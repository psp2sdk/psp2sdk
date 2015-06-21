@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSfmt2281, 0001, 1, 0

PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0x17c10e2d, sceSfmt2281FillArray64
PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0x3cc47146, sceSfmt2281GenRand64
PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0x84bb4adb, sceSfmt2281GenRand32
PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0xab3ad459, sceSfmt2281InitByArray
PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0xb8e5a0bb, sceSfmt2281InitGenRand
PSP2_IMPORT_FUNC SceSfmt2281, 0001, F00, 0xbb89d8f0, sceSfmt2281FillArray32
