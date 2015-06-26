# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x189599b4 0x3b42921f 0x414d8ca5 0x4ec01f9c
    0x67f70867 0x7d0c7ddb 0x7df23243 0x801ab334
    0x9c414b09 0xc6a3f9bb 0xcd543a71 0xe00b9afe
    0xe160f844 0xe4283144 0xf24a298c
)

set(SRCS
    SceFiber_stub.S
)

add_psp2_stub(SceFiber ${SRCS} ${NIDS})
