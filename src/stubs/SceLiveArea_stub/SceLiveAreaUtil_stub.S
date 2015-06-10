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

PSP2_IMPORT_HEAD 0x0, SceLiveAreaUtil, 0001, 1, 0

PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0x18066ba9, sceLiveAreaReplaceAllAsync
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0x29c65c0b, sceLiveAreaReplaceAllSync
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0x7fe5b83f, sceLiveAreaGetStatus
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0x833f5d0a, sceLiveAreaGetRevision
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0xcfcede95, sceLiveAreaUpdateFrameSync
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0xd330285d, sceLiveAreaUpdateFrameAsync
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0xd6ee2214, sceLiveAreaGetFrameRevision
PSP2_IMPORT_FUNC SceLiveAreaUtil, 0001, F00, 0xd6fd367f, sceLiveAreaGetFrameUserData
