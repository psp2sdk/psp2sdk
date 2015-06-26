# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x23369abf 0x4a972dcd 0x86dde4a7 0xa1ce5628
    0xa9cf6616 0xdd4256f0
)

set(SRCS
    SceSfmt216091_stub.S
)

add_psp2_stub(SceSfmt216091 ${SRCS} ${NIDS})
