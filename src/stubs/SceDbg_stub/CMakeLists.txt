# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x1af3678b 0x3deaecd3 0x6605ab19 0x941622fa
    0xed4a00ba
)

set(SRCS
    SceDbg_stub.S
)

add_psp2_stub(SceDbg ${SRCS} ${NIDS})
