;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module memory
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_StackAddress
	.globl _Mem_GetStackAddress
	.globl _Mem_HeapAlloc
	.globl _Mem_HeapFree
	.globl _Mem_Copy
	.globl _Mem_Set
	.globl _Mem_Set_16b
	.globl _Mem_FastSet
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_g_StackAddress::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:24: u16 Mem_GetStackAddress() __NAKED
;	---------------------------------
; Function Mem_GetStackAddress
; ---------------------------------
_Mem_GetStackAddress::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:30: __endasm;
	ld	(_g_StackAddress), sp
	ld	de, (_g_StackAddress)
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:31: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:35: void* Mem_HeapAlloc(u16 size)
;	---------------------------------
; Function Mem_HeapAlloc
; ---------------------------------
_Mem_HeapAlloc::
	ld	c, l
	ld	b, h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:37: u16 addr = g_HeapStartAddress;
	ld	de, (_g_HeapStartAddress)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:38: g_HeapStartAddress += size;
	ld	hl, #_g_HeapStartAddress
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:39: return (void*)addr;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:40: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:44: void Mem_HeapFree(u16 size)
;	---------------------------------
; Function Mem_HeapFree
; ---------------------------------
_Mem_HeapFree::
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:46: g_HeapStartAddress -= size;	
	ld	hl, #_g_HeapStartAddress
	ld	a, (hl)
	sub	a, e
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, d
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:47: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:52: void Mem_Copy(const void* src, void* dest, u16 size) __NAKED // Stack: 4 bytes
;	---------------------------------
; Function Mem_Copy
; ---------------------------------
_Mem_Copy::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:72: __endasm;
	pop	iy
	pop	bc
	ldir
	mem_copy_end:
	jp	(iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:73: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:127: void Mem_Set(u8 val, void* dest, u16 size) __NAKED // Stack: 4 bytes
;	---------------------------------
; Function Mem_Set
; ---------------------------------
_Mem_Set::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:155: __endasm;
	push	de
	pop	hl
	ld	(hl), a
	inc	de
	pop	iy
	pop	bc
	dec	bc
	ldir
	mem_fill_end:
	jp	(iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:156: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:161: void Mem_Set_16b(u16 val, void* dest, u16 size)
;	---------------------------------
; Function Mem_Set_16b
; ---------------------------------
_Mem_Set_16b::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:196: __endasm;
	push	de
	ex	de, hl
	ld	(hl), d
	inc	hl
	ld	(hl), e
	inc	hl
	ex	de, hl
	pop	hl
	pop	iy
	pop	bc
	dec	bc
	dec	bc
	ldir
	mem_fill16_end:
	jp	(iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:197: }
	pop	hl
	pop	af
	jp	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:202: void Mem_FastSet(u8 val, void* dest, u16 size) __NAKED // Stack: 4 bytes
;	---------------------------------
; Function Mem_FastSet
; ---------------------------------
_Mem_FastSet::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:251: __endasm;
	push	de
	pop	hl
	ld	(hl), a
	inc	de
	pop	iy
	pop	bc
	dec	bc
	mem_fastfill_setup:
	xor	a
	sub	c
	and	#15
	jp	z, mem_fastfill_loop
	add	a
	exx
	add	a, #mem_fastfill_loop
	ld	l, a
	ld	a, #0
	adc	a, #mem_fastfill_loop >> 8
	ld	h, a
	push	hl
	exx
	ret
	mem_fastfill_loop:
	.rept	16
	ldi
	.endm
	jp	pe, mem_fastfill_loop
	mem_fastfill_end:
	jp	(iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/memory.c:252: }
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
