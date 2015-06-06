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

PSP2_IMPORT_HEAD 0x0, sceNetEmulationGet, 0001, 1, 0

PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xaff9fa4d, ceNetDumpCreate
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xb1af6840, ceNetGetSockInfo
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xb226138b, ceNetRecvfrom
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xba652062, ceNetGetsockopt
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xd2eaa645, ceNetNtohl
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xd5eeb048, ceNetInetPton
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xd62ef218, ceNetSetDnsInfo
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xde94c6fe, ceNetRecvmsg
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xe37f34aa, ceNetErrnoLoc
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xe3dd8cd9, ceNetSend
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xea3cc286, ceNetTerm
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xeb03e265, ceNetInit
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xeec6d75f, ceNetEtherStrton
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xf084fce3, ceNetSocket
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xf9d102ae, ceNetEpollCreate
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xfb3336a6, ceNetNtohll
PSP2_IMPORT_FUNC sceNetEmulationGet, 0001, F00, 0xfec1166d, ceNetClearDnsCache
