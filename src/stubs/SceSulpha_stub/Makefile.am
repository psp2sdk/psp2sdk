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

PREFIX = _SceSulpha-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0fc71b72 0x10770ba7 0x29f0da12 0x2a8b74d7 	\
	0x324f158f 0x5c6815c6 0x5e15e164 0x7968a138 	\
	0x7adb454d 0x920ec7bf 0x951d159d 0xa41b7402 	\
	0xa6a05c50 0xb0c2b9ce 0xb16e7b88 0xb4668aea 	\
	0xbc6a2833 0xbf61f3b8 0xc5752b6b 0xd44c9f86 	\
	0xd52e5a5a 0xd5d995a9 0xde7e2911 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceSulpha_stub.a
libSceSulpha_stub_a_SOURCES = SceSulpha_stub.S 
am_libSceSulpha_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceSulpha_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceSulpha_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceSulpha_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@