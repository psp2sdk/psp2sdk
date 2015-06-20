@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt216091, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0x23369abf, sceSfmt216091GenRand64
PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0x4a972dcd, sceSfmt216091GenRand32
PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0x86dde4a7, sceSfmt216091InitGenRand
PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0xa1ce5628, sceSfmt216091FillArray64
PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0xa9cf6616, sceSfmt216091InitByArray
PSP2_IMPORT_FUNC SceSfmt216091, 0001, F00, 0xdd4256f0, sceSfmt216091FillArray32
