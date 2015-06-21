@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNearUtil, 0001, 1, 0

PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x06807ca3, sceNearOpenReceivedGiftData
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x146be236, sceNearSetGift
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x2364d6bd, sceNearReadDiscoveredGiftImage
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x2ed36ee2, sceNearRefresh
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x2f35c196, sceNearCloseReceivedGiftData
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x360d4a19, sceNearIgnoreDiscoveredGift
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x3f3f6d92, sceNearFinalizeAndLaunchNearApp
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x4cce6a14, sceNearSetGift2
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x52021026, sceNearDeleteGift
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x6c2e610f, sceNearGetNewNeighbors
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x773abea9, sceNearGetDiscoveredGiftInfo
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x80d6c552, sceNearConvertDiscoveredGiftParam
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x88a68d20, sceNearCloseDiscoveredGiftImage
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x8cbeb2da, sceNearDeleteDiscoveredGift
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0x8f3cc01c, sceNearGetGiftStatus
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xa64d9d38, sceNearGetDiscoveredGiftStatus
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xad264f5f, sceNearGetNeighbors
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xaef3022a, sceNearGetMyStatus
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xb14145dd, sceNearReadReceivedGiftData
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xb22cb01d, sceNearLaunchNearAppForDownload
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xbbca5813, sceNearInitialize
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xd393578e, sceNearGetLastNeighborFoundDateTime
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xdb8bac35, sceNearGetGift
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xde6f0859, sceNearGetDiscoveredGifts
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xe75a5a9b, sceNearGetRecentNeighbors
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xefe6f060, sceNearGetDiscoveredGiftSender
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xf3398774, sceNearLaunchNearAppForUpdate
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xf8c15008, sceNearOpenDiscoveredGiftImage
PSP2_IMPORT_FUNC SceNearUtil, 0001, F00, 0xff3bc581, sceNearFinalize
