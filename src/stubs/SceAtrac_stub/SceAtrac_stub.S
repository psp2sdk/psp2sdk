@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceAtrac, 0001, 1, 0

PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x008ef251, sceAtracReleaseHandle
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x01bfb98c, sceAtracCreateDecoderGroup
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x075b0c63, sceAtracSetOutputSamples
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x1a34b331, sceAtracQueryDecoderGroupMemSize
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x272b4cba, sceAtracSetSubBuffer
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x29c74ee3, sceAtracDecode
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x37b3f335, sceAtracGetOutputSamples
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x53656f1c, sceAtracAddStreamData
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x5b36cdb5, sceAtracGetOutputableSamples
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x5c22e927, sceAtracSetLoopNum
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x67981334, sceAtracGetInternalError
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x68dfc199, sceAtracGetContentInfo
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x6ca2f08a, sceAtracDeleteDecoderGroup
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x722f5004, sceAtracIsSubBufferNeeded
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x90b512ac, sceAtracGetDecoderStatus
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0x9bdb14f7, sceAtracGetVacantSize
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0xaca5f9cc, sceAtracGetNextOutputPosition
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0xbf34605d, sceAtracGetDecoderGroupInfo
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0xd1997678, sceAtracSetDataAndAcquireHandle
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0xd81d7280, sceAtracResetNextOutputPosition
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0xd9409e57, sceAtracGetStreamInfo
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0xdc27e7c2, sceAtracGetRemainSamples
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0xdc768033, sceAtracGetLoopInfo
PSP2_IMPORT_FUNC SceAtrac, 0001, F00, 0xe7d9dc4f, sceAtracGetSubBufferInfo
