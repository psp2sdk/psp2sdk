@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceUlt, 0001, 1, 0

PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x001eac8a, sceUltMutexLock
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x04dc59f2, sceUltGetWaitingQueueResourcePoolInfo
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x0603fcc1, _sceUltConditionVariableOptParamInitialize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x10b3fb76, sceUltGetReaderWriterLockInfo
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x1470318d, sceUltGetQueueInfo
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x14da1bb4, _sceUltQueueCreate
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x1ad58a53, sceUltQueuePop
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x1e401df8, sceUltUlthreadExit
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x218d4743, sceUltReaderWriterLockUnlockRead
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x24d87e05, _sceUltMutexOptParamInitialize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x25fe84f3, sceUltGetSemaphoreInfo
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x2629c055, sceUltReaderWriterLockTryLockRead
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x2a1a8ea6, sceUltQueueTryPop
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x2a5741f5, sceUltReaderWriterLockUnlockWrite
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x2b8d33f1, sceUltQueueDataResourcePoolDestroy
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x2cd0f57c, sceUltConditionVariableWait
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x2fb0eb32, _sceUltReaderWriterLockCreate
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x40856827, _sceUltQueueDataResourcePoolCreate
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x4e9a745c, sceUltUlthreadRuntimeDestroy
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x4f6a7da6, sceUltGetUlthreadRuntimeInfo
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x53420ed2, sceUltConditionVariableDestroy
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x5435c586, sceUltUlthreadRuntimeGetWorkAreaSize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x58d8dde6, sceUltGetMutexInfo
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x5afec7a1, _sceUltMutexCreate
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x62f9493e, _sceUltWaitingQueueResourcePoolCreate
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x63483381, sceUltUlthreadJoin
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x644da029, sceUltWaitingQueueResourcePoolGetWorkAreaSize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x65376e2d, sceUltSemaphoreRelease
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x6d356b29, sceUltQueueTryPush
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x750e7962, sceUltGetQueueDataResourcePoolInfo
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x7f373376, _sceUltUlthreadOptParamInitialize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x8486dde6, _sceUltUlthreadRuntimeOptParamInitialize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x86dda3ae, _sceUltUlthreadRuntimeCreate
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x897c9097, sceUltMutexUnlock
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x8a4f88a2, _sceUltQueueDataResourcePoolOptParamInitialize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x8e31b9fe, _sceUltSemaphoreOptParamInitialize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x8ec57420, sceUltSemaphoreDestroy
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x944fb222, sceUltReaderWriterLockTryLockWrite
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x9ad07630, sceUltReaderWriterLockLockRead
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0x9fe7cb9f, sceUltConditionVariableSignal
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xa798c5d7, sceUltUlthreadGetSelf
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xa7e78ff9, sceUltQueuePush
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xaf15606d, sceUltSemaphoreTryAcquire
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xb1290375, _sceUltUlthreadCreate
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xb1feb79b, sceUltReaderWriterLockDestroy
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xb4cf88ac, sceUltUlthreadTryJoin
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xb5895640, sceUltGetUlthreadInfo
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xc7aa4779, sceUltGetConditionVariableInfo
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xc9e96714, sceUltWaitingQueueResourcePoolDestroy
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xcad57bad, sceUltUlthreadYield
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xd76a156c, _sceUltConditionVariableCreate
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xd8334a1f, _sceUltReaderWriterLockOptParamInitialize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xdd59562c, _sceUltSemaphoreCreate
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xe5936a69, sceUltMutexTryLock
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xebb6fc1e, sceUltConditionVariableSignalAll
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xecda7fee, sceUltQueueDataResourcePoolGetWorkAreaSize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xeebd9052, sceUltMutexDestroy
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xef094e35, _sceUltWaitingQueueResourcePoolOptParamInitialize
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xf220d3ae, sceUltSemaphoreAcquire
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xf37862de, sceUltQueueDestroy
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xf5f63e2c, sceUltReaderWriterLockLockWrite
PSP2_IMPORT_FUNC SceUlt, 0001, F00, 0xf7a83023, _sceUltQueueOptParamInitialize
