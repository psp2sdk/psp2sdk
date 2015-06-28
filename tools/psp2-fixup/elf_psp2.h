/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef ELF_PSP2_H
#define ELF_PSP2_H

#include <stdint.h>
#include "elf.h"

typedef struct {
		uint8_t size;
		uint8_t unk0[3];
		uint32_t nid;
		uint32_t name;
		uint32_t ver;
		uint32_t unk[2];
} sce_libgen_mark_head;

typedef struct {
	uint8_t size;
	uint8_t unk[3];
	uint32_t head;
	uint32_t stub;
	uint32_t nid;
	uint32_t nidSym;
} sce_libgen_mark_stub;

typedef struct {
	uint16_t size;
	uint16_t ver;
	uint16_t flags;
	uint16_t funcNum;
	uint16_t varNum;
	uint16_t unkNum;
	uint32_t unused0;
	uint32_t nid;
	uint32_t name;
	uint32_t unused1;
	uint32_t funcNids;
	uint32_t funcStubs;
	uint32_t varNids;
	uint32_t varStubs;
	uint32_t unkNids;
	uint32_t unkStubs;
} sceLib_stub;

typedef struct {
	uint16_t attr;
	uint16_t ver;
	char name[27];
	uint8_t type;
	Elf32_Addr gp;
	uint32_t expTop;
	uint32_t expBtm;
	uint32_t impTop;
	uint32_t impBtm;
	uint32_t nid;
	uint32_t unk[3];
	uint32_t start;
	uint32_t stop;
	uint32_t exidxTop;
	uint32_t exidxBtm;
	uint32_t extabTop;
	uint32_t extabBtm;
} _sceModuleInfo;

typedef Elf32_Word Psp2_Rela[3];

#define PSP2_R_SET_SHORT(rela, isShort) {	\
		(*(rela))[0] &= 0xFFFFFFF0;	\
		(*(rela))[0] |= (isShort) ? 1 : 0;	\
	}
#define PSP2_R_SET_SYMSEG(rela, symseg) {	\
		(*(rela))[0] &= 0xFFFFFF0F;	\
		(*(rela))[0] |= (symseg) << 4;	\
	}
#define PSP2_R_SET_TYPE(rela, code) {	\
		(*(rela))[0] &= 0xFFFF00FF;	\
		(*(rela))[0] |= (code) << 8;	\
	}
#define PSP2_R_SET_DATSEG(rela, datseg) {	\
		(*(rela))[0] &= 0xFFF0FFFF;	\
		(*(rela))[0] |= (datseg) << 16;	\
	}

#define PSP2_R_SET_ADDEND(rela, addend) {	\
		(*(rela))[1] = addend;	\
	}

#define PSP2_R_SET_OFFSET(rela, offset) {	\
		(*(rela))[2] = offset;	\
	}

enum {
	ET_PSP2_RELEXEC = 0xFE04
};

enum {
	SHT_INTERNAL = SHT_NULL,
	SHT_PSP2_RELA = 0x60000000
};

#endif
