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

PREFIX = _SceNpBasic-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x050ae072 0x1211ae8e 0x20146aec 0x26e6e048 	\
	0x364531a8 0x389bcb3b 0x3b0a7f47 0x407e1e6f 	\
	0x5183a4b5 0x51d75562 0x7a5020a5 0xd20c2370 	\
	0xdf41f308 0xef8a91bc 0xefb91a99 0xf51545d8 	\
	0xfb0f7fdf 0xff07e787 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNpBasic_stub.a
libSceNpBasic_stub_a_SOURCES = SceNpBasic_stub.S 
am_libSceNpBasic_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNpBasic_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNpBasic_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNpBasic_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@