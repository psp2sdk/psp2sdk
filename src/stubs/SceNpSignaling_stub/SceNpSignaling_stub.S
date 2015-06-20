@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpSignaling, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x0b48fadb, sceNpSignalingSetCtxOpt
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x3b56e6c2, sceNpSignalingDeactivateConnection
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x3ec1f4aa, sceNpSignalingGetConnectionFromNpId
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x4b6acf47, sceNpSignalingInit
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x5048e147, sceNpSignalingCancelPeerNetInfo
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x51883eae, sceNpSignalingGetConnectionInfo
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x5861e7ba, sceNpSignalingGetLocalNetInfo
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x5d660c45, sceNpSignalingGetPeerNetInfo
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x6b9e6e3f, sceNpSignalingGetConnectionFromPeerAddress
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x83b3da0a, sceNpSignalingGetConnectionStatus
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x92ffbde3, sceNpSignalingActivateConnection
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x995a5a74, sceNpSignalingGetMemoryInfo
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x9d1c5303, sceNpSignalingGetCtxOpt
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0xa413f8c2, sceNpSignalingTerminateConnection
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0xbc892d18, sceNpSignalingTerm
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0xde8536f0, sceNpSignalingGetPeerNetInfoResult
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0xeaa4b1f3, sceNpSignalingDestroyCtx
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0xf77ef683, sceNpSignalingCreateCtx
