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

PREFIX = _SceHttp-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x00659635 0x03a6c89e 0x07d9f8bb 0x0f1fd1b3 	\
	0x11c03867 0x11ec42d0 0x11f6c27f 0x1274d318 	\
	0x179c56db 0x1b6ef66e 0x1d45f24e 0x1da2a673 	\
	0x214926d9 0x237ca86e 0x27071691 0x27a98bda 	\
	0x2b79bde0 0x34891c3f 0x37c30c90 0x3d3d29ad 	\
	0x4259fb9e 0x47664424 0x4e08167d 0x50737a3f 	\
	0x56c95d94 0x5ceb6554 0x5eb5f548 0x62241dab 	\
	0x65fe983f 0x6727874c 0x6ead73eb 0x70220bfa 	\
	0x72cb0741 0x75027d1d 0x7b51b122 0x7c99af67 	\
	0x7ede3979 0x8455b5b3 0x8577833f 0x8ae3f008 	\
	0x94bf196e 0x94f7256a 0x9ab56ea7 0x9ca58b99 	\
	0x9df48282 0x9e031d7c 0x9fbe2869 0xa0926037 	\
	0xae8d7c33 0xaeb3307e 0xaee573a3 0xb0284270 	\
	0xbd5da1d0 0xbedb988d 0xc616c200 0xc6d60403 	\
	0xc9076666 0xcfb1da4b 0xd4f32a23 0xd65746bc 	\
	0xe0a3a88d 0xea61662f 0xec85ecfb 0xf0f65c15 	\
	0xf580d304 0xf71aa58d 0xf98cdfa9 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceHttp_stub.a
libSceHttp_stub_a_SOURCES = SceHttp_stub.S 
am_libSceHttp_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceHttp_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceHttp_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceHttp_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@