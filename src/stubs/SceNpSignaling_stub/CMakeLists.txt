# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x0b48fadb 0x3b56e6c2 0x3ec1f4aa 0x4b6acf47
    0x5048e147 0x51883eae 0x5861e7ba 0x5d660c45
    0x6b9e6e3f 0x83b3da0a 0x92ffbde3 0x995a5a74
    0x9d1c5303 0xa413f8c2 0xbc892d18 0xde8536f0
    0xeaa4b1f3 0xf77ef683
)

set(SRCS
    SceNpSignaling_stub.S
)

add_psp2_stub(SceNpSignaling ${SRCS} ${NIDS})
