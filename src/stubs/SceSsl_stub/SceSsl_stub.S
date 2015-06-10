@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software: you can redistribute it and/or modify
@ it under the terms of the GNU Lesser General Public License as published by
@ the Free Software Foundation, either version 3 of the License, or
@ (at your option) any later version.
@
@ This libary is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@ GNU Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public License
@ along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
