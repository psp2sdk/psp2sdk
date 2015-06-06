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

PREFIX = _ScePspnetAdhoc-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x02098b69 0x0291ef5b 0x051d8368 0x0a0423dd 	\
	0x0a4e32ef 0x1172398c 0x14552bb1 0x31f45b51 	\
	0x356aa25e 0x49af74ae 0x54ed636d 0x632edb11 	\
	0x6c0b4971 0x81498625 0x87805e13 0x8f683810 	\
	0x97a80065 0xa083bf7c 0xa40f17e0 0xad5f570d 	\
	0xb56238ba 0xb7b6a662 0xca249f53 0xd3230114 	\
	0xe2fe9dd6 0xe45f0801 0xf2ec12cd 0xfca965f6 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libScePspnetAdhoc_stub.a
libScePspnetAdhoc_stub_a_SOURCES = ScePspnetAdhoc_stub.S 
am_libScePspnetAdhoc_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libScePspnetAdhoc_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libScePspnetAdhoc_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libScePspnetAdhoc_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@