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

PSP2_IMPORT_HEAD 0x0, SceProcessmgr, 0001, 1, 0

PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x0039be45, sceKernelLibcTime
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x2252890c, sceKernelPowerTick
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x2be3e066, sceKernelGetProcessParam
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x4b879059, sceKernelLibcGettimeofday
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x89da0967, sceKernelGetProcessTimeWide
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x9e45da09, sceKernelLibcClock
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xc1727f59, sceKernelGetStdin
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xcd248267, sceKernelGetCurrentProcess
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xd37a8437, sceKernelGetProcessTime
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xe5aa625c, sceKernelGetStdout
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xe6e9fca3, sceKernelGetRemoteProcessTime
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xf5d0d4c6, sceKernelGetProcessTimeLow
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xfa5e3ada, sceKernelGetStderr
