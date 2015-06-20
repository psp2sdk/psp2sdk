# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceRazorCapture-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x3d4b7e68 0x3f0913cf 0x472492da 0x6a09822d 	\
	0x8ee74eb7 0x911e0aa0 0x9daa7e9c 0xd2358bfb 	\
	0xdfbdcc4c 0xe916b538

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceRazorCapture_stub.a
libSceRazorCapture_stub_a_SOURCES = SceRazorCapture_stub.S
am_libSceRazorCapture_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceRazorCapture_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceRazorCapture_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceRazorCapture_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
