# Copyright (C) 2015 PSP2SDK Project
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

PREFIX = _SceNpMatching2-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0124641c 0x11beffa8 0x1c60bc5b 0x1e70d5b5 	\
	0x20598618 0x28c643b7 0x33f7d5ae 0x368aa759 	\
	0x3c507d4a 0x495d2b46 0x4e3193d2 0x4e4c55bd 	\
	0x506454de 0x5be8b86f 0x65c0feed 0x6e48307f 	\
	0x74eb6ce9 0x78521326 0x79310806 0x7b908d99 	\
	0x7bd39e50 0x818a9499 0x86458025 0x86ced8af 	\
	0x86e7c97d 0x881f7428 0x8f88ac7e 0x9388a007 	\
	0x94784a8c 0xa8021394 0xadcd102c 0xadf578e1 	\
	0xb6e8c059 0xbb2e7559 0xc086b560 0xc61c79ee 	\
	0xc8b0c9ee 0xd22c4989 0xd3096c55 0xd48baf13 	\
	0xe0be0510 0xebb1fe74 0xf049bec1 0xf0cb1dd3 	\
	0xf2847e3b 0xf3a43c50 0xf486991b 0xf9e35566 	\
	0xfa51949b 0xfdc7b2c9

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpMatching2_stub.a
libSceNpMatching2_stub_a_SOURCES = SceNpMatching2_stub.S
am_libSceNpMatching2_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpMatching2_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpMatching2_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpMatching2_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
