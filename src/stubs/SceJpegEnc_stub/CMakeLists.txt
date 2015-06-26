# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x25d52d97 0x2b55844d 0x2e8fe45d 0x2f58b12c
    0x824a7d4f 0x88da92b4 0x9511f3bc 0xb2b828ec
    0xc60de94c 0xc87aa849
)

set(SRCS
    SceJpegEncUser_stub.S
)

add_psp2_stub(SceJpegEnc ${SRCS} ${NIDS})
