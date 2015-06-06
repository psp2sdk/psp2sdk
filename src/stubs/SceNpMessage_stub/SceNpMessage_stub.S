@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software; you can redistribute it and/or
@ modify it under the terms of the GNU Lesser General Public
@ License version 2.1 as published by the Free Software Foundation
@
@ This library is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
@ Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public
@ License along with this library; if not, write to the Free Software
@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

#include <psp2import.S>

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
