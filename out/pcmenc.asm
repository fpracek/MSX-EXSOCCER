;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module pcmenc
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PCM_Reset
	.globl _PCM_Play_8K
	.globl _PCM_Play_11K
	.globl _PCM_Play_22K
	.globl _PCM_Play_44K
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_PortPrimarySlot	=	0x00a8
_g_PortReadKeyboard	=	0x00a9
_g_PortAccessKeyboard	=	0x00aa
_g_PortControl	=	0x00ab
_g_VDP_DataPort	=	0x0098
_g_VDP_RegPort	=	0x0099
_g_VDP_AddrPort	=	0x0099
_g_VDP_StatPort	=	0x0099
_g_PSG_RegPort	=	0x00a0
_g_PSG_DataPort	=	0x00a1
_g_PSG_StatPort	=	0x00a2
_g_PSG_Ext_RegPort	=	0x0010
_g_PSG_Ext_DataPort	=	0x0011
_g_PSG_Ext_StatPort	=	0x0012
_g_MSXMusic_IndexPort	=	0x007c
_g_MSXMusic_DataPort	=	0x007d
_g_MSXAudio_IndexPort	=	0x00c0
_g_MSXAudio_DataPort	=	0x00c1
_g_MSXAudio_IndexPort2	=	0x00c2
_g_MSXAudio_DataPort2	=	0x00c3
_g_RTC_AddrPort	=	0x00b4
_g_RTC_DataPort	=	0x00b5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:33: void PCM_Reset()
;	---------------------------------
; Function PCM_Reset
; ---------------------------------
_PCM_Reset::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:62: __endasm;		
	xor	a
	ld	bc, #0xFFA1
	out	(0xA0), a
	inc	a
	out	(c), b
	out	(0xA0), a
	inc	a
	out	(c), b
	out	(0xA0), a
	inc	a
	out	(c), b
	out	(0xA0), a
	inc	a
	out	(c), b
	out	(0xA0), a
	inc	a
	out	(c), b
	out	(0xA0), a
	inc	a
	out	(c), b
	out	(0xA0), a
	inc	a
	out	(c), b
	out	(0xA0), a
	ld	b, #0xBF
	out	(c), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:63: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:78: void PCM_Play_8K(u16 addr)
;	---------------------------------
; Function PCM_Play_8K
; ---------------------------------
_PCM_Play_8K::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:82: PCM_Reset(); // don't change HL
	call	_PCM_Reset
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:214: __endasm;
	di
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	PCM_8K_Play:
	ld	c, #0xA1
	push	hl
	ex	de, hl
	inc	h
	exx
	pop	hl
	ld	bc, #0x0010
	ld	de, #0x0000
	exx
	PCM_8K_Loop:
	exx
	ld	a, b
	sub	c
	jr	nc, PCM_8K_WaitA
	ld	a, (hl)
	ld	b, a
	and	#0x0F
	inc	hl
	exx
	ld	b, a
	exx
	PCM_8K_DoneA:
	ld	a, d
	sub	c
	jr	nc, PCM_8K_WaitB
	ld	a, (hl)
	ld	d, a
	and	#0x0F
	inc	hl
	exx
	ld	d, a
	exx
	PCM_8K_DoneB:
	ld	a, e
	sub	c
	jr	nc, PCM_8K_WaitC
	ld	a, (hl)
	ld	e, a
	and	#0x0F
	inc	hl
	exx
	ld	e, a
	PCM_8K_DoneC:
	ld	a, #8
	out	(0xA0), a
	inc	a
	out	(c), b
	out	(0xA0), a
	inc	a
	out	(c), d
	out	(0xA0), a
	out	(c), e
	call	Wait147
	dec	l
	jr	nz, PCM_8K_Loop
	dec	h
	jp	nz, PCM_8K_Loop
	ei
	ret
	PCM_8K_WaitA:
	ld	b, a
	nop
	nop
	nop
	nop
	jr	PCM_8K_DoneA
	PCM_8K_WaitB:
	ld	d, a
	nop
	nop
	nop
	nop
	jr	PCM_8K_DoneB
	PCM_8K_WaitC:
	ld	e, a
	exx
	nop
	nop
	nop
	jr	PCM_8K_DoneC
	Wait147:
	inc	hl
	dec	hl
	inc	hl
	dec	hl
	inc	hl
	dec	hl
	inc	hl
	dec	hl
	inc	hl
	dec	hl
	inc	hl
	dec	hl
	inc	hl
	dec	hl
	nop
	nop
	nop
	nop
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:215: }        
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:231: void PCM_Play_11K(u16 addr)
;	---------------------------------
; Function PCM_Play_11K
; ---------------------------------
_PCM_Play_11K::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:235: PCM_Reset(); // don't change HL
	call	_PCM_Reset
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:349: __endasm;
	di
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	PCM_11K_Play:
	ld	c, #0xA1
	push	hl
	ex	de, hl
	inc	h
	exx
	pop	hl
	ld	bc, #0x0010
	ld	de, #0x0000
	exx
	PCM_11K_Loop:
	exx
	ld	a, b
	sub	c
	jr	nc, PCM_11K_WaitA
	ld	a, (hl)
	ld	b, a
	and	#0x0F
	inc	hl
	exx
	ld	b, a
	exx
	PCM_11K_DoneA:
	ld	a, d
	sub	c
	jr	nc, PCM_11K_WaitB
	ld	a, (hl)
	ld	d, a
	and	#0x0F
	inc	hl
	exx
	ld	d, a
	exx
	PCM_11K_DoneB:
	ld	a, e
	sub	c
	jr	nc, PCM_11K_WaitC
	ld	a, (hl)
	ld	e, a
	and	#0x0F
	inc	hl
	exx
	ld	e, a
	PCM_11K_DoneC:
	ld	a, #8
	out	(0xA0), a
	inc	a
	out	(c), b
	out	(0xA0), a
	inc	a
	out	(c), d
	out	(0xA0), a
	out	(c), e
	nop
	nop
	nop
	nop
	nop
	dec	l
	jr	nz, PCM_11K_Loop
	dec	h
	jp	nz, PCM_11K_Loop
	ei
	ret
	PCM_11K_WaitA:
	ld	b, a
	nop
	nop
	nop
	nop
	jr	PCM_11K_DoneA
	PCM_11K_WaitB:
	ld	d, a
	nop
	nop
	nop
	nop
	jr	PCM_11K_DoneB
	PCM_11K_WaitC:
	ld	e, a
	exx
	nop
	nop
	nop
	jr	PCM_11K_DoneC
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:350: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:366: void PCM_Play_22K(u16 addr)
;	---------------------------------
; Function PCM_Play_22K
; ---------------------------------
_PCM_Play_22K::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:370: PCM_Reset(); // don't change HL
	call	_PCM_Reset
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:481: __endasm;
	di
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	PCM_22K_Play:
	ld	c, #0xA1
	push	hl
	ex	de, hl
	inc	h
	exx
	pop	hl
	ld	bc, #0x0010
	ld	de, #0x0000
	exx
	PCM_22K_Loop:
	exx
	ld	a, b
	sub	#0x10
	jr	nc, PCM_22K_WaitA
	ld	a, #8
	out	(0xA0), a
	ld	a, (hl)
	inc	hl
	ld	b, a
	and	#0x0F
	out	(0xA1), a
	PCM_22K_DoneA:
	ld	a, d
	sub	c
	jr	nc, PCM_22K_WaitB
	ld	a, (hl)
	inc	hl
	ld	d, a
	and	#0x0F
	exx
	ld	d, a
	exx
	PCM_22K_DoneB:
	ld	a, e
	sub	c
	jr	nc, PCM_22K_WaitC
	ld	a, (hl)
	inc	hl
	ld	e, a
	and	#0x0F
	exx
	ld	e, a
	PCM_22K_DoneC:
	ld	a, #9
	out	(0xA0), a
	inc	a
	out	(c), d
	out	(0xA0), a
	out	(c), e
	or	#0
	or	#0
	or	#0
	or	#0
	dec	l
	jr	nz, PCM_22K_Loop
	dec	h
	jp	nz, PCM_22K_Loop
	ei
	ret
	PCM_22K_WaitA:
	ld	b, a
	inc	hl
	dec	hl
	nop
	nop
	nop
	jr	PCM_22K_DoneA
	PCM_22K_WaitB:
	ld	d, a
	nop
	nop
	nop
	nop
	jr	PCM_22K_DoneB
	PCM_22K_WaitC:
	ld	e, a
	exx
	nop
	nop
	nop
	jr	PCM_22K_DoneC
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:482: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:498: void PCM_Play_44K(u16 addr)
;	---------------------------------
; Function PCM_Play_44K
; ---------------------------------
_PCM_Play_44K::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:502: PCM_Reset(); // don't change HL
	call	_PCM_Reset
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:602: __endasm;
	di
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	hl
	PCM_44K_Play:
	push	hl
	ld	h, d
	inc	h
	ld	a, e
	exx
	pop	hl
	ld	b, a
	ld	c, #0x00
	ld	de, #0x0000
	PCM_44K_Loop:
	ld	a, c
	sub	#0x20
	jr	nc, PCM_44K_WaitA
	ld	a, #8
	out	(0xA0), a
	ld	a, (hl)
	inc	hl
	ld	c, a
	out	(0xA1), a
	PCM_44K_DoneA:
	ld	a, d
	sub	#0x20
	jr	nc, PCM_44K_WaitB
	ld	a, #9
	out	(0xA0), a
	ld	a, (hl)
	inc	hl
	ld	d, a
	out	(0xA1), a
	PCM_44K_DoneB:
	jp	PCM_44K_Dummy
	PCM_44K_Dummy:
	ld	a, e
	sub	#0x20
	jr	nc, PCM_44K_WaitC
	ld	a, #10
	out	(0xA0), a
	ld	a, (hl)
	inc	hl
	ld	e, a
	out	(0xA1), a
	PCM_44K_DoneC:
	djnz	PCM_44K_Loop
	exx
	dec	h
	exx
	jp	nz, PCM_44K_Loop
	ei
	ret
	PCM_44K_WaitA:
	ld	c, a
	inc	hl
	dec	hl
	nop
	nop
	nop
	jr	PCM_44K_DoneA
	PCM_44K_WaitB:
	ld	d, a
	inc	hl
	dec	hl
	nop
	nop
	nop
	jr	PCM_44K_DoneB
	PCM_44K_WaitC:
	ld	e, a
	inc	hl
	dec	hl
	nop
	nop
	nop
	jr	PCM_44K_DoneC
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/pcm/pcmenc.c:603: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
