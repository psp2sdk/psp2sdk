@ Copyright (C) 2015 PSP2SDK Project
@
@ This Source Code Form is subject to the terms of the Mozilla Public
@ License, v. 2.0. If a copy of the MPL was not distributed with this
@ file, You can obtain one at http://mozilla.org/MPL/2.0/.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceLibLocationExtension, 0001, 1, 0

PSP2_IMPORT_FUNC SceLibLocationExtension, 0001, F00, 0x277da915, sceLocationQueryLocationWifiHistory
PSP2_IMPORT_FUNC SceLibLocationExtension, 0001, F00, 0x46d2f044, sceLocationCancelQueryLocationWifiHistory
PSP2_IMPORT_FUNC SceLibLocationExtension, 0001, F00, 0x82de9bf8, sceLocationGetLocationWifiHistory
