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

PSP2_IMPORT_HEAD 0x0, SceProcessmgr, 0001, 1, 0

PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x0039be45, sceKernelLibcTime
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x2252890c, sceKernelPowerTick
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x4b879059, sceKernelLibcGettimeofday
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x890bdc39, sceKernelLibcMktime
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x94f041ed, sceKernelLibcLocaltime_r
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0x9e45da09, sceKernelLibcClock
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xbca437cd, sceKernelLibcGmtime_r
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xc1727f59, sceKernelGetStdin
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xe5aa625c, sceKernelGetStdout
PSP2_IMPORT_FUNC SceProcessmgr, 0001, F00, 0xfa5e3ada, sceKernelGetStderr
