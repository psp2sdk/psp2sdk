# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x14fc18af 0x3377cd37 0x441d8b4e 0x59608d1c
    0x6093b689 0x6bc8150a 0x8327c26f 0xc1e23e01
    0xc8e51cca 0xe2582575 0xe807d0bc 0xe9a003de
    0xed42079f 0xf93842f0 0xfb8d82e5
)

set(SRCS
    SceNpCommon_stub.S
)

add_psp2_stub(SceNpCommon ${SRCS} ${NIDS})
