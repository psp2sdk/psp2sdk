@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

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
