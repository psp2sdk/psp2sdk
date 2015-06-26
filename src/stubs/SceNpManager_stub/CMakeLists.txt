# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x04d9f484 0x19e40ae1 0x3b0ae9a9 0x3c94b4b4
    0x43dc48a1 0x44239c35 0x54060df6 0x60c575b1
    0xaf0073b2 0xd9e6e56c 0xfe835967
)

set(SRCS
    SceNpManager_stub.S
)

add_psp2_stub(SceNpManager ${SRCS} ${NIDS})
