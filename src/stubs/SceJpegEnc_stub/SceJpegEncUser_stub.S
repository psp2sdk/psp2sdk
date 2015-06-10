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

PSP2_IMPORT_HEAD 0x0, SceJpegEncUser, 0001, 1, 0

PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x25d52d97, sceJpegEncoderSetOutputAddr
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x2b55844d, sceJpegEncoderGetContextSize
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x2e8fe45d, sceJpegEncoderInitWithParam
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x2f58b12c, sceJpegEncoderSetHeaderMode
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x824a7d4f, sceJpegEncoderCsc
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x88da92b4, sceJpegEncoderInit
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0x9511f3bc, sceJpegEncoderSetValidRegion
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0xb2b828ec, sceJpegEncoderSetCompressionRatio
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0xc60de94c, sceJpegEncoderEncode
PSP2_IMPORT_FUNC SceJpegEncUser, 0001, F00, 0xc87aa849, sceJpegEncoderEnd
