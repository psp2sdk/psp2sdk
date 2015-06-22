/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include <errno.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include "elf_psp2.h"
#include "elf.h"
#include "rel.h"
#include "stub.h"

// fstubOffset and markOffset should be relative to segment
static int addStub(Psp2_Rela_Short *relaFstub, const scn_t *fstub,
	Elf32_Word *fnid, const scn_t *relMark, const scn_t *mark,
	Elf32_Addr fstubOffset, Elf32_Addr markOffset,
	const scn_t *scns, const seg_t *segs,
	const char *strtab, const Elf32_Sym *symtab)
{
	const Elf32_Rel *rel;
	const Elf32_Sym *sym;
	Elf32_Word type;
	Elf32_Half symseg;
	Elf32_Addr addend;

	if (relaFstub == NULL || fstub == NULL || fnid == NULL
		|| relMark == NULL || relMark->content == NULL
		|| mark == NULL || mark->content == NULL
		|| scns == NULL || symtab == NULL)
	{
		return EINVAL;
	}

	rel = findRelByOffset(relMark,
		markOffset + offsetof(sce_libgen_mark_stub, stub), strtab);
	if (rel == NULL)
		return errno;

	type = ELF32_R_TYPE(rel->r_info);
	sym = symtab + ELF32_R_SYM(rel->r_info);
	symseg = scns[sym->st_shndx].phndx;

	PSP2_R_SET_SHORT(relaFstub, 1);
	PSP2_R_SET_SYMSEG(relaFstub, symseg);
	PSP2_R_SET_TYPE(relaFstub, type);
	PSP2_R_SET_DATSEG(relaFstub, fstub->phndx);
	PSP2_R_SET_OFFSET(relaFstub, fstubOffset);

	if (type == R_ARM_ABS32 || type == R_ARM_TARGET1) {
		if (mark->content == NULL)
			return EINVAL;

		addend = *(Elf32_Word *)((uintptr_t)mark->content
			+ rel->r_offset - mark->shdr.sh_addr);
	} else
		addend = sym->st_value;

	addend -= segs[symseg].phdr.p_vaddr;
	PSP2_R_SET_ADDEND(relaFstub, addend);

	*fnid = *(Elf32_Word *)((uintptr_t)mark->content
		+ markOffset - mark->shdr.sh_addr
		+ offsetof(sce_libgen_mark_stub, nid));

	return 0;
}

int updateStubs(sceScns_t *sceScns, FILE *fp,
	const scn_t *scns, const seg_t *segs,
	const char *strtab, Elf32_Sym *symtab)
{
	union {
		uint8_t size;
		sce_libgen_mark_head head;
		sce_libgen_mark_stub stub;
	} *p;
	sceLib_stub *stubHeads;
	Psp2_Rela_Short *relaFstubEnt, *relaStubEnt;
	Elf32_Off offset, fnidOffset, fstubOffset, stubOffset;
	Elf32_Rel *rel, *relMarkEnt;
	Elf32_Sym *sym;
	Elf32_Word i, type, *fnidEnt;
	Elf32_Half symseg;
	Elf32_Addr addend;
	int res;

	if (sceScns == NULL || fp == NULL || scns == NULL || segs == NULL
		|| strtab == NULL || symtab == NULL)
	{
		return EINVAL;
	}

	sceScns->relFstub->content = malloc(sceScns->relFstub->shdr.sh_size);
	if (sceScns->relFstub->content == NULL) {
		perror(strtab + sceScns->relFstub->shdr.sh_name);
		return errno;
	}

	sceScns->relStub->content = malloc(sceScns->relStub->shdr.sh_size);
	if (sceScns->relFstub->content == NULL) {
		perror(strtab + sceScns->relStub->shdr.sh_name);
		return errno;
	}

	sceScns->fnid->content = malloc(sceScns->fnid->shdr.sh_size);
	if (sceScns->fnid->content == NULL) {
		perror(strtab + sceScns->fnid->shdr.sh_name);
		return errno;
	}

	sceScns->stub->content = malloc(sceScns->stub->shdr.sh_size);
	if (sceScns->stub->content == NULL) {
		perror(strtab + sceScns->stub->shdr.sh_name);
		return errno;
	}

	res = loadScn(fp, sceScns->mark,
		strtab + sceScns->mark->shdr.sh_name);
	if (res)
		return res;

	res = loadScn(fp, sceScns->relMark,
		strtab + sceScns->relMark->shdr.sh_name);
	if (res)
		return res;

	relaFstubEnt = sceScns->relFstub->content;
	relaStubEnt = sceScns->relStub->content;
	fnidEnt = sceScns->fnid->content;
	stubHeads = sceScns->stub->content;
	p = sceScns->mark->content;
	fnidOffset = sceScns->fnid->segOffset;
	fstubOffset = sceScns->fstub->segOffset;
	stubOffset = sceScns->stub->segOffset;
	offset = 0;
	while (offset < sceScns->mark->shdr.sh_size) {
		if (p->size == sizeof(sce_libgen_mark_head)) {
			stubHeads->size = sizeof(sceLib_stub);
			stubHeads->ver = 1;
			stubHeads->flags = 0;
			stubHeads->nid = p->head.nid;

			// Resolve name
			rel = findRelByOffset(sceScns->relMark,
				sceScns->mark->shdr.sh_addr + offset
					+ offsetof(sce_libgen_mark_head, name),
				strtab);
			if (rel == NULL)
				return errno;

			type = ELF32_R_TYPE(rel->r_info);
			sym = symtab + ELF32_R_SYM(rel->r_info);
			symseg = scns[sym->st_shndx].phndx;

			PSP2_R_SET_SHORT(relaStubEnt, 1);
			PSP2_R_SET_SYMSEG(relaStubEnt, symseg);
			PSP2_R_SET_TYPE(relaStubEnt, type);
			PSP2_R_SET_DATSEG(relaStubEnt, sceScns->stub->phndx);
			PSP2_R_SET_OFFSET(relaStubEnt, stubOffset
				+ offsetof(sceLib_stub, name));

			PSP2_R_SET_ADDEND(relaStubEnt,
				(type == R_ARM_ABS32 || type == R_ARM_TARGET1 ?
					sym->st_value : p->head.name)
				- segs[symseg].phdr.p_vaddr);

			relaStubEnt++;

			// Resolve function NID table
			PSP2_R_SET_SHORT(relaStubEnt, 1);
			PSP2_R_SET_SYMSEG(relaStubEnt, sceScns->fnid->phndx);
			PSP2_R_SET_TYPE(relaStubEnt, R_ARM_ABS32);
			PSP2_R_SET_DATSEG(relaStubEnt, sceScns->stub->phndx);
			PSP2_R_SET_OFFSET(relaStubEnt, stubOffset
				+ offsetof(sceLib_stub, funcNids));
			PSP2_R_SET_ADDEND(relaStubEnt, fnidOffset);
			relaStubEnt++;

			// Resolve function stub table
			PSP2_R_SET_SHORT(relaStubEnt, 1);
			PSP2_R_SET_SYMSEG(relaStubEnt, sceScns->fstub->phndx);
			PSP2_R_SET_TYPE(relaStubEnt, R_ARM_ABS32);
			PSP2_R_SET_DATSEG(relaStubEnt, sceScns->stub->phndx);
			PSP2_R_SET_OFFSET(relaStubEnt, stubOffset
				+ offsetof(sceLib_stub, funcStubs));
			PSP2_R_SET_ADDEND(relaStubEnt, fstubOffset);
			relaStubEnt++;

			// TODO: Support other types
			stubHeads->varNids = 0;
			stubHeads->varStubs = 0;
			stubHeads->unkNids = 0;
			stubHeads->unkStubs = 0;

			// Resolve nids and stubs
			stubHeads->funcNum = 0;
			stubHeads->varNum = 0;
			stubHeads->unkNum = 0;

			relMarkEnt = sceScns->relMark->content;
			for (i = 0; i < sceScns->relMark->orgSize / sizeof(Elf32_Rel); i++) {
				sym = symtab + ELF32_R_SYM(relMarkEnt->r_info);
				type = ELF32_R_TYPE(relMarkEnt->r_info);

				if (type == R_ARM_ABS32 || type == R_ARM_TARGET1) {
					if (scns + sym->st_shndx != sceScns->mark)
						goto cont;

					addend = *(Elf32_Word *)((uintptr_t)sceScns->mark->content
						+ relMarkEnt->r_offset - sceScns->mark->shdr.sh_addr);
				} else
					addend = sym->st_value;

				if (addend != sceScns->mark->shdr.sh_addr + offset)
					goto cont;

				res = addStub(relaFstubEnt, sceScns->fstub, fnidEnt,
					sceScns->relMark, sceScns->mark,
					fstubOffset,
					relMarkEnt->r_offset
						- offsetof(sce_libgen_mark_stub, head),
					scns, segs, strtab, symtab);
				if (res)
					return res;

				relaFstubEnt++;
				fnidEnt++;
				fstubOffset += sizeof(Elf32_Addr);
				fnidOffset += sizeof(Elf32_Word);
				stubHeads->funcNum++;
cont:
				relMarkEnt++;
			}

			stubOffset += sizeof(sceLib_stub);
			stubHeads++;
		} else if (p->size == 0) {
			printf("%s: Invalid mark\n",
				strtab + sceScns->mark->shdr.sh_name);
			return EILSEQ;
		}

		offset += p->size;
		p = (void *)((uintptr_t)p + p->size);
	}

	sceScns->relFstub->shdr.sh_type = SHT_PSP2_RELA;
	sceScns->relStub->shdr.sh_type = SHT_PSP2_RELA;

	return 0;
}
