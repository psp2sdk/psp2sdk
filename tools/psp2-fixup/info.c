/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include <openssl/sha.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "elf_psp2.h"
#include "elf.h"
#include "info.h"
#include "rel.h"
#include "scn.h"
#include "seg.h"

int findSyslib(syslib_t *syslib, FILE *fp, scn_t *scns, Elf32_Half shnum,
	const seg_t *segs, const seg_t *rela,
	const char *strtab, const Elf32_Sym *symtab,
	scn_t *ent, const scn_t *relEnt)
{
	const Elf32_Rel *rel;
	const Elf32_Sym *sym;
	const Elf32_Word *nids;
	Elf32_Word i, stubOffset, type, *p;
	const scn_t *stubRel;
	scn_t *scn;
	int res;

	if (syslib == NULL || fp == NULL || scns == NULL || segs == NULL
		|| rela == NULL || strtab == NULL || symtab == NULL
		|| ent == NULL || relEnt == NULL || relEnt->content == NULL)
	{
		return EINVAL;
	}

	if (ent->content == NULL) {
		res = loadScn(fp, ent, strtab + ent->shdr.sh_name);
		if (res)
			return res;
	}

	// Stub Table
	rel = findRelByOffset(relEnt, ent->shdr.sh_addr + 28, strtab);
	if (rel == NULL)
		return errno;

	sym = symtab + ELF32_R_SYM(rel->r_info);
	scn = scns + sym->st_shndx;
	type = ELF32_R_TYPE(rel->r_info);
	stubOffset = (type == R_ARM_ABS32 || type == R_ARM_TARGET1 ?
		*(Elf32_Word *)((uintptr_t)ent->content + 28) : sym->st_value)
		- segs[scn->phndx].phdr.p_vaddr;

	i = 0;
	do {
		if (i >= rela->shnum) {
			fprintf(stderr, "%s: Relocation table not found\n",
				strtab + scn->shdr.sh_name);
			return EILSEQ;
		}

		stubRel = rela->scns[i];
		i++;
	} while (stubRel->shdr.sh_info != sym->st_shndx);

	// NID Table
	rel = findRelByOffset(relEnt, ent->segOffset + 24, strtab);
	if (rel == NULL)
		return errno;

	sym = symtab + ELF32_R_SYM(rel->r_info);
	scn = scns + sym->st_shndx;

	if (scn->content == NULL) {
		res = loadScn(fp, scn, strtab + scn->shdr.sh_name);
		if (res)
			return res;
	}

	type = ELF32_R_TYPE(rel->r_info);
	nids = (void *)((uintptr_t)scn->content
		+ (type == R_ARM_ABS32 || type == R_ARM_TARGET1 ?
			*(Elf32_Word *)((uintptr_t)ent->content + 24) : sym->st_value)
		- scn->shdr.sh_addr);

	// Resolve
	for (i = 0; i < ((Elf32_Half *)ent->content)[3]; i++) {
		if (nids[i] == 0x935CD196)
			p = &syslib->start;
		else if (nids[i] == 0x79F8E492)
			p = &syslib->stop;
		else
			continue;

		rel = findRelByOffset(stubRel, stubOffset + i * 4, strtab);
		if (rel == NULL)
			return errno;

		*p = symtab[ELF32_R_SYM(rel->r_info)].st_value;
	}

	return 0;
}

int updateModinfo(FILE *fp, const scn_t *scns, Elf32_Half shnum,
	const sceScns_t *sceScns, Elf32_Addr base,
	const syslib_t *syslib, const char *strtab, const char *str)
{
	unsigned char md[SHA_DIGEST_LENGTH];
	_sceModuleInfo *info;
	const scn_t *sp;
	int res;

	if (fp == NULL || scns == NULL || sceScns == NULL
		|| sceScns->relEnt->content == NULL || strtab == NULL || str == NULL)
	{
		return EINVAL;
	}

	if (sceScns->modinfo->orgSize != sizeof(_sceModuleInfo))
		return EILSEQ;

	res = loadScn(fp, sceScns->modinfo, str);
	if (res)
		return res;

	info = sceScns->modinfo->content;

	info->expTop = sceScns->ent->shdr.sh_addr - base;
	info->expBtm = info->expTop + sceScns->ent->shdr.sh_size;

	info->impTop = sceScns->stub->shdr.sh_addr - base;
	info->impBtm = info->impTop + sceScns->stub->shdr.sh_size;


	info->start = syslib->start - base;
	info->stop = syslib->stop - base;

	sp = findScnByType(scns, shnum, SHT_ARM_EXIDX, NULL);
	if (sp != NULL) {
		info->exidxTop = sp->segOffset;
		info->exidxBtm = info->exidxTop + sp->shdr.sh_size;
	}

	sp = findScnByName(scns, shnum, strtab, ".ARM.extab", NULL);
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
