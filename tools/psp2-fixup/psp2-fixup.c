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

typedef struct {
	char c;
	int b;
} arg_t;

static int parse(int argc, char * const argv[],
	arg_t *args, unsigned int argNum, char **src, char **dst)
{
	unsigned int i;

	if (argc < 3 || argv == NULL || args == NULL
		|| src == NULL || dst == NULL)
	{
		return EINVAL;
	}

	*src = NULL;
	*dst = NULL;

	argc--;
	argv++;

	while (argc) {
		if ((*argv)[0] == '-') {
			for (i = 0; (*argv)[1] != args[i].c; i++)
				if (i >= argNum)
					return EINVAL;

			args[i].b = 1;
		} else if (*src == NULL)
			*src = *argv;
		else if (*dst == NULL)
			*dst = *argv;
		else
			return EINVAL;

		argv++;
		argc--;
	}

	if (*src == NULL || *dst == NULL)
		return EINVAL;

	return 0;
}

int main(int argc, char *argv[])
{
	elf_t elf;
	char *src, *dst;
	int res;

	enum {
		ARG_RELOC,
		ARG_STRIP_ALL,

		ARG_NUM
	};

	arg_t args[ARG_NUM] = {
		[ARG_RELOC] = { 'q', 0 },
		[ARG_STRIP_ALL] = { 'S', 0 }
	};

	res = parse(argc, argv, args, ARG_NUM, &src, &dst);
	if (res) {
		fprintf(stderr, "Usage: %s [OPTIONS] <INPUT> <OUTPUT>\n"
"Options:\n"
"-q Generate relocations in final output\n"
"-S Remove all information which is not necessary for execution\n\n"

"psp2-fixup (" PACKAGE_NAME ") " PACKAGE_VERSION "\n"
"Copyright (C) 2015  PSP2SDK Project\n"
"This Program is subject to the terms of the Mozilla Public\n"
"License, v. 2.0. If a copy of the MPL was not distributed with this\n"
"file, You can obtain one at http://mozilla.org/MPL/2.0/.\n", argv[0]);

		return res;
	}

	if (args[ARG_RELOC].b == 0) {
		fputs("Currently non-relocatable ELF is not supported. Use option -q\n",
			stderr);

		return EINVAL;
	}

	if (args[ARG_STRIP_ALL].b == 0) {
		fputs("Currently it is not supported to output information\n"
			"which is not necessary for execution. Use option -S\n",
			stderr);

		return EINVAL;
	}

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
