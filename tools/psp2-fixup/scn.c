/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

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
	if (scns == NULL || strtab == NULL || name == NULL)
		return NULL;

	while (shnum) {
		if (!strcmp(strtab + scns->shdr.sh_name, name))
			return (scn_t *)scns;
		scns++;
		shnum--;
	}

	if (str != NULL)
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

	if (fseek(fp, scn->orgOffset, SEEK_SET)) {
		perror(str);
		return errno;
	}

	scn->content = malloc(scn->orgSize);
	if (scn->content == NULL) {
		perror(str);
		return errno;
	}

	if (fread(scn->content, scn->orgSize, 1, fp) <= 0) {
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
		".rel.sceFStub.rodata", NULL);

	sceScns->fstub = sceScns->relFstub == NULL ?
		NULL : scns + sceScns->relFstub->shdr.sh_info;

	sceScns->relVstub = findScnByName(scns, shnum, strtab,
		".rel.sceVStub.rodata", NULL);

	sceScns->vstub = sceScns->relVstub == NULL ?
		NULL : scns + sceScns->relVstub->shdr.sh_info;

	sceScns->fnid = findScnByName(scns, shnum, strtab,
		".sceFNID.rodata", NULL);

	sceScns->vnid = findScnByName(scns, shnum, strtab,
		".sceVNID.rodata", NULL);

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

	scns->relFstub->shdr.sh_type = SHT_INTERNAL;
	scns->relFstub->shdr.sh_size = stubNum * sizeof(Psp2_Rela);

	scns->relStub->shdr.sh_type = SHT_INTERNAL;
	// name, function NID table, and function stub table
	scns->relStub->shdr.sh_size = headNum * 3 * sizeof(Psp2_Rela);
	scns->stub->shdr.sh_size = headNum * sizeof(sceLib_stub);

	return 0;
}

int writeScn(FILE *dst, FILE *src, const scn_t *scn, const char *strtab)
{
	void *p;

	if (dst == NULL || src == NULL || scn == NULL)
		return EINVAL;

	if (scn->shdr.sh_size == 0 || scn->shdr.sh_type == SHT_NOBITS)
		return 0;

	if (fseek(dst, scn->shdr.sh_offset, SEEK_SET)) {
		perror(strtab + scn->shdr.sh_name);
		return errno;
	}


	if (scn->content == NULL) {
		p = malloc(scn->orgSize);
		if (p == NULL) {
			perror(strtab + scn->shdr.sh_name);
			return errno;
		}

		if (fseek(src, scn->orgOffset, SEEK_SET)) {
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
	} else if (fwrite(scn->content, scn->shdr.sh_size, 1, dst) != 1) {
		perror(strtab + scn->shdr.sh_name);
		return errno;
	}

	return 0;
}
