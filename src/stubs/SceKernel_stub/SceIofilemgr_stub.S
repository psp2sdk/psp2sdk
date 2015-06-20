@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceIofilemgr, 0001, 1, 0

PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x0dc4f1bb, sceIoGetProcessDefaultPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x14b2d56c, sceIoSetPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x16512f59, sceIoSyncByFd
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x34efd876, sceIoWrite
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x422a221a, sceIoDclose
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x49252b9b, sceIoLseek32
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x49312108, sceIoSetThreadDefaultPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x7f2abbaf, sceIoSetProcessDefaultPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0xa176cd03, sceIoGetThreadDefaultPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0xc70b8886, sceIoClose
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0xf2a472a1, sceIoGetPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0xfdb32293, sceIoRead
