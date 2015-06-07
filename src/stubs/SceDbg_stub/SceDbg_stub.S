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

PSP2_IMPORT_HEAD 0x0, SceDbg, 0001, 1, 0

PSP2_IMPORT_FUNC SceDbg, 0001, F00, 0x1af3678b, sceDbgAssertionHandler
PSP2_IMPORT_FUNC SceDbg, 0001, F00, 0x3deaecd3, sceDbgSetBreakOnWarningState
PSP2_IMPORT_FUNC SceDbg, 0001, F00, 0x6605ab19, sceDbgLoggingHandler
PSP2_IMPORT_FUNC SceDbg, 0001, F00, 0x941622fa, sceDbgSetMinimumLogLevel
PSP2_IMPORT_FUNC SceDbg, 0001, F00, 0xed4a00ba, sceDbgSetBreakOnErrorState
