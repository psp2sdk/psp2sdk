# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceNetAdhocMatching-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x04ff010c 0x54f6534d 0x63abb632 0x659d4b04 	\
	0x6e195cd1 0x7bad7ea2 0x7bcdd889 0x83c0e435 	\
	0x85b23ceb 0x8e0e0eae 0x90affedd 0x9a6b1d0f 	\
	0xf13e17be 0xfe77831e

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNetAdhocMatching_stub.a
libSceNetAdhocMatching_stub_a_SOURCES = SceNetAdhocMatching_stub.S
am_libSceNetAdhocMatching_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNetAdhocMatching_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNetAdhocMatching_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNetAdhocMatching_stub_a_SOURCES)
	$(AM_V_CC)$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
