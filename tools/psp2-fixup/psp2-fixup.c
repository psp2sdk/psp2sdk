/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License version 2.1 as published by the Free Software Foundation
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

#include <psp2moduleinfo.h>
#include <openssl/sha.h>
#include <errno.h>
#include <elf.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

typedef struct {
	Elf32_Addr addrDiff;
	Elf32_Word orgOffset;
	Elf32_Word orgSize;
	Elf32_Half phndx;
	Elf32_Word segOffset;
	Elf32_Shdr shdr;
} scn_t;

typedef struct {
	Elf32_Phdr phdr;
	Elf32_Half shnum;
	scn_t **scns;
} seg_t;

typedef struct {
	void *relaFstub;
	void *relaStub;
	void *fnid;
	void *stub;
} stubContents_t;

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

typedef struct {
	const char *path;
	FILE *fp;
	Elf32_Ehdr ehdr;
	scn_t *scns;
	seg_t *segs;
	sceScns_t sceScns;
	stubContents_t stubContents;
	struct {
		scn_t *scn;
		void *content;
	} strtab;
	struct {
		scn_t *scn;
		void *content;
	} symtab;
} elf_t;

enum {
	ET_SCE_RELEXEC = 0xFE04
};

enum {
	SHT_SCE_RELA = 0x60000000
};

static scn_t *findScn(const scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *name, const char *path)
{
	if (scns == NULL || strtab == NULL || name == NULL || path == NULL)
		return NULL;

	while (shnum) {
		if (!strcmp(strtab + scns->shdr.sh_name, name))
			return (scn_t *)scns;
		scns++;
		shnum--;
	}

	fprintf(stderr, "%s: %s is not found\n", path, name);
	errno = EILSEQ;

	return NULL;
}

static void *loadScn(FILE *fp, const char *path, const scn_t *scn,
	const char *strtab)
{
	void *p;

	if (fp == NULL || scn == NULL)
		return NULL;

	if (fseek(fp, scn->shdr.sh_offset, SEEK_SET)) {
		if (strtab != NULL)
			perror(strtab + scn->shdr.sh_name);
		else if (path != NULL)
			perror(path);

		return NULL;
	}

	p = malloc(scn->shdr.sh_size);
	if (p == NULL) {
		if (strtab != NULL)
			perror(strtab + scn->shdr.sh_name);
		else if (path != NULL)
			perror(path);

		return NULL;
	}

	if (fread(p, scn->shdr.sh_size, 1, fp) <= 0) {
		if (strtab != NULL)
			perror(strtab + scn->shdr.sh_name);
		else if (path != NULL)
			perror(path);

		free(p);
		return NULL;
	}

	return p;
}

static scn_t *getScns(FILE *fp, const char *path, const Elf32_Ehdr *ehdr)
{
	scn_t *scns;
	Elf32_Half i;

	if (fseek(fp, ehdr->e_shoff, SEEK_SET)) {
		perror(path);
		return NULL;
	}

	scns = malloc(ehdr->e_shnum * sizeof(scn_t));
	if (scns == NULL) {
		perror(NULL);
		return NULL;
	}

	for (i = 0; i < ehdr->e_shnum; i++) {
		if (fread(&scns[i].shdr, sizeof(scns[i].shdr), 1, fp) <= 0) {
			perror(path);
			free(scns);
			return NULL;
		}

		scns[i].orgOffset = scns[i].shdr.sh_offset;
		scns[i].orgSize = scns[i].shdr.sh_size;
	}

	return scns;
}

static void mapOverScnSeg(void (* f)(scn_t *, seg_t *, Elf32_Half),
	scn_t *scns, seg_t *segs, const Elf32_Ehdr *ehdr)
{
	Elf32_Half i, j;
	Elf32_Phdr *phdr;

	for (i = 0; i < ehdr->e_shnum; i++)
		for (j = 0; j < ehdr->e_phnum; j++) {
			phdr = &segs[j].phdr;
			if (phdr->p_offset <= scns[i].shdr.sh_offset
				&& scns[i].shdr.sh_offset + scns[i].shdr.sh_size
					<= phdr->p_offset + phdr->p_filesz) {
				f(scns + i, segs + j, j);
				break;
			}
		}
				
}

static void segCntScns(scn_t *scn, seg_t *seg, Elf32_Half index)
{
	seg->shnum++;
}

static void segCntMapScns(scn_t *scn, seg_t *seg, Elf32_Half index)
{
	scn->phndx = index;
	scn->segOffset = scn->shdr.sh_offset - seg->phdr.p_offset;

	seg->scns[seg->shnum] = scn;
	seg->shnum++;
}

/* Load phdrs and scns included in the sections. scns will be sorted. */
static seg_t *getSegs(FILE *fp, const char *path,
	const Elf32_Ehdr *ehdr, const scn_t *scns)
{
	Elf32_Half i, j, k;
	scn_t *tmp;
	seg_t *segs;

	if (fp == NULL || path == NULL || ehdr == NULL || scns == NULL)
		return NULL;

	segs = malloc(ehdr->e_phnum * sizeof(seg_t));
	if (segs == NULL) {
		perror(path);
		return NULL;
	}


	if (fseek(fp, ehdr->e_phoff, SEEK_SET)) {
		perror(path);
		return NULL;
	}

	for (i = 0; i < ehdr->e_phnum; i++) {
		if (fread(&segs[i].phdr, sizeof(segs[i].phdr), 1, fp) <= 0) {
			perror(path);
			free(segs);
			return NULL;
		}

		segs[i].shnum = 0;
	}

	mapOverScnSeg(segCntScns, (scn_t *)scns, segs, ehdr);

	for (i = 0; i < ehdr->e_phnum; i++) {
		segs[i].scns = malloc(segs[i].shnum * sizeof(scn_t));
		if (segs[i].scns == NULL) {
			perror(NULL);

			while (i) {
				i--;
				free(segs[i].scns);
			}

			free(segs);
			return NULL;
		}

		segs[i].shnum = 0;
	}

	mapOverScnSeg(segCntMapScns, (scn_t *)scns, segs, ehdr);

	for (i = 0; i < ehdr->e_phnum; i++) {
		for (j = 1; j < segs[i].shnum; j++) {
			tmp = segs[i].scns[j];
			if (segs[i].scns[j - 1]->shdr.sh_addr > tmp->shdr.sh_addr) {
				k = j;
				do {
					segs[i].scns[k] = segs[i].scns[k - 1];
					k--;
				} while (k > 0 &&
					segs[i].scns[k - 1]->shdr.sh_addr > tmp->shdr.sh_addr);
				segs[i].scns[k] = tmp;
			}
		}
	}

	return segs;
}

static scn_t *getSymtabScn(const char *path, scn_t *scns, Elf32_Half shnum)
{
	while (shnum) {
		if (scns->shdr.sh_type == SHT_SYMTAB)
			return scns;

		scns++;
		shnum--;
	}

	fprintf(stderr, "%s: Symbol Table is not found.\n", path);
	return NULL;
}

static int getSceScns(sceScns_t *sceScns, scn_t *scns, Elf32_Half shnum,
	const char *strtab, const char *path)
{
	if (sceScns == NULL || scns == NULL || strtab == NULL || path == NULL)
		return EINVAL;

	sceScns->relMark = findScn(scns, shnum, strtab,
		".rel.sce_libgen_mark", path);
	if (sceScns->relMark == NULL)
		return errno;

	sceScns->mark = scns + sceScns->relMark->shdr.sh_info;

	sceScns->relFstub = findScn(scns, shnum, strtab,
		".rel.sceFStub.rodata", path);
	if (sceScns->relFstub == NULL)
		return errno;

	sceScns->fstub = scns + sceScns->relFstub->shdr.sh_info;

	sceScns->fnid = findScn(scns, shnum, strtab, ".sceFNID.rodata", path);
	if (sceScns->fnid == NULL)
		return errno;

	sceScns->relStub = findScn(scns, shnum, strtab, ".rel.sceLib.stub", path);
	if (sceScns->relStub == NULL)
		return errno;

	sceScns->stub = scns + sceScns->relStub->shdr.sh_info;

	sceScns->modinfo = findScn(scns, shnum, strtab,
		".sceModuleInfo.rodata", path);
	if (sceScns->modinfo == NULL)
		return errno;

	return 0;
}

static int freeSegs(seg_t *segs, Elf32_Half segnum)
{
	seg_t *p;

	if (segs == NULL)
		return EINVAL;

	p = segs;
	while (segnum) {
		free(p->scns);

		p++;
		segnum--;
	}

	free(segs);
	return 0;
}

static int openElf(elf_t *dst, const char *path)
{
	int res;

	if (dst == NULL || path == NULL)
		return EINVAL;

	dst->path = path;

	dst->fp = fopen(path, "rb");
	if (path == NULL) {
		perror(path);
		return errno;
	}

	if (fread(&dst->ehdr, sizeof(dst->ehdr), 1, dst->fp) <= 0) {
		perror(path);
		fclose(dst->fp);
		return errno;
	}

	dst->scns = getScns(dst->fp, path, &dst->ehdr);
	if (dst->scns == NULL) {
		fclose(dst->fp);
		return errno;
	}

	dst->segs = getSegs(dst->fp, path, &dst->ehdr, dst->scns);
	if (dst->segs == NULL) {
		free(dst->scns);
		fclose(dst->fp);
		return errno;
	}

	dst->strtab.scn = dst->scns + dst->ehdr.e_shstrndx;
	dst->strtab.content = loadScn(dst->fp, path, dst->strtab.scn, NULL);
	if (dst->strtab.content == NULL) {
		free(dst->scns);
		freeSegs(dst->segs, dst->ehdr.e_phnum);
		fclose(dst->fp);
		return errno;
	}

	dst->symtab.scn = getSymtabScn(path, dst->scns, dst->ehdr.e_shnum);
	if (dst->symtab.scn == NULL) {
		free(dst->scns);
		freeSegs(dst->segs, dst->ehdr.e_phnum);
		free(dst->strtab.content);
		fclose(dst->fp);
		return errno;
	}

	dst->symtab.content = loadScn(dst->fp, path,
		dst->symtab.scn, dst->strtab.content);
	if (dst->symtab.content == NULL) {
		free(dst->scns);
		freeSegs(dst->segs, dst->ehdr.e_phnum);
		free(dst->strtab.content);
		fclose(dst->fp);
		return errno;
	}

	res = getSceScns(&dst->sceScns, dst->scns, dst->ehdr.e_shnum,
		dst->strtab.content, path);
	if (res) {
		free(dst->scns);
		freeSegs(dst->segs, dst->ehdr.e_phnum);
		free(dst->strtab.content);
		free(dst->symtab.content);
		fclose(dst->fp);
	}

	return res;
}

static int closeElf(const elf_t *elf)
{
	int res;
	if (elf == NULL)
		return EINVAL;

	free(elf->scns);
	res = freeSegs(elf->segs, elf->ehdr.e_phnum);

	if (fclose(elf->fp)) {
		perror(elf->path);
		return errno;
	}

	if (elf->stubContents.relaFstub != NULL)
		free(elf->stubContents.relaFstub);

	if (elf->stubContents.relaStub != NULL)
		free(elf->stubContents.relaStub);

	if (elf->stubContents.fnid != NULL)
		free(elf->stubContents.fnid);

	if (elf->stubContents.stub != NULL)
		free(elf->stubContents.stub);

	return res;
}

static int updateSceScnsSize(sceScns_t *scns)
{
	Elf32_Word headNum;

	if (scns == NULL)
		return EINVAL;

	/* mark->sh_size == (the number of the heads) * 24 + (the number of the stubs) * 20
	   fnid->sh_size == (the number of stubs) * 4 */
	headNum = (scns->mark->shdr.sh_size
		- scns->fnid->shdr.sh_size / 4 * sizeof(sce_libgen_mark_stub))
			/ sizeof(sce_libgen_mark_head);

	scns->relFstub->shdr.sh_size
		= scns->fstub->shdr.sh_size / 4 * sizeof(Psp2_Rela_Short);

	scns->relStub->shdr.sh_size = headNum * 6 * sizeof(Psp2_Rela_Short);
	scns->stub->shdr.sh_size = headNum * sizeof(sceLib_stub);

	return 0;
}

static int updateSegs(seg_t *segs, Elf32_Half segnum, const char *strtab)
{
	scn_t *scn;
	seg_t **sorts, *tmp;
	Elf32_Addr addr, newAddr;
	Elf32_Off offset;
	Elf32_Half i, j;
	Elf32_Word and, gap;

	if (segs == NULL || strtab == NULL)
		return EINVAL;

	sorts = malloc(segnum * sizeof(seg_t *));
	if (sorts == NULL) {
		perror(NULL);
		return errno;
	}

	for (i = 0; i < segnum; i++)
		sorts[i] = segs + i;

	for (i = 1; i < segnum; i++) {
		tmp = sorts[i];
		if (sorts[i - 1]->phdr.p_vaddr > tmp->phdr.p_vaddr) {
			j = i;
			do {
				sorts[j] = sorts[j - 1];
				j--;
			} while (j > 0 && sorts[j - 1]->phdr.p_vaddr > tmp->phdr.p_vaddr);
			sorts[j] = tmp;
		}
	}

	addr = sorts[0]->phdr.p_vaddr;
	for (i = 1; i < segnum; i++) {
		and = sorts[i]->phdr.p_align - 1;
		if (addr & and)
			addr = (addr & ~and) + sorts[i]->phdr.p_align;

		sorts[i]->phdr.p_vaddr = addr;
		sorts[i]->phdr.p_memsz -= sorts[i]->phdr.p_filesz;
		sorts[i]->phdr.p_filesz = 0;

		for (j = 0; j < sorts[i]->shnum; j++) {
			scn = sorts[i]->scns[j];
			newAddr = addr;

			gap = addr & (scn->shdr.sh_addralign - 1);
			if (gap)
				newAddr += scn->shdr.sh_addralign - gap;

			gap = newAddr - addr;
			if (gap)
				sorts[i]->phdr.p_filesz += gap;

			/* It doesn't back up sh_type, but it doesn't matter
			   because writeSegs assume sections whose sh_type were
			   SHT_REL */
			if (scn->shdr.sh_type == SHT_REL)
				scn->shdr.sh_type = SHT_SCE_RELA;

			scn->addrDiff = addr - scn->shdr.sh_addr;
			scn->segOffset = addr - sorts[i]->phdr.p_vaddr;
			scn->shdr.sh_addr = addr;

			if (scn->shdr.sh_type == SHT_SCE_RELA
				&& scn->orgSize == scn->shdr.sh_size)
			{
				scn->shdr.sh_size /= sizeof(Elf32_Rel);
				scn->shdr.sh_size *= sizeof(Psp2_Rela_Short);
			}

			sorts[i]->phdr.p_filesz += scn->shdr.sh_size;
			addr += scn->shdr.sh_size;
		}

		sorts[i]->phdr.p_memsz += sorts[i]->phdr.p_filesz;
	}

	for (i = 1; i < segnum; i++) {
		tmp = sorts[i];
		if (sorts[i - 1]->phdr.p_offset > tmp->phdr.p_offset) {
			j = i;
			do {
				sorts[j] = sorts[j - 1];
				j--;
			} while (j > 0 && sorts[j - 1]->phdr.p_offset > tmp->phdr.p_offset);
			sorts[j] = tmp;
		}
	}

	offset = sizeof(Elf32_Ehdr) + sizeof(Elf32_Phdr) * segnum;
	for (i = 0; i < segnum; i++) {
		and = sorts[i]->phdr.p_align - 1;
		if (offset & and)
			offset = (offset & ~and) + sorts[i]->phdr.p_align;

		sorts[i]->phdr.p_offset = offset;

		for (j = 0; j < sorts[i]->shnum; j++) {
			scn = sorts[i]->scns[j];

			scn->shdr.sh_offset = offset + scn->segOffset;
		}

		offset += sorts[i]->phdr.p_filesz;
	}

	for (i = 1; i < segnum; i++) {
		tmp = sorts[i];
		if (sorts[i - 1]->phdr.p_paddr > tmp->phdr.p_paddr) {
			j = i;
			do {
				sorts[j] = sorts[j - 1];
				j--;
			} while (j > 0 && sorts[j - 1]->phdr.p_paddr > tmp->phdr.p_paddr);
			sorts[j] = tmp;
		}
	}

	addr = sorts[0]->phdr.p_paddr;
	for (i = 1; i < segnum; i++) {
		and = sorts[i]->phdr.p_align - 1;
		if (addr & and)
			addr = (addr & ~and) + sorts[i]->phdr.p_align;

		sorts[i]->phdr.p_paddr = addr;
		addr += sorts[i]->phdr.p_memsz;
	}

	return 0;
}

static int updateEhdr(Elf32_Ehdr *ehdr, const char *path,
	seg_t *segs, scn_t *modinfo)
{
	Elf32_Off offset;
	int i, j;

	if (ehdr == NULL || segs == NULL)
		return EINVAL;

	ehdr->e_type = ET_SCE_RELEXEC;

	for (i = 0; i < ehdr->e_phnum || i < 4; i++)
		for (j = 0; j < segs[i].shnum; j++)
			if (segs[i].scns[j] == modinfo)
					goto found;

	fprintf(stderr, "%s: .sceModuleInfo.rodata not found\n", path);
	return EILSEQ;

found:
	offset = modinfo->shdr.sh_offset - segs[i].phdr.p_offset;
	if (offset >= 1 << 30) {
		fprintf(stderr, "%s: .sceModuleInfo.rodata is invalid\n", path);
		return EILSEQ;
	}

	ehdr->e_entry = (i << 30) | offset;

	ehdr->e_phoff = sizeof(Elf32_Ehdr);
	ehdr->e_shoff = 0;
	ehdr->e_shentsize = 0;
	ehdr->e_shnum = 0;
	ehdr->e_shstrndx = 0;

	return 0;
}

static int updateSymtab(Elf32_Sym *symtab, Elf32_Word size, scn_t *scns)
{
	if (symtab == NULL || scns == NULL)
		return EINVAL;

	while (size) {
		if (symtab->st_shndx != SHN_UNDEF
			&& symtab->st_shndx < SHN_LORESERVE)
		{
			symtab->st_value -= scns[symtab->st_shndx].addrDiff;
		}

		symtab++;
		size -= sizeof(Elf32_Sym);
	}

	return 0;
}

static int updateElf(elf_t *elf)
{
	int res;

	if (elf == NULL)
		return errno;

	res = updateSceScnsSize(&elf->sceScns);
	if (res)
		return res;

	res = updateSegs(elf->segs, elf->ehdr.e_phnum, elf->strtab.content);
	if (res)
		return res;

	res = updateEhdr(&elf->ehdr,
		elf->path, elf->segs, elf->sceScns.modinfo);
	if (res)
		return res;

	res = updateSymtab(elf->symtab.content, elf->symtab.scn->orgSize,
		elf->scns);
	return res;
}

static int writeRel(FILE *dst, FILE *src,
	const scn_t *scn, const seg_t *seg, const scn_t *scns,
	const char *strtab, const Elf32_Sym *symtab, const scn_t *modinfo)
{
	Psp2_Rela_Short rela;
	const scn_t *dstScn;
	Elf32_Rel rel;
	const Elf32_Sym *sym;
	Elf32_Word i, j, type;

	if (dst == NULL || src == NULL
		|| scn == NULL || seg == NULL || scns == NULL
		|| strtab == NULL || symtab == NULL)
	{
		return EINVAL;
	}

	dstScn = scns + scn->shdr.sh_info;

	for (i = 0; i < scn->orgSize; i += sizeof(rel)) {
		if (fread(&rel, sizeof(rel), 1, src) <= 0) {
			perror(strtab + scn->shdr.sh_name);
			return errno;
		}

		type = ELF32_R_TYPE(rel.r_info);
		if (type == R_ARM_NONE || type == R_ARM_TARGET2)
			continue;

		sym = symtab + ELF32_R_SYM(rel.r_info);

		rela.r_short = 1;
		rela.r_symseg = scns[sym->st_shndx].phndx;
		rela.r_code = type;
		rela.r_datseg = dstScn->phndx;

		if (dstScn == modinfo) {
			rela.r_addend = scns[sym->st_shndx].shdr.sh_offset;
			switch (rel.r_offset) {
				case 40: // The bottom of the export table
				case 48: // The bottom of the import table
					rela.r_addend += scns[sym->st_shndx].shdr.sh_size;
				case 36: // The top of the export table
				case 44: // The top of the import table
				break;
			default:
				goto usual;
			}
		} else {
usual:
			rela.r_addend = sym->st_value;
			if (type == R_ARM_ABS32 || type == R_ARM_TARGET1) {
				if (fseek(src, dstScn->orgOffset + rel.r_offset, SEEK_SET)) {
					perror(strtab + scn->shdr.sh_name);
					return errno;
				}

				if (fread(&j, sizeof(j), 1, src) <= 0) {
					perror(strtab + scn->shdr.sh_name);
					return errno;
				}

				rela.r_addend += j;
			}
		}

		rela.r_offset = dstScn->segOffset + rel.r_offset;

		if (fwrite(&rela, sizeof(rela), 1, dst) != 1) {
			perror(strtab + scn->shdr.sh_name);
			return errno;
		}
	}

	return 0;
}

static int addStub(Psp2_Rela_Short *relaFstub, const scn_t *fstub,
	uint32_t *fnid, const Elf32_Rel *relMark, Elf32_Word relMarkSize,
	const void *mark, Elf32_Addr offset,
	const scn_t *scns, const Elf32_Sym *symtab)
{
	const Elf32_Sym *sym;
	Elf32_Word i, type;

	if (relaFstub == NULL || fnid == NULL
		|| relMark == NULL || mark == NULL)
	{
		return EINVAL;
	}

	for (i = 0; i < relMarkSize / sizeof(Elf32_Rel); i++) {
		if (relMark[i].r_offset == offset
			+ offsetof(sce_libgen_mark_stub, stub))
		{
			type = ELF32_R_TYPE(relMark[i].r_info);
			sym = symtab + ELF32_R_SYM(relMark[i].r_info);

			relaFstub->r_short = 1;
			relaFstub->r_symseg = scns[sym->st_shndx].phndx;
			relaFstub->r_code = type;
			relaFstub->r_datseg = fstub->phndx;

			relaFstub->r_addend = sym->st_value;
			if (type == R_ARM_ABS32 || type == R_ARM_TARGET1)
				relaFstub->r_addend
					+= *(uint32_t *)((uintptr_t)mark + relMark[i].r_offset);

			relaFstub->r_offset = fstub->segOffset + relMark[i].r_offset;
		}
	}

	*fnid = *(uint32_t *)((uintptr_t)mark + offset
			+ offsetof(sce_libgen_mark_stub, nid));

	return 0;
}

static int buildStubs(stubContents_t *stubContents, sceScns_t *sceScns,
	FILE *srcFp, const scn_t *scns, const char *strtab, Elf32_Sym *symtab)
{
	union {
		uint8_t size;
		sce_libgen_mark_head head;
		sce_libgen_mark_stub stub;
	} *markContent, *p;
	sceLib_stub *stubHeads;
	Psp2_Rela_Short *relaFstubEnt, *relaStubEnt;
	Elf32_Off offset, fnidOffset, fstubOffset;
	Elf32_Rel *relMarkContent, *relMarkEnt;
	Elf32_Sym *sym;
	Elf32_Word i, *fnidEnt;

	if (stubContents == NULL || sceScns == NULL || srcFp == NULL
		|| scns == NULL || strtab == NULL || symtab == NULL)
	{
		return EINVAL;
	}

	markContent = malloc(sceScns->mark->shdr.sh_size);
	if (markContent == NULL) {
		perror(strtab + sceScns->mark->shdr.sh_name);
		return errno;
	}

	relMarkContent = malloc(sceScns->relMark->orgSize);
	if (relMarkContent == NULL) {
		perror(strtab + sceScns->relMark->shdr.sh_name);
		return errno;
	}

	stubContents->relaFstub = malloc(sceScns->relFstub->shdr.sh_size);
	if (stubContents->relaFstub == NULL) {
		perror(strtab + sceScns->relFstub->shdr.sh_name);
		return errno;
	}

	stubContents->relaStub = malloc(sceScns->relStub->shdr.sh_size);
	if (stubContents->relaStub == NULL) {
		perror(strtab + sceScns->relStub->shdr.sh_name);
		return errno;
	}

	stubContents->fnid = malloc(sceScns->fnid->shdr.sh_size);
	if (stubContents->fnid == NULL) {
		perror(strtab + sceScns->fnid->shdr.sh_name);
		return errno;
	}

	stubContents->stub = malloc(sceScns->stub->shdr.sh_size);
	if (stubContents->stub == NULL) {
		perror(strtab + sceScns->stub->shdr.sh_name);
		return errno;
	}

	if (fseek(srcFp, sceScns->mark->orgOffset, SEEK_SET)) {
		perror(strtab + sceScns->mark->shdr.sh_name);
		return errno;
	}

	if (fread(markContent, sceScns->mark->shdr.sh_size, 1, srcFp) <= 0) {
		perror(strtab + sceScns->mark->shdr.sh_name);
		return errno;
	}

	if (fseek(srcFp, sceScns->relMark->orgOffset, SEEK_SET)) {
		perror(strtab + sceScns->relMark->shdr.sh_name);
		return errno;
	}

	if (fread(relMarkContent, sceScns->relMark->orgSize, 1, srcFp) <= 0) {
		perror(strtab + sceScns->relMark->shdr.sh_name);
		return errno;
	}

	relaFstubEnt = stubContents->relaFstub;
	relaStubEnt = stubContents->relaStub;
	fnidEnt = stubContents->fnid;
	stubHeads = stubContents->stub;
	relMarkEnt = relMarkContent;
	p = markContent;
	fnidOffset = 0;
	fstubOffset = 0;
	offset = 0;
	while (offset < sceScns->mark->shdr.sh_size) {
		if (p->size == sizeof(sce_libgen_mark_head)) {
			stubHeads->size = sizeof(sceLib_stub);
			stubHeads->ver = 1;
			stubHeads->flags = 0;
			stubHeads->nid = p->head.nid;

			relaStubEnt->r_short = 1;
			relaStubEnt->r_symseg = sceScns->fnid->phndx;
			relaStubEnt->r_code = R_ARM_ABS32;
			relaStubEnt->r_datseg = sceScns->stub->phndx;
			relaStubEnt->r_addend = fnidOffset;
			relaStubEnt->r_offset = sceScns->mark->segOffset
				+ offset + offsetof(sceLib_stub, funcNids);

			relaStubEnt->r_short = 1;
			relaStubEnt->r_symseg = sceScns->fstub->phndx;
			relaStubEnt->r_code = R_ARM_ABS32;
			relaStubEnt->r_datseg = sceScns->stub->phndx;
			relaStubEnt->r_addend = fstubOffset;
			relaStubEnt->r_offset = sceScns->mark->segOffset
				+ offset + offsetof(sceLib_stub, funcStubs);

			stubHeads->varNids = 0;
			stubHeads->varStubs = 0;
			stubHeads->unkNids = 0;
			stubHeads->unkStubs = 0;

			stubHeads->funcNum = 0;
			stubHeads->varNum = 0;
			stubHeads->unkNum = 0;

			for (i = 0; i < sceScns->relMark->orgSize / sizeof(Elf32_Rel); i++) {
				sym = symtab + ELF32_R_SYM(relMarkEnt[i].r_info);
				if (sym->st_value != sceScns->mark->shdr.sh_addr + offset)
					continue;

				addStub(relaFstubEnt, sceScns->fstub, fnidEnt,
					relMarkContent, sceScns->relMark->shdr.sh_size,
					markContent,
					relMarkEnt[i].r_offset
						- offsetof(sce_libgen_mark_stub, head),
					scns, symtab);
				relaFstubEnt++;
				fnidEnt++;
				fstubOffset += sizeof(Psp2_Rela_Short);
				fnidOffset += 4;
				stubHeads->funcNum++;
			}

			stubHeads++;
		}

		offset += p->size;
		p = (void *)((uintptr_t)p + p->size);
	}

	free(markContent);
	free(relMarkContent);

	return 0;
}

static int writeModinfo(FILE *dst, FILE *src, const scn_t *scn, const char *strtab)
{
	unsigned char md[SHA_DIGEST_LENGTH];
	_sceModuleInfo *p;

	if (dst == NULL || src == NULL || scn == NULL)
		return EINVAL;

	if (scn->orgSize == 0)
		return 0;

	p = malloc(scn->orgSize);
	if (p == NULL) {
		perror(strtab + scn->shdr.sh_name);
		return errno;
	}

	if (fread(p, scn->orgSize, 1, src) <= 0) {
		perror(strtab + scn->shdr.sh_name);
		free(p);
		return errno;
	}

	if (p->nid == 0) {
		SHA1((unsigned char *)p->name, strlen(p->name), md);
		((unsigned char *)&p->nid)[0] = md[3];
		((unsigned char *)&p->nid)[1] = md[2];
		((unsigned char *)&p->nid)[2] = md[1];
		((unsigned char *)&p->nid)[3] = md[0];
	}

	if (fwrite(p, scn->orgSize, 1, dst) != 1) {
		perror(strtab + scn->shdr.sh_name);
		free(p);
		return errno;
	}

	free(p);

	return 0;
}

static int writeScn(FILE *dst, FILE *src, const scn_t *scn, const char *strtab)
{
	void *p;

	if (dst == NULL || src == NULL || scn == NULL)
		return EINVAL;

	if (scn->orgSize == 0)
		return 0;

	p = malloc(scn->orgSize);
	if (p == NULL) {
		perror(strtab + scn->shdr.sh_name);
		return errno;
	}

	if (fread(p, scn->orgSize, 1, src) <= 0) {
		perror(strtab + scn->shdr.sh_name);
		free(p);
		return errno;
	}

	if (fwrite(p, scn->orgSize, 1, dst) != 1) {
		perror(strtab + scn->shdr.sh_name);
		free(p);
		return errno;
	}

	free(p);

	return 0;
}

static int writePhdrs(FILE *dstFp, const char *dst,
	const Elf32_Ehdr *ehdr, const seg_t *segs)
{
	Elf32_Half i;

	if (dstFp == NULL || dst == NULL || ehdr == NULL || segs == NULL)
		return EINVAL;

	if (fseek(dstFp, ehdr->e_phoff, SEEK_SET)) {
		perror(dst);
		return errno;
	}

	for (i = 0; i < ehdr->e_phnum; i++)
		if (fwrite(&segs[i].phdr, sizeof(segs[i].phdr), 1, dstFp) != 1) {
			perror(dst);
			return errno;
		}

	return 0;
}

static int writeSegs(FILE *dst, FILE *src, const scn_t *scns,
	const seg_t *segs, Elf32_Half phnum,
	const sceScns_t *sceScns, const stubContents_t *stubContents,
	const char *strtab, const Elf32_Sym *symtab)
{
	Elf32_Half i, j;
	int res;

	if (dst == NULL || src == NULL || scns == NULL || segs == NULL
		|| sceScns == NULL || stubContents == NULL || strtab == NULL)
	{
		return EINVAL;
	}

	for (i = 0; i < phnum; i++) {
		for (j = 0; j < segs->shnum; j++) {
			if (fseek(src, segs->scns[j]->orgOffset, SEEK_SET)) {
				perror(strtab + segs->scns[j]->shdr.sh_name);
				return errno;
			}

			if (fseek(dst, segs->scns[j]->shdr.sh_offset, SEEK_SET)) {
				perror(strtab + segs->scns[j]->shdr.sh_name);
				return errno;
			}

			// Refer to updateSegs
			if (segs->scns[j]->shdr.sh_type == SHT_SCE_RELA) {
				if (segs->scns[j] == sceScns->relFstub) {
					if (fwrite(stubContents->relaFstub, sceScns->relFstub->shdr.sh_size, 1, dst) != 1) {
						perror(strtab + sceScns->relFstub->shdr.sh_name);
						res = errno;
					}
				} else if (segs->scns[j] == sceScns->relStub) {
					if (fwrite(stubContents->relaStub, sceScns->relStub->shdr.sh_size, 1, dst) != 1) {
						perror(strtab + sceScns->relStub->shdr.sh_name);
						res = errno;
					}
				} else
					res = writeRel(dst, src,
						segs->scns[j], segs, scns,
						strtab, symtab, sceScns->modinfo);
			} else if (segs->scns[j] == sceScns->fnid) {
				if (fwrite(stubContents->fnid, sceScns->fnid->shdr.sh_size, 1, dst) != 1) {
					perror(strtab + sceScns->fnid->shdr.sh_name);
					res = errno;
				}
			} else if (segs->scns[j] == sceScns->stub) {
				if (fwrite(stubContents->stub, sceScns->stub->shdr.sh_size, 1, dst) != 1) {
					perror(strtab + sceScns->stub->shdr.sh_name);
					res = errno;
				}
			} else if (segs->scns[j] == sceScns->modinfo) {
				res = writeModinfo(dst, src, sceScns->modinfo, strtab);
			} else
				res = writeScn(dst, src, segs->scns[j], strtab);

			if (res)
				return res;
		}

		segs++;
	}

	return 0;
}

static int writeElf(const char *path, elf_t *elf)
{
	FILE *fp;
	int res;

	if (path == NULL)
		return EINVAL;

	fp = fopen(path, "wb");
	if (fp == NULL) {
		perror(path);
		return errno;
	}

	if (fwrite(&elf->ehdr, sizeof(Elf32_Ehdr), 1, fp) != 1) {
		perror(path);
		fclose(fp);
		return errno;
	}

	res = writePhdrs(fp, path, &elf->ehdr, elf->segs);
	if (res) {
		fclose(fp);
		return res;
	}

	res = writeSegs(fp, elf->fp, elf->scns, elf->segs, elf->ehdr.e_phnum,
		&elf->sceScns, &elf->stubContents,
		elf->strtab.content, elf->symtab.content);
	if (res) {
		fclose(fp);
		return res;
	}

	if (fclose(fp)) {
		perror(path);
		return errno;
	}

	return 0;
}

int main(int argc, char *argv[])
{
	elf_t elf;
	char *src, *dst;
	int res;

	if (argc != 3) {
		fprintf(stderr, "%s: Usage <INPUT> <OUTPUT>\n", argv[0]);
		return EINVAL;
	}

	src = argv[1];
	dst = argv[2];

	res = openElf(&elf, src);
	if (res)
		return res;

	res = updateElf(&elf);
	if (res)
		goto fail;

	res = buildStubs(&elf.stubContents, &elf.sceScns,
		elf.fp, elf.scns, elf.strtab.content, elf.symtab.content);
	if (res)
		goto fail;

	res = writeElf(dst, &elf);
	if (res)
		goto fail;

	return closeElf(&elf);

fail:
	closeElf(&elf);
	return res;
}
