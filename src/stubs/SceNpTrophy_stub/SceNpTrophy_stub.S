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
