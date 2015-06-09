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

PSP2_IMPORT_HEAD 0x0, SceDeci4pUserp, 0001, 1, 0

PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x28578fe8, sceKernelDeci4pOpen
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x3bc66bd8, sceKernelDeci4pEnableWatchpoint
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x5a4cdf97, sceKernelDeci4pDisableWatchpoint
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x63b0c50f, sceKernelDeci4pClose
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x73371f35, sceKernelDeci4pRegisterCallback
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0x971e1c66, sceKernelDeci4pRead
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0xc4e1d86d, sceKernelDeci4pIsProcessAttached
PSP2_IMPORT_FUNC SceDeci4pUserp, 0001, F00, 0xcda3aaac, sceKernelDeci4pWrite
