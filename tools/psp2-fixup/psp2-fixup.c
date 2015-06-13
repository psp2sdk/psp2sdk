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

#include <stdio.h>
#include <errno.h>
#include "elf_priv.h"
#include "stub.h"

int main(int argc, char *argv[])
{
	elf_t elf;
	char *src, *dst;
	int res;

	if (argc != 3) {
		fprintf(stderr, "Usage: %s <INPUT> <OUTPUT>\n\n"
"psp2-fixup (" PACKAGE_NAME ") " PACKAGE_VERSION "\n"
"Copyright (C) 2015  PSP2SDK Project\n"
"This program is free software; you may redistribute it under the terms of\n"
"the GNU Lesser General Public License version 3 or (at your option) any later\n"
"version. This program has absolutely no warranty.\n", argv[0]);
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

	res = buildStubs(&elf.sceScns, elf.fp, elf.scns,
		elf.strtab.content, elf.symtab.content);
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
