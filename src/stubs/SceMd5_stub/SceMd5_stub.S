@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceMd5, 0001, 1, 0

PSP2_IMPORT_FUNC SceMd5, 0001, F00, 0x094a4902, sceMd5BlockUpdate
PSP2_IMPORT_FUNC SceMd5, 0001, F00, 0x4d6436f9, sceMd5BlockInit
PSP2_IMPORT_FUNC SceMd5, 0001, F00, 0xb845bccb, sceMd5Digest
PSP2_IMPORT_FUNC SceMd5, 0001, F00, 0xb94abf83, sceMd5BlockResult
