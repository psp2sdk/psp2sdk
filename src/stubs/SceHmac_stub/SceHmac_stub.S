@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceHmac, 0001, 1, 0

PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x05ae1466, sceHmacSha0BlockResult
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x0c9fa657, sceHmacSha256BlockUpdate
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x272feffe, sceHmacSha512BlockInit
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x2ab46bb5, sceHmacSha224BlockResult
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x359ed31e, sceHmacSha224Digest
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x393ff6bc, sceHmacSha224BlockInit
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x55871d87, sceHmacSha1Digest
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x5a52150f, sceHmacSha256BlockResult
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x64219ff5, sceHmacSha512BlockResult
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x6eeb05d3, sceHmacMd5Digest
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x6ef06490, sceHmacSha1BlockUpdate
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x8fdfce5b, sceHmacSha512Digest
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x96ad3a67, sceHmacSha256BlockInit
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x9bccc484, sceHmacMd5BlockResult
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x9c3b4844, sceHmacSha384Digest
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x9cb7f0ef, sceHmacSha0BlockUpdate
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0x9fd439e9, sceHmacMd5BlockUpdate
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xa2285a9a, sceHmacSha1BlockInit
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xb77629eb, sceHmacSha224BlockUpdate
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xb786f59f, sceHmacSha384BlockInit
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xba308cda, sceHmacSha384BlockResult
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xc16d8ab6, sceHmacSha384BlockUpdate
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xccb91784, sceHmacSha0Digest
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xd0af51c6, sceHmacSha1BlockResult
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xd44f6b32, sceHmacSha0BlockInit
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xd6e232cd, sceHmacMd5BlockInit
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xe254d9a1, sceHmacSha256Digest
PSP2_IMPORT_FUNC SceHmac, 0001, F00, 0xeca83992, sceHmacSha512BlockUpdate
