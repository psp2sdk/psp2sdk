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

PSP2_IMPORT_HEAD 0x0, SceCommonDialog, 0001, 1, 0

PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x013e7f74, sceSaveDataDialogAbort
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x032206d8, scePhotoImportDialogGetStatus
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x0cc66115, sceMsgDialogAbort
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x19192c8b, sceSaveDataDialogContinue
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x1e7043bf, sceImeDialogInit
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x2192a10a, sceSaveDataDialogTerm
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x2d8edf09, sceNetCheckDialogAbort
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x2eb3d046, sceImeDialogGetResult
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x4107019e, sceMsgDialogGetStatus
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x415d6068, sceSaveDataDialogSubClose
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x4b125581, scePhotoImportDialogAbort
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x594a220e, sceImeDialogAbort
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x5c322d1e, sceSaveDataDialogProgressBarSetValue
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x6c49924b, sceSaveDataDialogFinish
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x6e258046, sceSaveDataDialogGetStatus
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x73ee7c9c, scePhotoImportDialogInit
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x74ff2a8b, scePhotoReviewDialogAbort
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x755ff270, sceMsgDialogInit
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x7be0e08b, sceMsgDialogProgressBarInc
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x7fe5bd77, scePhotoImportDialogTerm
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x8027292a, sceNetCheckDialogGetStatus
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x81acf695, sceMsgDialogTerm
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x838a3af4, sceImeDialogTerm
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x8be51c15, sceNetCheckDialogTerm
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x90530f2f, sceCommonDialogUpdate
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0x9cda5e0d, sceMsgDialogProgressBarSetValue
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xa38a4a0d, sceNetCheckDialogInit
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xb05fce9e, sceNetCheckDialogGetResult
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xb2ff576e, sceSaveDataDialogGetResult
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xba0542ca, sceSaveDataDialogGetSubStatus
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xbb3bfc89, sceMsgDialogGetResult
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xbde00a83, sceSaveDataDialogProgressBarInc
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xbf5248fa, sceSaveDataDialogInit
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xc296d396, sceMsgDialogClose
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xc700b2df, scePhotoReviewDialogTerm
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xcd990375, scePhotoReviewDialogInit
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xcf0431fd, sceImeDialogGetStatus
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xd855414c, scePhotoImportDialogGetResult
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xf4f600ca, scePhotoReviewDialogGetStatus
PSP2_IMPORT_FUNC SceCommonDialog, 0001, F00, 0xffa35858, scePhotoReviewDialogGetResult
