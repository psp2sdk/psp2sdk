# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x0635eb77 0x2c9da711 0x5d75df62 0xd2efaea1
)

set(SRCS
    SceCodecEnginePerf_stub.S
)

add_psp2_stub(SceCodecEnginePerf ${SRCS} ${NIDS})
