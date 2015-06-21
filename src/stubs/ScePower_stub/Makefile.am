# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _ScePower-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x04b7766e 0x1e490401 0x2085d15d 0x3ce187b6 	\
	0x78a1a796 0x87440f5e 0x8efb3fa2 0x94f5a53f 	\
	0xd3075926 0xdfa8baf8 0xfd18a0ff

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libScePower_stub.a
libScePower_stub_a_SOURCES = ScePower_stub.S
am_libScePower_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libScePower_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libScePower_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libScePower_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
