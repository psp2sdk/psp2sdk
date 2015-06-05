@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software; you can redistribute it and/or
@ modify it under the terms of the GNU Lesser General Public
@ License as published by the Free Software Foundation; either
@ version 2.1 of the License.
@
@ This library is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
@ Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public
@ License along with this library; if not, write to the Free Software
@ Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

#include <psp2import.S>

PSP2_IMPORT_HEAD 0x0, sceAudio, 0001, 1, 0

PSP2_IMPORT_FUNC sceAudio, 0001, F00, 0x02db3f5f, sceAudioOutOutput
PSP2_IMPORT_FUNC sceAudio, 0001, F00, 0x12fb1767, sceAudioOutGetAdopt
PSP2_IMPORT_FUNC sceAudio, 0001, F00, 0x5bc341e4, sceAudioOutOpenPort
PSP2_IMPORT_FUNC sceAudio, 0001, F00, 0x64167f11, sceAudioOutSetVolume
PSP2_IMPORT_FUNC sceAudio, 0001, F00, 0x69e2e6b5, sceAudioOutReleasePort
PSP2_IMPORT_FUNC sceAudio, 0001, F00, 0x940ce469, sceAudioOutSetAlcMode
PSP2_IMPORT_FUNC sceAudio, 0001, F00, 0x9a5370c4, sceAudioOutGetRestSample
PSP2_IMPORT_FUNC sceAudio, 0001, F00, 0x9c8edaea, sceAudioOutGetConfig
PSP2_IMPORT_FUNC sceAudio, 0001, F00, 0xb8ba0d07, sceAudioOutSetConfig