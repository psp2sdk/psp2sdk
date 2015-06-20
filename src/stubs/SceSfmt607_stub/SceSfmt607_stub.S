@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt607, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt607, 0001, F00, 0x1520d408, sceSfmt607FillArray64
PSP2_IMPORT_FUNC SceSfmt607, 0001, F00, 0x5e880862, sceSfmt607GenRand64
PSP2_IMPORT_FUNC SceSfmt607, 0001, F00, 0x76a5d8ca, sceSfmt607InitGenRand
PSP2_IMPORT_FUNC SceSfmt607, 0001, F00, 0x8a0bf859, sceSfmt607GenRand32
PSP2_IMPORT_FUNC SceSfmt607, 0001, F00, 0xa288adb9, sceSfmt607FillArray32
PSP2_IMPORT_FUNC SceSfmt607, 0001, F00, 0xcc6daba0, sceSfmt607InitByArray
