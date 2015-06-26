# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x26146a16 0x5dc0b916 0x669281e8 0xe017a9cd
)

set(SRCS
    SceSha512_stub.S
)

add_psp2_stub(SceSha512 ${SRCS} ${NIDS})
