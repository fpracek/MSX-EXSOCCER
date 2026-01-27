;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module v9990
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _g_V9_ColorConfig
	.globl _g_V9_ModeConfig
	.globl _V9_SetPort
	.globl _V9_GetPort
	.globl _V9_SetRegister
	.globl _V9_SetRegister16
	.globl _V9_GetRegister
	.globl _V9_Detect
	.globl _V9_SetScreenMode
	.globl _V9_SetColorMode
	.globl _V9_SetScrollingY
	.globl _V9_SetScrollingX
	.globl _V9_SetScrollingBY
	.globl _V9_SetScrollingBX
	.globl _V9_ClearVRAM
	.globl _V9_SetWriteAddress
	.globl _V9_SetReadAddress
	.globl _V9_Peek_CurrentAddr
	.globl _V9_Peek16_CurrentAddr
	.globl _V9_Poke_CurrentAddr
	.globl _V9_Poke16_CurrentAddr
	.globl _V9_FillVRAM_CurrentAddr
	.globl _V9_FillVRAM16_CurrentAddr
	.globl _V9_WriteVRAM_CurrentAddr
	.globl _V9_ReadVRAM_CurrentAddr
	.globl _V9_SetPaletteEntry
	.globl _V9_SetCursorAttribute
	.globl _V9_SetCursorDisplay
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_g_V9_VRAMPort	=	0x0060
_g_V9_PalettePort	=	0x0061
_g_V9_CmdDataPort	=	0x0062
_g_V9_RegDataPort	=	0x0063
_g_V9_RegSelectPort	=	0x0064
_g_V9_SatusPort	=	0x0065
_g_V9_IntFlagPort	=	0x0066
_g_V9_SysCtrlPort	=	0x0067
_g_V9_KanjiAddrLPort	=	0x0068
_g_V9_KanjiAddrHPort	=	0x0069
_g_V9_KanjiDataPort	=	0x0069
_g_V9_Kanji2AddrLPort	=	0x006a
_g_V9_Kanji2AddrHPort	=	0x006b
_g_V9_Kanji2DataPort	=	0x006b
_g_V9_OutputCtrPort	=	0x006f
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:123: void V9_SetPort(u8 port, u8 value) __NAKED __PRESERVES(b, d, e, h, iyl, iyh)
;	---------------------------------
; Function V9_SetPort
; ---------------------------------
_V9_SetPort::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:133: __endasm;
	v9_set_port:
	ld	c, a
	out	(c), l
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:134: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:138: u8 V9_GetPort(u8 port) __NAKED __PRESERVES(b, d, e, h, l, iyl, iyh)
;	---------------------------------
; Function V9_GetPort
; ---------------------------------
_V9_GetPort::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:147: __endasm;
	v9_get_port:
	ld	c, a
	in	a, (c)
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:148: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:152: void V9_SetRegister(u8 reg, u8 val) __NAKED __PRESERVES(b, c, d, e, h, iyl, iyh)
;	---------------------------------
; Function V9_SetRegister
; ---------------------------------
_V9_SetRegister::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:165: __endasm;
	v9_set_reg:
	di
	out	(0x64), a
	ld	a, l
	ei
	out	(0x63), a
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:166: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:170: void V9_SetRegister16(u8 reg, u16 val) __NAKED __PRESERVES(b, h, l, iyl, iyh)
;	---------------------------------
; Function V9_SetRegister16
; ---------------------------------
_V9_SetRegister16::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:185: __endasm;
	v9_set_reg16:
	di
	out	(0x64), a
	ld	a, l
	ei
	ld	c, #0x63
	out	(c), e
	out	(c), d
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:186: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:190: u8 V9_GetRegister(u8 reg) __NAKED __PRESERVES(b, c, d, e, h, l, iyl, iyh)
;	---------------------------------
; Function V9_GetRegister
; ---------------------------------
_V9_GetRegister::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:201: __endasm;
	v9_get_reg:
	di
	out	(0x64), a
	ei
	in	a, (0x63)
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:202: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:206: bool V9_Detect() __NAKED
;	---------------------------------
; Function V9_Detect
; ---------------------------------
_V9_Detect::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:227: __endasm;
	v9_detect:
	ld	a, #15 + 0b01000000 + 0b10000000
	di
	out	(0x64), a
	in	a, (0x63)
	ld	b, a
	cpl
	out	(0x63), a
	in	a, (0x63)
	xor	b
	jr	z, v9_notfound
	v9_found:
	ld	c, #0x63
	out	(c), b
	v9_notfound:
	ei
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:228: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:232: void V9_SetScreenMode(u8 mode)
;	---------------------------------
; Function V9_SetScreenMode
; ---------------------------------
_V9_SetScreenMode::
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:234: const u8* ptr = (const u8*)&g_V9_ModeConfig[mode];
	ld	bc, #_g_V9_ModeConfig+0
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, bc
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:235: V9_SetRegister(6, *ptr++);
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, #0x06
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:236: V9_SetRegister(7, *ptr++);
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, #0x07
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:237: V9_SetPort(V9_P07, *ptr);
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x67
	call	_V9_SetPort
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:239: V9_SetRegister(8, V9_R08_DISP_ON | 0x02); // Enable display
	ld	l, #0x82
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:240: V9_SetRegister(13, 0x00); // Reset color mode
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:241: }
	jp	_V9_SetRegister
_g_V9_ModeConfig:
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x59	; 89	'Y'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x82	; 130
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa9	; 169
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xa9	; 169
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xa9	; 169
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0xa9	; 169
	.db #0x00	; 0
	.db #0x00	; 0
_g_V9_ColorConfig:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x40	; 64
	.db #0x02	; 2
	.db #0x80	; 128
	.db #0x02	; 2
	.db #0xa0	; 160
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x02	; 2
	.db #0xe0	; 224
	.db #0x03	; 3
	.db #0x00	; 0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:250: void V9_SetColorMode(u8 mode)
;	---------------------------------
; Function V9_SetColorMode
; ---------------------------------
_V9_SetColorMode::
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:252: const u8* ptr = (const u8*)&g_V9_ColorConfig[mode];
	ld	bc, #_g_V9_ColorConfig+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:253: V9_SetFlag(6, V9_R06_BPP_MASK, *ptr++);
	ld	a, (de)
	ld	c, a
	inc	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x06
	call	_V9_GetRegister
	and	a, #0xfc
	or	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x06
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:254: V9_SetFlag(13, (u8)(V9_R13_PLTM_MASK + V9_R13_YAE), *ptr);
	ld	a, (de)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x0d
	call	_V9_GetRegister
	and	a, #0x1f
	or	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:254: V9_SetFlag(13, (u8)(V9_R13_PLTM_MASK + V9_R13_YAE), *ptr);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:255: }
	jp	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:261: void V9_SetScrollingY(u16 y)
;	---------------------------------
; Function V9_SetScrollingY
; ---------------------------------
_V9_SetScrollingY::
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:264: V9_SetRegister(17, y & 0xFF);
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x11
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:267: u8 a = (y >> 8) & 0x1F;
	ld	a, d
	and	a, #0x1f
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:268: u8 b = V9_GetRegister(18) & 0xE0;
	ld	a, #0x12
	call	_V9_GetRegister
	and	a, #0xe0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:269: V9_SetRegister(18, a | b);
	or	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x12
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:270: }
	jp	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:274: void V9_SetScrollingX(u16 x)
;	---------------------------------
; Function V9_SetScrollingX
; ---------------------------------
_V9_SetScrollingX::
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:277: V9_SetRegister(19, x & 0x07);
	ld	a, e
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x13
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:280: V9_SetRegister(20, (x >> 3) & 0xFF);
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x14
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:281: }
	jp	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:287: void V9_SetScrollingBY(u16 y)
;	---------------------------------
; Function V9_SetScrollingBY
; ---------------------------------
_V9_SetScrollingBY::
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:290: V9_SetRegister(21, y & 0xFF);
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x15
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:293: u8 a = (y >> 8) & 0x01;
	ld	a, d
	and	a, #0x01
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:294: u8 b = V9_GetRegister(22) & 0xFE;
	ld	a, #0x16
	call	_V9_GetRegister
	res	0, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:295: V9_SetRegister(22, a | b);
	or	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x16
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:296: }
	jp	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:300: void V9_SetScrollingBX(u16 x)
;	---------------------------------
; Function V9_SetScrollingBX
; ---------------------------------
_V9_SetScrollingBX::
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:303: V9_SetRegister(23, x & 0x07);
	ld	a, e
	and	a, #0x07
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x17
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:306: V9_SetRegister(24, (x >> 3) & 0xFF);
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x18
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:307: }
	jp	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:313: void V9_ClearVRAM() __NAKED __PRESERVES(d, e, h, l, iyl, iyh)
;	---------------------------------
; Function V9_ClearVRAM
; ---------------------------------
_V9_ClearVRAM::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:344: __endasm;
	di
	xor	a
	out	(0x64), a
	out	(0x63), a
	out	(0x63), a
	out	(0x63), a
	ld	b, a
	ld	c, a
	v9_clear_loop:
	out	(0x60), a
	out	(0x60), a
	out	(0x60), a
	out	(0x60), a
	out	(0x60), a
	out	(0x60), a
	out	(0x60), a
	out	(0x60), a
	djnz	v9_clear_loop
	dec	c
	jp	nz, v9_clear_loop
	ei
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:345: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:349: void V9_SetWriteAddress(u32 addr) __NAKED __PRESERVES(b, iyl, iyh)
;	---------------------------------
; Function V9_SetWriteAddress
; ---------------------------------
_V9_SetWriteAddress::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:363: __endasm;							//-total: 67 cc
	v9_set_write_addr:
	xor	a
	di
	out	(0x64), a
	ld	c, #0x63
	out	(c), e
	out	(c), d
	out	(c), l
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:364: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:368: void V9_SetReadAddress(u32 addr) __NAKED __PRESERVES(b, iyl, iyh)
;	---------------------------------
; Function V9_SetReadAddress
; ---------------------------------
_V9_SetReadAddress::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:382: __endasm;							//-total: 70 cc
	v9_set_read_addr:
	ld	a, #3
	di
	out	(0x64), a
	ld	c, #0x63
	out	(c), e
	out	(c), d
	out	(c), l
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:383: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:387: u8 V9_Peek_CurrentAddr() __NAKED __PRESERVES(b, c, d, e, h, l, iyl, iyh)
;	---------------------------------
; Function V9_Peek_CurrentAddr
; ---------------------------------
_V9_Peek_CurrentAddr::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:393: __endasm;
	ei
	in	a, (0x60)
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:394: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:398: u16 V9_Peek16_CurrentAddr() __NAKED __PRESERVES(b, c, h, l, iyl, iyh)
;	---------------------------------
; Function V9_Peek16_CurrentAddr
; ---------------------------------
_V9_Peek16_CurrentAddr::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:407: __endasm;
	in	a, (0x60)
	ld	e, a
	ei
	in	a, (0x60)
	ld	d, a
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:408: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:412: void V9_Poke_CurrentAddr(u8 val) __NAKED __PRESERVES(b, c, d, e, h, l, iyl, iyh)
;	---------------------------------
; Function V9_Poke_CurrentAddr
; ---------------------------------
_V9_Poke_CurrentAddr::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:420: __endasm;
	ei
	out	(0x60), a
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:421: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:425: void V9_Poke16_CurrentAddr(u16 val) __NAKED __PRESERVES(b, c, d, e, iyl, iyh)
;	---------------------------------
; Function V9_Poke16_CurrentAddr
; ---------------------------------
_V9_Poke16_CurrentAddr::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:436: __endasm;
	ld	a, l
	out	(0x60), a
	ld	a, h
	ei
	out	(0x60), a
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:437: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:441: void V9_FillVRAM_CurrentAddr(u8 value, u16 count) __NAKED
;	---------------------------------
; Function V9_FillVRAM_CurrentAddr
; ---------------------------------
_V9_FillVRAM_CurrentAddr::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:461: __endasm;
	v9_fill_setup:
	ld	b, e
	dec	de
	inc	d
	v9_fill_loop:
	out	(0x60), a
	djnz	v9_fill_loop
	dec	d
	jp	nz, v9_fill_loop
	ei
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:462: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:466: void V9_FillVRAM16_CurrentAddr(u16 value, u16 count) __NAKED
;	---------------------------------
; Function V9_FillVRAM16_CurrentAddr
; ---------------------------------
_V9_FillVRAM16_CurrentAddr::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:489: __endasm;
	v9_fill16_setup:
	ld	b, e
	dec	de
	inc	d
	v9_fill16_loop:
	ld	a, l
	out	(0x60), a
	ld	a, h
	out	(0x60), a
	djnz	v9_fill16_loop
	dec	d
	jp	nz, v9_fill16_loop
	ei
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:490: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:494: void V9_WriteVRAM_CurrentAddr(const u8* src, u16 count) __NAKED
;	---------------------------------
; Function V9_WriteVRAM_CurrentAddr
; ---------------------------------
_V9_WriteVRAM_CurrentAddr::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:514: __endasm;
	v9_write_setup:
	ld	b, e
	dec	de
	inc	d
	ld	c, #0x60
	v9_write_loop:
	otir
	dec	d
	jp	nz, v9_write_loop
	ei
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:515: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:519: void V9_ReadVRAM_CurrentAddr(const u8* dest, u16 count) __NAKED
;	---------------------------------
; Function V9_ReadVRAM_CurrentAddr
; ---------------------------------
_V9_ReadVRAM_CurrentAddr::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:539: __endasm;
	v9_read_setup:
	ld	b, e
	dec	de
	inc	d
	ld	c, #0x60
	v9_read_loop:
	inir
	dec	d
	jp	nz, v9_read_loop
	ei
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:540: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:608: void V9_SetPaletteEntry(u8 index, const u8* color) __NAKED __PRESERVES(h, l, iyl, iyh)
;	---------------------------------
; Function V9_SetPaletteEntry
; ---------------------------------
_V9_SetPaletteEntry::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:641: __endasm;
	ld	c, #0x64
	ld	b, #14
	di
	out	(c), b
	sla	a
	sla	a
	out	(0x63), a
	v9_set_pal_entry:
	ld	a, (de)
	out	(0x61), a
	inc	de
	ld	a, (de)
	out	(0x61), a
	inc	de
	ld	a, (de)
	ei
	out	(0x61), a
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:642: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:658: void V9_SetCursorAttribute(u8 id, u16 x, u16 y, u8 color)
;	---------------------------------
; Function V9_SetCursorAttribute
; ---------------------------------
_V9_SetCursorAttribute::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	c, a
	inc	sp
	inc	sp
	push	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:660: u32 addr = 0x7FE00;
	ld	de, #0xfe00
	ld	hl, #0x0007
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:661: if (id)
	ld	a, c
	or	a, a
	jr	Z, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:662: addr += 8;
	ld	de, #0xfe08
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:663: V9_Poke(addr, y & 0xFF);
	ld	b, 4 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.h:388: inline void V9_Poke(u32 addr, u8 val) { V9_SetWriteAddress(addr); V9_Poke_CurrentAddr(val); }
	push	hl
	push	de
	call	_V9_SetWriteAddress
	pop	de
	ld	a, b
	call	_V9_Poke_CurrentAddr
	pop	hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:664: addr += 2;
	ld	a, e
	add	a, #0x02
	ld	e, a
	ld	a, d
	adc	a, #0x00
	ld	d, a
	jr	NC, 00114$
	inc	hl
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:665: V9_Poke(addr, y >> 8);
	ld	b, 5 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.h:388: inline void V9_Poke(u32 addr, u8 val) { V9_SetWriteAddress(addr); V9_Poke_CurrentAddr(val); }
	push	hl
	push	de
	call	_V9_SetWriteAddress
	pop	de
	ld	a, b
	call	_V9_Poke_CurrentAddr
	pop	hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:666: addr += 2;
	ld	a, e
	add	a, #0x02
	ld	e, a
	ld	a, d
	adc	a, #0x00
	ld	d, a
	jr	NC, 00115$
	inc	hl
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:667: V9_Poke(addr, x & 0xFF);
	ld	b, -2 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.h:388: inline void V9_Poke(u32 addr, u8 val) { V9_SetWriteAddress(addr); V9_Poke_CurrentAddr(val); }
	push	hl
	push	de
	call	_V9_SetWriteAddress
	pop	de
	ld	a, b
	call	_V9_Poke_CurrentAddr
	pop	hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:668: addr += 2;
	ld	a, e
	add	a, #0x02
	ld	e, a
	ld	a, d
	adc	a, #0x00
	ld	d, a
	jr	NC, 00116$
	inc	hl
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:669: V9_Poke(addr, ((x >> 8) & 0x3) + ((color & 0x3) << 6));
	ld	a, -1 (ix)
	and	a, #0x03
	ld	c, a
	ld	a, 6 (ix)
	and	a, #0x03
	rrca
	rrca
	and	a, #0xc0
	add	a, c
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.h:388: inline void V9_Poke(u32 addr, u8 val) { V9_SetWriteAddress(addr); V9_Poke_CurrentAddr(val); }
	call	_V9_SetWriteAddress
	ld	a, b
	call	_V9_Poke_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:669: V9_Poke(addr, ((x >> 8) & 0x3) + ((color & 0x3) << 6));
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:670: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	inc	sp
	jp	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:678: void V9_SetCursorDisplay(u8 id, bool enable)
;	---------------------------------
; Function V9_SetCursorDisplay
; ---------------------------------
_V9_SetCursorDisplay::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
	ld	-1 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:680: u32 addr = 0x7FE06;
	ld	de, #0xfe06
	ld	hl, #0x0007
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:681: if (id)
	ld	a, c
	or	a, a
	jr	Z, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:682: addr += 8;
	ld	de, #0xfe0e
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:683: u8 val = V9_Peek(addr);
	push	hl
	push	de
	call	_V9_SetReadAddress
	pop	de
	call	_V9_Peek_CurrentAddr
	pop	hl
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:684: if (enable)
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:685: val &= ~V9_CURSOR_DISABLE;
	res	4, b
	jp	00105$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:687: val |= V9_CURSOR_DISABLE;
	set	4, b
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.h:388: inline void V9_Poke(u32 addr, u8 val) { V9_SetWriteAddress(addr); V9_Poke_CurrentAddr(val); }
	call	_V9_SetWriteAddress
	ld	a, b
	call	_V9_Poke_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:688: V9_Poke(addr, val);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\engine/src/v9990.c:689: }
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
