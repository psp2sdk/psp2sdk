# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceFiber-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x189599b4 0x3b42921f 0x414d8ca5 0x4ec01f9c 	\
	0x67f70867 0x7d0c7ddb 0x7df23243 0x801ab334 	\
	0x9c414b09 0xc6a3f9bb 0xcd543a71 0xe00b9afe 	\
	0xe160f844 0xe4283144 0xf24a298c

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceFiber_stub.a
libSceFiber_stub_a_SOURCES = SceFiber_stub.S
am_libSceFiber_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceFiber_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceFiber_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceFiber_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
