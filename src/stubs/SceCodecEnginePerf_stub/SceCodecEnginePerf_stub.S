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

PSP2_IMPORT_HEAD 0x0, SceCodecEnginePerf, 0001, 1, 0

PSP2_IMPORT_FUNC SceCodecEnginePerf, 0001, F00, 0x0635eb77, sceCodecEnginePmonStart
PSP2_IMPORT_FUNC SceCodecEnginePerf, 0001, F00, 0x2c9da711, sceCodecEnginePmonGetProcessorLoad
PSP2_IMPORT_FUNC SceCodecEnginePerf, 0001, F00, 0x5d75df62, sceCodecEnginePmonReset
PSP2_IMPORT_FUNC SceCodecEnginePerf, 0001, F00, 0xd2efaea1, sceCodecEnginePmonStop
