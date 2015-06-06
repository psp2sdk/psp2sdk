# Copyright (C) 2015 PSP2SDK Project
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License version 2.1 as published by the Free Software Foundation
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

PREFIX = _SceNpMatching2-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0124641c 0x1c60bc5b 0x20598618 0x33f7d5ae 	\
	0x368aa759 0x495d2b46 0x4e4c55bd 0x506454de 	\
	0x65c0feed 0x74eb6ce9 0x79310806 0x7b908d99 	\
	0x7bd39e50 0x818a9499 0x8f88ac7e 0xa8021394 	\
	0xadcd102c 0xadf578e1 0xbb2e7559 0xc086b560 	\
	0xc8b0c9ee 0xd48baf13 0xe0be0510 0xebb1fe74 	\
	0xf0cb1dd3 0xf2847e3b 0xf3a43c50 0xf486991b 	\
	0xf9e35566 0xfa51949b 0xfdc7b2c9 

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