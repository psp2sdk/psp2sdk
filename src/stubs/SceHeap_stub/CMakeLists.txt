# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x00be8fc3 0x76c5b003 0x9e6716ba 0xa130d00c
    0xa7571ad8 0xaa50462f 0xad2645b0 0xb6fc0ba1
    0xd09ffc11 0xd4c09869
)

set(SRCS
    SceHeap_stub.S
)

add_psp2_stub(SceHeap ${SRCS} ${NIDS})
