/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License version 2.1 as published by the Free Software Foundation
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include <psp2moduleinfo.h>
#include <openssl/sha.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "elf_psp2.h"
#include "elf.h"
#include "scn.h"
#include "stub.h"

scn_t *findScn(const scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *name, const char *path)
{
	if (scns == NULL || strtab == NULL || name == NULL || path == NULL)
		return NULL;

	while (shnum) {
		if (!strcmp(strtab + scns->shdr.sh_name, name))
			return (scn_t *)scns;
		scns++;
		shnum--;
	}

	fprintf(stderr, "%s: %s is not found\n", path, name);
	errno = EILSEQ;

	return NULL;
}

void *loadScn(FILE *fp, const char *path, const scn_t *scn,
	const char *strtab)
{
	void *p;

	if (fp == NULL || scn == NULL)
		return NULL;

	if (fseek(fp, scn->shdr.sh_offset, SEEK_SET)) {
		if (strtab != NULL)
			perror(strtab + scn->shdr.sh_name);
		else if (path != NULL)
			perror(path);

		return NULL;
	}

	p = malloc(scn->shdr.sh_size);
	if (p == NULL) {
		if (strtab != NULL)
			perror(strtab + scn->shdr.sh_name);
		else if (path != NULL)
			perror(path);

		return NULL;
	}

	if (fread(p, scn->shdr.sh_size, 1, fp) <= 0) {
		if (strtab != NULL)
			perror(strtab + scn->shdr.sh_name);
		else if (path != NULL)
			perror(path);

		free(p);
		return NULL;
	}

	return p;
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
			perror(path);
			free(scns);
			return NULL;
		}

		scns[i].orgOffset = scns[i].shdr.sh_offset;
		scns[i].orgSize = scns[i].shdr.sh_size;
	}

	return scns;
}

scn_t *getSymtabScn(const char *path, scn_t *scns, Elf32_Half shnum)
{
	while (shnum) {
		if (scns->shdr.sh_type == SHT_SYMTAB)
			return scns;

		scns++;
		shnum--;
	}

	fprintf(stderr, "%s: Symbol Table is not found.\n", path);
	return NULL;
}

int getSceScns(sceScns_t *sceScns, scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *path)
{
	if (sceScns == NULL || scns == NULL || strtab == NULL || path == NULL)
		return EINVAL;

	sceScns->relMark = findScn(scns, shnum, strtab,
		".rel.sce_libgen_mark", path);
	if (sceScns->relMark == NULL)
		return errno;

	sceScns->mark = scns + sceScns->relMark->shdr.sh_info;

	sceScns->relFstub = findScn(scns, shnum, strtab,
		".rel.sceFStub.rodata", path);
	if (sceScns->relFstub == NULL)
		return errno;

	sceScns->fstub = scns + sceScns->relFstub->shdr.sh_info;

	sceScns->fnid = findScn(scns, shnum, strtab, ".sceFNID.rodata", path);
	if (sceScns->fnid == NULL)
		return errno;

	sceScns->relStub = findScn(scns, shnum, strtab, ".rel.sceLib.stub", path);
	if (sceScns->relStub == NULL)
		return errno;

	sceScns->stub = scns + sceScns->relStub->shdr.sh_info;

	sceScns->modinfo = findScn(scns, shnum, strtab,
		".sceModuleInfo.rodata", path);
	if (sceScns->modinfo == NULL)
		return errno;

	return 0;
}

int updateSceScnsSize(sceScns_t *scns)
{
	Elf32_Word headNum;

	if (scns == NULL)
		return EINVAL;

	/* mark->sh_size == (the number of the heads) * 24 + (the number of the stubs) * 20
	   fnid->sh_size == (the number of stubs) * 4 */
	headNum = (scns->mark->shdr.sh_size
		- scns->fnid->shdr.sh_size / 4 * sizeof(sce_libgen_mark_stub))
			/ sizeof(sce_libgen_mark_head);

	scns->relFstub->shdr.sh_size
		= scns->fstub->shdr.sh_size / 4 * sizeof(Psp2_Rela_Short);

	scns->relStub->shdr.sh_size = headNum * 6 * sizeof(Psp2_Rela_Short);
	scns->stub->shdr.sh_size = headNum * sizeof(sceLib_stub);

	return 0;
}

int writeModinfo(FILE *dst, FILE *src, const scn_t *scn, const char *strtab)
{
	unsigned char md[SHA_DIGEST_LENGTH];
	_sceModuleInfo *p;

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
		perror(strtab + scn->shdr.sh_name);
		free(p);
		return errno;
	}

	if (p->nid == 0) {
		SHA1((unsigned char *)p->name, strlen(p->name), md);
		((unsigned char *)&p->nid)[0] = md[3];
		((unsigned char *)&p->nid)[1] = md[2];
		((unsigned char *)&p->nid)[2] = md[1];
		((unsigned char *)&p->nid)[3] = md[0];
	}

	if (fwrite(p, scn->orgSize, 1, dst) != 1) {
		perror(strtab + scn->shdr.sh_name);
		free(p);
		return errno;
	}

	free(p);

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
		perror(strtab + scn->shdr.sh_name);
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
