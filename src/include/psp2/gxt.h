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

#ifndef _PSP2_GXT_H_
#define _PSP2_GXT_H_

#include "gxm.h"

#ifdef __cplusplus
extern "C" {
#endif

int sceGxtInitTexture(const SceGxmTexture *texture, const ScePVoid data, SceUInt8* data, int flag);
const ScePVoid sceGxtGetDataAddress(const ScePVoid data);
const SceSize sceGxtGetDataSize(const ScePVoid data);

#ifdef __cplusplus
}
#endif

#endif /* _PSP2_GXT_H_ */
