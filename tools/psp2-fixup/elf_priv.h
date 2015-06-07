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

#ifndef _ELF_PRIV_H_
#define _ELF_PRIV_H_

#include <stdio.h>
#include "elf.h"
#include "scn.h"
#include "seg.h"

typedef struct {
	const char *path;
	FILE *fp;
	Elf32_Ehdr ehdr;
	scn_t *scns;
	seg_t *segs;
	sceScns_t sceScns;
	stubContents_t stubContents;
	struct {
		scn_t *scn;
		void *content;
	} strtab;
	struct {
		scn_t *scn;
		void *content;
	} symtab;
} elf_t;

int openElf(elf_t *dst, const char *path);
int closeElf(const elf_t *elf);
int updateElf(elf_t *elf);
int writeElf(const char *path, elf_t *elf);

#endif
