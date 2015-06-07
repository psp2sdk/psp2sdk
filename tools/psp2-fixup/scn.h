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

#ifndef _SCN_H_
#define _SCN_H_

#include <stdio.h>
#include "elf.h"

typedef struct {
	Elf32_Addr addrDiff;
	Elf32_Word orgOffset;
	Elf32_Word orgSize;
	Elf32_Half phndx;
	Elf32_Word segOffset;
	Elf32_Shdr shdr;
} scn_t;

typedef struct {
	scn_t *relFstub;
	scn_t *relStub;
	scn_t *fnid;
	scn_t *fstub;
	scn_t *stub;
	scn_t *mark;
	scn_t *relMark;
	scn_t *modinfo;
} sceScns_t;

scn_t *findScn(const scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *name, const char *path);

void *loadScn(FILE *fp, const char *path, const scn_t *scn,
	const char *strtab);

scn_t *getScns(FILE *fp, const char *path, const Elf32_Ehdr *ehdr);

scn_t *getSymtabScn(const char *path, scn_t *scns, Elf32_Half shnum);

int getSceScns(sceScns_t *sceScns, scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *path);

int updateSceScnsSize(sceScns_t *scns);

int writeModinfo(FILE *dst, FILE *src, const scn_t *scn, const char *strtab);

int writeScn(FILE *dst, FILE *src, const scn_t *scn, const char *strtab);

#endif
