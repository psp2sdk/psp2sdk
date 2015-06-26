# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x04f34bee 0x06a21bbb 0x06d3816c 0x06fb2900
    0x103a75b8 0x1175f477 0x12b6ff26 0x1dd9c9ce
    0x274ef751 0x2c36d6f3 0x3a0dabbd 0x3cf630a1
    0x3f26233e 0x44f6043f 0x4d4514ac 0x4ebd5c68
    0x5fa5b1bb 0x624f7653 0x62aff0b8 0x79b5c2de
    0x7e8ef3b2 0x85d5951d 0x8b5e6147 0x8dd1292b
    0x8fbe84be 0x98d71588 0x9fdacb99 0xa462f801
    0xa8feae35 0xaa72c3dc 0xae071044 0xcd6e1cfc
    0xd1a5bb0b 0xdbffa1da 0xe312958a 0xe65cfe86
    0xe9d2cfb1 0xf7464216 0xf9f7ca3d
)

set(SRCS
    SceCamera_stub.S
)

add_psp2_stub(SceCamera ${SRCS} ${NIDS})
