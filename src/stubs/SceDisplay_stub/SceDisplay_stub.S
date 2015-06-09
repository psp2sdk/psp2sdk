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

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceDisplay, 0001, 1, 0

PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x05f27764, sceDisplayWaitVblankStartMultiCB
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x3e796ef5, sceDisplayWaitSetFrameBufMultiCB
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x5795e898, sceDisplayWaitVblankStart
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x6bdf4c4d, sceDisplayRegisterVblankStartCallback
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x78b41b92, sceDisplayWaitVblankStartCB
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x7d9864a8, sceDisplayWaitSetFrameBufMulti
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x814c90af, sceDisplayWaitSetFrameBufCB
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x9423560c, sceDisplayWaitSetFrameBuf
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0x98436a80, sceDisplayUnregisterVblankStartCallback
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0xa08ca60d, sceDisplayGetRefreshRate
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0xb6fde0ba, sceDisplayGetVcount
PSP2_IMPORT_FUNC SceDisplay, 0001, F00, 0xdd0a13b8, sceDisplayWaitVblankStartMulti
