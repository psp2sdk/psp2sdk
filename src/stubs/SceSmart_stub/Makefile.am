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

PREFIX = _SceSmart-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x0c6a1da8 0x2260e8bb 0x23edfa9a 0x245ec28a 	\
	0x2808c8cb 0x3159d38c 0x35344a8e 0x43df6d9c 	\
	0x4907021f 0x4d9ea817 0x52eb57e4 0x55c37f31 	\
	0x58979c84 0x5a121f6c 0x5a31446e 0x5a9ec64d 	\
	0x607aacb5 0x648c7e15 0x6807ca97 0x6d4081d3 	\
	0x6ee07829 0x7c4731e2 0x7fe71305 0x8acadd54 	\
	0x8ae7354a 0x961367d3 0x9a578a29 0x9f30c12a 	\
	0xa3a82b99 0xa4a155b5 0xa96b997b 0xb17057ea 	\
	0xbfd87f61 0xc1ad43bc 0xc4c607c0 0xc7ebd753 	\
	0xcb30bd4d 0xdf900b29 0xe7867558 0xf10fddd1 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceSmart_stub.a
libSceSmart_stub_a_SOURCES = SceSmart_stub.S 
am_libSceSmart_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceSmart_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceSmart_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceSmart_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@