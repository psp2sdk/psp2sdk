@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNet, 0001, 1, 0

PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x023643b7, sceNetRecv
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x04042925, sceNetDumpRead
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x0424ae26, sceNetResolverStartAton
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x065505ca, sceNetSetsockopt
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x06c05518, sceNetGetMacAddress
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x07845128, sceNetNtohs
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x11e5b6f6, sceNetConnect
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x1296a94b, sceNetBind
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x12c19209, sceNetHtonll
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x138cf1d6, sceNetGetSockIdInfo
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x1adf9bb1, sceNetAccept
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x1c66a6db, sceNetGetsockname
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x1eb11857, sceNetResolverStartNtoa
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x2348d353, sceNetGetpeername
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x29822b4d, sceNetSocketClose
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x338edc2e, sceNetShowNetstat
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x3559f098, sceNetResolverDestroy
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x38ebbd57, sceNetResolverAbort
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x3b24e75f, sceNetDumpAbort
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x45ce337d, sceNetEpollWait
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x4c30b03c, sceNetHtonl
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x4c8764ac, sceNetEpollControl
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x52db31d5, sceNetSendto
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x658b903b, sceNetShowIfconfig
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x69e50bb5, sceNetShutdown
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x6ab3b74b, sceNetShowRoute
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x6da29319, sceNetResolverCreate
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x7915caf3, sceNetEpollDestroy
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x7a8da094, sceNetListen
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x82ddcf63, sceNetDumpDestroy
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x84334eb2, sceNetEtherNtostr
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x874ef500, sceNetResolverGetError
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x891c1b9b, sceNetSocketAbort
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x92d3e767, sceNetEpollWaitCB
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x93fcc4e8, sceNetEpollAbort
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x98839b74, sceNetInetNtop
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x99c579ae, sceNetSendmsg
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0x9fa3207b, sceNetHtons
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xa86f8fe5, sceNetGetStatisticsInfo
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xaff9fa4d, sceNetDumpCreate
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xb1af6840, sceNetGetSockInfo
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xb226138b, sceNetRecvfrom
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xba652062, sceNetGetsockopt
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xd2eaa645, sceNetNtohl
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xd5eeb048, sceNetInetPton
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xd62ef218, sceNetSetDnsInfo
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xde94c6fe, sceNetRecvmsg
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xe37f34aa, sceNetErrnoLoc
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xe3dd8cd9, sceNetSend
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xea3cc286, sceNetTerm
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xeb03e265, sceNetInit
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xeec6d75f, sceNetEtherStrton
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xf084fce3, sceNetSocket
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xf9d102ae, sceNetEpollCreate
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xfb3336a6, sceNetNtohll
PSP2_IMPORT_FUNC SceNet, 0001, F00, 0xfec1166d, sceNetClearDnsCache
