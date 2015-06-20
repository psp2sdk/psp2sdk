@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceDisplay, 0001, 1, 0

PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x05f27764, sceDisplayWaitVblankStartMultiCB
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x3e796ef5, sceDisplayWaitSetFrameBufMultiCB
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x5795e898, sceDisplayWaitVblankStart
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x6bdf4c4d, sceDisplayRegisterVblankStartCallback
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x78b41b92, sceDisplayWaitVblankStartCB
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x7d9864a8, sceDisplayWaitSetFrameBufMulti
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x814c90af, sceDisplayWaitSetFrameBufCB
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x9423560c, sceDisplayWaitSetFrameBuf
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x98436a80, sceDisplayUnregisterVblankStartCallback
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0xa08ca60d, sceDisplayGetRefreshRate
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0xb6fde0ba, sceDisplayGetVcount
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0xdd0a13b8, sceDisplayWaitVblankStartMulti
