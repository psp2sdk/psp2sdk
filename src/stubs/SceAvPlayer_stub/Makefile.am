# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceAvPlayer-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x11ff162d 0x15365ece 0x22986cd1 0x2acb4217 	\
	0x2cd86fd6 0x2e4ff35f 0x34e2d370 0x34fd744b 	\
	0x3f51d38a 0x4c847adf 0x5b7db4bc 0x70127ab8 	\
	0x7aa29b2d 0x804dcecd 0x86e0cf55 0x8bc3221b 	\
	0xa10fc252 0xbc83c8fd 0xbd35e360 0xec103adf

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceAvPlayer_stub.a
libSceAvPlayer_stub_a_SOURCES = SceAvPlayer_stub.S
am_libSceAvPlayer_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceAvPlayer_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceAvPlayer_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceAvPlayer_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
