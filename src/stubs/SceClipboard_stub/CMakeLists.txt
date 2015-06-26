# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x43a94d3e 0x5bb10cc2
)

set(SRCS
    SceClipboard_stub.S
)

add_psp2_stub(SceClipboard ${SRCS} ${NIDS})
