# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x04ff010c 0x54f6534d 0x63abb632 0x659d4b04
    0x6e195cd1 0x7bad7ea2 0x7bcdd889 0x83c0e435
    0x85b23ceb 0x8e0e0eae 0x90affedd 0x9a6b1d0f
    0xf13e17be 0xfe77831e
)

set(SRCS
    SceNetAdhocMatching_stub.S
)

add_psp2_stub(SceNetAdhocMatching ${SRCS} ${NIDS})
