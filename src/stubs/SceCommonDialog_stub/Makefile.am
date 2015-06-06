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

PREFIX = _SceCommonDialog-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x013e7f74 0x032206d8 0x0cc66115 0x19192c8b 	\
	0x1e7043bf 0x2192a10a 0x2d8edf09 0x2eb3d046 	\
	0x4107019e 0x415d6068 0x4b125581 0x594a220e 	\
	0x5c322d1e 0x6c49924b 0x6e258046 0x73ee7c9c 	\
	0x74ff2a8b 0x755ff270 0x7be0e08b 0x7fe5bd77 	\
	0x8027292a 0x81acf695 0x838a3af4 0x8be51c15 	\
	0x90530f2f 0x9cda5e0d 0xa38a4a0d 0xb05fce9e 	\
	0xb2ff576e 0xba0542ca 0xbb3bfc89 0xbde00a83 	\
	0xbf5248fa 0xc296d396 0xc700b2df 0xcd990375 	\
	0xcf0431fd 0xd855414c 0xf4f600ca 0xffa35858 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceCommonDialog_stub.a
libSceCommonDialog_stub_a_SOURCES = SceCommonDialog_stub.S 
am_libSceCommonDialog_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceCommonDialog_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceCommonDialog_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceCommonDialog_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@