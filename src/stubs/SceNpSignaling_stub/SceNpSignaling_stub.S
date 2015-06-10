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

PSP2_IMPORT_HEAD 0x0, SceNpSignaling, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x0b48fadb, sceNpSignalingSetCtxOpt
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x3b56e6c2, sceNpSignalingDeactivateConnection
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x3ec1f4aa, sceNpSignalingGetConnectionFromNpId
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x4b6acf47, sceNpSignalingInit
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x5048e147, sceNpSignalingCancelPeerNetInfo
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x51883eae, sceNpSignalingGetConnectionInfo
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x5861e7ba, sceNpSignalingGetLocalNetInfo
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x5d660c45, sceNpSignalingGetPeerNetInfo
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x6b9e6e3f, sceNpSignalingGetConnectionFromPeerAddress
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x83b3da0a, sceNpSignalingGetConnectionStatus
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x92ffbde3, sceNpSignalingActivateConnection
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x995a5a74, sceNpSignalingGetMemoryInfo
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0x9d1c5303, sceNpSignalingGetCtxOpt
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0xa413f8c2, sceNpSignalingTerminateConnection
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0xbc892d18, sceNpSignalingTerm
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0xde8536f0, sceNpSignalingGetPeerNetInfoResult
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0xeaa4b1f3, sceNpSignalingDestroyCtx
PSP2_IMPORT_FUNC SceNpSignaling, 0001, F00, 0xf77ef683, sceNpSignalingCreateCtx
