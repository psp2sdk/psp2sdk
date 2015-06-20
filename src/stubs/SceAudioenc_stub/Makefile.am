# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceAudioenc-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x452246d0 0x552e8882 0x64c04ae8 0x76ee4dc6 	\
	0x9386f42d 0x9b1e8de2 0xab32d022 0xc6ba5ee6 	\
	0xd01c63a3 0xd85db29c 0xead4af38

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceAudioenc_stub.a
libSceAudioenc_stub_a_SOURCES = SceAudioencUser_stub.S
am_libSceAudioenc_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceAudioenc_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceAudioenc_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceAudioenc_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
