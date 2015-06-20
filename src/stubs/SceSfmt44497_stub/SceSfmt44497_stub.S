@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt44497, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0x16d8aa5e, sceSfmt44497InitByArray
PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0x1c38322a, sceSfmt44497FillArray32
PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0x908f1122, sceSfmt44497FillArray64
PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0xcf1c8c38, sceSfmt44497InitGenRand
PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0xd411a9a6, sceSfmt44497GenRand64
PSP2_IMPORT_FUNC SceSfmt44497, 0001, F00, 0xf869dfdc, sceSfmt44497GenRand32
