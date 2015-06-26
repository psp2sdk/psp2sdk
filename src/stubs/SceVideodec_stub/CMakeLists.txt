# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x0eb2e4e7 0x17c6ac9e 0x230a78ff 0x25f31020
    0x3a5f4924 0x441673e3 0x624664db 0x6731bb2d
    0x7c460d75 0x87cfd23b 0x8a0e359e 0x9648d853
    0x97e95edb 0xa8cf1942 0xb2a428db 0xb4bc325b
    0xc300bf46 0xc67c1a80 0xd6190a06 0xe82bb69b
    0xf1af65a3
)

set(SRCS
    SceVideodecUser_stub.S
)

add_psp2_stub(SceVideodec ${SRCS} ${NIDS})
