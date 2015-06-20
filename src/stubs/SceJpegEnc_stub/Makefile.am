# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceJpegEnc-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x25d52d97 0x2b55844d 0x2e8fe45d 0x2f58b12c 	\
	0x824a7d4f 0x88da92b4 0x9511f3bc 0xb2b828ec 	\
	0xc60de94c 0xc87aa849

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceJpegEnc_stub.a
libSceJpegEnc_stub_a_SOURCES = SceJpegEncUser_stub.S
am_libSceJpegEnc_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceJpegEnc_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceJpegEnc_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceJpegEnc_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
