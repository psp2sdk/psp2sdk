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

#ifndef _STUB_H_
#define _STUB_H_

#include <elf.h>
#include <stdio.h>
#include "scn.h"

typedef struct {
	void *relaFstub;
	void *relaStub;
	void *fnid;
	void *stub;
} stubContents_t;

int buildStubs(stubContents_t *stubContents, sceScns_t *sceScns,
	FILE *srcFp, const scn_t *scns, const char *strtab, Elf32_Sym *symtab);

#endif
