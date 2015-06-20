@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceSmart, 0001, 1, 0

PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x0c6a1da8, sceSmartDestroyTarget
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x2260e8bb, sceSmartSceneMappingGetNumLandmarks
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x23edfa9a, sceSmartGetTargetInfo
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x245ec28a, sceSmartTargetTrackingRun2
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x2808c8cb, sceSmartTargetTrackingQuery
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x3159d38c, sceSmartSceneMappingGetNumNodePoints
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x35344a8e, sceSmartTargetTrackingSetSearchPolicy
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x43df6d9c, sceSmartRelease
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x4907021f, sceSmartSceneMappingSaveMap
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x4d9ea817, sceSmartSceneMappingDispatchAndQueryWithMask
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x52eb57e4, sceSmartSceneMappingStop
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x55c37f31, sceSmartSceneMappingRegisterTarget
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x58979c84, sceSmartInit
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x5a121f6c, sceSmartTargetTrackingStart
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x5a31446e, sceSmartCreateLearnedImageTarget
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x5a9ec64d, sceSmartSceneMappingPropagateResult
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x607aacb5, sceSmartSceneMappingGetNodePointInfo
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x648c7e15, sceSmartTargetTrackingGetResults
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x6807ca97, sceSmartSceneMappingUnregisterTarget
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x6d4081d3, sceSmartSceneMappingForceLocalize
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x6ee07829, sceSmartTargetTrackingUnregisterTarget
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x7c4731e2, sceSmartSceneMappingEnableMask
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x7fe71305, sceSmartTargetTrackingDispatchAndQuery
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x8acadd54, sceSmartTargetTrackingRegisterTarget
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x8ae7354a, sceSmartTargetTrackingRunWorker
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x961367d3, sceSmartSceneMappingLoadMap
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x9a578a29, sceSmartSceneMappingGetInitializationPointInfo
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0x9f30c12a, sceSmartSceneMappingRemoveLandmark
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xa3a82b99, sceSmartSceneMappingStart
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xa4a155b5, sceSmartTargetTrackingReset
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xa96b997b, sceSmartSceneMappingFixMap
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xb17057ea, sceSmartSceneMappingGetLandmarkInfo
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xbfd87f61, sceSmartTargetTrackingRun
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xc1ad43bc, sceSmartSceneMappingReset
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xc4c607c0, sceSmartTargetTrackingStop
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xc7ebd753, sceSmartSceneMappingRun
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xcb30bd4d, sceSmartSceneMappingRunCore
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xdf900b29, sceSmartSceneMappingGetNumInitializationPoints
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xe7867558, sceSmartSceneMappingSetDenseMapMode
PSP2_IMPORT_FUNC SceSmart, 0001, F00, 0xf10fddd1, sceSmartSceneMappingDispatchAndQuery
