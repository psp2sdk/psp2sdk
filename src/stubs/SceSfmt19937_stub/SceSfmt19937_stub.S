@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt19937, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt19937, 0001, F00, 0x2afacb0b, sceSfmt19937InitGenRand
PSP2_IMPORT_FUNC SceSfmt19937, 0001, F00, 0xa1c654d8, sceSfmt19937FillArray32
PSP2_IMPORT_FUNC SceSfmt19937, 0001, F00, 0xac496c8c, sceSfmt19937InitByArray
PSP2_IMPORT_FUNC SceSfmt19937, 0001, F00, 0xe66f2502, sceSfmt19937GenRand64
PSP2_IMPORT_FUNC SceSfmt19937, 0001, F00, 0xe74ba81c, sceSfmt19937FillArray64
PSP2_IMPORT_FUNC SceSfmt19937, 0001, F00, 0xf0557157, sceSfmt19937GenRand32
