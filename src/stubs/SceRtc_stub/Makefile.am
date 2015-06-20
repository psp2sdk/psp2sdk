# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceRtc-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0572eddc 0x0a05e201 0x1282c436 0x147f2138 	\
	0x2347ce12 0x23f79274 0x2d18aeec 0x2f3531eb 	\
	0x3a332f81 0x42ca8eb5 0x4559e2db 0x49eb4556 	\
	0x4c358871 0x58de3c70 0x6321b4aa 0x6f193f55 	\
	0x70fde8f1 0x742250a9 0x811313b3 0x8148e95c 	\
	0x8a95e119 0x8de6feb7 0x92abebaf 0x979afd79 	\
	0xa6c36b6a 0xa79a8846 0xa8c16615 0xae26d920 	\
	0xb5c4e95f 0xc7385158 0xc995de02 0xccea2b54 	\
	0xcd89f464 0xcddd25fe 0xd7622935 0xdf6c3e1b 	\
	0xe713c640 0xf17fd8b5 0xf2b238e2 0xf8b22b07 	\
	0x258be8ec

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceRtc_stub.a
libSceRtc_stub_a_SOURCES = SceRtcUser_stub.S SceRtc_stub.S
am_libSceRtc_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceRtc_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceRtc_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceRtc_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
