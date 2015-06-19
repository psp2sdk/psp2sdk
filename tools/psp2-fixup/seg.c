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
#include "elf_psp2.h"
#include "elf.h"
#include "scn.h"
#include "seg.h"

static int mapOverScnSeg(void (* f)(scn_t *, seg_t *, Elf32_Half),
	scn_t *scns, seg_t *segs, const Elf32_Ehdr *ehdr,
	Elf32_Half relaNdx, const scn_t *relMark)
{
	Elf32_Half i, j, rela;
	Elf32_Phdr *phdr;

	if (f == NULL || scns == NULL || segs == NULL
		|| ehdr == NULL || relMark == NULL)
	{
		return EINVAL;
	}

	for (i = 0; i < ehdr->e_shnum; i++, scns++) {
		if (scns->shdr.sh_type == SHT_REL) {
			if (scns != relMark)
				f(scns, segs + rela, rela);
			continue;
		}

		for (j = 0; j < ehdr->e_phnum; j++) {
			phdr = &segs[j].phdr;
			if (phdr->p_offset <= scns->shdr.sh_offset
				&& scns->shdr.sh_offset + scns->shdr.sh_size
					<= phdr->p_offset + phdr->p_filesz) {
				f(scns, segs + j, j);
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
	scn->segOffset = scn->shdr.sh_offset - seg->phdr.p_offset;

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
	Elf32_Addr addr, newAddr;
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
		sorts[i]->phdr.p_memsz -= sorts[i]->phdr.p_filesz;
		sorts[i]->phdr.p_filesz = 0;

		for (j = 0; j < sorts[i]->shnum; j++) {
			scn = sorts[i]->scns[j];
			newAddr = addr;

			gap = addr & (scn->shdr.sh_addralign - 1);
			if (gap)
				newAddr += scn->shdr.sh_addralign - gap;

			gap = newAddr - addr;
			if (gap)
				sorts[i]->phdr.p_filesz += gap;

			scn->addrDiff = addr - scn->shdr.sh_addr;
			offset = addr - sorts[i]->phdr.p_vaddr;
			scn->segOffsetDiff = offset - scn->segOffset;
			scn->segOffset = offset;
			scn->shdr.sh_addr = addr;

			sorts[i]->phdr.p_filesz += scn->shdr.sh_size;
			addr += scn->shdr.sh_size;
		}

		sorts[i]->phdr.p_memsz += sorts[i]->phdr.p_filesz;
	}

	for (i = loadNum; i < segnum; i++) {
		sorts[i]->phdr.p_memsz -= sorts[i]->phdr.p_filesz;
		sorts[i]->phdr.p_filesz = 0;

		for (j = 0; j < sorts[i]->shnum; j++) {
			scn = sorts[i]->scns[j];

			/* It doesn't back up sh_type, but it doesn't matter
			   because writeSegs assume sections whose sh_type were
			   SHT_REL */
			if (scn->shdr.sh_type == SHT_REL) {
				scn->shdr.sh_type = SHT_SCE_RELA;

			}

			scn->segOffsetDiff = sorts[i]->phdr.p_filesz - scn->segOffset;
			scn->segOffset = sorts[i]->phdr.p_filesz;
			sorts[i]->phdr.p_filesz += scn->shdr.sh_size;
		}

		sorts[i]->phdr.p_memsz += sorts[i]->phdr.p_filesz;
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

int writeSegs(FILE *dst, FILE *src, const seg_t *segs, Elf32_Half phnum,
	const char *strtab, const char *str)
{
	Elf32_Half i, j;
	int res;

	if (dst == NULL || src == NULL || segs == NULL
		|| strtab == NULL || str == NULL)
	{
		return EINVAL;
	}

	for (i = 0; i < phnum; i++) {
		for (j = 0; j < segs->shnum; j++) {
			if (fseek(dst, segs->scns[j]->shdr.sh_offset, SEEK_SET)) {
				perror(strtab + segs->scns[j]->shdr.sh_name);
				return errno;
			}

			if (segs->scns[j]->content != NULL) {
				if (fwrite(segs->scns[j]->content, segs->scns[j]->shdr.sh_size, 1, dst) != 1) {
					perror(strtab + segs->scns[j]->shdr.sh_name);
					return errno;
				}

				free(segs->scns[j]->content);
				segs->scns[j]->content = NULL;

				continue;
			}

			res = writeScn(dst, src, segs->scns[j], strtab);
			if (res)
				return res;
		}

		segs++;
	}

	return 0;
}
