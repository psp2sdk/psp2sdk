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

PREFIX = _SceSas-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x007e63e6 0x011788be 0x0be8204d 0x1568017a 	\
	0x180c6824 0x18a5efa2 0x296a9910 0x2b4a207c 	\
	0x2b75f9bc 0x2bea45bc 0x2c36e150 0x2c48a08c 	\
	0x4314f0e9 0x449b5974 0x44ddb3c4 0x5207f9d2 	\
	0x55eddbfa 0x59c7a9df 0x5e42adab 0x7a4672b2 	\
	0x820d5f82 0xb0444e69 0xb1756efc 0xb6642276 	\
	0xbad546a0 0xbb7d6790 0xbd496983 0xc838db6f 	\
	0xcdf2ddd5 0xde6227b8 0xecce0db8 0xf1c63cb9 	\
	0xfd1a0cbf 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceSas_stub.a
libSceSas_stub_a_SOURCES = SceSas_stub.S 
am_libSceSas_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceSas_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceSas_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceSas_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@