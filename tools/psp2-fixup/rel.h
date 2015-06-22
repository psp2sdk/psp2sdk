/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef REL_H
#define REL_H

#include <stdint.h>
#include "elf_psp2.h"
#include "elf.h"
#include "scn.h"
#include "seg.h"

Elf32_Rel *findRelByOffset(const scn_t *scn, Elf32_Addr offset,
	const char *strtab);

int updateRel(FILE *fp, scn_t *scns,
	const char *strtab, const Elf32_Sym *symtab,
	scn_t **relScns, Elf32_Half relShnum);

int convRelToRela(scn_t *scns, seg_t *segs, const Elf32_Sym *symtab,
	scn_t **relScns, Elf32_Half relShnum);

#endif
