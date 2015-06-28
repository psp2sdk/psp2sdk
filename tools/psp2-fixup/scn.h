/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef SCN_H
#define SCN_H

#include <stdio.h>
#include "elf.h"

typedef struct {
	Elf32_Sword addrDiff;
	Elf32_Word orgOffset;
	Elf32_Word orgSize;
	Elf32_Half phndx;
	Elf32_Word segOffset;
	void *content;
	Elf32_Shdr shdr;
} scn_t;

typedef struct {
	scn_t *relFstub;
	scn_t *relVstub;
	scn_t *relEnt;
	scn_t *relStub;
	scn_t *fnid;
	scn_t *fstub;
	scn_t *vnid;
	scn_t *vstub;
	scn_t *ent;
	scn_t *stub;
	scn_t *mark;
	scn_t *relMark;
	scn_t *modinfo;
} sceScns_t;

scn_t *findScnByName(const scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *name, const char *str);

scn_t *findScnByType(const scn_t *scns, Elf32_Half shnum,
	Elf32_Word type, const char *str);

int loadScn(FILE *fp, scn_t *scn, const char *str);

scn_t *getScns(FILE *fp, const char *path, const Elf32_Ehdr *ehdr);

scn_t *getSymtabScn(const char *path, scn_t *scns, Elf32_Half shnum);

int getSceScns(sceScns_t *sceScns, scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *path);

int updateSceScnsSize(sceScns_t *scns);

int writeScn(FILE *dst, FILE *src, const scn_t *scn, const char *strtab);

#endif
