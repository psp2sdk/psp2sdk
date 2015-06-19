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

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include "elf_priv.h"
#include "elf_psp2.h"
#include "elf.h"
#include "scn.h"
#include "seg.h"

int openElf(elf_t *dst, const char *path)
{
	int res;

	if (dst == NULL || path == NULL)
		return EINVAL;

	dst->path = path;

	dst->fp = fopen(path, "rb");
	if (path == NULL) {
		perror(path);
		return errno;
	}

	if (fread(&dst->ehdr, sizeof(dst->ehdr), 1, dst->fp) <= 0) {
		if (feof(dst->fp)) {
			fprintf(stderr, "%s: Unexpected EOF\n", path);
			errno = EILSEQ;
		} else
			perror(path);

		fclose(dst->fp);
		return errno;
	}

	dst->orgShnum = dst->ehdr.e_shnum;

	dst->scns = getScns(dst->fp, path, &dst->ehdr);
	if (dst->scns == NULL) {
		fclose(dst->fp);
		return errno;
	}

	dst->strtab = dst->scns + dst->ehdr.e_shstrndx;
	res = loadScn(dst->fp, dst->strtab, path);
	if (res) {
		free(dst->scns);
		fclose(dst->fp);
		return res;
	}

	dst->symtab = findScnByType(dst->scns, dst->ehdr.e_shnum,
		SHT_SYMTAB, path);
	if (dst->symtab == NULL) {
		free(dst->scns);
		free(dst->strtab->content);
		fclose(dst->fp);
		return errno;
	}

	res = loadScn(dst->fp, dst->symtab,
		dst->strtab->content + dst->symtab->shdr.sh_name);
	if (res) {
		free(dst->scns);
		free(dst->strtab->content);
		fclose(dst->fp);
		return res;
	}

	res = getSceScns(&dst->sceScns, dst->scns, dst->ehdr.e_shnum,
		dst->strtab->content, path);
	if (res) {
		free(dst->scns);
		free(dst->strtab->content);
		free(dst->symtab->content);
		fclose(dst->fp);
		return res;
	}

	dst->segs = getSegs(dst->fp, path, &dst->ehdr,
		dst->scns, &dst->rela, dst->sceScns.relMark);
	if (dst->segs == NULL) {
		free(dst->scns);
		free(dst->strtab->content);
		free(dst->symtab->content);
		fclose(dst->fp);
		return errno;
	}

	return 0;
}

int closeElf(elf_t *elf)
{
	int res;

	if (elf == NULL)
		return EINVAL;

	while (elf->orgShnum) {
		elf->orgShnum--;
		if (elf->scns[elf->orgShnum].content != NULL)
			free(elf->scns[elf->orgShnum].content);
	}

	free(elf->scns);
	res = freeSegs(elf->segs, elf->ehdr.e_phnum);

	if (fclose(elf->fp)) {
		perror(elf->path);
		return errno;
	}

	return res;
}

static int updateEhdr(Elf32_Ehdr *ehdr, const char *path,
	seg_t *segs, scn_t *modinfo)
{
	if (ehdr == NULL || segs == NULL)
		return EINVAL;

	ehdr->e_type = ET_SCE_RELEXEC;
	ehdr->e_entry = (modinfo->phndx << 30) | modinfo->segOffset;
	ehdr->e_phoff = sizeof(Elf32_Ehdr);
	ehdr->e_shoff = 0;
	ehdr->e_shentsize = 0;
	ehdr->e_shnum = 0;
	ehdr->e_shstrndx = 0;

	return 0;
}

static int updateSymtab(Elf32_Sym *symtab, Elf32_Word size, scn_t *scns)
{
	if (symtab == NULL || scns == NULL)
		return EINVAL;

	while (size) {
		if (symtab->st_shndx != SHN_UNDEF
			&& symtab->st_shndx < SHN_LORESERVE)
		{
			symtab->st_value -= scns[symtab->st_shndx].addrDiff;
		}

		symtab++;
		size -= sizeof(Elf32_Sym);
	}

	return 0;
}

static int findSyslib(syslib_t *syslib, FILE *fp, scn_t *scns, Elf32_Half shnum,
	const seg_t *segs, scn_t **relScns, Elf32_Half relShnum,
	const char *strtab, const Elf32_Sym *symtab,
	scn_t *ent, const scn_t *relEnt)
{
	const Elf32_Rel *rel, *stubRel;
	const Elf32_Sym *sym;
	const Elf32_Word *nids;
	Elf32_Word i, j, stubOffset, *p;
	const scn_t *scn, *stubRelScn;
	int res;

	if (syslib == NULL || fp == NULL || scns == NULL || relScns == NULL
		|| segs == NULL || strtab == NULL || symtab == NULL || ent == NULL
		|| relEnt == NULL || relEnt->content == NULL)
	{
		return EINVAL;
	}

	res = loadScn(fp, ent, strtab + ent->shdr.sh_name);
	if (res)
		return res;

	// Stub Table
	i = 0;
	for (rel = relEnt->content; rel->r_offset != ent->segOffset + 28; rel++)
	{
		i += sizeof(rel);
		if (i >= relEnt->shdr.sh_size) {
			fprintf(stderr, "%s: Relocation entry for Stub table not found\n",
				strtab + relEnt->shdr.sh_name);
			return EILSEQ;
		}
	}

	sym = symtab + ELF32_R_SYM(rel->r_info);
	scn = scns + sym->st_shndx;
	stubOffset = sym->st_value - segs[scn->phndx].phdr.p_vaddr;

	i = 0;
	do {
		if (i >= relShnum) {
			fprintf(stderr, "%s: Relocation table not found\n",
				strtab + scn->shdr.sh_name);
			return EILSEQ;
		}

		stubRelScn = relScns[i];
		i++;
	} while (stubRelScn->shdr.sh_info != sym->st_shndx);

	stubRel = stubRelScn->content;

	// NID Table
	i = 0;
	for (rel = relEnt->content; rel->r_offset != ent->segOffset + 24; rel++)
	{
		i += sizeof(rel);
		if (i >= relEnt->shdr.sh_size) {
			fprintf(stderr, "%s: Relocation entry for NID table not found\n",
				strtab + relEnt->shdr.sh_name);
			return EILSEQ;
		}
	}

	sym = symtab + ELF32_R_SYM(rel->r_info);
	scn = scns + sym->st_shndx;

	if (scn->content == NULL) {
		res = loadScn(fp, scns + sym->st_shndx,
			strtab + scn->shdr.sh_name);
		if (res)
			return res;
	}

	nids = (void *)((uintptr_t)scn->content
		+ sym->st_value - scn->shdr.sh_addr);

	// Resolve
	for (i = 0; i < ((Elf32_Half *)ent->content)[3]; i++) {
		if (nids[i] == 0x935CD196)
			p = &syslib->start;
		else if (nids[i] == 0x79F8E492)
			p = &syslib->stop;
		else
			continue;

		j = 0;
		for (rel = stubRel; rel->r_offset != stubOffset + i * 4; rel++) {
			j += sizeof(rel);
			if (j >= stubRelScn->shdr.sh_size) {
				fprintf(stderr, "%s: Relocation Entry for a function (NID: 0x%X) not found\n",
					strtab + stubRelScn->shdr.sh_name,
					nids[i]);
				return EINVAL;
			}
		}

		*p = symtab[ELF32_R_SYM(rel->r_info)].st_value;
	}

	return 0;
}

static int updateRel(FILE *fp, const scn_t *scns, const char *strtab,
	scn_t **relScns, Elf32_Half relShnum)
{
	const scn_t *dstScn;
	scn_t *scn;
	Elf32_Rel *rel;
	Elf32_Word i;
	int res;

	if (fp == NULL || scns == NULL || strtab == NULL || relScns == NULL)
		return EINVAL;

	while (relShnum) {
		scn = *relScns;
		if (scn == NULL)
			return EINVAL;
		if (scn->shdr.sh_type != SHT_REL)
			goto cont;

		res = loadScn(fp, scn, strtab + scn->shdr.sh_name);
		if (res)
			return res;

		dstScn = scns + scn->shdr.sh_info;

		rel = scn->content;
		for (i = 0; i < scn->orgSize; i += sizeof(rel)) {
			rel->r_offset -= dstScn->segOffsetDiff;
			rel++;
		}

cont:
		relScns++;
		relShnum--;
	}

	return 0;
}

static int convRelToRela(FILE *fp, const scn_t *scns, const seg_t *segs,
	const char *strtab, const Elf32_Sym *symtab,
	scn_t **relScns, Elf32_Half relShnum)
{
	if (scns == NULL)
		return EINVAL;

	Psp2_Rela_Short *buf, *cur;
	const scn_t *dstScn;
	scn_t *scn;
	const Elf32_Rel *rel;
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

		if (scn->shdr.sh_type != SHT_REL)
			goto cont;

		rel = scn->content;

		buf = malloc(scn->shdr.sh_size);
		cur = buf;

		dstScn = scns + scn->shdr.sh_info;

		for (i = 0; i < scn->orgSize; i += sizeof(rel)) {
			type = ELF32_R_TYPE(rel->r_info);
			sym = symtab + ELF32_R_SYM(rel->r_info);

			PSP2_R_SET_SHORT(cur, 1);
			PSP2_R_SET_SYMSEG(cur, sym->st_shndx == SHN_ABS ?
				15 : scns[sym->st_shndx].phndx);
			PSP2_R_SET_TYPE(cur, type);
			PSP2_R_SET_DATSEG(cur, dstScn->phndx);
			PSP2_R_SET_OFFSET(cur, rel->r_offset);

			addend = sym->st_value;
			if (type == R_ARM_ABS32 || type == R_ARM_TARGET1) {
				if (fseek(fp, segs[dstScn->phndx].phdr.p_offset
					+ rel->r_offset, SEEK_SET))
				{
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

			PSP2_R_SET_ADDEND(cur, addend);

			rel++;
			cur++;
		}

		free(scn->content);

		scn->shdr.sh_type = SHT_SCE_RELA;
		scn->content = buf;

cont:
		relScns++;
		relShnum--;
	}

	return 0;
}

int updateElf(elf_t *elf)
{
	syslib_t syslib;
	int res;

	if (elf == NULL)
		return errno;

	res = updateSceScnsSize(&elf->sceScns);
	if (res)
		return res;

	res = updateSegs(elf->segs, elf->ehdr.e_phnum, elf->strtab->content);
	if (res)
		return res;

	res = updateSymtab(elf->symtab->content, elf->symtab->orgSize,
		elf->scns);
	if (res)
		return res;

	res = updateRel(elf->fp, elf->scns, elf->strtab->content,
		elf->rela->scns, elf->rela->shnum);
	if (res)
		return res;

	res = findSyslib(&syslib, elf->fp, elf->scns, elf->ehdr.e_shnum,
		elf->segs, elf->rela->scns, elf->rela->shnum,
		elf->strtab->content, elf->symtab->content,
		elf->sceScns.ent, elf->sceScns.relEnt);
	if (res)
		return res;

	res = convRelToRela(elf->fp, elf->scns, elf->segs,
		elf->strtab->content, elf->symtab->content,
		elf->rela->scns, elf->rela->shnum);
	if (res)
		return res;

	res = updateModinfo(elf->fp, elf->scns, elf->ehdr.e_shnum, &elf->sceScns,
		elf->segs[elf->sceScns.modinfo->phndx].phdr.p_vaddr,
		&syslib, elf->strtab->content, elf->path);
	if (res)
		return res;

	return updateEhdr(&elf->ehdr,
		elf->path, elf->segs, elf->sceScns.modinfo);
}

int writeElf(const char *path, elf_t *elf)
{
	FILE *fp;
	int res;

	if (path == NULL)
		return EINVAL;

	fp = fopen(path, "wb");
	if (fp == NULL) {
		perror(path);
		return errno;
	}

	if (fwrite(&elf->ehdr, sizeof(Elf32_Ehdr), 1, fp) != 1) {
		perror(path);
		fclose(fp);
		return errno;
	}

	res = writePhdrs(fp, path, &elf->ehdr, elf->segs);
	if (res) {
		fclose(fp);
		return res;
	}

	res = writeSegs(fp, elf->fp, elf->segs, elf->ehdr.e_phnum,
		elf->strtab->content);
	if (res) {
		fclose(fp);
		return res;
	}

	if (fclose(fp)) {
		perror(path);
		return errno;
	}

	return 0;
}
