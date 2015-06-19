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

#ifndef SCN_H
#define SCN_H

#include <stdio.h>
#include "elf.h"

typedef struct {
	Elf32_Sword addrDiff;
	Elf32_Sword segOffsetDiff;
	Elf32_Word orgOffset;
	Elf32_Word orgSize;
	Elf32_Half phndx;
	Elf32_Word segOffset;
	void *content;
	Elf32_Shdr shdr;
} scn_t;

typedef struct {
	scn_t *relFstub;
	scn_t *relEnt;
	scn_t *relStub;
	scn_t *fnid;
	scn_t *fstub;
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

int convRelToRela(FILE *fp, const scn_t *scns,
	const char *strtab, const Elf32_Sym *symtab,
	scn_t **relScns, Elf32_Half relShnum);

int writeModinfo(FILE *dst, FILE *src, const scn_t *scns, Elf32_Half shnum,
	const sceScns_t *sceScns, const char *strtab, const char *str);

int writeScn(FILE *dst, FILE *src, const scn_t *scn, const char *strtab);

#endif
