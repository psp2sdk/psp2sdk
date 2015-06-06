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

PSP2_IMPORT_HEAD 0x0, SceNpBasic, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x050ae072, sceNpBasicUnregisterHandler
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x1211ae8e, sceNpBasicGetBlockListEntries
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x20146aec, sceNpBasicCheckCallback
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x26e6e048, sceNpBasicRegisterHandler
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x364531a8, sceNpBasicGetPlaySessionLog
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x389bcb3b, sceNpBasicTerm
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x3b0a7f47, sceNpBasicRecordPlaySessionLog
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x407e1e6f, sceNpBasicGetBlockListEntryCount
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x5183a4b5, sceNpBasicGetFriendOnlineStatus
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x51d75562, sceNpBasicSetInGamePresence
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x7a5020a5, sceNpBasicSendInGameDataMessage
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xd20c2370, sceNpBasicUnsetInGamePresence
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xdf41f308, sceNpBasicGetFriendListEntryCount
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xef8a91bc, sceNpBasicGetGamePresenceOfFriend
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xefb91a99, sceNpBasicInit
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xf51545d8, sceNpBasicCheckIfPlayerIsBlocked
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xfb0f7fdf, sceNpBasicGetPlaySessionLogSize
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xff07e787, sceNpBasicGetFriendListEntries
