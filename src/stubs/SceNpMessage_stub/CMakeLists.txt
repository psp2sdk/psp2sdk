# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x1dbd26d2 0x258da4ac 0x26af5306 0x35be21c5
    0x380230a1 0x514a4320 0x70116381 0x707b26c2
    0x7e697f98 0xc86b6da7 0xf533a73a
)

set(SRCS
    SceNpMessage_stub.S
)

add_psp2_stub(SceNpMessage ${SRCS} ${NIDS})
