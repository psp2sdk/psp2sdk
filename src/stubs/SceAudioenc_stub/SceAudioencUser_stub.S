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

PSP2_IMPORT_HEAD 0x0, SceAudioencUser, 0001, 1, 0

PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0x452246d0, sceAudioencGetInternalError
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0x64c04ae8, sceAudioencCreateEncoder
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0x76ee4dc6, sceAudioencInitLibrary
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0x9386f42d, sceAudioencClearContext
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0xab32d022, sceAudioencTermLibrary
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0xc6ba5ee6, sceAudioencDeleteEncoder
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0xd01c63a3, sceAudioencGetOptInfo
PSP2_IMPORT_FUNC SceAudioencUser, 0001, F00, 0xd85db29c, sceAudioencEncode
