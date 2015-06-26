# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x0c6a1da8 0x2260e8bb 0x23edfa9a 0x245ec28a
    0x2808c8cb 0x3159d38c 0x35344a8e 0x43df6d9c
    0x4907021f 0x4d9ea817 0x52eb57e4 0x55c37f31
    0x58979c84 0x5a121f6c 0x5a31446e 0x5a9ec64d
    0x607aacb5 0x648c7e15 0x6807ca97 0x6d4081d3
    0x6ee07829 0x7c4731e2 0x7fe71305 0x8acadd54
    0x8ae7354a 0x961367d3 0x9a578a29 0x9f30c12a
    0xa3a82b99 0xa4a155b5 0xa96b997b 0xb17057ea
    0xbfd87f61 0xc1ad43bc 0xc4c607c0 0xc7ebd753
    0xcb30bd4d 0xdf900b29 0xe7867558 0xf10fddd1
)

set(SRCS
    SceSmart_stub.S
)

add_psp2_stub(SceSmart ${SRCS} ${NIDS})
