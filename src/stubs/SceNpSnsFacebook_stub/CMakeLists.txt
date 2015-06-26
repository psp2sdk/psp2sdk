# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x32fb2721 0x80557aa0 0x9a87eee9 0x9cf1bc76
    0xa3c9041d 0xa537ff90 0xa71e6847
)

set(SRCS
    SceNpSnsFacebook_stub.S
)

add_psp2_stub(SceNpSnsFacebook ${SRCS} ${NIDS})
