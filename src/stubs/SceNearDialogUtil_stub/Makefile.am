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

PREFIX = _SceNearDialogUtil-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x1265745d 0x1341672d 0x200d6143 0x28394cd7 	\
	0x294693cb 0x30c8b7a3 0x3289bf4a 0x44a0f2b7 	\
	0x44ea7fa3 0x486bebdb 0x52bbf4c5 0x61a68242 	\
	0x6dbc14b8 0x722e8b53 0x74e55a3b 0x7790bdb4 	\
	0x8cbd3bf9 0x8d32729e 0x9d6a7ad4 0xa3d52935 	\
	0xaf4740d1 0xb04b9676 0xbf1b4bb9 0xccb5ff48 	\
	0xd46e5257 0xd6ffc962 0xda56f2f1 0xdbefb12e 	\
	0xe2a90639 0xe493d3b8 0xeca38e35 0xf3fbffe9 	\
	0xf684c554 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceNearDialogUtil_stub.a
libSceNearDialogUtil_stub_a_SOURCES = SceNearDialogUtil_stub.S 
am_libSceNearDialogUtil_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceNearDialogUtil_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceNearDialogUtil_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceNearDialogUtil_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@