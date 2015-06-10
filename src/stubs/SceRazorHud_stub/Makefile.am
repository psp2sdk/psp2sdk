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

PREFIX = _SceRazorHud-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x29cefdaa 0x528aa4c7 0x6dfbac39 0x6fd64de6 	\
	0x73f83357 0x77f2f606 0x7a51f1a0 0xb46382fc 	\
	0xbcb790e9 0xbd360a69 0xbfeadb77 0xcc390860 	\
	0xdfd00bae 0xe3709b44 0xece363ef 0xf867efe1 	\
	0xfd290a17 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceRazorHud_stub.a
libSceRazorHud_stub_a_SOURCES = SceRazorHud_stub.S 
am_libSceRazorHud_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceRazorHud_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceRazorHud_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceRazorHud_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@