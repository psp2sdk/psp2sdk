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

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceNpManager, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x04d9f484, sceNpInit
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x19e40ae1, sceNpTerm
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x3b0ae9a9, sceNpCheckCallback
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x3c94b4b4, sceNpManagerGetNpId
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x43dc48a1, sceNpManagerGetCachedParam
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x44239c35, sceNpRegisterServiceStateCallback
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x54060df6, sceNpGetServiceState
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0x60c575b1, sceNpManagerGetChatRestrictionFlag
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0xaf0073b2, sceNpManagerGetContentRatingFlag
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0xd9e6e56c, sceNpUnregisterServiceStateCallback
PSP2_IMPORT_FUNC SceNpManager, 0001, F00, 0xfe835967, sceNpManagerGetAccountRegion
