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
