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

#ifndef _SEG_H_
#define _SEG_H_

#include <stdio.h>
#include "elf.h"
#include "scn.h"
#include "stub.h"

typedef struct {
	Elf32_Phdr phdr;
	Elf32_Half shnum;
	scn_t **scns;
} seg_t;

seg_t *getSegs(FILE *fp, const char *path,
	const Elf32_Ehdr *ehdr, const scn_t *scns);

int freeSegs(seg_t *segs, Elf32_Half segnum);

int updateSegs(seg_t *segs, Elf32_Half segnum, const char *strtab);

int writePhdrs(FILE *dstFp, const char *dst,
	const Elf32_Ehdr *ehdr, const seg_t *segs);

int writeSegs(FILE *dst, FILE *src, const scn_t *scns,
	const seg_t *segs, Elf32_Half phnum,
	const sceScns_t *sceScns, const stubContents_t *stubContents,
	const char *strtab, const Elf32_Sym *symtab);

#endif
