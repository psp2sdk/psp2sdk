@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceThreadmgr, 0001, 1, 0

PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x001173f8, sceKernelChangeActiveCpuMask
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x038644d5, sceKernelGetCallbackCount
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x03e23af6, sceKernelCloseMutex
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x0e1cb9f6, sceKernelOpenMsgPipe
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x1269f4ec, sceKernelSignalCondTo
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x1305a065, sceKernelCloseMsgPipe
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x15129174, sceKernelChangeThreadCpuAffinityMask
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x15c690e0, sceKernelCloseCond
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x18462b11, sceKernelUnregisterCallbackFromEvent
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x1a372ec8, sceKernelUnlockMutex
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x1bbde3d9, sceKernelDeleteThread
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x1d17decf, sceKernelExitDeleteThread
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x206cbb66, sceKernelTryLockWriteRWLock
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x208cfe28, sceKernelDeleteSimpleEvent
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x273b4a4d, sceKernelSetTimerTimeWide
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x30741ef2, sceKernelCancelCallback
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x324218cd, sceKernelSetEvent
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x3ef91145, sceKernelUnlockReadRWLock
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x3efd3165, sceKernelGetTimerTimeWide
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x48091e0c, sceKernelStartTimer
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x4b675d05, sceKernelDelayThread
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x4cb87ca7, sceKernelClearEventFlag
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x4e1e4df8, sceKernelOpenSimpleEvent
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x4f8a3da0, sceKernelGetThreadStackFreeSize
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x52e17182, sceKernelOpenMutex
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x5840162c, sceKernelDeleteEventFlag
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x5dbc1960, sceKernelGetTimerBaseWide
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x6ed2e2dc, sceKernelSignalCond
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x72fc1f54, sceKernelTryLockMutex
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x76bda02f, sceKernelOpenCond
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x76fb37e9, sceKernelRegisterCallbackToEvent
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x7b2a4b28, sceKernelClearEvent
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x866ef048, sceKernelPollSema
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x869e9f20, sceKernelStopTimer
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x879e6ebd, sceKernelDeleteCond
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x888a7361, sceKernelUnregisterCallbackFromEventAll
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x8d27bad6, sceKernelPulseEvent
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x9a68f547, sceKernelCloseEventFlag
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x9c0180e1, sceKernelDelayThreadCB
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0x9dcb4b7a, sceKernelGetProcessId
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xa2d81f9e, sceKernelCloseSema
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xa4683592, sceKernelNotifyCallback
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xab1e42c4, sceKernelDeleteTimer
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xace60e4a, sceKernelCloseTimer
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xb19cf7e9, sceKernelCreateCallback
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xb4151397, sceKernelUnlockWriteRWLock
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xb6e286e7, sceKernelOpenTimer
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xbc19f8a1, sceKernelOpenEventFlag
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xbd0139f2, sceKernelChangeThreadPriority
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xc0faf6a3, sceKernelCreateThreadForUser
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xc2e7ac22, sceKernelSignalCondAll
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xc9678f7f, sceKernelGetThreadmgrUIDClass
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xcb78710d, sceKernelDeleteMutex
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xcbe235c7, sceKernelOpenSema
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xcc18fbae, sceKernelChangeThreadVfpException
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xce510196, sceKernelOpenRWLock
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xd469676b, sceKernelDeleteCallback
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xd4c367b2, sceKernelSendSignal
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xd9bd74eb, sceKernelCheckWaitableStatus
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xdb32948a, sceKernelDeleteSema
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xe53e41f6, sceKernelCheckCallback
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xe6b761d1, sceKernelSignalSema
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xe73649ca, sceKernelDeleteRWLock
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xe78bccf7, sceKernelDeleteMsgPipe
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xec94dff7, sceKernelSetEventFlag
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xefdda456, sceKernelTryLockReadRWLock
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xfd5bd5c1, sceKernelCloseRWLock
PSP2_IMPORT_FUNC SceThreadmgr, 0001, F00, 0xfef4ca53, sceKernelCloseSimpleEvent
