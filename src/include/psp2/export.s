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

.macro PSP2_EXPORT_START
	.section .sceExport.rodata
	.subsection 1
	.align	2
.NIDTBL_TOP:

	.subsection 2
	.align	2
.ENTTBL_TOP:
.endm

.macro PSP2_EXPORT_FUNC_START
	.section .sceExport.rodata
	.subsection 1
.NIDTBL_FUNC_TOP:
.endm

.macro PSP2_EXPORT_FUNC nid, func
	.section .sceExport.rodata
	.subsection 1
	.word	\nid

	.subsection 2
	.word	\func
.endm

.macro PSP2_EXPORT_FUNC_END
	.section .sceExport.rodata
	.subsection 1
.NIDTBL_FUNC_BTM:
.endm

.macro PSP2_EXPORT_VAR_START
	.section .sceExport.rodata
	.subsection 1
.NIDTBL_VAR_TOP:
.endm

.macro PSP2_EXPORT_VAR nid, var
	.section .sceExport.rodata
	.subsection 1
	.word	\nid

	.subsection 2
	.word	\var
.endm

.macro PSP2_EXPORT_VAR_END
	.section .sceExport.rodata
	.subsection 1
.NIDTBL_VAR_BTM:
.endm

.macro PSP2_EXPORT_END ver, flag, nid, name
	.section .sceLib.ent
	.short	0x0020
	.short	\ver
	.short	\flag
.ifdef .NIDTBL_FUNC_TOP
	.short	(.NIDTBL_FUNC_BTM - .NIDTBL_FUNC_TOP) / 4
.else
	.short	0
.endif
.ifdef .NIDTBL_VAR_TOP
	.word	(.NIDTBL_VAR_BTM - .NIDTBL_VAR_TOP) / 4
.else
	.word	0
.endif
	.word	0
	.word	\nid
	.word	.STR
	.word	.NIDTBL_TOP
	.word	.ENTTBL_TOP

	.section .sceExport.rodata
.STR:
	.asciz	"\name"
.endm
