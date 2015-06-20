@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceVoice, 0001, 1, 0

PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x02f58d6f, sceVoiceSetBitRate
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x09e4d18c, sceVoiceReadFromOPort
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x0a22ec0e, sceVoiceWriteToIPort
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x0b9e4ae2, sceVoiceSetMuteFlag
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x1f93fc0c, sceVoiceResumePortAll
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x23c6b16b, sceVoicePausePort
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x2de35411, sceVoiceResumePort
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x39aa3884, sceVoicePausePortAll
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x5933ccfb, sceVoiceGetPortInfo
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x5e1ce910, sceVoiceResetPort
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x5f0260f4, sceVoiceDisconnectIPortFromOPort
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x698bdaae, sceVoiceConnectIPortToOPort
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x6e46950e, sceVoiceGetResourceInfo
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x73f72940, sceVoiceGetPortAttr
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x805cc20f, sceVoiceInit
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x874054ce, sceVoiceCheckTopology
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x875cc80d, sceVoiceGetVolume
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x9b0d3490, sceVoiceSetPortAttr
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0xac98853e, sceVoiceEnd
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0xae46564d, sceVoiceDeletePort
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0xb2ed725b, sceVoiceStart
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0xc3868df6, sceVoiceStop
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0xc913f7e9, sceVoiceGetMuteFlag
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0xce855c50, sceVoiceUpdatePort
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0xd02c00b4, sceVoiceGetBitRate
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0xd93769e6, sceVoiceSetVolume
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0xdb90eac4, sceVoiceSetMuteFlagAll
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0xfa4e57b1, sceVoiceCreatePort
