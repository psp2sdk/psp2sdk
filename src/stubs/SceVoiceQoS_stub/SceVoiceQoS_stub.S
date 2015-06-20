@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceVoiceQoS, 0001, 1, 0

PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0x2d613549, sceVoiceQoSReadPacket
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0x2fe1f28f, sceVoiceQoSWritePacket
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0x3c7a08b0, sceVoiceQoSDisconnect
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0x4b5fff1c, sceVoiceQoSInit
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0x540ceba5, sceVoiceQoSSetLocalEndpointAttribute
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0x68fabf6f, sceVoiceQoSDeleteLocalEndpoint
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0x876a9b9c, sceVoiceQoSGetRemoteEndpoint
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0xaab54be4, sceVoiceQoSCreateLocalEndpoint
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0xbab98727, sceVoiceQoSCreateRemoteEndpoint
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0xc2f2c771, sceVoiceQoSDeleteRemoteEndpoint
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0xc981ab3b, sceVoiceQoSGetLocalEndpointAttribute
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0xc9dc1425, sceVoiceQoSGetStatus
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0xe0c5ceee, sceVoiceQoSConnect
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0xe5b4527d, sceVoiceQoSGetLocalEndpoint
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0xe757806f, sceVoiceQoSSetConnectionAttribute
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0xe81b8d44, sceVoiceQoSGetConnectionAttribute
PSP2_IMPORT_FUNC SceVoiceQoS, 0001, F00, 0xfb0b747b, sceVoiceQoSEnd
