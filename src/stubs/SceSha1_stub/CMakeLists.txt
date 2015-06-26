# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x0195dadf 0x9007205e 0xb13d65aa 0xe1215c9d
)

set(SRCS
    SceSha1_stub.S
)

add_psp2_stub(SceSha1 ${SRCS} ${NIDS})
