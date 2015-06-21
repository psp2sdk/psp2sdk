@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceLibRudp, 0001, 1, 0

PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x104e4d3b, sceRudpGetRemoteInfo
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x18668bd8, sceRudpPollControl
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x22c9aa29, sceRudpInit
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x24e36e39, sceRudpProcessEvents
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x2c1e736e, sceRudpNetReceived
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x30a9438e, sceRudpRead
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x396a24d6, sceRudpSetEventHandler
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x3a495e69, sceRudpEnableInternalIOThread
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x3ea0961e, sceRudpEnd
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x46b635bd, sceRudpInitiate
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x4dc43692, sceRudpGetLocalInfo
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x552b2d3e, sceRudpTerminate
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x55918c7c, sceRudpPollWait
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x5d0460cd, sceRudpGetNumberOfPacketsToRead
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x68a52861, sceRudpGetMaxSegmentSize
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x69c9de15, sceRudpWrite
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x6b74ca22, sceRudpGetSizeReadable
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x772c07e8, sceRudpCreateContext
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x8b766108, sceRudpBind
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x8d45ba52, sceRudpFlush
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0x943d96ec, sceRudpPollCreate
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0xa9b92efe, sceRudpPollCancel
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0xade196dc, sceRudpGetSizeWritable
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0xbd87a5ca, sceRudpSetOption
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0xc9acbdf0, sceRudpPollDestroy
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0xd620b557, sceRudpGetContextStatus
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0xd77928c5, sceRudpGetStatus
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0xe1dd9645, sceRudpSetMaxSegmentSize
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0xe68005e3, sceRudpGetOption
PSP2_IMPORT_FUNC SceLibRudp, 0001, F00, 0xf1151d91, sceRudpActivate
