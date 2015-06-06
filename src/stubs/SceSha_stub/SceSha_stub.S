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

PSP2_IMPORT_HEAD 0x0, SceSha, 0001, 1, 0

PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x37ef2afc, sceSha0BlockUpdate
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xbcf6db3a, sceSha0BlockInit
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xbf0158c4, sceSha0BlockResult
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xd19a9aa8, sceSha0Digest
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x0195dadf, sceSha1BlockResult
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x9007205e, sceSha1BlockUpdate
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xb13d65aa, sceSha1BlockInit
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xe1215c9d, sceSha1Digest
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x1346d270, sceSha224Digest
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x538f04ce, sceSha224BlockInit
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xa36ecf65, sceSha224BlockResult
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xb5fd0160, sceSha224BlockUpdate
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x9b5bb4ba, sceSha256BlockResult
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xa337079c, sceSha256Digest
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xdaeca1f8, sceSha256BlockUpdate
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xe281374f, sceSha256BlockInit
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x037aabe7, sceSha384BlockInit
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x30d5c919, sceSha384BlockResult
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x4b99dbb8, sceSha384BlockUpdate
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xa602c694, sceSha384Digest
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x00e52720, sceSha512tDigest
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x66425db6, sceSha512tBlockResult
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x79065bb2, sceSha512tBlockInit
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xc5359df8, sceSha512tBlockUpdate
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x26146a16, sceSha512BlockResult
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x5dc0b916, sceSha512Digest
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0x669281e8, sceSha512BlockUpdate
PSP2_IMPORT_FUNC SceSha, 0001, F00, 0xe017a9cd, sceSha512BlockInit
