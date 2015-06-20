@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceMotion, 0001, 1, 0

PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x047f060a, sceMotionGetDeviceLocation
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x0fd2cda2, sceMotionReset
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x112e0eae, sceMotionGetDeadband
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x122a79f8, sceMotionMagnetometerOn
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x20f00078, sceMotionRotateYaw
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x28034ac9, sceMotionStartSampling
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x3d4813ae, sceMotionGetMagnetometerState
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x47d679ea, sceMotionGetSensorState
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x499b6c87, sceMotionGetAngleThreshold
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x4f28bfe0, sceMotionGetBasicOrientation
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0x917ea390, sceMotionSetDeadband
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0xa4a7e6e2, sceMotionSetGyroBiasCorrection
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0xaf09fcdb, sceMotionSetTiltCorrection
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0xaf32cb1d, sceMotionStopSampling
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0xbdb32767, sceMotionGetState
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0xc1652201, sceMotionGetTiltCorrection
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0xc1a7395a, sceMotionMagnetometerOff
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0xdacb2a41, sceMotionSetAngleThreshold
PSP2_IMPORT_FUNC SceMotion, 0001, F00, 0xe8a28da5, sceMotionGetGyroBiasCorrection
