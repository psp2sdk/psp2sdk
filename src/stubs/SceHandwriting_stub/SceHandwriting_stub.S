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

PSP2_IMPORT_HEAD 0x0, SceHandwriting, 0001, 1, 0

PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x09af9bf8, sceHandwritingSetMode
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x12e4f99a, sceHandwritingRecognize
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x356b2931, sceHandwritingTerm
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x446f171e, sceHandwritingInit
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x4c3a8d49, sceHandwritingGetBufferSize
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x69324689, sceHandwritingRegisterInfo
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x6abbd675, sceHandwritingRegisterTerm
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x6ba4a521, sceHandwritingRegisterDelete
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x76395d93, sceHandwritingRegisterInit
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0x79ca5d3f, sceHandwritingRegisterSet
PSP2_IMPORT_FUNC SceHandwriting, 0001, F00, 0xb886450e, sceHandwritingRegisterGetResult
