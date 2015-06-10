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

PSP2_IMPORT_HEAD 0x0, SceDeflt, 0001, 1, 0

PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0x110d5050, sceDeflateDecompress
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0x14a0698d, sceZlibIsValid
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0x1b8e5862, sceGzipGetInfo
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0x25b8c7a2, sceDeflateDecompressPartial
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0x4c0a685d, sceZlibGetInfo
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0xaebaabe6, sceGzipGetName
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0xbabcf5cf, sceGzipGetComment
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0xcd83a464, sceZlibAdler32
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0xda404fe4, sceZipGetInfo
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0xdedadc31, sceGzipIsValid
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0xe1844802, sceGzipGetCompressedData
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0xe38f754d, sceZlibDecompress
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0xe3cb51a3, sceGzipDecompress
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0xe680a65a, sceZlibGetCompressedData
PSP2_IMPORT_FUNC SceDeflt, 0001, F00, 0xf720a8f6, sceGzipCrc32
