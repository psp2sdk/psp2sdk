/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
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
} elf_t;

int openElf(elf_t *dst, const char *path);
int closeElf(elf_t *elf);
int updateElf(elf_t *elf);
int writeElf(const char *path, elf_t *elf);

#endif
