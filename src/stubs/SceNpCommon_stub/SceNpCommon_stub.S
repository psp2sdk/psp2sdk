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

PSP2_IMPORT_HEAD 0x0, SceNpCommon, 0001, 1, 0

PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0x14fc18af, sceNpAuthDestroyRequest
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0x3377cd37, sceNpAuthGetEntitlementIdList
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0x441d8b4e, sceNpAuthInit
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0x59608d1c, sceNpAuthGetTicket
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0x6093b689, sceNpAuthTerm
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0x6bc8150a, sceNpCmpNpIdInOrder
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0x8327c26f, sceNpCmpOnlineId
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0xc1e23e01, sceNpAuthGetTicketParam
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0xc8e51cca, sceNpAuthGetEntitlementByIdPrefix
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0xe2582575, sceNpAuthAbortRequest
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0xe807d0bc, sceNpSetPlatformType
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0xe9a003de, sceNpGetPlatformType
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0xed42079f, sceNpAuthCreateStartRequest
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0xf93842f0, sceNpAuthGetEntitlementById
PSP2_IMPORT_FUNC SceNpCommon, 0001, F00, 0xfb8d82e5, sceNpCmpNpId
