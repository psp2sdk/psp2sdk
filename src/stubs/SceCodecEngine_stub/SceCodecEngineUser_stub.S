@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceCodecEngineUser, 0001, 1, 0

PSP2_IMPORT_FUNC SceCodecEngineUser, 0001, F00, 0x1a3a53e5, sceCodecEngineAllocMemoryFromUnmapMemBlock
PSP2_IMPORT_FUNC SceCodecEngineUser, 0001, F00, 0x6a31831d, sceCodecEngineFreeMemoryFromUnmapMemBlock
PSP2_IMPORT_FUNC SceCodecEngineUser, 0001, F00, 0x95ea3b3e, sceCodecEngineCloseUnmapMemBlock
PSP2_IMPORT_FUNC SceCodecEngineUser, 0001, F00, 0xf0b4c892, sceCodecEngineOpenUnmapMemBlock
