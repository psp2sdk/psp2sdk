@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, sceNetEmulationSet, 0001, 1, 0

PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x658b903b, ceNetShowIfconfig
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x69e50bb5, ceNetShutdown
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x6ab3b74b, ceNetShowRoute
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x6da29319, ceNetResolverCreate
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x7915caf3, ceNetEpollDestroy
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x7a8da094, ceNetListen
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x82ddcf63, ceNetDumpDestroy
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x84334eb2, ceNetEtherNtostr
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x874ef500, ceNetResolverGetError
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x891c1b9b, ceNetSocketAbort
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x92d3e767, ceNetEpollWaitCB
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x93fcc4e8, ceNetEpollAbort
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x98839b74, ceNetInetNtop
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x99c579ae, ceNetSendmsg
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0x9fa3207b, ceNetHtons
PSP2_IMPORT_FUNC sceNetEmulationSet, 0001, F00, 0xa86f8fe5, ceNetGetStatisticsInfo
