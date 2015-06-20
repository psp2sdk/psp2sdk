# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceDisplay-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x42ae6bbc 0x7a410b64 0x05f27764 0x3e796ef5 	\
	0x5795e898 0x6bdf4c4d 0x78b41b92 0x7d9864a8 	\
	0x814c90af 0x9423560c 0x98436a80 0xa08ca60d 	\
	0xb6fde0ba 0xdd0a13b8

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceDisplay_stub.a
libSceDisplay_stub_a_SOURCES = SceDisplayUser_stub.S SceDisplay_stub.S
am_libSceDisplay_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceDisplay_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceDisplay_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceDisplay_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
