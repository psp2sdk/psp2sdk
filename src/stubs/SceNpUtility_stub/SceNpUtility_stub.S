@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpUtility, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x01284c6e, sceNpWordFilterInit
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x0158b61b, sceNpLookupTerm
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x027587c4, sceNpLookupAbortRequest
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x081fa13c, sceNpBandwidthTestInitStart
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x1075589c, sceNpWordFilterCreateTitleCtx
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x282bd43c, sceNpLookupAvatarImageAsync
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x30606c85, sceNpWordFilterSanitizeComment
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x31b308aa, sceNpWordFilterWaitAsync
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x32b068c4, sceNpBandwidthTestAbort
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x33b64699, sceNpLookupDeleteTitleCtx
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x36da662e, sceNpWordFilterAbortRequest
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x40ec7271, sceNpWordFilterSanitizeCommentAsync
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x5110e17e, sceNpLookupCreateTitleCtx
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x5387babb, sceNpLookupNpIdAsync
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x58d92efd, sceNpBandwidthTestShutdown
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x6690d8e2, sceNpWordFilterDeleteRequest
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x6a1bf429, sceNpLookupUserProfile
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x7183047c, sceNpWordFilterCreateRequest
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x7d140f70, sceNpWordFilterTerm
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x8b608bf6, sceNpLookupDeleteRequest
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x9246a673, sceNpLookupInit
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x9e42e922, sceNpLookupCreateRequest
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0x9f44ce45, sceNpWordFilterSetTimeout
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xa30e4e17, sceNpWordFilterCensorComment
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xb0c9dc45, sceNpLookupSetTimeout
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xb1a14879, sceNpLookupNpId
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xb4e5a189, sceNpWordFilterDeleteTitleCtx
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xbae4cd1f, sceNpWordFilterPollAsync
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xcf956f23, sceNpLookupWaitAsync
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xe0ebfbf6, sceNpBandwidthTestGetStatus
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xe5285e0f, sceNpLookupUserProfileAsync
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xe956080f, sceNpWordFilterCensorCommentAsync
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xfcdba234, sceNpLookupPollAsync
PSP2_IMPORT_FUNC SceNpUtility, 0001, F00, 0xfdb0ae47, sceNpLookupAvatarImage
