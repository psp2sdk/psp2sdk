/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef INFO_H
#define INFO_H

#include <stdio.h>
#include "elf.h"
#include "scn.h"
#include "seg.h"

typedef struct {
	Elf32_Word start;
	Elf32_Word stop;
} syslib_t;

int findSyslib(syslib_t *syslib, FILE *fp, scn_t *scns, Elf32_Half shnum,
	const seg_t *segs, const seg_t *rela,
	const char *strtab, const Elf32_Sym *symtab,
	scn_t *ent, const scn_t *relEnt);

int updateModinfo(FILE *fp, const scn_t *scns, Elf32_Half shnum,
	const sceScns_t *sceScns, Elf32_Addr base,
	const syslib_t *syslib, const char *strtab, const char *str);

#endif
