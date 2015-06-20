@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpMessage, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0x1dbd26d2, sceNpMessageGetMessageEntryCount
PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0x258da4ac, sceNpMessageInit
PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0x26af5306, sceNpMessageInitWithParam
PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0x35be21c5, sceNpMessageSyncMessage
PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0x380230a1, sceNpMessageTerm
PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0x514a4320, sceNpMessageGetMessage
PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0x70116381, sceNpMessageGetMessageEntry
PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0x707b26c2, sceNpMessageAbort
PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0x7e697f98, sceNpMessageGetAttachedData
PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0xc86b6da7, sceNpMessageGetMessageEntries
PSP2_IMPORT_FUNC SceNpMessage, 0001, F00, 0xf533a73a, sceNpMessageSetAttachedDataUsedFlag
