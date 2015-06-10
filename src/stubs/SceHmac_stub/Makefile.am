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

PREFIX = _SceHmac-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x05ae1466 0x0c9fa657 0x272feffe 0x2ab46bb5 	\
	0x359ed31e 0x393ff6bc 0x55871d87 0x5a52150f 	\
	0x64219ff5 0x6eeb05d3 0x6ef06490 0x8fdfce5b 	\
	0x96ad3a67 0x9bccc484 0x9c3b4844 0x9cb7f0ef 	\
	0x9fd439e9 0xa2285a9a 0xb77629eb 0xb786f59f 	\
	0xba308cda 0xc16d8ab6 0xccb91784 0xd0af51c6 	\
	0xd44f6b32 0xd6e232cd 0xe254d9a1 0xeca83992 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceHmac_stub.a
libSceHmac_stub_a_SOURCES = SceHmac_stub.S 
am_libSceHmac_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceHmac_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceHmac_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceHmac_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@