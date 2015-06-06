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

PSP2_IMPORT_HEAD 0x0, SceThreadmgr, 0001, 1, 0

PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x001173f8, sceKernelChangeActiveCpuMask
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x01414f0b, sceKernelGetThreadCurrentPriority
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x0c8a38e1, sceKernelExitThread
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x1d17decf, sceKernelExitDeleteThread
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x47f6de49, sceKernelGetSystemTimeLow
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x4b675d05, sceKernelDelayThread
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x751c9b7a, sceKernelChangeCurrentThreadAttr
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x9c0180e1, sceKernelDelayThreadCB
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x9dcb4b7a, sceKernelGetProcessId
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xc0faf6a3, sceKernelCreateThreadForUser
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xd9bd74eb, sceKernelCheckWaitableStatus
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xe53e41f6, sceKernelCheckCallback
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xf4ee4fa9, sceKernelGetSystemTimeWide
