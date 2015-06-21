@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, ScePspnetAdhoc, 0001, 1, 0

PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x02098b69, sceNetAdhocGetPdpStat
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x0291ef5b, sceNetAdhocPtpRecv
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x051d8368, sceNetAdhocctlGetParameter
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x0a0423dd, sceNetAdhocPtpAccept
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x0a4e32ef, sceNetAdhocPtpSend
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x1172398c, sceNetAdhocPdpRecv
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x14552bb1, sceNetAdhocctlGetPeerInfo
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x31f45b51, sceNetAdhocSetSocketAlert
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x356aa25e, sceNetAdhocctlGetPeerList
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x49af74ae, sceNetAdhocctlGetAdhocId
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x54ed636d, sceNetAdhocPollSocket
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x632edb11, sceNetAdhocPtpConnect
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x6c0b4971, sceNetAdhocTerm
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x81498625, sceNetAdhocPtpOpen
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x87805e13, sceNetAdhocInit
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x8f683810, sceNetAdhocPtpListen
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0x97a80065, sceNetAdhocctlTerm
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xa083bf7c, sceNetAdhocPtpClose
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xa40f17e0, sceNetAdhocctlGetEtherAddr
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xad5f570d, sceNetAdhocPtpFlush
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xb56238ba, sceNetAdhocPdpSend
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xb7b6a662, sceNetAdhocPdpDelete
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xca249f53, sceNetAdhocGetSocketAlert
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xd3230114, sceNetAdhocctlGetAddrByName
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xe2fe9dd6, sceNetAdhocctlInit
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xe45f0801, sceNetAdhocGetPtpStat
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xf2ec12cd, sceNetAdhocPdpCreate
PSP2_IMPORT_FUNC ScePspnetAdhoc, 0001, F00, 0xfca965f6, sceNetAdhocctlGetNameByAddr
