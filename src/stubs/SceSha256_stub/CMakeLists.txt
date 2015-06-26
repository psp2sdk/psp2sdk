# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x9b5bb4ba 0xa337079c 0xdaeca1f8 0xe281374f
)

set(SRCS
    SceSha256_stub.S
)

add_psp2_stub(SceSha256 ${SRCS} ${NIDS})
