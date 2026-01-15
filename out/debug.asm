;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module debug
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DEBUG_INIT
	.globl _DEBUG_BREAK
	.globl _DEBUG_ASSERT
	.globl _DEBUG_LOG
	.globl _DEBUG_LOGNUM
	.globl _DEBUG_PRINT
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_PortDebugMode	=	0x002e
_g_PortDebugData	=	0x002f
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:66: void DEBUG_INIT() {}
;	---------------------------------
; Function DEBUG_INIT
; ---------------------------------
_DEBUG_INIT::
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:70: void DEBUG_BREAK()
;	---------------------------------
; Function DEBUG_BREAK
; ---------------------------------
_DEBUG_BREAK::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:73: g_PortDebugMode = 0xFF;
	ld	a, #0xff
	out	(_g_PortDebugMode), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:75: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:79: void DEBUG_ASSERT(bool a)
;	---------------------------------
; Function DEBUG_ASSERT
; ---------------------------------
_DEBUG_ASSERT::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:81: if (!(a))
	ld	c, a
	or	a, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:82: DEBUG_BREAK();
	jp	Z,_DEBUG_BREAK
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:83: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:87: void DEBUG_LOG(const c8* msg)
;	---------------------------------
; Function DEBUG_LOG
; ---------------------------------
_DEBUG_LOG::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:90: DEBUG_PRINT("%s", msg);
	ld	bc, #___str_0+0
	push	hl
	push	bc
	call	_DEBUG_PRINT
	pop	af
	pop	af
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:96: }
	ret
___str_0:
	.ascii "%s"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:100: void DEBUG_LOGNUM(const c8* msg, u8 num)
;	---------------------------------
; Function DEBUG_LOGNUM
; ---------------------------------
_DEBUG_LOGNUM::
	push	ix
	ld	ix,#0
	add	ix,sp
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:103: DEBUG_PRINT("%s:%d", msg, num);
	ld	e, 4 (ix)
	ld	d, #0x00
	ld	bc, #___str_1+0
	push	de
	push	hl
	push	bc
	call	_DEBUG_PRINT
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:110: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
___str_1:
	.ascii "%s:%d"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:114: void DEBUG_PRINT(const c8* format, ...)
;	---------------------------------
; Function DEBUG_PRINT
; ---------------------------------
_DEBUG_PRINT::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:118: va_start(args, format);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:119: u16 val = ((u16)args - sizeof(format));
	ld	hl,#0x2
	add	hl,sp
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:122: g_PortDebugMode = 1;
	ld	a, #0x01
	out	(_g_PortDebugMode), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:123: g_PortDebugData = val & 0xFF; // low byte
	ld	a, l
	out	(_g_PortDebugData), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:124: g_PortDebugData = val >> 8; // high byte
	ld	a, h
	out	(_g_PortDebugData), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/debug.c:135: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
