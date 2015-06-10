# Copyright (C) 2015 PSP2SDK Project
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

PREFIX = _SceNearUtil-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x06807ca3 0x146be236 0x2364d6bd 0x2ed36ee2 	\
	0x2f35c196 0x360d4a19 0x3f3f6d92 0x4cce6a14 	\
	0x52021026 0x6c2e610f 0x773abea9 0x80d6c552 	\
	0x88a68d20 0x8cbeb2da 0x8f3cc01c 0xa64d9d38 	\
	0xad264f5f 0xaef3022a 0xb14145dd 0xb22cb01d 	\
	0xbbca5813 0xd393578e 0xdb8bac35 0xde6f0859 	\
	0xe75a5a9b 0xefe6f060 0xf3398774 0xf8c15008 	\
	0xff3bc581 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNearUtil_stub.a
libSceNearUtil_stub_a_SOURCES = SceNearUtil_stub.S 
am_libSceNearUtil_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNearUtil_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNearUtil_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNearUtil_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@