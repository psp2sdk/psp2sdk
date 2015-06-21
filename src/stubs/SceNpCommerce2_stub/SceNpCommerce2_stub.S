@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpCommerce2, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x021dc797, sceNpCommerce2GetGameProductInfoFromContentInfo
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x0550c016, sceNpCommerce2GetGameProductInfoFromGetProductInfoListResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x118e1c5e, sceNpCommerce2InitGetProductInfoResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x123e55f4, sceNpCommerce2CreateCtx
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x18bdc4bd, sceNpCommerce2GetProductInfoListStart
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x24d3fe34, sceNpCommerce2DestroyGetProductInfoListResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x29186e27, sceNpCommerce2InitGetProductInfoListResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x315b9bd0, sceNpCommerce2GetContentRatingDescriptor
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x363922ba, sceNpCommerce2GetProductInfoGetResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x3b7c81a5, sceNpCommerce2GetGameSkuInfoFromGameProductInfo
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x4dfbcdd6, sceNpCommerce2GetProductInfoListGetResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x5135ea31, sceNpCommerce2InitGetCategoryContentsResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x56b80faf, sceNpCommerce2GetCategoryInfoFromContentInfo
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x586b0599, sceNpCommerce2GetShortfallOfLibhttpPool
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x5cf665e0, sceNpCommerce2GetCategoryContentsCreateReq
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x6cd27bd0, sceNpCommerce2DestroyCtx
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x7132eaa5, sceNpCommerce2StartEmptyStoreCheck
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x774f88d0, sceNpCommerce2GetCategoryContentsStart
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x7894dcdf, sceNpCommerce2GetContentRatingInfoFromGameProductInfo
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x84c336c6, sceNpCommerce2StopEmptyStoreCheck
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x84e56a6d, sceNpCommerce2ShowPsStoreIcon
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x88d236df, sceNpCommerce2GetPrice
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0x9cd463f8, sceNpCommerce2DestroyGetCategoryContentsResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xa308b496, sceNpCommerce2GetGameProductInfo
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xa4464754, sceNpCommerce2DestroyReq
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xadf3bd5b, sceNpCommerce2DestroyGetProductInfoResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xaee8d3df, sceNpCommerce2CreateSessionGetResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xb0aff6c9, sceNpCommerce2GetProductInfoCreateReq
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xb88db7c2, sceNpCommerce2GetCategoryInfo
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xb99958ae, sceNpCommerce2Term
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xba5a5784, sceNpCommerce2GetShortfallOfLibsslPool
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xbbddf866, sceNpCommerce2CreateSessionStart
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xc47cdb59, sceNpCommerce2GetCategoryContentsGetResult
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xc594adc2, sceNpCommerce2GetProductInfoStart
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xc73f209a, sceNpCommerce2Init
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xd6a5b200, sceNpCommerce2GetContentRatingInfoFromCategoryInfo
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xde45f84f, sceNpCommerce2GetContentInfo
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xe7486a60, sceNpCommerce2AbortReq
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xe81b8bad, sceNpCommerce2GetProductInfoListCreateReq
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xf6f23623, sceNpCommerce2GetSessionInfo
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xfdb39774, sceNpCommerce2CreateSessionCreateReq
PSP2_IMPORT_FUNC SceNpCommerce2, 0001, F00, 0xffc8b18b, sceNpCommerce2HidePsStoreIcon
