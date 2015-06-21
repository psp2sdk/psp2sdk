@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpBasic, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x050ae072, sceNpBasicUnregisterHandler
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x1211ae8e, sceNpBasicGetBlockListEntries
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x20146aec, sceNpBasicCheckCallback
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x26e6e048, sceNpBasicRegisterHandler
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x2a764628, sceNpBasicUnregisterJoinGameAckHandler
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x364531a8, sceNpBasicGetPlaySessionLog
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x3700e00c, sceNpBasicGetRequestedFriendRequestEntries
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x389bcb3b, sceNpBasicTerm
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x3b0a7f47, sceNpBasicRecordPlaySessionLog
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x407e1e6f, sceNpBasicGetBlockListEntryCount
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x5183a4b5, sceNpBasicGetFriendOnlineStatus
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x51d75562, sceNpBasicSetInGamePresence
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x7a5020a5, sceNpBasicSendInGameDataMessage
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x863249cb, sceNpBasicGetGameJoiningPresence
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x8c90cc09, sceNpBasicJoinGameAckResponseSend
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x91bf63cb, sceNpBasicGetFriendRequestEntries
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0x9a9e2021, sceNpBasicGetFriendContextState
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xb9041420, sceNpBasicGetRequestedFriendRequestEntryCount
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xd20c2370, sceNpBasicUnsetInGamePresence
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xdf41f308, sceNpBasicGetFriendListEntryCount
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xe02a445c, sceNpBasicRegisterJoinGameAckHandler
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xef8a91bc, sceNpBasicGetGamePresenceOfFriend
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xefb91a99, sceNpBasicInit
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xf51545d8, sceNpBasicCheckIfPlayerIsBlocked
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xfb0f7fdf, sceNpBasicGetPlaySessionLogSize
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xfe98e45a, sceNpBasicGetFriendRequestEntryCount
PSP2_IMPORT_FUNC SceNpBasic, 0001, F00, 0xff07e787, sceNpBasicGetFriendListEntries
