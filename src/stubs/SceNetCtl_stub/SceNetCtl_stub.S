@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNetCtl, 0001, 1, 0

PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0x0961a561, sceNetCtlAdhocGetState
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0x495ca1db, sceNetCtlInit
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0x4ddd6149, sceNetCtlGetNatInfo
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0x4fb4bea1, sceNetCtlGetPhoneMaxDownloadableSize
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0x6b20ec02, sceNetCtlInetGetResult
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0x6d26ac68, sceNetCtlInetGetState
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0x7118c99d, sceNetCtlAdhocGetInAddr
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0x77586c59, sceNetCtlAdhocGetPeerList
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0x7ae0ed19, sceNetCtlAdhocGetResult
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0xa4471e10, sceNetCtlAdhocUnregisterCallback
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0xb26d07f3, sceNetCtlInetGetInfo
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0xcd188648, sceNetCtlTerm
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0xd0c3bf3f, sceNetCtlInetUnregisterCallback
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0xda130450, sceNetCtlGetIfStat
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0xdffc3ed4, sceNetCtlCheckCallback
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0xeaee6185, sceNetCtlInetRegisterCallback
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0xed43b79a, sceNetCtlAdhocDisconnect
PSP2_IMPORT_FUNC SceNetCtl, 0001, F00, 0xffa9d594, sceNetCtlAdhocRegisterCallback
