# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x037aabe7 0x30d5c919 0x4b99dbb8 0xa602c694
)

set(SRCS
    SceSha384_stub.S
)

add_psp2_stub(SceSha384 ${SRCS} ${NIDS})
