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

PSP2_IMPORT_HEAD 0x0, SceNpMatching2, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x0124641c, sceNpMatching2Term
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x1c60bc5b, sceNpMatching2RegisterSignalingCallback
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x20598618, sceNpMatching2SignalingGetConnectionInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x33f7d5ae, sceNpMatching2JoinRoom
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x368aa759, sceNpMatching2DestroyContext
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x495d2b46, sceNpMatching2GetSignalingOptParamLocal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x4e4c55bd, sceNpMatching2SignalingGetConnectionStatus
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x506454de, sceNpMatching2ContextStop
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x65c0feed, sceNpMatching2GetServerLocal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x74eb6ce9, sceNpMatching2AbortRequest
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x79310806, sceNpMatching2SignalingGetLocalNetInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x7b908d99, sceNpMatching2SendRoomMessage
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x7bd39e50, sceNpMatching2GetMemoryInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x818a9499, sceNpMatching2CreateJoinRoom
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0x8f88ac7e, sceNpMatching2SetRoomDataExternal
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xa8021394, sceNpMatching2KickoutRoomMember
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xadcd102c, sceNpMatching2SignalingCancelPeerNetInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xadf578e1, sceNpMatching2CreateContext
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xbb2e7559, sceNpMatching2ContextStart
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xc086b560, sceNpMatching2GetWorldInfoList
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xc8b0c9ee, sceNpMatching2LeaveRoom
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xd48baf13, sceNpMatching2SearchRoom
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xe0be0510, sceNpMatching2SendRoomChatMessage
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xebb1fe74, sceNpMatching2Init
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf0cb1dd3, sceNpMatching2SignalingGetPeerNetInfo
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf2847e3b, sceNpMatching2AbortContextStart
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf3a43c50, sceNpMatching2SetDefaultRequestOptParam
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf486991b, sceNpMatching2RegisterRoomEventCallback
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xf9e35566, sceNpMatching2RegisterContextCallback
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xfa51949b, sceNpMatching2RegisterRoomMessageCallback
PSP2_IMPORT_FUNC SceNpMatching2, 0001, F00, 0xfdc7b2c9, sceNpMatching2SignalingGetPeerNetInfoResult
