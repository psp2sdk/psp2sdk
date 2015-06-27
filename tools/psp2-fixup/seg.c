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
#include "elf_psp2.h"
#include "elf.h"
#include "scn.h"
#include "seg.h"

static int mapOverScnSeg(void (* f)(scn_t *, seg_t *, Elf32_Half),
	scn_t *scns, seg_t *segs, const Elf32_Ehdr *ehdr,
	Elf32_Half relaNdx, const scn_t *relMark)
{
	Elf32_Half i, j;
	Elf32_Phdr *phdr;
	Elf32_Shdr *shdr;

	if (f == NULL || scns == NULL || segs == NULL
		|| ehdr == NULL || relMark == NULL)
	{
		return EINVAL;
	}

	for (i = 0; i < ehdr->e_shnum; i++) {
		shdr = &scns[i].shdr;

		if (shdr->sh_type == SHT_REL) {
			if (scns[shdr->sh_info].shdr.sh_flags & SHF_ALLOC)
				f(scns + i, segs + relaNdx, relaNdx);

			continue;
		}

		if (!(shdr->sh_flags & SHF_ALLOC))
			continue;

		for (j = 0; j < ehdr->e_phnum; j++) {
			phdr = &segs[j].phdr;
			if (phdr->p_offset <= shdr->sh_offset
				&& shdr->sh_offset + shdr->sh_size
					<= phdr->p_offset + phdr->p_memsz) {
				f(scns + i, segs + j, j);
				break;
			}
		}
	}

	return 0;
}

static void segCntScns(scn_t *scn, seg_t *seg, Elf32_Half index)
{
	seg->shnum++;
}

static void segCntMapScns(scn_t *scn, seg_t *seg, Elf32_Half index)
{
	scn->phndx = index;
	scn->segOffset = scn->shdr.sh_addr - seg->phdr.p_vaddr;

	seg->scns[seg->shnum] = scn;
	seg->shnum++;
}

/* Load phdrs and scns included in the sections. scns will be sorted. */
seg_t *getSegs(FILE *fp, const char *path, Elf32_Ehdr *ehdr,
	scn_t *scns, seg_t **rela, const scn_t *relMark)
{
	Elf32_Half i, j, k, relaPhndx;
	scn_t *tmp;
	seg_t *segs;

	if (fp == NULL || path == NULL || ehdr == NULL
		|| scns == NULL || rela == NULL || relMark == NULL)
	{
		return NULL;
	}

	segs = malloc(ehdr->e_phnum * sizeof(seg_t));
	if (segs == NULL) {
		perror(path);
		return NULL;
	}


	if (fseek(fp, ehdr->e_phoff, SEEK_SET)) {
		perror(path);
		return NULL;
	}

	i = 0;
	relaPhndx = 0;
	while (i < ehdr->e_phnum) {
		if (fread(&segs[i].phdr, sizeof(segs[i].phdr), 1, fp) <= 0) {
			if (feof(fp)) {
				fprintf(stderr, "%s: Unexpected EOF\n", path);
				errno = EILSEQ;
			} else
				perror(path);

			free(segs);
			return NULL;
		}

		switch (segs[i].phdr.p_type) {
			case PT_ARM_EXIDX:
				ehdr->e_phnum--;
				break;
			case 0x60000000:
				relaPhndx = i;
			default:
				segs[i].shnum = 0;
				i++;
		}
	}

	if (relaPhndx == 0) {
		fprintf(stderr, "%s: PT_PSP2_RELA not found\n", path);
		errno = EILSEQ;
		free(segs);

		return NULL;
	}

	*rela = segs + relaPhndx;

	mapOverScnSeg(segCntScns, scns, segs, ehdr, relaPhndx, relMark);

	for (i = 0; i < ehdr->e_phnum; i++) {
		segs[i].scns = malloc(segs[i].shnum * sizeof(scn_t));
		if (segs[i].scns == NULL) {
			perror(NULL);

			while (i) {
				i--;
				free(segs[i].scns);
			}

			free(segs);
			return NULL;
		}

		segs[i].shnum = 0;
	}

	mapOverScnSeg(segCntMapScns, scns, segs, ehdr, relaPhndx, relMark);

	for (i = 0; i < ehdr->e_phnum; i++) {
		if (segs[i].phdr.p_type != PT_LOAD)
			continue;

		for (j = 1; j < segs[i].shnum; j++) {
			tmp = segs[i].scns[j];
			if (segs[i].scns[j - 1]->shdr.sh_addr > tmp->shdr.sh_addr) {
				k = j;
				do {
					segs[i].scns[k] = segs[i].scns[k - 1];
					k--;
				} while (k > 0 &&
					segs[i].scns[k - 1]->shdr.sh_addr > tmp->shdr.sh_addr);
				segs[i].scns[k] = tmp;
			}
		}
	}

	return segs;
}

int freeSegs(seg_t *segs, Elf32_Half segnum)
{
	seg_t *p;

	if (segs == NULL)
		return EINVAL;

	p = segs;
	while (segnum) {
		free(p->scns);

		p++;
		segnum--;
	}

	free(segs);
	return 0;
}

int updateSegs(seg_t *segs, Elf32_Half segnum, const char *strtab)
{
	scn_t *scn;
	seg_t **sorts, *tmp;
	Elf32_Addr addr;
	Elf32_Off offset;
	Elf32_Half i, j, loadNum;
	Elf32_Word and, gap;

	if (segs == NULL || strtab == NULL)
		return EINVAL;

	sorts = malloc(segnum * sizeof(seg_t *));
	if (sorts == NULL) {
		perror(NULL);
		return errno;
	}

	loadNum = 0;
	for (i = 0; i < segnum; i++) {
		if (segs[i].phdr.p_type == PT_LOAD) {
			sorts[loadNum] = segs + i;
			loadNum++;
		} else
			sorts[segnum - (i - loadNum) - 1] = segs + i;
	}

	for (i = 1; i < loadNum; i++) {
		tmp = sorts[i];
		if (sorts[i - 1]->phdr.p_vaddr > tmp->phdr.p_vaddr) {
			j = i;
			do {
				sorts[j] = sorts[j - 1];
				j--;
			} while (j > 0 && sorts[j - 1]->phdr.p_vaddr > tmp->phdr.p_vaddr);
			sorts[j] = tmp;
		}
	}

	addr = sorts[0]->phdr.p_vaddr;
	for (i = 0; i < loadNum; i++) {
		and = sorts[i]->phdr.p_align - 1;
		if (addr & and)
			addr = (addr & ~and) + sorts[i]->phdr.p_align;

		sorts[i]->phdr.p_vaddr = addr;
		sorts[i]->phdr.p_memsz = 0;
		sorts[i]->phdr.p_filesz = 0;

		for (j = 0; j < sorts[i]->shnum; j++) {
			scn = sorts[i]->scns[j];

			gap = addr & (scn->shdr.sh_addralign - 1);
			if (gap) {
				gap = scn->shdr.sh_addralign - gap;
				addr += gap;
				sorts[i]->phdr.p_filesz += gap;
				sorts[i]->phdr.p_memsz += gap;
			}

			scn->addrDiff = addr - scn->shdr.sh_addr;
			scn->shdr.sh_addr = addr;
			offset = sorts[i]->phdr.p_memsz;
			scn->segOffset = offset;

			if (scn->shdr.sh_type != SHT_NOBITS
				|| j < sorts[i]->shnum - 1)
			{
				sorts[i]->phdr.p_filesz += scn->shdr.sh_size;
			}

			sorts[i]->phdr.p_memsz += scn->shdr.sh_size;
			addr += scn->shdr.sh_size;
		}
	}

	for (i = loadNum; i < segnum; i++) {
		sorts[i]->phdr.p_memsz = 0;
		sorts[i]->phdr.p_filesz = 0;

		for (j = 0; j < sorts[i]->shnum; j++) {
			scn = sorts[i]->scns[j];
			scn->segOffset = sorts[i]->phdr.p_memsz;

			if (scn->shdr.sh_type == SHT_REL) {
				scn->shdr.sh_size /= sizeof(Elf32_Rel);
				scn->shdr.sh_size *= sizeof(Psp2_Rela);
			}

			if (scn->shdr.sh_type != SHT_NOBITS
				|| j < sorts[i]->shnum - 1)
			{
				sorts[i]->phdr.p_filesz += scn->shdr.sh_size;
			}

			sorts[i]->phdr.p_memsz += scn->shdr.sh_size;
		}
	}

	for (i = 1; i < loadNum; i++) {
		tmp = sorts[i];
		if (sorts[i - 1]->phdr.p_paddr > tmp->phdr.p_paddr) {
			j = i;
			do {
				sorts[j] = sorts[j - 1];
				j--;
			} while (j > 0 && sorts[j - 1]->phdr.p_paddr > tmp->phdr.p_paddr);
			sorts[j] = tmp;
		}
	}

	addr = sorts[0]->phdr.p_paddr;
	for (i = 1; i < loadNum; i++) {
		and = sorts[i]->phdr.p_align - 1;
		if (addr & and)
			addr = (addr & ~and) + sorts[i]->phdr.p_align;

		sorts[i]->phdr.p_paddr = addr;
		addr += sorts[i]->phdr.p_memsz;
	}

	for (i = 1; i < segnum; i++) {
		tmp = sorts[i];
		if (sorts[i - 1]->phdr.p_offset > tmp->phdr.p_offset) {
			j = i;
			do {
				sorts[j] = sorts[j - 1];
				j--;
			} while (j > 0 && sorts[j - 1]->phdr.p_offset > tmp->phdr.p_offset);
			sorts[j] = tmp;
		}
	}

	offset = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * segnum;
	for (i = 0; i < segnum; i++) {
		and = sorts[i]->phdr.p_align - 1;
		if (offset & and)
			offset = (offset & ~and) + sorts[i]->phdr.p_align;

		sorts[i]->phdr.p_offset = offset;

		for (j = 0; j < sorts[i]->shnum; j++) {
			scn = sorts[i]->scns[j];

			scn->shdr.sh_offset = offset + scn->segOffset;
		}

		offset += sorts[i]->phdr.p_filesz;
	}

	return 0;
}

int writePhdrs(FILE *dstFp, const char *dst,
	const Elf32_Ehdr *ehdr, const seg_t *segs)
{
	Elf32_Half i;

	if (dstFp == NULL || dst == NULL || ehdr == NULL || segs == NULL)
		return EINVAL;

	if (fseek(dstFp, ehdr->e_phoff, SEEK_SET)) {
		perror(dst);
		return errno;
	}

	for (i = 0; i < ehdr->e_phnum; i++)
		if (fwrite(&segs[i].phdr, sizeof(segs[i].phdr), 1, dstFp) != 1) {
			perror(dst);
			return errno;
		}

	return 0;
}

int writeSegs(FILE *dst, FILE *src,
	const seg_t *segs, Elf32_Half phnum, const char *strtab)
{
	Elf32_Half i, j;
	int res;

	if (dst == NULL || src == NULL || segs == NULL || strtab == NULL)
		return EINVAL;

	for (i = 0; i < phnum; i++) {
		for (j = 0; j < segs->shnum; j++) {
			res = writeScn(dst, src, segs->scns[j], strtab);
			if (res)
				return res;
		}

		segs++;
	}

	return 0;
}
