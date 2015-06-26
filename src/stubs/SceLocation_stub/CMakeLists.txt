# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x07d4dfe0 0x09c4f674 0x12d1f0ea 0x14fe76e8
    0x15bc27c8 0x16f41ed0 0x188ce004 0x1e80199a
    0x482622c6 0x4e9e5ed9 0x71503251 0x730ff842
    0x8aaf3fbd 0x92e53f94 0xaa026b53 0xb1f55065
    0xc895e567 0xdd271661 0xde0a9ea4 0xe3cbf875
    0xed378700 0xff016c13
)

set(SRCS
    SceLibLocation_stub.S
)

add_psp2_stub(SceLocation ${SRCS} ${NIDS})
