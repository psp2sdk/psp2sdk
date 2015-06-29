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
#include "elf_priv.h"
#include "elf_psp2.h"
#include "elf.h"
#include "info.h"
#include "rel.h"
#include "scn.h"
#include "seg.h"
#include "stub.h"

int openElf(elf_t *dst, const char *path)
{
	int res;

	if (dst == NULL || path == NULL)
		return EINVAL;

	dst->path = path;

	dst->fp = fopen(path, "rb");
	if (dst->fp == NULL) {
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
		(void *)((uintptr_t)dst->strtab->content + dst->symtab->shdr.sh_name));
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

	ehdr->e_type = ET_PSP2_RELEXEC;
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
			symtab->st_value += scns[symtab->st_shndx].addrDiff;
		}

		symtab++;
		size -= sizeof(Elf32_Sym);
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

	res = updateRel(elf->fp, elf->scns,
		elf->strtab->content, elf->symtab->content,
		elf->rela->scns, elf->rela->shnum);
	if (res)
		return res;

	res = findSyslib(&syslib, elf->fp, elf->scns, elf->ehdr.e_shnum,
		elf->segs, elf->rela, elf->strtab->content, elf->symtab->content,
		elf->sceScns.ent, elf->sceScns.relEnt);
	if (res)
		return res;

	res = updateStubs(&elf->sceScns, elf->fp, elf->scns, elf->segs,
		elf->strtab->content, elf->symtab->content);
	if (res)
		return res;

	res = convRelToRela(elf->scns, elf->segs, elf->symtab->content,
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
