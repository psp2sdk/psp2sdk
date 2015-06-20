@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt86243, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0x2ff42588, sceSfmt86243InitGenRand
PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0x569bf903, sceSfmt86243GenRand32
PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0x81b67ab5, sceSfmt86243InitByArray
PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0x8e25cba8, sceSfmt86243GenRand64
PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0xc297e6b1, sceSfmt86243FillArray32
PSP2_IMPORT_FUNC SceSfmt86243, 0001, F00, 0xf7ffe87c, sceSfmt86243FillArray64
