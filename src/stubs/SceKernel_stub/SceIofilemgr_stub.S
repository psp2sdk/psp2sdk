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

PSP2_IMPORT_HEAD 0x0, SceIofilemgr, 0001, 1, 0

PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x0dc4f1bb, sceIoGetProcessDefaultPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x14b2d56c, sceIoSetPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x16512f59, sceIoSyncByFd
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x34efd876, sceIoWrite
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x422a221a, sceIoDclose
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x49252b9b, sceIoLseek32
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x49312108, sceIoSetThreadDefaultPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0x7f2abbaf, sceIoSetProcessDefaultPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0xa176cd03, sceIoGetThreadDefaultPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0xc70b8886, sceIoClose
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0xf2a472a1, sceIoGetPriority
PSP2_IMPORT_FUNC SceIofilemgr, 0001, F00, 0xfdb32293, sceIoRead
