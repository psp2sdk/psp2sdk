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

PREFIX = _ScePgf-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x03f10ec8 0x07ee1733 0x1055aba3 0x39b9aeff 	\
	0x4a7293e9 0x51061d87 0x6fd1ba65 0x70c86b3e 	\
	0x7b45e2d1 0x7d8cb13b 0x8d5b44df 0x8dfbae1b 	\
	0x9e38f4d6 0x9f842307 0xab034738 0xab45aad3 	\
	0xb23ed47c 0xbd2dfcff 0xd56dccea 0xde47674c 	\
	0xe260e740 0xeb589530 0xf9414fa2 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libScePgf_stub.a
libScePgf_stub_a_SOURCES = ScePgf_stub.S 
am_libScePgf_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libScePgf_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libScePgf_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libScePgf_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@