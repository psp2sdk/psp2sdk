@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSas, 0001, 1, 0

PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x007e63e6, sceSasGetEndState
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x011788be, sceSasSetDistortion
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x0be8204d, sceSasSetVolume
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x1568017a, sceSasGetPreMasterPeak
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x180c6824, sceSasGetNeededMemorySize
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x18a5efa2, sceSasSetADSR
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
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x59c7a9df, sceSasSetPause
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x5e42adab, sceSasSetKeyOff
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x7a4672b2, sceSasCore
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0x820d5f82, sceSasInitWithGrain
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xb0444e69, sceSasSetEffect
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xb1756efc, sceSasSetVoicePCM
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xb6642276, sceSasGetDryPeak
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xbad546a0, sceSasSetEffectParam
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xbb7d6790, sceSasExit
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xbd496983, sceSasCoreWithMix
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xc838db6f, sceSasSetKeyOn
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xcdf2ddd5, sceSasSetEffectType
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xde6227b8, sceSasSetSL
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xecce0db8, sceSasSetSimpleADSR
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xf1c63cb9, sceSasSetNoise
PSP2_IMPORT_FUNC SceSas, 0001, F00, 0xfd1a0cbf, sceSasGetPauseState
