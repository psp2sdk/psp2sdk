/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Modified for PSP2 by PSP2SDK Team
 */

#ifndef _MALLOC_H_
#define _MALLOC_H_

#include <_ansi.h>

#define __need_size_t
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

/* The routines.  */

extern _PTR malloc _PARAMS ((size_t));

extern _VOID free _PARAMS ((_PTR));

extern _PTR realloc _PARAMS ((_PTR, size_t));

extern _PTR calloc _PARAMS ((size_t, size_t));

extern _PTR memalign _PARAMS ((size_t, size_t));

extern void malloc_stats _PARAMS ((void));

extern size_t malloc_usable_size _PARAMS ((_PTR));

#ifdef __cplusplus
}
#endif

#endif
