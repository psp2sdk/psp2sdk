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

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNgs, 0001, 1, 0

PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x01a52e3a, sceNgsVoiceGetOutputPatch
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x0a92e4ec, sceNgsRackInit
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x0a93ea96, sceNgsSystemUnlock
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x0d5399cf, sceNgsVoiceDefGetSimpleVoice
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x0e0acb68, sceNgsVoiceDefGetCompressorBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x0e291aad, sceNgsVoiceKill
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x14ef65a0, sceNgsVoiceDefGetAtrac9Voice
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x17a6f564, sceNgsVoiceSetFinishedCallback
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x1af83512, sceNgsVoiceDefGetCompressorSideChainBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x1ddbebeb, sceNgsVoiceInit
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x1f51c2ba, sceNgsVoiceDefGetSasEmuVoice
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x214485d6, sceNgsVoiceDefGetPauserBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x24e909a8, sceNgsVoiceSetModuleCallback
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x251af6a9, sceSulphaNgsSetRackName
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x2a9fa501, sceNgsAT9GetSectionDetails
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x2f3f7515, sceSulphaNgsSetSynthName
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x3d46d8a7, sceNgsVoiceUnlockParams
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x431bf3ab, sceNgsVoiceGetModuleBypass
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x45cf2a73, sceNgsVoiceDefGetSimpleAtrac9Voice
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x477318c0, sceNgsRackGetRequiredMemorySize
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x4a25bebc, sceNgsSystemRelease
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x4cbe08f3, sceNgsVoiceGetParamsOutOfRange
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x4d705e3e, sceNgsVoiceDefGetDelayBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x508975bd, sceSulphaNgsSetVoiceName
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x534b6e3f, sceNgsRackSetParamErrorCallback
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x54cfb981, sceNgsVoiceResume
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x54ec5b8d, sceSulphaNgsSetSampleName
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x5551410d, sceNgsVoiceGetInfo
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x5add22dc, sceNgsSystemSetParamErrorCallback
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x5c71fe09, sceNgsModuleGetNumPresets
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x5fd8aedb, sceSulphaNgsGetDefaultConfig
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x64d80013, sceNgsSystemSetFlags
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x684f080c, sceNgsSystemUpdate
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x6ce8b36f, sceNgsSystemGetRequiredMemorySize
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x793e3e8c, sceSulphaNgsGetNeededMemory
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x79a121d1, sceNgsVoiceDefGetMasterBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x8a88e665, sceNgsVoiceSetPreset
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x98703dbc, sceNgsPatchGetInfo
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x9ab87e71, sceNgsVoiceBypassModule
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0x9dcf50f5, sceNgsVoiceDefGetReverbBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xa0f5402d, sceNgsVoicePatchSetVolumesMatrix
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xa3c807bc, sceNgsVoicePatchSetVolume
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xaad90deb, sceNgsVoiceDefGetDistortionBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xab6bef8f, sceNgsVoiceLockParams
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xafcd824f, sceSulphaNgsInit
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xb307185e, sceNgsVoiceGetModuleType
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xb9d971f2, sceNgsSystemLock
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xbb13373d, sceNgsVoiceKeyOff
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xbd6f57f0, sceNgsVoicePatchSetVolumes
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xc58298a7, sceNgsModuleGetPreset
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xc9b8c0b4, sceNgsVoiceGetStateData
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xcd63a2bf, sceNgsVoiceDefGetScreamAtrac9Voice
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xce53bc33, sceNgsVoiceDefGetScreamVoice
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xd0c9ae5a, sceNgsPatchRemoveRouting
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xd124bfb1, sceSulphaNgsShutdown
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xd668b49c, sceNgsPatchCreateRouting
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xd7786e99, sceNgsVoicePause
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xdc7c0f05, sceSulphaNgsTrace
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xdd5ca10b, sceNgsRackRelease
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xe0ac8776, sceNgsVoiceDefGetMixerBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xe9b572b7, sceNgsVoiceDefGetTemplate1
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xed14cf4a, sceNgsSystemInit
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xf6b68c31, sceNgsVoiceDefGetEnvelopeBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xf964120e, sceNgsVoiceDefGetEqBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xfa0a0f34, sceNgsVoicePlay
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xfb8174b1, sceNgsVoiceSetParamsBlock
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xfbe515d4, sceNgsVoiceDefGetPitchShiftBuss
PSP2_IMPORT_FUNC SceNgs, 0001, F00, 0xfe1a98e9, sceNgsRackGetVoiceHandle
