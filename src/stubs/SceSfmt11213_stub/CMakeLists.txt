# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

set(NIDS
    0x7a412a29 0x8ff464c9 0xafedd6e1 0xbaf5f058
    0xfb281cd7 0xfd696585
)

set(SRCS
    SceSfmt11213_stub.S
)

add_psp2_stub(SceSfmt11213 ${SRCS} ${NIDS})
