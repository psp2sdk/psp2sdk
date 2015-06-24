/**
 * \file
 * \brief Header file which defines GXT variables and functions
 *
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#ifndef _PSP2_GXT_
#define _PSP2_GXT_

#include "gxm.h"

int sceGxtInitTexture(const SceGxmTexture *texture, const ScePVoid data, SceUInt8* data, int flag);
const ScePVoid sceGxtGetDataAddress(const ScePVoid data);
const SceSize sceGxtGetDataSize(const ScePVoid data);

#endif
