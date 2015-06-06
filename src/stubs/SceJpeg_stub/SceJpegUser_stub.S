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

PSP2_IMPORT_HEAD 0x0, SceJpegUser, 0001, 1, 0

PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x123b4734, sceJpegCreateSplitDecoder
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x2a769bd8, sceJpegDecodeMJpegYCbCr
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x353ba9b0, sceJpegGetOutputInfo
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x4598ec9c, sceJpegSplitDecodeMJpeg
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x6215b095, sceJpegDecodeMJpeg
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0x62842598, sceJpegFinishMJpeg
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0xb030773b, sceJpegInitMJpeg
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0xc2380e3a, sceJpegMJpegCsc
PSP2_IMPORT_FUNC SceJpegUser, 0001, F00, 0xde8d5fa1, sceJpegDeleteSplitDecoder
