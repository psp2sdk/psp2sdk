# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x3d4b7e68 0x3f0913cf 0x472492da 0x6a09822d
    0x8ee74eb7 0x911e0aa0 0x9daa7e9c 0xd2358bfb
    0xdfbdcc4c 0xe916b538
)

set(SRCS
    SceRazorCapture_stub.S
)

add_psp2_stub(SceRazorCapture ${SRCS} ${NIDS})
