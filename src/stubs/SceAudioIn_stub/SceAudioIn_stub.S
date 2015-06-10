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

PSP2_IMPORT_HEAD 0x0, SceAudioIn, 0001, 1, 0

PSP2_IMPORT_FUNC SceAudioIn, 0001, F00, 0x2f940377, sceAudioInGetStatus
PSP2_IMPORT_FUNC SceAudioIn, 0001, F00, 0x39b50dc1, sceAudioInOpenPort
PSP2_IMPORT_FUNC SceAudioIn, 0001, F00, 0x3a61b8c4, sceAudioInReleasePort
PSP2_IMPORT_FUNC SceAudioIn, 0001, F00, 0x566ac433, sceAudioInGetAdopt
PSP2_IMPORT_FUNC SceAudioIn, 0001, F00, 0x638add2d, sceAudioInInput
