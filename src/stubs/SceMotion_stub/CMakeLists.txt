# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x047f060a 0x0fd2cda2 0x112e0eae 0x122a79f8
    0x20f00078 0x28034ac9 0x3d4813ae 0x47d679ea
    0x499b6c87 0x4f28bfe0 0x917ea390 0xa4a7e6e2
    0xaf09fcdb 0xaf32cb1d 0xbdb32767 0xc1652201
    0xc1a7395a 0xdacb2a41 0xe8a28da5
)

set(SRCS
    SceMotion_stub.S
)

add_psp2_stub(SceMotion ${SRCS} ${NIDS})
