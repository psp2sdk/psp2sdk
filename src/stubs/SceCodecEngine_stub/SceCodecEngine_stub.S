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

PSP2_IMPORT_HEAD 0x0, SceCodecEngine, 0001, 1, 0

PSP2_IMPORT_FUNC SceCodecEngine, 0001, F00, 0x268b1ef5, sceCodecEnginePmonStop
PSP2_IMPORT_FUNC SceCodecEngine, 0001, F00, 0x3e718890, sceCodecEnginePmonStart
PSP2_IMPORT_FUNC SceCodecEngine, 0001, F00, 0x859e4a68, sceCodecEnginePmonGetProcessorLoad
PSP2_IMPORT_FUNC SceCodecEngine, 0001, F00, 0xa097e4c8, sceCodecEnginePmonReset
