# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x413c420e 0x63f0c4f5 0x761062e9 0xa47807d7
    0xb8232491 0xf2c9207a
)

set(SRCS
    SceDTrace_stub.S
)

add_psp2_stub(SceDTrace ${SRCS} ${NIDS})
