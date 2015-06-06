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
