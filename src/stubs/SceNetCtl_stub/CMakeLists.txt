# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x0961a561 0x495ca1db 0x4ddd6149 0x4fb4bea1
    0x6b20ec02 0x6d26ac68 0x7118c99d 0x77586c59
    0x7ae0ed19 0xa4471e10 0xb26d07f3 0xcd188648
    0xd0c3bf3f 0xda130450 0xdffc3ed4 0xeaee6185
    0xed43b79a 0xffa9d594
)

set(SRCS
    SceNetCtl_stub.S
)

add_psp2_stub(SceNetCtl ${SRCS} ${NIDS})
