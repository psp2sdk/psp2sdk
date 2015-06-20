@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt4253, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt4253, 0001, F00, 0x01683cdd, sceSfmt4253FillArray64
PSP2_IMPORT_FUNC SceSfmt4253, 0001, F00, 0x59a1b9fc, sceSfmt4253FillArray32
PSP2_IMPORT_FUNC SceSfmt4253, 0001, F00, 0x6c0e5e3c, sceSfmt4253GenRand64
PSP2_IMPORT_FUNC SceSfmt4253, 0001, F00, 0x8791e2ef, sceSfmt4253GenRand32
PSP2_IMPORT_FUNC SceSfmt4253, 0001, F00, 0xc4d7aa2d, sceSfmt4253InitByArray
PSP2_IMPORT_FUNC SceSfmt4253, 0001, F00, 0xe9f8cb9a, sceSfmt4253InitGenRand
