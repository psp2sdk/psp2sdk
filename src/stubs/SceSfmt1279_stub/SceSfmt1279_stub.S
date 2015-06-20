@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt1279, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0x02e8d906, sceSfmt1279InitGenRand
PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0x9b4a48df, sceSfmt1279GenRand32
PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0xa2c5ee14, sceSfmt1279GenRand64
PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0xc25d9ace, sceSfmt1279InitByArray
PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0xdb3832eb, sceSfmt1279FillArray64
PSP2_IMPORT_FUNC SceSfmt1279, 0001, F00, 0xe7f63838, sceSfmt1279FillArray32
