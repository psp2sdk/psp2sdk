@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSulpha, 0001, 1, 0

PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x0fc71b72, sceSulphaNetworkShutdown
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x10770ba7, sceSulphaShutdown
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x29f0da12, sceSulphaGetTimestamp
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x2a8b74d7, sceSulphaAgentsUnregister
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x324f158f, sceSulphaInit
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x5c6815c6, sceSulphaLogHandler
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x5e15e164, sceSulphaSetBookmark
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x7968a138, sceSulphaFileConnect
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x7adb454d, sceSulphaAgentsRegister
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x920ec7bf, sceSulphaUpdate
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0x951d159d, sceSulphaLogSetLevel
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xa41b7402, sceSulphaNodeNew
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xa6a05c50, sceSulphaGetDefaultConfig
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xb0c2b9ce, sceSulphaEventAdd
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xb16e7b88, sceSulphaFileDisconnect
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xb4668aea, sceSulphaNetworkInit
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xbc6a2833, sceSulphaEventReport
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xbf61f3b8, sceSulphaEventNew
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xc5752b6b, sceSulphaAgentsGetNeededMemory
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xd44c9f86, sceSulphaNodeDelete
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xd52e5a5a, sceSulphaGetNeededMemory
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xd5d995a9, sceSulphaEventDelete
PSP2_IMPORT_FUNC SceSulpha, 0001, F00, 0xde7e2911, sceSulphaGetAgent
