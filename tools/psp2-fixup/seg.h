/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef SEG_H
#define SEG_H

#include <stdio.h>
#include "elf.h"
#include "scn.h"

typedef struct {
	Elf32_Phdr phdr;
	Elf32_Half shnum;
	scn_t **scns;
} seg_t;

seg_t *getSegs(FILE *fp, const char *path, Elf32_Ehdr *ehdr,
	scn_t *scns, seg_t **rela, const scn_t *relMark);

int freeSegs(seg_t *segs, Elf32_Half segnum);

int updateSegs(seg_t *segs, Elf32_Half segnum, const char *strtab);

int writePhdrs(FILE *dstFp, const char *dst,
	const Elf32_Ehdr *ehdr, const seg_t *segs);

int writeSegs(FILE *dst, FILE *src,
	const seg_t *segs, Elf32_Half phnum, const char *strtab);

#endif
