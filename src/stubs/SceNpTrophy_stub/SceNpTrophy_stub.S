@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpTrophy, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0x087b0535, sceNpTrophyGetGroupInfo
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0x1b8c3192, sceNpTrophyGetGroupIcon
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0x34516838, sceNpTrophyInit
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0x4ebc6977, sceNpTrophyCreateHandle
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0x56f5cba5, sceNpTrophyDestroyContext
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0x94bab8d0, sceNpTrophyGetTrophyIcon
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0xa4addd91, sceNpTrophyGetTrophyInfo
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0xb397aa24, sceNpTrophyUnlockTrophy
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0xba2b7f2a, sceNpTrophyGetGameInfo
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0xbfe0f28f, sceNpTrophyTerm
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0xc49fd33f, sceNpTrophyCreateContext
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0xc8d2a4de, sceNpTrophyGetTrophyUnlockState
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0xd55c6f4c, sceNpTrophyAbortHandle
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0xfe382529, sceNpTrophyGetGameIcon
PSP2_IMPORT_FUNC SceNpTrophy, 0001, F00, 0xff142071, sceNpTrophyDestroyHandle
