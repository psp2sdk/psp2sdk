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

PREFIX = _SceSha-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x37ef2afc 0xbcf6db3a 0xbf0158c4 0xd19a9aa8	\
	0x0195dadf 0x9007205e 0xb13d65aa 0xe1215c9d	\
	0x1346d270 0x538f04ce 0xa36ecf65 0xb5fd0160	\
	0x9b5bb4ba 0xa337079c 0xdaeca1f8 0xe281374f	\
	0x037aabe7 0x30d5c919 0x4b99dbb8 0xa602c694	\
	0x00e52720 0x66425db6 0x79065bb2 0xc5359df8	\
	0x26146a16 0x5dc0b916 0x669281e8 0xe017a9cd

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceSha_stub.a
libSceSha_stub_a_SOURCES = SceSha_stub.S
am_libSceSha_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceSha_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceSha_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceSha_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@
