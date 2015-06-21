@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceCodecEnginePerf, 0001, 1, 0

PSP2_IMPORT_FUNC SceCodecEnginePerf, 0001, F00, 0x0635eb77, sceCodecEnginePmonStart
PSP2_IMPORT_FUNC SceCodecEnginePerf, 0001, F00, 0x2c9da711, sceCodecEnginePmonGetProcessorLoad
PSP2_IMPORT_FUNC SceCodecEnginePerf, 0001, F00, 0x5d75df62, sceCodecEnginePmonReset
PSP2_IMPORT_FUNC SceCodecEnginePerf, 0001, F00, 0xd2efaea1, sceCodecEnginePmonStop
