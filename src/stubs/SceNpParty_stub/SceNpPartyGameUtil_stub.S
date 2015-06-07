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

PSP2_IMPORT_HEAD 0x0, SceNpPartyGameUtil, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0x0560d9a1, sceNpPartyGetMemberInfo
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0x324c76f0, sceNpPartyRegisterHandler
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0x420c30e9, sceNpPartyGetMembers
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0x9f99adf7, sceNpPartyGetState
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0xb304962c, sceNpPartyInit
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0xb6132502, sceNpPartyCheckCallback
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0xf524ad2b, sceNpPartyTerm
PSP2_IMPORT_FUNC SceNpPartyGameUtil, 0001, F00, 0xfb200a6d, sceNpPartyGetMemberVoiceInfo
