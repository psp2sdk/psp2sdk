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

PREFIX = _SceAppUtil-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0f4ee55f 0x1b36af8c 0x22297d59 0x266a7646 	\
	0x28c7d4f6 0x2af42d6a 0x2db7be3b 0x3424d772 	\
	0x4faad133 0x53b2c020 0x5dfb9ca0 0x607647ba 	\
	0x6a140498 0x6bed9b58 0x6e6aa267 0x7402c6ea 	\
	0x77380601 0x7e8fe96a 0x85fa94ee 0x8dee696b 	\
	0x8ed716f5 0x93f0d89f 0x9651b941 0x96f478d6 	\
	0x98630136 0x9942071d 0x9d8ac677 0xa2496814 	\
	0xa7fe1bf7 0xb220b00b 0xb5edcbff 0xc560e716 	\
	0xc97d5d9e 0xcd7fd67a 0xd1c6ab8e 0xdaffe671 	\
	0xe6057a85 0xe61453b0 0xeb720402 0xee0dbed9 	\
	0xee85804d 0xf19d0423 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceAppUtil_stub.a
libSceAppUtil_stub_a_SOURCES = SceAppUtil_stub.S 
am_libSceAppUtil_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceAppUtil_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceAppUtil_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceAppUtil_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@