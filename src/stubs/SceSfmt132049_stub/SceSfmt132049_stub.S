@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt132049, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0x68ad7866, sceSfmt132049FillArray64
PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0x795f9644, sceSfmt132049GenRand32
PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0xbbd80ac4, sceSfmt132049GenRand64
PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0xd891a99f, sceSfmt132049FillArray32
PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0xdc69294a, sceSfmt132049InitByArray
PSP2_IMPORT_FUNC SceSfmt132049, 0001, F00, 0xdc6b23b0, sceSfmt132049InitGenRand
