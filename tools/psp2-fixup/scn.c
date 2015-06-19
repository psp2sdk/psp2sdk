/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <openssl/sha.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "elf_psp2.h"
#include "elf.h"
#include "scn.h"
#include "stub.h"

scn_t *findScnByName(const scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *name, const char *str)
{
	if (scns == NULL || strtab == NULL || name == NULL || str == NULL)
		return NULL;

	while (shnum) {
		if (!strcmp(strtab + scns->shdr.sh_name, name))
			return (scn_t *)scns;
		scns++;
		shnum--;
	}

	fprintf(stderr, "%s: %s is not found\n", str, name);
	errno = EILSEQ;

	return NULL;
}

scn_t *findScnByType(const scn_t *scns, Elf32_Half shnum,
	Elf32_Word type, const char *str)
{
	if (scns == NULL || str == NULL)
		return NULL;

	while (shnum) {
		if (scns->shdr.sh_type == type)
			return (scn_t *)scns;

		scns++;
		shnum--;
	}

	fprintf(stderr, "%s: Section type 0x%X not found.\n", str, type);
	errno = EILSEQ;

	return NULL;
}

int loadScn(FILE *fp, scn_t *scn, const char *str)
{
	if (fp == NULL || scn == NULL || str == NULL)
		return EINVAL;

	if (fseek(fp, scn->shdr.sh_offset, SEEK_SET)) {
		perror(str);
		return errno;
	}

	scn->content = malloc(scn->shdr.sh_size);
	if (scn->content == NULL) {
		perror(str);
		return errno;
	}

	if (fread(scn->content, scn->shdr.sh_size, 1, fp) <= 0) {
		free(scn->content);

		if (feof(fp)) {
			fprintf(stderr, "%s: Unexpected EOF\n", str);
			return EILSEQ;
		} else {
			perror(str);
			return errno;
		}
	}

	return 0;
}

scn_t *getScns(FILE *fp, const char *path, const Elf32_Ehdr *ehdr)
{
	scn_t *scns;
	Elf32_Half i;

	if (fseek(fp, ehdr->e_shoff, SEEK_SET)) {
		perror(path);
		return NULL;
	}

	scns = malloc(ehdr->e_shnum * sizeof(scn_t));
	if (scns == NULL) {
		perror(NULL);
		return NULL;
	}

	for (i = 0; i < ehdr->e_shnum; i++) {
		if (fread(&scns[i].shdr, sizeof(scns[i].shdr), 1, fp) <= 0) {
			if (feof(fp)) {
				fprintf(stderr, "%s: Unexpected EOF\n", path);
				errno = EILSEQ;
			} else
				perror(path);

			free(scns);
			return NULL;
		}

		scns[i].orgOffset = scns[i].shdr.sh_offset;
		scns[i].orgSize = scns[i].shdr.sh_size;
		scns[i].content = NULL;
	}

	return scns;
}

int getSceScns(sceScns_t *sceScns, scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *path)
{
	if (sceScns == NULL || scns == NULL || strtab == NULL || path == NULL)
		return EINVAL;

	sceScns->relMark = findScnByName(scns, shnum, strtab,
		".rel.sce_libgen_mark", path);
	if (sceScns->relMark == NULL)
		return errno;

	sceScns->mark = scns + sceScns->relMark->shdr.sh_info;

	sceScns->relFstub = findScnByName(scns, shnum, strtab,
		".rel.sceFStub.rodata", path);
	if (sceScns->relFstub == NULL)
		return errno;

	sceScns->fstub = scns + sceScns->relFstub->shdr.sh_info;

	sceScns->fnid = findScnByName(scns, shnum, strtab,
		".sceFNID.rodata", path);
	if (sceScns->fnid == NULL)
		return errno;

	sceScns->relEnt = findScnByName(scns, shnum, strtab,
		".rel.sceLib.ent", path);
	if (sceScns->relEnt == NULL)
		return errno;

	sceScns->ent = scns + sceScns->relEnt->shdr.sh_info;

	sceScns->relStub = findScnByName(scns, shnum, strtab,
		".rel.sceLib.stub", path);
	if (sceScns->relStub == NULL)
		return errno;

	sceScns->stub = scns + sceScns->relStub->shdr.sh_info;

	sceScns->modinfo = findScnByName(scns, shnum, strtab,
		".sceModuleInfo.rodata", path);
	if (sceScns->modinfo == NULL)
		return errno;

	return 0;
}

int updateSceScnsSize(sceScns_t *scns)
{
	Elf32_Word headNum, stubNum;

	if (scns == NULL)
		return EINVAL;

	/* mark->sh_size == (the number of the heads) * 24 + (the number of the stubs) * 20
	   fnid->sh_size == (the number of stubs) * 4 */
	stubNum = scns->fstub->shdr.sh_size / 4;
	headNum = (scns->mark->shdr.sh_size
		- stubNum * sizeof(sce_libgen_mark_stub))
			/ sizeof(sce_libgen_mark_head);

	scns->relFstub->shdr.sh_size = stubNum * sizeof(Psp2_Rela_Short);

	scns->relStub->shdr.sh_size = headNum * 2 * sizeof(Psp2_Rela_Short);
	scns->stub->shdr.sh_size = headNum * sizeof(sceLib_stub);

	return 0;
}

int convRelToRela(FILE *fp, const scn_t *scns,
	const char *strtab, const Elf32_Sym *symtab,
	scn_t **relScns, Elf32_Half relShnum)
{
	if (scns == NULL)
		return EINVAL;

	Psp2_Rela_Short *rela;
	const scn_t *dstScn;
	scn_t *scn;
	Elf32_Rel rel;
	const Elf32_Sym *sym;
	Elf32_Word i, j, type;
	Elf32_Addr addend;

	if (fp == NULL || scns == NULL || strtab == NULL || symtab == NULL
		|| relScns == NULL)
	{
		return EINVAL;
	}

	while (relShnum) {
		scn = *relScns;

		if (scn->content != NULL)
			goto cont;

		scn->shdr.sh_size /= sizeof(Elf32_Rel);
		scn->shdr.sh_size *= sizeof(Psp2_Rela_Short);

		scn->content = malloc(scn->shdr.sh_size);
		rela = scn->content;

		dstScn = scns + scn->shdr.sh_info;

		for (i = 0; i < scn->orgSize; i += sizeof(rel)) {
			if (fseek(fp, scn->orgOffset + i, SEEK_SET)) {
				perror(strtab + scn->shdr.sh_name);
				free(scn->content);
				return errno;
			}

			if (fread(&rel, sizeof(rel), 1, fp) <= 0) {
				strtab += scn->shdr.sh_name;
				if (feof(fp)) {
					fprintf(stderr, "%s: Unexpected EOF\n", strtab);
					errno = EILSEQ;
				} else
					perror(strtab);

				free(scn->content);
				return errno;
			}

			type = ELF32_R_TYPE(rel.r_info);
			sym = symtab + ELF32_R_SYM(rel.r_info);

			PSP2_R_SET_SHORT(rela, 1);
			PSP2_R_SET_SYMSEG(rela, sym->st_shndx == SHN_ABS ?
				15 : scns[sym->st_shndx].phndx);
			PSP2_R_SET_TYPE(rela, type);
			PSP2_R_SET_DATSEG(rela, dstScn->phndx);
			PSP2_R_SET_OFFSET(rela, rel.r_offset - dstScn->segOffsetDiff);

			addend = sym->st_value;
			if (type == R_ARM_ABS32 || type == R_ARM_TARGET1) {
				if (fseek(fp, dstScn->orgOffset + rel.r_offset, SEEK_SET)) {
					perror(strtab + scn->shdr.sh_name);

					free(scn->content);
					return errno;
				}

				if (fread(&j, sizeof(j), 1, fp) <= 0) {
					free(scn->content);

					strtab += scn->shdr.sh_name;
					if (feof(fp)) {
						fprintf(stderr, "%s: Unexpected EOF\n", strtab);
						return EILSEQ;
					} else {
						perror(strtab);
						return errno;
					}
				}

				addend += j;
			}

			PSP2_R_SET_ADDEND(rela, addend);

			rela++;
		}

cont:
		relScns++;
		relShnum--;
	}

	return 0;
}

int updateModinfo(FILE *fp, const scn_t *scns, Elf32_Half shnum,
	const sceScns_t *sceScns, const char *strtab, const char *str)
{
	unsigned char md[SHA_DIGEST_LENGTH];
	_sceModuleInfo *info;
	const scn_t *sp;
	int res;

	if (fp == NULL || scns == NULL
		|| sceScns == NULL || strtab == NULL || str == NULL)
	{
		return EINVAL;
	}

	if (sceScns->modinfo->orgSize != sizeof(info))
		return EILSEQ;

	res = loadScn(fp, sceScns->modinfo, str);
	if (res)
		return res;

	info = sceScns->modinfo->content;

	info->expTop = sceScns->ent->segOffset;
	info->expBtm = info->expTop + sceScns->ent->shdr.sh_size;

	info->impTop = sceScns->stub->segOffset;
	info->impBtm = info->impTop + sceScns->stub->shdr.sh_size;

	// TODO: module_start and module_stop

	sp = findScnByType(scns, shnum, SHT_ARM_EXIDX, str);
	if (sp != NULL) {
		info->exidxTop = sp->segOffset;
		info->exidxBtm = info->exidxTop + sp->shdr.sh_size;
	}

	sp = findScnByName(scns, shnum, strtab, ".ARM.extab", str);
	if (sp != NULL) {
		info->extabTop = sp->segOffset;
		info->extabBtm = info->extabTop + sp->shdr.sh_size;
	}

	if (info->nid == 0) {
		SHA1((unsigned char *)info->name, strlen(info->name), md);
		((unsigned char *)&info->nid)[0] = md[3];
		((unsigned char *)&info->nid)[1] = md[2];
		((unsigned char *)&info->nid)[2] = md[1];
		((unsigned char *)&info->nid)[3] = md[0];
	}

	return 0;
}

int writeScn(FILE *dst, FILE *src, const scn_t *scn, const char *strtab)
{
	void *p;

	if (dst == NULL || src == NULL || scn == NULL)
		return EINVAL;

	if (scn->orgSize == 0)
		return 0;

	p = malloc(scn->orgSize);
	if (p == NULL) {
		perror(strtab + scn->shdr.sh_name);
		return errno;
	}

	if (fread(p, scn->orgSize, 1, src) <= 0) {
		strtab += scn->shdr.sh_name;
		if (feof(src)) {
			fprintf(stderr, "%s: Unexpected EOF\n", strtab);
			errno = EILSEQ;
		} else
			perror(strtab);

		free(p);
		return errno;
	}

	if (fwrite(p, scn->orgSize, 1, dst) != 1) {
		perror(strtab + scn->shdr.sh_name);
		free(p);
		return errno;
	}

	free(p);

	return 0;
}
