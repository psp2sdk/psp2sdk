#ifndef _ELF_PSP2_H_
#define _ELF_PSP2_H_

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
	uint8_t unk0[3];
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
	Elf32_Word r_short : 4;
	Elf32_Word r_symseg : 4;
	Elf32_Word r_code : 8;
	Elf32_Word r_datseg : 4;
	Elf32_Word r_offset : 32;
	Elf32_Word r_addend : 12;
} Psp2_Rela_Short;

enum {
	ET_SCE_RELEXEC = 0xFE04
};

enum {
	SHT_SCE_RELA = 0x60000000
};

#endif
