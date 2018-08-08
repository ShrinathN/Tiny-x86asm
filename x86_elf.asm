BITS 32
org     0x08048000
	;elf header starting here
elfhdr:	
	db	0x7f,"ELF"	;0x00 to 0x03	magic number
	db	1		;0x04 to 0x04	32 bit
	db	1		;0x05 to 0x05	little endian
	db	1		;0x06 to 0x06	set as 1
	db	0		;0x07 to 0x07	operating system ABI
	dd	0		;0x08 to 0x0F	ABI version, set as 1
	dd	0
	dw	2		;0x10 to 0x11	type, executable here
	dw	3		;0x12 to 0x13	instruction set arch, 0x3 is for x86
	dd	1		;0x14 to 0x17	need to be set as 1
	dd	_start		;0x18 to 0x1b	address of entry point
	dd	phdr-$$		;0x1c to 0x1f	address to the program header table
	dd	0		;0x20 t0 0x23	address to section header table, setting as 0
	dd	0		;0x24 to 0x27	flags, setting as 0
	dw	elfsiz		;0x28 to 0x29	size of this header
	dw	phdsiz		;0x2A to 0x2B	size of program header table
	dw	1		;0x2C to 0x2D	number of program header tables, 1 obviously
	dw	0		;0x2E to 0x2F	size of section header table, setting as 0
	dw	0		;0x30 to 0x31	number of section header tables, 0
	dw	0		;0x32 to 0x33	something related to section header table, setting 0 :)
elfsiz	equ	$-elfhdr	;size of elf header
	;program header starting here
phdr:	dd	1		;0x00 to 0x03	type of segment
	dd	0		;0x04 to 0x07	offset in the segment image, setting as 0
	dd	$$		;0x08 to 0x0B	Virtual address of the segment in memory
	dd	$$		;0x0C to 0x0F	reserved for segment's physical address
	dd	filesz		;0x10 to 0x13	file size
	dd	filesz		;0x14 to 0x17	file size
	dd	5		;0x18 to 0x1B	flags, setting as 5 for some reason
	dd	0x1000		;no freaking clue
phdsiz	equ	$-phdr

_start:	;=====your code goes here=====

filesz	equ	$-$$		;file size, must remain at the end
