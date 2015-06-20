@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNearDialogUtil, 0001, 1, 0

PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x1265745d, sceNearUtilityGetMyStatus
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x1341672d, sceNearDialogGetStatus
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x200d6143, sceNearUtilityReadDiscoveredGiftImage
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x28394cd7, sceNearUtilityCloseReceivedGiftData
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x294693cb, sceNearUtilitySetGift
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x30c8b7a3, sceNearUtilityReadReceivedGiftData
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x3289bf4a, sceNearUtilityCloseDiscoveredGiftImage
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x44a0f2b7, sceNearUtilityGetNewNeighbors
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x44ea7fa3, sceNearUtilityDeleteDiscoveredGift
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x486bebdb, sceNearUtilityOpenReceivedGiftData
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x52bbf4c5, sceNearUtilityFinalize
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x61a68242, sceNearUtilityGetNeighbors
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x6dbc14b8, sceNearUtilityLaunchNearAppForDownload
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x722e8b53, sceNearUtilityDeleteGift
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x74e55a3b, sceNearUtilityRefresh
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x7790bdb4, sceNearDialogAbort
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x8cbd3bf9, sceNearUtilityGetGift
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x8d32729e, sceNearUtilityLaunchNearAppForUpdate
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0x9d6a7ad4, sceNearUtilityGetLastNeighborFoundDateTime
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xa3d52935, sceNearDialogTerm
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xaf4740d1, sceNearUtilityGetDiscoveredGiftInfo
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xb04b9676, sceNearUtilityIgnoreDiscoveredGift
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xbf1b4bb9, sceNearUtilityOpenDiscoveredGiftImage
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xccb5ff48, sceNearUtilityGetGiftStatus
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xd46e5257, sceNearDialogGetResult
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xd6ffc962, sceNearUtilityGetDiscoveredGiftStatus
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xda56f2f1, sceNearUtilityGetRecentNeighbors
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xdbefb12e, sceNearUtilitySetGift2
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xe2a90639, sceNearUtilityGetDiscoveredGiftSender
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xe493d3b8, sceNearDialogInit
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xeca38e35, sceNearUtilityInitialize
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xf3fbffe9, sceNearUtilityConvertDiscoveredGiftParam
PSP2_IMPORT_FUNC SceNearDialogUtil, 0001, F00, 0xf684c554, sceNearUtilityGetDiscoveredGifts
