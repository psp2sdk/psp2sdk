# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceLocation-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x07d4dfe0 0x09c4f674 0x12d1f0ea 0x14fe76e8 	\
	0x15bc27c8 0x16f41ed0 0x188ce004 0x1e80199a 	\
	0x482622c6 0x4e9e5ed9 0x71503251 0x730ff842 	\
	0x8aaf3fbd 0x92e53f94 0xaa026b53 0xb1f55065 	\
	0xc895e567 0xdd271661 0xde0a9ea4 0xe3cbf875 	\
	0xed378700 0xff016c13

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceLocation_stub.a
libSceLocation_stub_a_SOURCES = SceLibLocation_stub.S
am_libSceLocation_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceLocation_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceLocation_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceLocation_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
