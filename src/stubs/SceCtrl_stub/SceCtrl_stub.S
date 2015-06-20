@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceCtrl, 0001, 1, 0

PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0x104ed1a7, sceCtrlPeekBufferNegative
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0x15f96fb0, sceCtrlReadBufferNegative
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0x67e7ab83, sceCtrlReadBufferPositive
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0xa497b150, sceCtrlSetSamplingMode
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0xa9c3ced6, sceCtrlPeekBufferPositive
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0xd8294c9c, sceCtrlClearRapidFire
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0xe9cb69c8, sceCtrlSetRapidFire
PSP2_IMPORT_FUNC SceCtrl, 0001, F00, 0xec752aaf, sceCtrlGetSamplingMode
