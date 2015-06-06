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

PSP2_IMPORT_HEAD 0x0, SceSas, 0001, 1, 0

PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x007e63e6, sceSasGetEndState
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x011788be, sceSasSetDistortion
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x0be8204d, sceSasSetVolume
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x139d29c0, sceAsDestroySystem
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x1568017a, sceSasGetPreMasterPeak
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x180c6824, sceSasGetNeededMemorySize
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x18a5efa2, sceSasSetADSR
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x1e608068, sceAsSetRacks
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x2549f436, sceAsSetEvent
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x296a9910, sceSasGetEnvelope
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x2b4a207c, sceSasSetGrain
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x2b75f9bc, sceSasSetVoice
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x2bea45bc, sceSasGetGrain
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x2c36e150, sceSasGetOutputmode
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x2c48a08c, sceSasSetPitch
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x4314f0e9, sceSasGetWetPeak
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x449b5974, sceSasInit
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x44ddb3c4, sceSasSetOutputmode
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x5207f9d2, sceSasSetADSRmode
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x55eddbfa, sceSasSetEffectVolume
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x5835b473, sceAsSetGranularity
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x59c7a9df, sceSasSetPause
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x5e42adab, sceSasSetKeyOff
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x7a4672b2, sceSasCore
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x820d5f82, sceSasInitWithGrain
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x8bef3c92, sceAsUnlockUpdate
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xa2209c58, sceAsSetRegisterReportHandler
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xaa8d4541, sceAsCreateSystem
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xb0444e69, sceSasSetEffect
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xb1756efc, sceSasSetVoicePCM
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xb6220e73, sceAsSetBuss
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xb6642276, sceSasGetDryPeak
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xbad546a0, sceSasSetEffectParam
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xbb635544, sceAsSetUnregisterReportHandler
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xbb7d6790, sceSasExit
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xbd496983, sceSasCoreWithMix
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xbe843eec, sceAsLockParam
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xc72f1eef, sceAsRender
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xc838db6f, sceSasSetKeyOn
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xcdf2ddd5, sceSasSetEffectType
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xce23f057, sceAsLockUpdate
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xdc26b9f2, sceAsGetState
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xde6227b8, sceSasSetSL
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xdfe6502f, sceAsGetGranularity
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xecce0db8, sceSasSetSimpleADSR
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xf1c63cb9, sceSasSetNoise
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xf578f0ef, sceAsGetSystemNeededMemory
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xfd1a0cbf, sceSasGetPauseState
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xff2380c4, sceAsUnlockParam
