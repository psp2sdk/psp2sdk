@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSsl, 0001, 1, 0

PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0x03ce6e3a, sceSslTerm
PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0x2a857867, sceSslGetNameEntryInfo
PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0x3c733316, sceSslInit
PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0x412711e5, sceSslGetIssuerName
PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0x70dea174, sceSslGetNotBefore
PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0x901c5c15, sceSslGetSerialNumber
PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0x95e14ca6, sceSslGetNameEntryCount
PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0x9b2f1bc1, sceSslGetSubjectName
PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0xbd203262, sceSslGetMemoryPoolStats
PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0xc73687e4, sceSslFreeSslCertName
PSP2_IMPORT_FUNC SceSsl, 0001, F00, 0xf5ed7b68, sceSslGetNotAfter
