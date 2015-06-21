@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpMatching2, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x0124641c, sceNpMatching2Term
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x11beffa8, sceNpMatching2GetRoomMemberDataExternalList
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x1c60bc5b, sceNpMatching2RegisterSignalingCallback
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x1e70d5b5, sceNpMatching2LeaveLobby
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x20598618, sceNpMatching2SignalingGetConnectionInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x28c643b7, sceNpMatching2GetRoomMemberDataInternal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x33f7d5ae, sceNpMatching2JoinRoom
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x368aa759, sceNpMatching2DestroyContext
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x3c507d4a, sceNpMatching2RegisterLobbyEventCallback
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x495d2b46, sceNpMatching2GetSignalingOptParamLocal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x4e3193d2, sceNpMatching2RegisterLobbyMessageCallback
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x4e4c55bd, sceNpMatching2SignalingGetConnectionStatus
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x506454de, sceNpMatching2ContextStop
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x5be8b86f, sceNpMatching2GetRoomDataExternalList
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x65c0feed, sceNpMatching2GetServerLocal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x6e48307f, sceNpMatching2SetSignalingOptParam
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x74eb6ce9, sceNpMatching2AbortRequest
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x78521326, sceNpMatching2GetUserInfoList
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x79310806, sceNpMatching2SignalingGetLocalNetInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x7b908d99, sceNpMatching2SendRoomMessage
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x7bd39e50, sceNpMatching2GetMemoryInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x818a9499, sceNpMatching2CreateJoinRoom
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x86458025, sceNpMatching2GrantRoomOwner
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x86ced8af, sceNpMatching2JoinLobby
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x86e7c97d, sceNpMatching2GetLobbyInfoList
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x881f7428, sceNpMatching2SignalingGetPingInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x8f88ac7e, sceNpMatching2SetRoomDataExternal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x9388a007, sceNpMatching2SendLobbyChatMessage
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x94784a8c, sceNpMatching2SetRoomDataInternal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xa8021394, sceNpMatching2KickoutRoomMember
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xadcd102c, sceNpMatching2SignalingCancelPeerNetInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xadf578e1, sceNpMatching2CreateContext
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xb6e8c059, sceNpMatching2GetRoomMemberIdListLocal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xbb2e7559, sceNpMatching2ContextStart
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xc086b560, sceNpMatching2GetWorldInfoList
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xc61c79ee, sceNpMatching2GetRoomDataInternal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xc8b0c9ee, sceNpMatching2LeaveRoom
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xd22c4989, sceNpMatching2GetRoomPasswordLocal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xd3096c55, sceNpMatching2SetRoomMemberDataInternal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xd48baf13, sceNpMatching2SearchRoom
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xe0be0510, sceNpMatching2SendRoomChatMessage
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xebb1fe74, sceNpMatching2Init
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf049bec1, sceNpMatching2SetUserInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf0cb1dd3, sceNpMatching2SignalingGetPeerNetInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf2847e3b, sceNpMatching2AbortContextStart
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf3a43c50, sceNpMatching2SetDefaultRequestOptParam
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf486991b, sceNpMatching2RegisterRoomEventCallback
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf9e35566, sceNpMatching2RegisterContextCallback
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xfa51949b, sceNpMatching2RegisterRoomMessageCallback
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xfdc7b2c9, sceNpMatching2SignalingGetPeerNetInfoResult
