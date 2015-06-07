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

PSP2_IMPORT_HEAD 0x0, ScePower, 0001, 1, 0

PSP2_IMPORT_FUNC ScePower, 0001, F00, 0x04b7766e, scePowerRegisterCallback
PSP2_IMPORT_FUNC ScePower, 0001, F00, 0x1e490401, scePowerIsBatteryCharging
PSP2_IMPORT_FUNC ScePower, 0001, F00, 0x2085d15d, scePowerGetBatteryLifePercent
PSP2_IMPORT_FUNC ScePower, 0001, F00, 0x3ce187b6, scePowerSetConfigurationMode
PSP2_IMPORT_FUNC ScePower, 0001, F00, 0x78a1a796, scePowerIsSuspendRequired
PSP2_IMPORT_FUNC ScePower, 0001, F00, 0x87440f5e, scePowerIsPowerOnline
PSP2_IMPORT_FUNC ScePower, 0001, F00, 0x8efb3fa2, scePowerGetBatteryLifeTime
PSP2_IMPORT_FUNC ScePower, 0001, F00, 0x94f5a53f, scePowerGetBatteryRemainCapacity
PSP2_IMPORT_FUNC ScePower, 0001, F00, 0xd3075926, scePowerIsLowBattery
PSP2_IMPORT_FUNC ScePower, 0001, F00, 0xdfa8baf8, scePowerUnregisterCallback
PSP2_IMPORT_FUNC ScePower, 0001, F00, 0xfd18a0ff, scePowerGetBatteryFullCapacity
