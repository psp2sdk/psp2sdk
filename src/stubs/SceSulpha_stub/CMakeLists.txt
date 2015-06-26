# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x0fc71b72 0x10770ba7 0x29f0da12 0x2a8b74d7
    0x324f158f 0x5c6815c6 0x5e15e164 0x7968a138
    0x7adb454d 0x920ec7bf 0x951d159d 0xa41b7402
    0xa6a05c50 0xb0c2b9ce 0xb16e7b88 0xb4668aea
    0xbc6a2833 0xbf61f3b8 0xc5752b6b 0xd44c9f86
    0xd52e5a5a 0xd5d995a9 0xde7e2911
)

set(SRCS
    SceSulpha_stub.S
)

add_psp2_stub(SceSulpha ${SRCS} ${NIDS})
