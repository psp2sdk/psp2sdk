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

PREFIX = _SceFios2-0001_
ENTRIES_PREFIX = $(PREFIX)F00_

NIDS = 0x030306f4 0x057252f2 0x06d97629 0x0c81d80e 	\
	0x0df32816 0x125efd34 0x132b6de6 0x13efe5f0 	\
	0x156eafdc 0x157515cb 0x15857180 0x159b1fa8 	\
	0x1915052a 0x1b9a575e 0x1bc977fa 0x1c0bcad5 	\
	0x1c488b32 0x1e920b1d 0x1e962f57 0x1f3cc428 	\
	0x202079f9 0x218a43ee 0x22e35018 0x233b070c 	\
	0x25e399e5 0x267e6ce3 0x26d03e20 0x27ae468b 	\
	0x280d284a 0x2904b539 0x29104bf3 0x2ac79dfc 	\
	0x2b39453b 0x2b406deb 0x30583fcb 0x30f56704 	\
	0x34bc3713 0x35a82737 0x37143ae3 0x3904f205 	\
	0x397bf626 0x428e927d 0x42c278e5 0x44b9f8eb 	\
	0x45182328 0x48d50d97 0x4d42f95c 0x4e2fd311 	\
	0x510953dc 0x51e677df 0x5506acab 0x5b8d48c4 	\
	0x5ba4bd6d 0x5c593c1e 0x5cff6ea0 0x5e75937a 	\
	0x681184a2 0x68c436e4 0x6a51e688 0x6e1252b8 	\
	0x6ec156da 0x6f12d8a5 0x716bb121 0x726e01be 	\
	0x72a0a851 0x742addc4 0x764dfa7a 0x76945919 	\
	0x774c2c05 0x789215c3 0x79d9bb50 0x7c4e0c42 	\
	0x7c9b14eb 0x7db0afaf 0x7ff33797 0x8179ccfa 	\
	0x84080161 0x8758e62f 0x8a243e74 0x8b6cab52 	\
	0x8f62832c 0x90ab9195 0x9198ed8b 0x92e76bbd 	\
	0x94fdffee 0x968cadbd 0x984024e5 0x988dd7ff 	\
	0x9c1084c5 0xa2c610e6 0xa75f3c4a 0xa88edca8 	\
	0xa909cce3 0xaac54b44 0xabfee706 0xacbaf3e0 	\
	0xaf7faadf 0xb09afbdf 0xb26dc24d 0xb309e327 	\
	0xb5302e30 0xb647278b 0xb66a3dc8 0xb7e79cad 	\
	0xb9573146 0xbbc9afd5 0xbf099e16 0xbf2d3cc1 	\
	0xbf699bd4 0xc3e7c3db 0xc40600dd 0xc4822276 	\
	0xc5513e13 0xc55db73b 0xc5c26581 0xc781d7b4 	\
	0xc897f6a7 0xcc21c849 0xcc823b47 0xcd0e86d0 	\
	0xcf1faa6f 0xd0b19c9f 0xd2466ea5 0xd2cd9af2 	\
	0xd55b8555 0xd7f33130 0xd97c4df7 0xda93677c 	\
	0xddd6bf6b 0xdf3352fc 0xe037b076 0xe2805059 	\
	0xe438d4f0 0xe485f35e 0xe4ea92fa 0xe663138e 	\
	0xe6a66c70 0xe76c8ec3 0xea9855ba 0xee681e1d 	\
	0xf21213b9 0xf3c84d0f 0xf4c6b72a 0xf4f54e09 	\
	0xf6cacfc7 0xf85c208b 0xf8beac88 0xfe1e1d28 	\
	0xfef940b7 0xff04af72 

ENTRIES = $(addsuffix .o,$(addprefix $(ENTRIES_PREFIX),$(subst 0x,,$(NIDS))))

lib_LIBRARIES = libSceFios2_stub.a
libSceFios2_stub_a_SOURCES = SceFios2_stub.S 
am_libSceFios2_stub_a_OBJECTS =	\
	$(PREFIX)head.o $(PREFIX)NIDS.o $(ENTRIES)

$(PREFIX)head.o: $(libSceFios2_stub_a_SOURCES)
	$(COMPILE) -DHEAD $< -c -o $@

$(PREFIX)NIDS.o: $(libSceFios2_stub_a_SOURCES)
	$(COMPILE) -DNIDS $< -c -o $@

$(ENTRIES): $(libSceFios2_stub_a_SOURCES)
	$(COMPILE) -DFUNC=$(subst $(ENTRIES_PREFIX),0x,$*) $< -c -o $@