# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x110d5050 0x14a0698d 0x1b8e5862 0x25b8c7a2
    0x4c0a685d 0xaebaabe6 0xbabcf5cf 0xcd83a464
    0xda404fe4 0xdedadc31 0xe1844802 0xe38f754d
    0xe3cb51a3 0xe680a65a 0xf720a8f6
)

set(SRCS
    SceDeflt_stub.S
)

add_psp2_stub(SceDeflt ${SRCS} ${NIDS})
