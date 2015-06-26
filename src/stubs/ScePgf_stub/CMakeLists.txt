# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x03f10ec8 0x07ee1733 0x1055aba3 0x39b9aeff
    0x4a7293e9 0x51061d87 0x6fd1ba65 0x70c86b3e
    0x7b45e2d1 0x7d8cb13b 0x8d5b44df 0x8dfbae1b
    0x9e38f4d6 0x9f842307 0xab034738 0xab45aad3
    0xb23ed47c 0xbd2dfcff 0xd56dccea 0xde47674c
    0xe260e740 0xeb589530 0xf9414fa2
)

set(SRCS
    ScePgf_stub.S
)

add_psp2_stub(ScePgf ${SRCS} ${NIDS})
