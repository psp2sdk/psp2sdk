/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include "elf.h"
#include "rel.h"
#include "scn.h"

Elf32_Rel *findRelByOffset(const scn_t *scn, Elf32_Addr offset,
	const char *strtab)
{
	Elf32_Half i;
	Elf32_Rel *ent;

	if (scn == NULL || scn->content == NULL || strtab == NULL)
		return NULL;

	ent = scn->content;
	for (i = 0; i < scn->shdr.sh_size; i += sizeof(Elf32_Rel)) {
		if (ent->r_offset == offset)
			return ent;

		ent++;
	}

	fprintf(stderr, "%s: Relocation entry for offset 0x%08X not found\n",
		strtab + scn->shdr.sh_name, offset);

	errno = EILSEQ;
	return NULL;
}

int updateRel(FILE *fp, scn_t *scns,
	const char *strtab, const Elf32_Sym *symtab,
	scn_t **relScns, Elf32_Half relShnum)
{
	scn_t *dstScn;
	scn_t *scn;
	Elf32_Rel *rel;
	Elf32_Word i, st_shndx, type;
	int res;

	if (fp == NULL || scns == NULL || strtab == NULL || symtab == NULL
		|| relScns == NULL)
	{
		return EINVAL;
	}

	while (relShnum) {
		scn = *relScns;
		if (scn == NULL)
			return EINVAL;
		if (scn->shdr.sh_type == SHT_REL) {
			res = loadScn(fp, scn, strtab + scn->shdr.sh_name);
			if (res)
				return res;

			dstScn = scns + scn->shdr.sh_info;

			rel = scn->content;
			for (i = 0; i < scn->orgSize;
				i += sizeof(Elf32_Rel), rel++)
			{
				rel->r_offset += dstScn->addrDiff;

				type = ELF32_R_TYPE(rel->r_info);
				if (type != R_ARM_ABS32 && type != R_ARM_TARGET1)
					continue;

				st_shndx = symtab[ELF32_R_SYM(rel->r_info)].st_shndx;
				if (st_shndx == SHN_UNDEF
					|| st_shndx >= SHN_LORESERVE)
				{
					continue;
				}

				if (dstScn->content == NULL) {
					res = loadScn(fp, dstScn,
						strtab + dstScn->shdr.sh_name);
					if (res)
						return res;
				}

				*(Elf32_Word *)((uintptr_t)dstScn->content
					+ rel->r_offset - dstScn->shdr.sh_addr)
						+= scns[st_shndx].addrDiff;
			}
		}

		relScns++;
		relShnum--;
	}

	return 0;
}

int convRelToRela(scn_t *scns, seg_t *segs, const Elf32_Sym *symtab,
	scn_t **relScns, Elf32_Half relShnum)
{
	Psp2_Rela *buf, *cur;
	scn_t *scn, *dstScn;
	const Elf32_Rel *rel;
	const Elf32_Sym *sym;
	Elf32_Addr addend;
	Elf32_Word i, type;
	Elf32_Half symseg;

	if (scns == NULL || symtab == NULL || relScns == NULL)
		return EINVAL;

	while (relShnum) {
		scn = *relScns;

		if (scn->shdr.sh_type != SHT_REL)
			goto cont;

		rel = scn->content;

		buf = malloc(scn->shdr.sh_size);
		cur = buf;

		dstScn = scns + scn->shdr.sh_info;

		for (i = 0; i < scn->orgSize; i += sizeof(*rel)) {
			type = ELF32_R_TYPE(rel->r_info);
			sym = symtab + ELF32_R_SYM(rel->r_info);

			PSP2_R_SET_SHORT(cur, 0);
			PSP2_R_SET_TYPE(cur, type);
			PSP2_R_SET_DATSEG(cur, dstScn->phndx);
			PSP2_R_SET_OFFSET(cur, rel->r_offset
				- segs[dstScn->phndx].phdr.p_vaddr);

			if (sym->st_shndx != SHN_ABS
				&& (type == R_ARM_ABS32 || type == R_ARM_TARGET1))
			{
				if (dstScn->content == NULL)
					return EINVAL;

				addend = *(Elf32_Word *)((uintptr_t)dstScn->content
					+ rel->r_offset - dstScn->shdr.sh_addr);
			} else {
				addend = sym->st_value;
				if (type == R_ARM_CALL)
					addend -= 8;
			}

			if (sym->st_shndx == SHN_ABS)
				symseg = 15;
			else {
				symseg = scns[sym->st_shndx].phndx;
				addend -= segs[symseg].phdr.p_vaddr;
			}

			PSP2_R_SET_SYMSEG(cur, symseg);
			PSP2_R_SET_ADDEND(cur, addend);

			rel++;
			cur++;
		}

		free(scn->content);

		scn->shdr.sh_type = SHT_PSP2_RELA;
		scn->content = buf;

cont:
		relScns++;
		relShnum--;
	}

	return 0;
}
