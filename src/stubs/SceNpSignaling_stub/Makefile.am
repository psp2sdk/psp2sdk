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

PREFIX = _SceNpSignaling-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0b48fadb 0x3b56e6c2 0x3ec1f4aa 0x4b6acf47 	\
	0x5048e147 0x51883eae 0x5861e7ba 0x5d660c45 	\
	0x6b9e6e3f 0x83b3da0a 0x92ffbde3 0x995a5a74 	\
	0x9d1c5303 0xa413f8c2 0xbc892d18 0xde8536f0 	\
	0xeaa4b1f3 0xf77ef683 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpSignaling_stub.a
libSceNpSignaling_stub_a_SOURCES = SceNpSignaling_stub.S 
am_libSceNpSignaling_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpSignaling_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpSignaling_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpSignaling_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@