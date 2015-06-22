/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef STUB_H
#define STUB_H

#include <stdio.h>
#include "elf.h"
#include "scn.h"
#include "seg.h"

int updateStubs(sceScns_t *sceScns, FILE *fp,
	const scn_t *scns, const seg_t *segs,
	const char *strtab, Elf32_Sym *symtab);

#endif
