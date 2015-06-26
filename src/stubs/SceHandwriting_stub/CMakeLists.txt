# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x09af9bf8 0x12e4f99a 0x356b2931 0x446f171e
    0x4c3a8d49 0x69324689 0x6abbd675 0x6ba4a521
    0x76395d93 0x79ca5d3f 0xb886450e
)

set(SRCS
    SceHandwriting_stub.S
)

add_psp2_stub(SceHandwriting ${SRCS} ${NIDS})
