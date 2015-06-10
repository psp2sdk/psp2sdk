@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software: you can redistribute it and/or modify
@ it under the terms of the GNU Lesser General Public License as published by
@ the Free Software Foundation, either version 3 of the License, or
@ (at your option) any later version.
@
@ This libary is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@ GNU Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public License
@ along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceFpu, 0001, 1, 0

PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0x19881ec8, sceFpuLog2f
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0x33e1ac14, sceFpuSinf
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0x35652326, sceFpuExp10f
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0x4d1ae0f1, sceFpuAsinf
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0x53ff26af, sceFpuAtanf
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0x64a8f9fe, sceFpuAcosf
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0x6fbda1c9, sceFpuTanf
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0x936f0d27, sceFpuLogf
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0xa3a88ad0, sceFpuExp2f
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0xabbb6168, sceFpuLog10f
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0xc8a4989b, sceFpuAtan2f
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0xdb66ba89, sceFpuCosf
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0xdf622e56, sceFpuPowf
PSP2_IMPORT_FUNC SceFpu, 0001, F00, 0xefa16c6e, sceFpuExpf
