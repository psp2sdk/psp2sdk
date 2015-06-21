@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpScore, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x00f90e7b, sceNpScoreGetBoardInfo
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x0433069f, sceNpScoreInit
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x15981858, sceNpScoreSanitizeCommentAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x2050f98f, sceNpScoreTerm
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x24b09634, sceNpScoreRecordScoreAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x31733bf3, sceNpScoreWaitAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x320c0277, sceNpScoreRecordScore
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x3cd9974e, sceNpScoreGetBoardInfoAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x40573917, sceNpScoreRecordGameDataAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x427d3412, sceNpScoreGetRankingByRange
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x45cd1d00, sceNpScoreGetRankingByNpIdAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x53d77883, sceNpScoreSetPlayerCharacterId
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x5685f225, sceNpScoreCreateTitleCtx
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x5ef44841, sceNpScoreSetTimeout
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x6fd2041a, sceNpScoreSanitizeComment
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x7c68d91b, sceNpScoreChangeModeForOtherSaveDataOwners
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x871f28aa, sceNpScoreGetRankingByNpIdPcId
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0x9f2a7ac9, sceNpScorePollAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xa0c94d46, sceNpScoreCensorComment
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xa7e93ce1, sceNpScoreAbortRequest
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xaa0bbf8e, sceNpScoreCensorCommentAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xbae55b34, sceNpScoreGetRankingByNpId
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xc2862b67, sceNpScoreRecordGameData
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xc45e3fcd, sceNpScoreGetRankingByRangeAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xce3a9544, sceNpScoreGetRankingByNpIdPcIdAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xce416993, sceNpScoreGetGameDataAsync
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xd30d1993, sceNpScoreCreateRequest
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xdfad64d3, sceNpScoreGetGameData
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xf52ea88a, sceNpScoreDeleteTitleCtx
PSP2_IMPORT_FUNC SceNpScore, 0001, F00, 0xfff24bb1, sceNpScoreDeleteRequest
