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

#ifndef ELF_PRIV_H
#define ELF_PRIV_H

#include <stdio.h>
#include "elf.h"
#include "scn.h"
#include "seg.h"

typedef struct {
	const char *path;
	FILE *fp;
	Elf32_Ehdr ehdr;
	Elf32_Half orgShnum;
	scn_t *scns;
	seg_t *segs;
	sceScns_t sceScns;
	scn_t *strtab;
	scn_t *symtab;
	seg_t *rela;
	syslib_t syslib;
} elf_t;

int openElf(elf_t *dst, const char *path);
int closeElf(elf_t *elf);
int updateElf(elf_t *elf);
int writeElf(const char *path, elf_t *elf);

#endif
