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
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x805cc20f, sceVoiceInit
PSP2_IMPORT_FUNC SceVoice, 0001, F00, 0x875cc80d, sceVoiceGetVolume
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
