@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software: you can redistribute it and/or modify
@ it under the terms of the GNU Lesser General Public License as published by
@ the Free Software Foundation, either version 3 of the License, or
@ (at your option) any later version.
@
@ This library is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@ GNU Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public License
@ along with this program.  If not, see <http://www.gnu.org/licenses/>.

.macro PSP2_IMPORT_HEAD nid, name, num, ver, pkgVer
#ifdef HEAD
	.section .sce_libgen_mark
	.align	2
	.global	_\name\()_\num\()_stub_head
_\name\()_\num\()_stub_head:
	.word	0x00000018
	.word	\nid
	.word	_\name\()_stub_str
	.word	\ver
	.word	0x00000000
	.word	0x00000000
	.size	_\name\()_\num\()_stub_head, .-_\name\()_\num\()_stub_head

	.global	_sce_package_version_\name
_sce_package_version_\name:
	.word	\pkgVer
	.size	_sce_package_version_\name, .-_sce_package_version_\name

	.section .sceImport.rodata
	.global	_\name\()_stub_str
_\name\()_stub_str:
	.asciz	"\name"
	.size	_\name\()_stub_str, .-_\name\()_stub_str
#endif
.endm

.macro PSP2_IMPORT_FUNC module, moduleNum, num, nid, name
#ifdef NIDS
	.global	_NID_\name
_NID_\name = \nid
#elif defined(FUNC)
.if FUNC == \nid
	.section .sceFStub.rodata
	.word	0

	.section .sceRefs.rodata
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0

	.section .sceFNID.rodata
	.word	0

	.section .sceStubs.text.\module\().\name
	.align	2
	.global	\name
\name:
	mvn	r0, #0
	bx	lr
	nop
	.word	0
	.size	\name, .-\name

	.section .sce_libgen_mark
	.word	0x00000114
	.word	_\module\()_\moduleNum\()_stub_head
	.word	\name
	.word	\nid
	.word	_NID_\name
.endif
#endif
.endm

.macro PSP2_IMPORT_FUNC_WITH_ALIAS module, moduleNum, num, nid, name, alias
	PSP2_IMPORT_FUNC module, moduleNum, num, nid, name
#ifdef FUNC
.if FUNC == \nid
	.global	\alias
	.type	\alias, @function
\alias = \funcname
.endif
#endif
.endm
