/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include <stdio.h>
#include <errno.h>
#include "elf_priv.h"

int main(int argc, char *argv[])
{
	elf_t elf;
	char *src, *dst;
	int res;

	if (argc != 3) {
		fprintf(stderr, "Usage: %s <INPUT> <OUTPUT>\n\n"
"psp2-fixup (" PACKAGE_NAME ") " PACKAGE_VERSION "\n"
"Copyright (C) 2015  PSP2SDK Project\n"
"This Program is subject to the terms of the Mozilla Public\n"
"License, v. 2.0. If a copy of the MPL was not distributed with this\n"
"file, You can obtain one at http://mozilla.org/MPL/2.0/.\n", argv[0]);
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

	res = writeElf(dst, &elf);
	if (res)
		goto fail;

	return closeElf(&elf);

fail:
	closeElf(&elf);
	return res;
}
