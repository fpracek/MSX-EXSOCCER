;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module exsoccer_s22_b2
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _IsOffside
	.globl _ShowMenu
	.globl _GetTeamStats
	.globl _PerformPass
	.globl _GetOffsideLineY
	.globl _GetClosestPlayerToBall
	.globl _PerformShot
	.globl _PutBallOnPlayerFeet
	.globl _ClearTextFromLayerA
	.globl _IsTeamJoystickTriggerPressed
	.globl _GetJoystick1Direction
	.globl _UpdateSpritesPositions
	.globl _ShowHeaderInfo
	.globl _V9_PrintLayerAStringAtPos
	.globl _UpdateV9990
	.globl _V9_SetScrollingBY
	.globl _V9_WriteVRAM_CurrentAddr
	.globl _V9_SetWriteAddress
	.globl _g_SLTSL
	.globl _g_GRPACY
	.globl _g_GRPACX
	.globl _g_LOGOPR
	.globl _g_CMASK
	.globl _g_CLOC
	.globl _g_FNKSTR
	.globl _g_ATRBYT
	.globl _g_BDRCLR
	.globl _g_BAKCLR
	.globl _g_FORCLR
	.globl _g_CSRX
	.globl _g_CSRY
	.globl _g_CLIKSW
	.globl _g_MLTPAT
	.globl _g_MLTATR
	.globl _g_MLTCGP
	.globl _g_MLTCOL
	.globl _g_MLTNAM
	.globl _g_GRPPAT
	.globl _g_GRPATR
	.globl _g_GRPCGP
	.globl _g_GRPCOL
	.globl _g_GRPNAM
	.globl _g_T32PAT
	.globl _g_T32ATR
	.globl _g_T32CGP
	.globl _g_T32COL
	.globl _g_T32NAM
	.globl _g_TXTPAT
	.globl _g_TXTATR
	.globl _g_TXTCGP
	.globl _g_TXTCOL
	.globl _g_TXTNAM
	.globl _g_CLMLST
	.globl _g_CRTCNT
	.globl _g_LINLEN
	.globl _g_LINL32
	.globl _g_LINL40
	.globl _g_BDOS
	.globl _g_MASTER
	.globl _g_RAMAD3
	.globl _g_RAMAD2
	.globl _g_RAMAD1
	.globl _g_RAMAD0
	.globl _g_BREAKV
	.globl _g_DISKVE
	.globl _g_KANJTABLE
	.globl _g_STRSRC
	.globl _g_SUBRID
	.globl _g_CHAR_16
	.globl _g_MSXMID
	.globl _g_MSXVER
	.globl _g_ROMVersion
	.globl _g_BASRVN
	.globl _g_VDP_DW
	.globl _g_VDP_DR
	.globl _g_CGTABL
	.globl _g_SVFFFD
	.globl _g_RG27SAV
	.globl _g_RG26SAV
	.globl _g_RG25SAV
	.globl _g_SVFFF8
	.globl _g_MINROM
	.globl _g_RG23SAV
	.globl _g_RG22SAV
	.globl _g_RG21SAV
	.globl _g_RG20SAV
	.globl _g_RG19SAV
	.globl _g_RG18SAV
	.globl _g_RG17SAV
	.globl _g_RG16SAV
	.globl _g_RG15SAV
	.globl _g_RG14SAV
	.globl _g_RG13SAV
	.globl _g_RG12SAV
	.globl _g_RG11SAV
	.globl _g_RG10SAV
	.globl _g_RG09SAV
	.globl _g_RG08SAV
	.globl _g_PROCNM
	.globl _g_SLTWRK
	.globl _g_SLTATR
	.globl _g_SLTTBL
	.globl _g_EXPTBL
	.globl _g_MNROM
	.globl _g_DRWANG
	.globl _g_DRWSCL
	.globl _g_DRWFLG
	.globl _g_GYPOS
	.globl _g_GXPOS
	.globl _g_BRDATR
	.globl _g_CASPRV
	.globl _g_OLDSCR
	.globl _g_SCRMOD
	.globl _g_FLBMEM
	.globl _g_KANAMD
	.globl _g_KANAST
	.globl _g_CAPST
	.globl _g_CSTYLE
	.globl _g_CSRSW
	.globl _g_INSFLG
	.globl _g_ESCCNT
	.globl _g_GRPHED
	.globl _g_WINWID
	.globl _g_LOWLIM
	.globl _g_INTCNT
	.globl _g_INTVAL
	.globl _g_JIFFY
	.globl _g_PADX
	.globl _g_PADY
	.globl _g_INTFLG
	.globl _g_RTYCNT
	.globl _g_TRPTBL
	.globl _g_HIMEM
	.globl _g_BOTTOM
	.globl _g_PATWRK
	.globl _g_LINWRK
	.globl _g_KEYBUF
	.globl _g_NEWKEY
	.globl _g_OLDKEY
	.globl _g_CLIKFL
	.globl _g_ONGSBF
	.globl _g_FNKFLG
	.globl _g_FNKSWI
	.globl _g_CODSAV
	.globl _g_FSTPOS
	.globl _g_LINTTB
	.globl _g_BASROM
	.globl _g_ENSTOP
	.globl _g_VCBC
	.globl _g_VCBB
	.globl _g_VCBA
	.globl _g_PLYCNT
	.globl _g_MUSICF
	.globl _g_QUEUEN
	.globl _g_MCLPTR
	.globl _g_MCLLEN
	.globl _g_SAVVOL
	.globl _g_VOICEN
	.globl _g_SAVSP
	.globl _g_PRSCNT
	.globl _g_LSTMOD
	.globl _g_LSTCOM
	.globl _g_COMMSK
	.globl _g_ESTBLS
	.globl _g_FLAGS
	.globl _g_ERRORS
	.globl _g_DATCNT
	.globl _g_DEVNUM
	.globl _g_OLDINT
	.globl _g_OLDSTT
	.globl _g_MEXBIh
	.globl _g_RSIQLN
	.globl _g_RSFCB
	.globl _g_TOCNT
	.globl _g_RSTMP
	.globl _g_YSAVE
	.globl _g_XSAVE
	.globl _g_NORUSE
	.globl _g_MODE
	.globl _g_ROMA
	.globl _g_CHRCNT
	.globl _g_EXBRSA
	.globl _g_AVCSAV
	.globl _g_ACPAGE
	.globl _g_DPPAGE
	.globl _g_RS2IQ
	.globl _g_VOICCQ
	.globl _g_VOICBQ
	.globl _g_VOICAQ
	.globl _g_QUEBAK
	.globl _g_QUETAB
	.globl _g_ASPCT2
	.globl _g_ASPCT1
	.globl _g_HEADER
	.globl _g_HIGH
	.globl _g_LOW
	.globl _g_CS240
	.globl _g_CS120
	.globl _g_GETPNT
	.globl _g_PUTPNT
	.globl _g_REPCNT
	.globl _g_SCNCNT
	.globl _g_FRCNEW
	.globl _g_QUEUES
	.globl _g_MINUPD
	.globl _g_MAXUPD
	.globl _g_TRGFLG
	.globl _g_STATFL
	.globl _g_RG7SAV
	.globl _g_RG6SAV
	.globl _g_RG5SAV
	.globl _g_RG4SAV
	.globl _g_RG3SAV
	.globl _g_RG2SAV
	.globl _g_RG1SAV
	.globl _g_RG0SAV
	.globl _g_CNSDFG
	.globl _g_USRTAB
	.globl _g_CLPRIM
	.globl _g_WRPRIM
	.globl _g_RDPRIM
	.globl _TickAI
	.globl _PenaltyShots
	.globl _TeamVictory
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
_g_LINL40	=	0xf3ae
_g_LINL32	=	0xf3af
_g_LINLEN	=	0xf3b0
_g_CRTCNT	=	0xf3b1
_g_CLMLST	=	0xf3b2
_g_TXTNAM	=	0xf3b3
_g_TXTCOL	=	0xf3b5
_g_TXTCGP	=	0xf3b7
_g_TXTATR	=	0xf3b9
_g_TXTPAT	=	0xf3bb
_g_T32NAM	=	0xf3bd
_g_T32COL	=	0xf3bf
_g_T32CGP	=	0xf3c1
_g_T32ATR	=	0xf3c3
_g_T32PAT	=	0xf3c5
_g_GRPNAM	=	0xf3c7
_g_GRPCOL	=	0xf3c9
_g_GRPCGP	=	0xf3cb
_g_GRPATR	=	0xf3cd
_g_GRPPAT	=	0xf3cf
_g_MLTNAM	=	0xf3d1
_g_MLTCOL	=	0xf3d3
_g_MLTCGP	=	0xf3d5
_g_MLTATR	=	0xf3d7
_g_MLTPAT	=	0xf3d9
_g_CLIKSW	=	0xf3db
_g_CSRY	=	0xf3dc
_g_CSRX	=	0xf3dd
_g_FORCLR	=	0xf3e9
_g_BAKCLR	=	0xf3ea
_g_BDRCLR	=	0xf3eb
_g_ATRBYT	=	0xf3f2
_g_FNKSTR	=	0xf87f
_g_CLOC	=	0xf92a
_g_CMASK	=	0xf92c
_g_LOGOPR	=	0xfb02
_g_GRPACX	=	0xfcb7
_g_GRPACY	=	0xfcb9
_g_SLTSL	=	0xffff
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
	.area _SEG22
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:40: void TickAI(u8 playerId){
;	---------------------------------
; Function TickAI
; ---------------------------------
_TickAI::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-38
	add	hl, sp
	ld	sp, hl
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:41: if(g_MatchStatus==MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER){
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jr	Z, 00649$
	sub	a, #0x0d
	jp	NZ,00662$
00649$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:47: u16 refX = g_Players[playerId].X;
	ld	c, -3 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-2 (ix), l
	ld	-1 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:44: if (playerId == REFEREE) {
	ld	a, -3 (ix)
	sub	a, #0x0e
	jp	NZ,00174$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:45: u16 ballX = g_Ball.X;
	ld	bc, (#_g_Ball + 2)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:46: u16 ballY = g_Ball.Y;
	ld	de, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:47: u16 refX = g_Players[playerId].X;
	ld	a, #<(_g_Players)
	add	a, -2 (ix)
	ld	-15 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -1 (ix)
	ld	-14 (ix), a
	ld	a, -15 (ix)
	add	a, #0x02
	ld	-13 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:48: u16 refY = g_Players[playerId].Y;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:52: u16 targetY = ballY;
	ld	-7 (ix), e
	ld	-6 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:55: if (ballY > 230 && ballY < 260 && ballX > 110 && ballX < 140) {
	ld	-5 (ix), c
	ld	-4 (ix), b
	ld	a, #0xe6
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00107$
	ld	a, e
	sub	a, #0x04
	ld	a, d
	sbc	a, #0x01
	jr	NC, 00107$
	ld	a, #0x6e
	cp	a, -5 (ix)
	ld	a, #0x00
	sbc	a, -4 (ix)
	jr	NC, 00107$
	ld	a, -5 (ix)
	sub	a, #0x8c
	ld	a, -4 (ix)
	sbc	a, #0x00
	jr	NC, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:56: targetY = ballY - 40; 
	ld	a, e
	add	a, #0xd8
	ld	c, a
	ld	a, d
	adc	a, #0xff
	ld	-7 (ix), c
	ld	-6 (ix), a
	jp	00108$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:59: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#_g_Ball + 6)
	cp	a, #0xff
	jr	Z, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:60: if (g_Players[g_Ball.PossessionPlayerId].TeamId == TEAM_1) targetY = ballY - 20;
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #_g_Players
	add	hl, bc
	ld	bc, #0x0009
	add	hl, bc
	ld	a, (hl)
	dec	a
	jr	NZ, 00102$
	ld	a, e
	add	a, #0xec
	ld	c, a
	ld	a, d
	adc	a, #0xff
	ld	-7 (ix), c
	ld	-6 (ix), a
	jp	00108$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:61: else targetY = ballY + 20;
	ld	hl, #0x0014
	add	hl, de
	ld	-7 (ix), l
	ld	-6 (ix), h
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:72: if (ballX < 128) targetX = ballX + 60; // Ball Left -> Ref Right
	ld	a, -5 (ix)
	sub	a, #0x80
	ld	a, -4 (ix)
	sbc	a, #0x00
	jr	NC, 00113$
	ld	a, -5 (ix)
	add	a, #0x3c
	ld	c, a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	b, a
	jp	00114$
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:73: else targetX = ballX - 60;             // Ball Right -> Ref Left
	ld	a, -5 (ix)
	add	a, #0xc4
	ld	-2 (ix), a
	ld	a, -4 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	c, -2 (ix)
	ld	b, -1 (ix)
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:76: if (targetX < FIELD_BOUND_X_LEFT + 10) targetX = FIELD_BOUND_X_LEFT + 10;
	ld	a, c
	sub	a, #0x14
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00116$
	ld	bc, #0x0014
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:77: if (targetX > FIELD_BOUND_X_RIGHT - 10) targetX = FIELD_BOUND_X_RIGHT - 10;
	ld	a, #0xec
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00118$
	ld	bc, #0x00ec
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:82: u8 moveDir = DIRECTION_NONE;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:83: i16 diffY = (i16)targetY - (i16)refY;
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	cp	a, a
	sbc	hl, de
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:84: i16 diffX = (i16)targetX - (i16)refX;
	ld	l, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:87: if (diffY < -8) moveDir = DIRECTION_UP;
	ld	a, e
	sub	a, #0xf8
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00122$
	ld	-1 (ix), #0x01
	jp	00123$
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:88: else if (diffY > 8) moveDir = DIRECTION_DOWN;
	ld	a, #0x08
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 02049$
	xor	a, #0x80
02049$:
	jp	P, 00123$
	ld	-1 (ix), #0x05
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:91: bool moveX = false;
	ld	e, #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:92: if (diffX < -16) moveX = true; // Need to go Left
	ld	a, c
	sub	a, #0xf0
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00127$
	ld	e, #0x01
	jp	00128$
00127$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:93: else if (diffX > 16) moveX = true; // Need to go Right
	ld	d, c
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x10
	cp	a, d
	ld	a, #0x00
	sbc	a, l
	jp	PO, 02050$
	xor	a, #0x80
02050$:
	jp	P, 00128$
	ld	e, #0x01
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:95: if (moveX) {
	ld	a, e
	or	a, a
	jr	Z, 00145$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:93: else if (diffX > 16) moveX = true; // Need to go Right
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:97: if (diffX > 0) moveDir = DIRECTION_UP_RIGHT;
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 02051$
	xor	a, #0x80
02051$:
	rlca
	and	a,#0x01
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:96: if (moveDir == DIRECTION_UP) {
	ld	a, -1 (ix)
	dec	a
	jr	NZ, 00142$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:97: if (diffX > 0) moveDir = DIRECTION_UP_RIGHT;
	ld	a, c
	or	a, a
	jr	Z, 00130$
	ld	-1 (ix), #0x02
	jp	00145$
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:98: else moveDir = DIRECTION_UP_LEFT;
	ld	-1 (ix), #0x08
	jp	00145$
00142$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:99: } else if (moveDir == DIRECTION_DOWN) {
	ld	a, -1 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:100: if (diffX > 0) moveDir = DIRECTION_DOWN_RIGHT;
	sub	a,#0x05
	jr	NZ, 00139$
	or	a,c
	jr	Z, 00133$
	ld	-1 (ix), #0x04
	jp	00145$
00133$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:101: else moveDir = DIRECTION_DOWN_LEFT;
	ld	-1 (ix), #0x06
	jp	00145$
00139$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:103: if (diffX > 0) moveDir = DIRECTION_RIGHT;
	ld	a, c
	or	a, a
	jr	Z, 00136$
	ld	-1 (ix), #0x03
	jp	00145$
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:104: else moveDir = DIRECTION_LEFT;
	ld	-1 (ix), #0x07
00145$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:108: g_Players[playerId].Direction = moveDir;
	ld	a, -15 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, -1 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:111: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	(bc), a
	ld	e, a
	ld	a, -1 (ix)
	dec	a
	jr	Z, 00146$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:112: g_Players[playerId].Direction == DIRECTION_UP_RIGHT ||
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:113: g_Players[playerId].Direction == DIRECTION_UP_LEFT) {
	ld	a,e
	cp	a,#0x02
	jr	Z, 00146$
	sub	a, #0x08
	jr	NZ, 00147$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:114: g_Players[playerId].Y--;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00147$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:111: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	a, (bc)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:116: if (g_Players[playerId].Direction == DIRECTION_DOWN ||
	cp	a, #0x05
	jr	Z, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:117: g_Players[playerId].Direction == DIRECTION_DOWN_RIGHT ||
	cp	a, #0x04
	jr	Z, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:118: g_Players[playerId].Direction == DIRECTION_DOWN_LEFT) {
	sub	a, #0x06
	jr	NZ, 00151$
00150$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:119: g_Players[playerId].Y++;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00151$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:111: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	a, (bc)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:121: if (g_Players[playerId].Direction == DIRECTION_LEFT ||
	cp	a, #0x07
	jr	Z, 00154$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:122: g_Players[playerId].Direction == DIRECTION_UP_LEFT ||
	cp	a, #0x08
	jr	Z, 00154$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:123: g_Players[playerId].Direction == DIRECTION_DOWN_LEFT) {
	sub	a, #0x06
	jr	NZ, 00155$
00154$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:124: g_Players[playerId].X--;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:111: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	a, (bc)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:126: if (g_Players[playerId].Direction == DIRECTION_RIGHT ||
	cp	a, #0x03
	jr	Z, 00158$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:127: g_Players[playerId].Direction == DIRECTION_UP_RIGHT ||
	cp	a, #0x02
	jr	Z, 00158$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:128: g_Players[playerId].Direction == DIRECTION_DOWN_RIGHT) {
	sub	a, #0x04
	jr	NZ, 00159$
00158$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:129: g_Players[playerId].X++;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00159$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:133: if(g_Players[playerId].Y < FIELD_BOUND_Y_TOP) g_Players[playerId].Y = FIELD_BOUND_Y_TOP;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x32
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00163$
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), #0x32
	inc	hl
	ld	(hl), #0x00
00163$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:134: if(g_Players[playerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[playerId].Y = FIELD_BOUND_Y_BOTTOM;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xae
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	jr	NC, 00165$
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), #0xae
	inc	hl
	ld	(hl), #0x01
00165$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:135: if(g_Players[playerId].X < FIELD_BOUND_X_LEFT) g_Players[playerId].X = FIELD_BOUND_X_LEFT;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x0a
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00167$
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x0a
	inc	hl
	ld	(hl), #0x00
00167$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:136: if(g_Players[playerId].X > FIELD_BOUND_X_RIGHT) g_Players[playerId].X = FIELD_BOUND_X_RIGHT;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xf6
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00169$
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0xf6
	inc	hl
	ld	(hl), #0x00
00169$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:142: g_Players[playerId].Status = PLAYER_STATUS_NONE; // Force not positioned
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x0012
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:141: if (moveDir != DIRECTION_NONE) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00171$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:142: g_Players[playerId].Status = PLAYER_STATUS_NONE; // Force not positioned
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00662$
00171$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:144: g_Players[playerId].Status = PLAYER_STATUS_POSITIONED; // Allow rest
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:147: return;
	jp	00662$
00174$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:150: u8 playerTeamId = g_Players[playerId].TeamId;
	ld	a, #<(_g_Players)
	add	a, -2 (ix)
	ld	-38 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -1 (ix)
	ld	-37 (ix), a
	pop	bc
	push	bc
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	ld	-36 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:151: bool ballPossessionByPlayerTeam = false;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:152: const TeamStats* stats = GetTeamStats(playerTeamId);
	ld	a, -36 (ix)
	call	_GetTeamStats
	ld	-35 (ix), e
	ld	-34 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:154: if (g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0d
	jr	NZ, 00187$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:157: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#(_g_Ball + 6) + 0)
	ld	-1 (ix), a
	inc	a
	jp	Z,00188$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:158: if (g_Players[g_Ball.PossessionPlayerId].TeamId == playerTeamId) ballPossessionByPlayerTeam = true;
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	a, #<(_g_Players)
	add	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -4 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a,-36 (ix)
	sub	a,(hl)
	jr	NZ, 00188$
	ld	-6 (ix), #0x01
	jp	00188$
00187$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:162: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#_g_Ball + 6)
	ld	-1 (ix), a
	inc	a
	jr	Z, 00184$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:163: if (g_Players[g_Ball.PossessionPlayerId].TeamId == playerTeamId) {
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	a, #<(_g_Players)
	add	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -4 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a,-36 (ix)
	sub	a,(hl)
	jr	NZ, 00188$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:164: ballPossessionByPlayerTeam = true;
	ld	-6 (ix), #0x01
	jp	00188$
00184$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:168: if (g_Ball.LastTouchTeamId == playerTeamId) {
	ld	hl, #_g_Ball + 14
	ld	a,-36 (ix)
	sub	a,(hl)
	jr	NZ, 00188$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:169: ballPossessionByPlayerTeam = true;
	ld	-6 (ix), #0x01
00188$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:177: if (ballPossessionByPlayerTeam) {
	ld	a, -6 (ix)
	or	a, a
	jp	Z, 00481$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:180: if (g_Ball.PossessionPlayerId == playerId) {
	ld	a, (#_g_Ball + 6)
	ld	-1 (ix), a
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jp	NZ,00360$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:183: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) return;
	pop	bc
	push	bc
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	ld	-33 (ix), a
	or	a, a
	jp	Z,00662$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:189: if (playerTeamId == TEAM_1) { 
	ld	a, -36 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 02085$
	xor	a, a
02085$:
	ld	-32 (ix), a
	or	a, a
	jr	Z, 00192$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:190: targetY_Goal = goalTopY - 20; 
	ld	-31 (ix), #0x37
	ld	-30 (ix), #0
	jp	00193$
00192$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:192: targetY_Goal = goalBottomY + 20;
	ld	-31 (ix), #0xa9
	ld	-30 (ix), #0x01
00193$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:196: targetX_Goal = g_Players[playerId].X;
	ld	a, -38 (ix)
	add	a, #0x02
	ld	-29 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-28 (ix), a
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	a, (hl)
	ld	-27 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-26 (ix), a
	ld	a, -27 (ix)
	ld	-25 (ix), a
	ld	a, -26 (ix)
	ld	-24 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:197: if (targetX_Goal > 100 && targetX_Goal < 156) {
	ld	c, -25 (ix)
	ld	b, -24 (ix)
	ld	a, #0x64
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00198$
	ld	a, c
	sub	a, #0x9c
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:198: if ((g_Players[playerId].Role % 2) != 0) targetX_Goal = 60; // Go Left
	bit	0, -33 (ix)
	jr	Z, 00195$
	ld	-25 (ix), #0x3c
	ld	-24 (ix), #0
	jp	00198$
00195$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:199: else targetX_Goal = 190; // Go Right
	ld	-25 (ix), #0xbe
	ld	-24 (ix), #0
00198$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:202: if (targetX_Goal < FIELD_BOUND_X_LEFT + 20) targetX_Goal = FIELD_BOUND_X_LEFT + 20;
	ld	a, -25 (ix)
	sub	a, #0x1e
	ld	a, -24 (ix)
	sbc	a, #0x00
	jr	NC, 00201$
	ld	-25 (ix), #0x1e
	ld	-24 (ix), #0
00201$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:203: if (targetX_Goal > FIELD_BOUND_X_RIGHT - 20) targetX_Goal = FIELD_BOUND_X_RIGHT - 20;
	ld	a, #0xe2
	cp	a, -25 (ix)
	ld	a, #0x00
	sbc	a, -24 (ix)
	jr	NC, 00203$
	ld	-25 (ix), #0xe2
	ld	-24 (ix), #0
00203$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:207: bool obstacleRight = false;
	ld	-23 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:208: bool obstacleLeft = false;
	ld	-22 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:209: bool obstacleFront = false;
	ld	-21 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:210: bool obstacleFrontNonGK = false;
	ld	-20 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:211: bool dangerousOpponent = false;
	ld	-19 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:214: for(i=0; i<14; i++) { 
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-18 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-17 (ix), a
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00652$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:215: if (g_Players[i].TeamId == playerTeamId) continue;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	a, -5 (ix)
	add	a, #<(_g_Players)
	ld	-16 (ix), a
	ld	a, -4 (ix)
	adc	a, #>(_g_Players)
	ld	-15 (ix), a
	ld	c, -16 (ix)
	ld	b, -15 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a,-36 (ix)
	sub	a,(hl)
	jp	Z,00244$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:216: if (g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -16 (ix)
	ld	b, -15 (ix)
	ld	hl, #18
	add	hl, bc
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00244$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:217: if (i == playerId) continue;
	ld	c, -3 (ix)
	ld	b, #0x00
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	cp	a, a
	sbc	hl, bc
	jp	Z,00244$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:219: i16 relX = (i16)g_Players[i].X - (i16)g_Players[playerId].X;
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ex	de, hl
	ld	c, -27 (ix)
	ld	b, -26 (ix)
	cp	a, a
	sbc	hl, bc
	ld	-14 (ix), l
	ld	-13 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:220: i16 relY = (i16)g_Players[i].Y - (i16)g_Players[playerId].Y;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ex	de, hl
	ld	c, -18 (ix)
	ld	b, -17 (ix)
	cp	a, a
	sbc	hl, bc
	ld	-12 (ix), l
	ld	-11 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:226: bool isFront = false;
	ld	-10 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:227: bool isBehind = false;
	ld	-4 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:230: if (relY < 0 && relY > -obstacleDetDist) isFront = true;
	ld	a, -12 (ix)
	ld	-9 (ix), a
	ld	a, -11 (ix)
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:229: if (playerTeamId == TEAM_1) { // Moving UP (Y decreases)
	ld	a, -32 (ix)
	or	a, a
	jr	Z, 00221$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:230: if (relY < 0 && relY > -obstacleDetDist) isFront = true;
	ld	a, -8 (ix)
	rlca
	and	a,#0x01
	ld	c, a
	or	a, a
	jr	Z, 00211$
	ld	a, #0xe0
	cp	a, -9 (ix)
	ld	a, #0xff
	sbc	a, -8 (ix)
	jp	PO, 02089$
	xor	a, #0x80
02089$:
	jp	P, 00211$
	ld	-10 (ix), #0x01
00211$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:231: if (relY >= 0) isBehind = true;
	bit	0, c
	jr	NZ, 00222$
	ld	-4 (ix), #0x01
	jp	00222$
00221$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:233: if (relY > 0 && relY < obstacleDetDist) isFront = true;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 02090$
	xor	a, #0x80
02090$:
	rlca
	and	a,#0x01
	ld	c, a
	or	a, a
	jr	Z, 00216$
	ld	a, -12 (ix)
	sub	a, #0x20
	ld	a, -11 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00216$
	ld	-10 (ix), #0x01
00216$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:234: if (relY <= 0) isBehind = true;
	bit	0, c
	jr	NZ, 00222$
	ld	-4 (ix), #0x01
00222$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:239: u8 safeDist = isBehind ? 12 : 16; 
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00664$
	ld	bc, #0x000c
	jp	00665$
00664$:
	ld	bc, #0x0010
00665$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:240: if (relX > -safeDist && relX < safeDist && relY > -safeDist && relY < safeDist) {
	ld	a, c
	ld	b, #0x00
	neg
	ld	-7 (ix), a
	sbc	a, a
	sub	a, b
	ld	-6 (ix), a
	ld	a, -14 (ix)
	ld	-5 (ix), a
	ld	a, -13 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	sub	a, -5 (ix)
	ld	a, -6 (ix)
	sbc	a, -4 (ix)
	jp	PO, 02091$
	xor	a, #0x80
02091$:
	jp	P, 00224$
	ld	b, #0x00
	ld	a, -14 (ix)
	sub	a, c
	ld	a, -13 (ix)
	sbc	a, b
	jp	PO, 02092$
	xor	a, #0x80
02092$:
	jp	P, 00224$
	ld	a, -7 (ix)
	sub	a, -9 (ix)
	ld	a, -6 (ix)
	sbc	a, -8 (ix)
	jp	PO, 02093$
	xor	a, #0x80
02093$:
	jp	P, 00224$
	ld	a, -12 (ix)
	sub	a, c
	ld	a, -11 (ix)
	sbc	a, b
	jp	PO, 02094$
	xor	a, #0x80
02094$:
	jp	P, 00224$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:241: dangerousOpponent = true;
	ld	-19 (ix), #0x01
00224$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:245: if (isFront && relX > -10 && relX < 10) {
	ld	a, -10 (ix)
	or	a, a
	jr	Z, 00231$
	ld	a, #0xf6
	cp	a, -14 (ix)
	ld	a, #0xff
	sbc	a, -13 (ix)
	jp	PO, 02095$
	xor	a, #0x80
02095$:
	jp	P, 00231$
	ld	a, -5 (ix)
	sub	a, #0x0a
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00231$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:246: obstacleFront = true;
	ld	-21 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:247: if (g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) obstacleFrontNonGK = true;
	ld	c, -16 (ix)
	ld	b, -15 (ix)
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00231$
	ld	-20 (ix), #0x01
00231$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:250: if (isFront || (relY < 18 && relY > -18)) { 
	ld	a, -10 (ix)
	or	a, a
	jr	NZ, 00240$
	ld	a, -9 (ix)
	sub	a, #0x12
	ld	a, -8 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00244$
	ld	a, #0xee
	cp	a, -12 (ix)
	ld	a, #0xff
	sbc	a, -11 (ix)
	jp	PO, 02096$
	xor	a, #0x80
02096$:
	jp	P, 00244$
00240$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:251: if (relX >= 0 && relX < 24) obstacleRight = true; // Obstacle is to my right
	ld	a, -4 (ix)
	rlca
	and	a,#0x01
	ld	-6 (ix), a
	bit	0, -6 (ix)
	jr	NZ, 00235$
	ld	a, -5 (ix)
	sub	a, #0x18
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00235$
	ld	-23 (ix), #0x01
00235$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:252: if (relX < 0 && relX > -24) obstacleLeft = true; // Obstacle is to my left
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00244$
	ld	a, #0xe8
	cp	a, -14 (ix)
	ld	a, #0xff
	sbc	a, -13 (ix)
	jp	PO, 02097$
	xor	a, #0x80
02097$:
	jp	P, 00244$
	ld	-22 (ix), #0x01
00244$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:214: for(i=0; i<14; i++) { 
	inc	-2 (ix)
	jr	NZ, 02098$
	inc	-1 (ix)
02098$:
	ld	a, -2 (ix)
	sub	a, #0x0e
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00652$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:261: bool isHumanControlled = false;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:262: if ((playerTeamId == TEAM_1 && g_Team1ActivePlayer == playerId) || 
	ld	a, -32 (ix)
	or	a, a
	jr	Z, 00258$
	ld	a, (_g_Team1ActivePlayer+0)
	sub	a, -3 (ix)
	jr	Z, 00253$
00258$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:263: (playerTeamId == TEAM_2 && g_GameWith2Players && g_Team2ActivePlayer == playerId)) {
	ld	a, -36 (ix)
	sub	a, #0x02
	jr	NZ, 00254$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00254$
	ld	a, (_g_Team2ActivePlayer+0)
	sub	a, -3 (ix)
	jr	NZ, 00254$
00253$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:264: isHumanControlled = true;
	ld	-6 (ix), #0x01
00254$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:267: if (!isHumanControlled) {
	ld	a, -6 (ix)
	or	a, a
	jp	NZ, 00296$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:269: bool inRealShootingRange = false;
	ld	-5 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:270: bool inDangerousZone = false;
	ld	-4 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:273: if (playerTeamId == TEAM_1) {
	ld	a, -32 (ix)
	or	a, a
	jr	Z, 00268$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:277: if (g_Players[playerId].Y < (FIELD_BOUND_Y_TOP + 90)) inRealShootingRange = true;
	ld	a, -18 (ix)
	ld	-2 (ix), a
	ld	a, -17 (ix)
	ld	-1 (ix), a
	ld	a, -18 (ix)
	sub	a, #0x8c
	ld	a, -17 (ix)
	sbc	a, #0x00
	jr	NC, 00260$
	ld	-5 (ix), #0x01
00260$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:280: if (g_Players[playerId].Y < (FIELD_BOUND_Y_TOP + 60)) inDangerousZone = true; 
	ld	a, -2 (ix)
	sub	a, #0x6e
	ld	a, -1 (ix)
	sbc	a, #0x00
	jr	NC, 00262$
	ld	-4 (ix), #0x01
00262$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:281: goalTargetY = FIELD_BOUND_Y_TOP - 40; 
	ld	-2 (ix), #0x0a
	ld	-1 (ix), #0
	jp	00269$
00268$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:285: if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 90)) inRealShootingRange = true;
	ld	a, -18 (ix)
	ld	-2 (ix), a
	ld	a, -17 (ix)
	ld	-1 (ix), a
	ld	a, #0x54
	cp	a, -2 (ix)
	ld	a, #0x01
	sbc	a, -1 (ix)
	jr	NC, 00264$
	ld	-5 (ix), #0x01
00264$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:288: if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 60)) inDangerousZone = true;
	ld	a, #0x72
	cp	a, -2 (ix)
	ld	a, #0x01
	sbc	a, -1 (ix)
	jr	NC, 00266$
	ld	-4 (ix), #0x01
00266$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:289: goalTargetY = FIELD_BOUND_Y_BOTTOM + 40; 
	ld	-2 (ix), #0xd6
	ld	-1 (ix), #0x01
00269$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:293: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -33 (ix)
	or	a, a
	jr	NZ, 00271$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:294: inRealShootingRange = false;
	ld	-5 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:295: inDangerousZone = false;
	ld	-4 (ix), #0x00
00271$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:298: if (inRealShootingRange) {
	ld	a, -5 (ix)
	or	a, a
	jp	Z, 00296$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:307: bool clearShot = !obstacleFrontNonGK;
	ld	a, -20 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:310: if (inDangerousZone) clearShot = true;
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00273$
	ld	c, #0x01
00273$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:313: if (playerTeamId == TEAM_1) {
	ld	a, -32 (ix)
	or	a, a
	jr	Z, 00285$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:314: if (g_Players[playerId].Y < (FIELD_BOUND_Y_TOP + 20)) {
	ld	a, -18 (ix)
	sub	a, #0x46
	ld	a, -17 (ix)
	sbc	a, #0x00
	jr	NC, 00286$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:315: if (g_Players[playerId].X < (GOAL_X_MIN - 5) || g_Players[playerId].X > (GOAL_X_MAX + 5)) clearShot = false;
	ld	a, -27 (ix)
	sub	a, #0x5b
	ld	a, -26 (ix)
	sbc	a, #0x00
	jr	C, 00274$
	ld	a, #0x95
	cp	a, -27 (ix)
	ld	a, #0x00
	sbc	a, -26 (ix)
	jr	NC, 00286$
00274$:
	ld	c, #0x00
	jp	00286$
00285$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:318: if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 20)) {
	ld	b, -18 (ix)
	ld	e, -17 (ix)
	ld	a, #0x9a
	cp	a, b
	ld	a, #0x01
	sbc	a, e
	jr	NC, 00286$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:319: if (g_Players[playerId].X < (GOAL_X_MIN - 5) || g_Players[playerId].X > (GOAL_X_MAX + 5)) clearShot = false;
	ld	a, -27 (ix)
	sub	a, #0x5b
	ld	a, -26 (ix)
	sbc	a, #0x00
	jr	C, 00279$
	ld	a, #0x95
	cp	a, -27 (ix)
	ld	a, #0x00
	sbc	a, -26 (ix)
	jr	NC, 00286$
00279$:
	ld	c, #0x00
00286$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:325: if (clearShot) {
	ld	a, c
	or	a, a
	jr	Z, 00296$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:327: if ((g_FrameCounter % 10) > stats->ShotFreq) return;
	ld	bc, (_g_FrameCounter)
	push	bc
	ld	de, #0x000a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__moduint
	pop	bc
	ld	l, -35 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -34 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	h, a
	sbc	hl, de
	jp	C,00662$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:329: u16 shotX = 86 + ((g_FrameCounter + playerId * 13) % 68);
	ld	e, -3 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	de, #0x0044
	call	__moduint
	ld	hl, #0x0056
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:330: PerformShot(shotX, goalTargetY);
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	call	_PerformShot
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:331: return;
	jp	00662$
00296$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:337: bool shouldPass = false;
	ld	-4 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:338: bool isPanicPass = false;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:344: bool checkPassing = false;
	ld	-2 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:346: if (dangerousOpponent) {
	ld	a, -19 (ix)
	or	a, a
	jr	Z, 00307$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:348: shouldPass = true;
	ld	-4 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:349: isPanicPass = true;
	ld	-1 (ix), #0x01
	jp	00308$
00307$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:351: else if (obstacleFront) {
	ld	a, -21 (ix)
	or	a, a
	jr	Z, 00304$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:354: bool canGoRight = (g_Players[playerId].X < FIELD_BOUND_X_RIGHT - 20) && !obstacleRight;
	ld	a, -27 (ix)
	sub	a, #0xe2
	ld	a, -26 (ix)
	sbc	a, #0x00
	jr	NC, 00666$
	ld	a, -23 (ix)
	or	a, a
	jr	Z, 00667$
00666$:
	ld	-4 (ix), #0x00
	jp	00668$
00667$:
	ld	-4 (ix), #0x01
00668$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:355: bool canGoLeft = (g_Players[playerId].X > FIELD_BOUND_X_LEFT + 20) && !obstacleLeft;
	ld	a, #0x1e
	cp	a, -27 (ix)
	ld	a, #0x00
	sbc	a, -26 (ix)
	jr	NC, 00669$
	ld	a, -22 (ix)
	or	a, a
	jr	Z, 00670$
00669$:
	ld	-5 (ix), #0x00
	jp	00671$
00670$:
	ld	-5 (ix), #0x01
00671$:
	ld	c, -5 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:357: if (canGoRight || canGoLeft) {
	ld	a, -4 (ix)
	or	a,a
	jr	NZ, 00297$
	or	a,c
	jr	Z, 00298$
00297$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:359: shouldPass = false;
	ld	-4 (ix), #0x00
	jp	00308$
00298$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:362: shouldPass = true;
	ld	-4 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:363: isPanicPass = true;
	ld	-1 (ix), #0x01
	jp	00308$
00304$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:369: if ((g_FrameCounter % 10) < stats->PassFreq) checkPassing = true;
	ld	hl, (_g_FrameCounter)
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	de, #0x000a
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__moduint
	ld	-10 (ix), e
	ld	-9 (ix), d
	ld	a, -35 (ix)
	ld	-8 (ix), a
	ld	a, -34 (ix)
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	-8 (ix), a
	ld	-7 (ix), #0x00
	ld	a, -10 (ix)
	sub	a, -8 (ix)
	ld	a, -9 (ix)
	sbc	a, -7 (ix)
	jr	NC, 00308$
	ld	-2 (ix), #0x01
00308$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:372: if (checkPassing) {
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00310$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:375: shouldPass = true; 
	ld	-4 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:376: isPanicPass = false;
	ld	-1 (ix), #0x00
00310$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:379: if (shouldPass) {
	ld	a, -4 (ix)
	or	a, a
	jp	Z, 00347$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:380: if (!isHumanControlled) {
	ld	a, -6 (ix)
	or	a, a
	jp	NZ, 00347$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:381: u8 bestT = NO_VALUE;
	ld	-14 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:382: i16 bestScore = -30000;
	ld	-13 (ix), #0xd0
	ld	-12 (ix), #0x8a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:384: for(t=0; t<14; t++) {
	xor	a, a
	ld	-5 (ix), a
	ld	-4 (ix), a
00653$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:385: if(g_Players[t].TeamId != playerTeamId) continue;
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_g_Players
	add	hl, de
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	c, l
	ld	b, h
	ld	hl, #9
	add	hl, bc
	ld	a,-36 (ix)
	sub	a,(hl)
	jp	NZ,00336$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:386: if(t == playerId) continue;
	ld	c, -3 (ix)
	ld	b, #0x00
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	cp	a, a
	sbc	hl, bc
	jp	Z,00336$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:387: if(g_Players[t].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	ld	hl, #18
	add	hl, bc
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00336$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:388: if(g_Players[t].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00336$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:391: if (IsOffside(t)) continue;
	ld	a, -5 (ix)
	ld	-2 (ix), a
	call	_IsOffside
	or	a, a
	jp	NZ, 00336$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:393: i16 dx = (i16)g_Players[t].X - (i16)g_Players[playerId].X;
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:394: i16 dy = (i16)g_Players[t].Y - (i16)g_Players[playerId].Y;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	pop	hl
	push	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	-9 (ix), e
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:395: u16 adx = (dx < 0) ? -dx : dx;
	ld	e, c
	ld	d, b
	bit	7, d
	jr	Z, 00672$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	jp	00673$
00672$:
	ld	a, b
00673$:
	ld	-7 (ix), c
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:396: u16 ady = (dy < 0) ? -dy : dy;
	ld	b, -8 (ix)
	bit	7, b
	jr	Z, 00674$
	xor	a, a
	sub	a, -9 (ix)
	ld	-16 (ix), a
	sbc	a, a
	sub	a, -8 (ix)
	ld	-15 (ix), a
	jp	00675$
00674$:
	ld	a, -9 (ix)
	ld	-16 (ix), a
	ld	a, -8 (ix)
	ld	-15 (ix), a
00675$:
	ld	c, -16 (ix)
	ld	b, -15 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:397: if (adx < 40 && ady < 40) continue; // Minimum pass distance
	ld	a, -7 (ix)
	sub	a, #0x28
	ld	a, -6 (ix)
	sbc	a, #0x00
	jr	NC, 00322$
	ld	a, c
	sub	a, #0x28
	ld	a, b
	sbc	a, #0x00
	jp	C, 00336$
00322$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:400: if (g_Players[t].Y < g_FieldCurrentYPosition - 40 || 
	ld	a, (_g_FieldCurrentYPosition+0)
	add	a, #0xd8
	ld	e, a
	ld	a, (_g_FieldCurrentYPosition+1)
	adc	a, #0xff
	ld	d, a
	ld	c, -11 (ix)
	ld	b, -10 (ix)
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jr	C, 00336$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:401: g_Players[t].Y > (g_FieldCurrentYPosition + 252)) continue;
	ld	hl, (_g_FieldCurrentYPosition)
	ld	de, #0x00fc
	add	hl, de
	xor	a, a
	sbc	hl, bc
	jr	C, 00336$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:403: i16 advanceScore = (playerTeamId == TEAM_1) ? -dy : dy;
	ld	a, -32 (ix)
	or	a, a
	jr	Z, 00676$
	xor	a, a
	sub	a, -9 (ix)
	ld	e, a
	sbc	a, a
	sub	a, -8 (ix)
	ld	d, a
	jp	00677$
00676$:
	ld	e, -9 (ix)
	ld	d, -8 (ix)
00677$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:407: if (advanceScore < 40) continue; // Must gain at least 40px ground
	ld	c, e
	ld	b, d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:406: if (!isPanicPass) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00332$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:407: if (advanceScore < 40) continue; // Must gain at least 40px ground
	ld	a, c
	sub	a, #0x28
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00333$
	jp	00336$
00332$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:410: if (advanceScore < -150) continue;
	ld	a, c
	sub	a, #0x6a
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00336$
00333$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:413: i16 score = advanceScore - (adx/4); // Minimal lateral penalty
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	srl	b
	rr	c
	srl	b
	rr	c
	ex	de, hl
	cp	a, a
	sbc	hl, bc
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:415: if (score > bestScore) {
	ld	a, -13 (ix)
	sub	a, e
	ld	a, -12 (ix)
	sbc	a, d
	jp	PO, 02107$
	xor	a, #0x80
02107$:
	jp	P, 00336$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:416: bestScore = score;
	ld	-13 (ix), e
	ld	-12 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:417: bestT = t;
	ld	a, -2 (ix)
	ld	-14 (ix), a
00336$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:384: for(t=0; t<14; t++) {
	inc	-5 (ix)
	jr	NZ, 02108$
	inc	-4 (ix)
02108$:
	ld	a, -5 (ix)
	sub	a, #0x0e
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00653$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:422: if (bestT != NO_VALUE) {
	ld	a, -14 (ix)
	inc	a
	jr	Z, 00347$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:425: i16 threshold = isPanicPass ? -80 : 10;
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00678$
	ld	-2 (ix), #0xb0
	ld	-1 (ix), #0xff
	jp	00679$
00678$:
	ld	-2 (ix), #0x0a
	ld	-1 (ix), #0
00679$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:427: if (bestScore > threshold) {
	ld	a, -2 (ix)
	sub	a, -13 (ix)
	ld	a, -1 (ix)
	sbc	a, -12 (ix)
	jp	PO, 02110$
	xor	a, #0x80
02110$:
	jp	P, 00347$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:428: if (g_Ball.PossessionTimer < 15) return; // Wait 15 frames before passing
	ld	a, (#_g_Ball + 28)
	ld	-1 (ix), a
	sub	a, #0x0f
	jp	C,00662$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:429: PerformPass(bestT);
	ld	a, -14 (ix)
	call	_PerformPass
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:430: return; // End tick
	jp	00662$
00347$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:436: u16 finalTargetX = targetX_Goal;
	ld	a, -25 (ix)
	ld	-2 (ix), a
	ld	a, -24 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:437: u16 finalTargetY = targetY_Goal;
	ld	a, -31 (ix)
	ld	-5 (ix), a
	ld	a, -30 (ix)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:439: if (obstacleFront) {
	ld	a, -21 (ix)
	or	a, a
	jp	Z, 00358$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:440: if (!obstacleRight) {
	ld	a, -23 (ix)
	or	a, a
	jr	NZ, 00355$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:441: finalTargetX = g_Players[playerId].X + 24;
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -1 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, #0x18
	ld	-2 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:442: if (finalTargetX > FIELD_BOUND_X_RIGHT) finalTargetX = FIELD_BOUND_X_RIGHT;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	a, #0xf6
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00358$
	ld	-2 (ix), #0xf6
	ld	-1 (ix), #0
	jp	00358$
00355$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:443: } else if (!obstacleLeft) {
	ld	a, -22 (ix)
	or	a, a
	jr	NZ, 00358$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:444: finalTargetX = g_Players[playerId].X - 24; 
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -1 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, #0xe8
	ld	-2 (ix), a
	ld	a, -6 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:445: if (finalTargetX < FIELD_BOUND_X_LEFT) finalTargetX = FIELD_BOUND_X_LEFT;
	ld	a, -2 (ix)
	ld	b, -1 (ix)
	sub	a, #0x0a
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00358$
	ld	-2 (ix), #0x0a
	ld	-1 (ix), #0
00358$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:448: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-7 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -4 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:449: g_Players[playerId].TargetX = finalTargetX;
	ld	a, -38 (ix)
	add	a, #0x10
	ld	-5 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:450: return; // IMPORTANT: Ball Carrier handled. Stop.
	jp	00662$
00360$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:456: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	a, -1 (ix)
	inc	a
	jr	NZ, 00364$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:458: if (GetClosestPlayerToBall(playerTeamId, NO_VALUE) == playerId) {
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -36 (ix)
	call	_GetClosestPlayerToBall
	ld	c, a
	ld	a, -3 (ix)
	sub	a, c
	jr	NZ, 00364$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:459: g_Players[playerId].TargetX = g_Ball.X;
	ld	a, -38 (ix)
	add	a, #0x10
	ld	c, a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	b, a
	ld	de, (#_g_Ball + 2)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:460: g_Players[playerId].TargetY = g_Ball.Y;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	c, a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	b, a
	ld	de, (#_g_Ball + 0)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:461: return;
	jp	00662$
00364$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:183: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) return;
	ld	a, -38 (ix)
	add	a, #0x0d
	ld	-9 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:495: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER || 
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:469: if (g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0d
	jp	NZ,00398$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:448: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	c, a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:472: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = 160;
	ld	a, -2 (ix)
	sub	a, #0x05
	ld	a, #0x00
	rla
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:471: if (playerTeamId == TEAM_1) { // Moving UP
	ld	a, -36 (ix)
	dec	a
	jr	NZ, 00378$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:472: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = 160;
	bit	0, -1 (ix)
	jr	NZ, 00369$
	ld	a, #0xa0
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	jp	00379$
00369$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:473: else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetY = 240;
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	C, 00366$
	ld	a, #0xf0
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	jp	00379$
00366$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:474: else g_Players[playerId].TargetY = 350;
	ld	a, #0x5e
	ld	(bc), a
	inc	bc
	ld	a, #0x01
	ld	(bc), a
	jp	00379$
00378$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:476: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = 320;
	bit	0, -1 (ix)
	jr	NZ, 00375$
	ld	a, #0x40
	ld	(bc), a
	inc	bc
	ld	a, #0x01
	ld	(bc), a
	jp	00379$
00375$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:477: else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetY = 240;
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	C, 00372$
	ld	a, #0xf0
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
	jp	00379$
00372$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:478: else g_Players[playerId].TargetY = 130;
	ld	a, #0x82
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
00379$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:482: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetX = 64;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
	cp	a, #0x05
	jr	NZ, 00395$
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x00
	jp	00662$
00395$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:483: else if (g_Players[playerId].Role == PLAYER_ROLE_RIGHT_STRIKER) g_Players[playerId].TargetX = 192;
	cp	a, #0x06
	jr	NZ, 00392$
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
	ld	(hl), #0xc0
	inc	hl
	ld	(hl), #0x00
	jp	00662$
00392$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:484: else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetX = 48;
	cp	a, #0x03
	jr	NZ, 00389$
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x00
	jp	00662$
00389$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:485: else if (g_Players[playerId].Role == PLAYER_ROLE_RIGHT_HALFFIELDER) g_Players[playerId].TargetX = 208;
	cp	a, #0x04
	jr	NZ, 00386$
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
	ld	(hl), #0xd0
	inc	hl
	ld	(hl), #0x00
	jp	00662$
00386$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:486: else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) g_Players[playerId].TargetX = 80;
	cp	a, #0x01
	jr	NZ, 00383$
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
	ld	(hl), #0x50
	inc	hl
	ld	(hl), #0x00
	jp	00662$
00383$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:487: else if (g_Players[playerId].Role == PLAYER_ROLE_RIGHT_DEFENDER) g_Players[playerId].TargetX = 176;
	sub	a, #0x02
	jp	NZ,00662$
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
	ld	(hl), #0xb0
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:489: return;
	jp	00662$
00398$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:495: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER || 
	ld	a, -2 (ix)
	sub	a, #0x05
	jr	Z, 00448$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:496: g_Players[playerId].Role == PLAYER_ROLE_RIGHT_STRIKER) {
	ld	a, -2 (ix)
	sub	a, #0x06
	jr	NZ, 00449$
00448$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:448: g_Players[playerId].TargetY = finalTargetY;
	pop	hl
	push	hl
	ld	de, #0x000e
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:499: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = GK_BOX_Y_TOP_MAX - 10;
	ld	a, -36 (ix)
	dec	a
	jr	NZ, 00400$
	ld	(hl), #0x41
	inc	hl
	ld	(hl), #0x00
	jp	00401$
00400$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:500: else g_Players[playerId].TargetY = GK_BOX_Y_BOTTOM_MIN + 10;
	ld	(hl), #0x9f
	inc	hl
	ld	(hl), #0x01
00401$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:502: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetX = 64;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:449: g_Players[playerId].TargetX = finalTargetX;
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:502: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetX = 64;
	ld	a, c
	sub	a, #0x05
	jr	NZ, 00403$
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x00
	jp	00877$
00403$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:503: else g_Players[playerId].TargetX = 192;
	ld	(hl), #0xc0
	inc	hl
	ld	(hl), #0x00
	jp	00877$
00449$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:505: } else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER || 
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	Z, 00444$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:506: g_Players[playerId].Role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
	ld	a, -2 (ix)
	sub	a, #0x04
	jp	NZ,00445$
00444$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:448: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-5 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:460: g_Players[playerId].TargetY = g_Ball.Y;
	ld	hl, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:513: g_Players[playerId].TargetY = g_Ball.Y - 40;
	ld	-2 (ix), l
	ld	-1 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:510: if (playerTeamId == TEAM_1) {
	ld	a, -36 (ix)
	dec	a
	jr	NZ, 00410$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:513: g_Players[playerId].TargetY = g_Ball.Y - 40;
	ld	a, -2 (ix)
	add	a, #0xd8
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0xff
	ld	b, a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:514: if (g_Players[playerId].TargetY < limitY) g_Players[playerId].TargetY = limitY;
	ld	a, c
	sub	a, #0x6a
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00411$
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x6a
	inc	hl
	ld	(hl), #0x00
	jp	00411$
00410$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:518: g_Players[playerId].TargetY = g_Ball.Y + 40;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0028
	add	hl, de
	ex	de, hl
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:519: if (g_Players[playerId].TargetY > limitY) g_Players[playerId].TargetY = limitY;
	ld	a, #0x3e
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00411$
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x3e
	inc	hl
	ld	(hl), #0x01
00411$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:522: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetX = 48;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:449: g_Players[playerId].TargetX = finalTargetX;
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:522: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetX = 48;
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00413$
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x00
	jp	00877$
00413$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:523: else g_Players[playerId].TargetX = 208;
	ld	(hl), #0xd0
	inc	hl
	ld	(hl), #0x00
	jp	00877$
00445$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:525: } else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER || 
	ld	a, -2 (ix)
	dec	a
	jr	Z, 00440$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:526: g_Players[playerId].Role == PLAYER_ROLE_RIGHT_DEFENDER) {
	ld	a, -2 (ix)
	sub	a, #0x02
	jp	NZ,00441$
00440$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:448: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-7 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:460: g_Players[playerId].TargetY = g_Ball.Y;
	ld	hl, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:513: g_Players[playerId].TargetY = g_Ball.Y - 40;
	ld	-5 (ix), l
	ld	-4 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:529: if (playerTeamId == TEAM_1) { // Attacking UP
	ld	a, -36 (ix)
	dec	a
	jr	NZ, 00430$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:530: g_Players[playerId].TargetY = g_Ball.Y + 30;
	ld	a, -5 (ix)
	add	a, #0x1e
	ld	-2 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:532: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) {
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:534: if (g_Players[playerId].TargetY < 318) g_Players[playerId].TargetY = 318;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:532: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) {
	dec	a
	jr	NZ, 00420$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:534: if (g_Players[playerId].TargetY < 318) g_Players[playerId].TargetY = 318;
	ld	a, c
	sub	a, #0x3e
	ld	a, b
	sbc	a, #0x01
	jr	NC, 00431$
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x3e
	inc	hl
	ld	(hl), #0x01
	jp	00431$
00420$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:537: if (g_Players[playerId].TargetY < 190) g_Players[playerId].TargetY = 190;
	ld	a, c
	sub	a, #0xbe
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00431$
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0xbe
	inc	hl
	ld	(hl), #0x00
	jp	00431$
00430$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:541: g_Players[playerId].TargetY = g_Ball.Y - 30;
	ld	a, -5 (ix)
	add	a, #0xe2
	ld	-2 (ix), a
	ld	a, -4 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:543: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) {
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:534: if (g_Players[playerId].TargetY < 318) g_Players[playerId].TargetY = 318;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:543: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) {
	dec	a
	jr	NZ, 00427$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:545: if (g_Players[playerId].TargetY > 106) g_Players[playerId].TargetY = 106;
	ld	a, #0x6a
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00431$
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x6a
	inc	hl
	ld	(hl), #0x00
	jp	00431$
00427$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:548: if (g_Players[playerId].TargetY > 234) g_Players[playerId].TargetY = 234;
	ld	a, #0xea
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00431$
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0xea
	inc	hl
	ld	(hl), #0x00
00431$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:554: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) defTargetX = 80;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
	dec	a
	jr	NZ, 00433$
	ld	-7 (ix), #0x50
	ld	-6 (ix), #0
	jp	00434$
00433$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:555: else defTargetX = 176;
	ld	-7 (ix), #0xb0
	ld	-6 (ix), #0
00434$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:558: defTargetX = (defTargetX + g_Ball.X) / 2;
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	add	a, -7 (ix)
	ld	-2 (ix), a
	ld	a, -4 (ix)
	adc	a, -6 (ix)
	ld	-1 (ix), a
	srl	-1 (ix)
	rr	-2 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:559: g_Players[playerId].TargetX = defTargetX;
	ld	a, -38 (ix)
	add	a, #0x10
	ld	-5 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	jp	00877$
00441$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:561: } else if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -2 (ix)
	or	a, a
	jr	NZ, 00877$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:562: g_Players[playerId].TargetX = FIELD_POS_X_CENTER;
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:448: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-2 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:563: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = GK_BOX_Y_BOTTOM_MIN + 20;
	ld	a, -36 (ix)
	dec	a
	jr	NZ, 00436$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0xa9
	inc	hl
	ld	(hl), #0x01
	jp	00662$
00436$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:564: else g_Players[playerId].TargetY = GK_BOX_Y_TOP_MAX - 20;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x37
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:565: return; // GK Done
	jp	00662$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:569: for(u8 i=0; i<14; i++) {
00877$:
	ld	-1 (ix), #0x00
00655$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00472$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:570: if (i == playerId) continue;
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jp	Z,00471$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:571: if (g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	a, -7 (ix)
	add	a, #<(_g_Players)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, #>(_g_Players)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
	or	a, -7 (ix)
	jp	Z, 00471$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:572: if (g_Players[i].TeamId != playerTeamId) continue;
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a,-36 (ix)
	sub	a,(hl)
	jp	NZ,00471$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:573: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00471$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:575: i16 dx = (i16)g_Players[playerId].TargetX - (i16)g_Players[i].X;
	ld	a, -38 (ix)
	add	a, #0x10
	ld	-17 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-16 (ix), a
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	a, (hl)
	ld	-15 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-14 (ix), a
	ld	a, -15 (ix)
	ld	-11 (ix), a
	ld	a, -14 (ix)
	ld	-10 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -11 (ix)
	sub	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -10 (ix)
	sbc	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-13 (ix), a
	ld	a, -6 (ix)
	ld	-12 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:576: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-11 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -9 (ix)
	sub	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	sbc	a, -6 (ix)
	ld	-4 (ix), a
	ld	e, -5 (ix)
	ld	d, -4 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:577: if (dx > -75 && dx < 75 && dy > -75 && dy < 75) {
	ld	a, #0xb5
	cp	a, -13 (ix)
	ld	a, #0xff
	sbc	a, -12 (ix)
	jp	PO, 02161$
	xor	a, #0x80
02161$:
	jp	P, 00471$
	ld	a, -13 (ix)
	ld	b, -12 (ix)
	sub	a, #0x4b
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00471$
	ld	a, #0xb5
	cp	a, e
	ld	a, #0xff
	sbc	a, d
	jp	PO, 02162$
	xor	a, #0x80
02162$:
	jp	P, 00471$
	ld	-7 (ix), e
	ld	-6 (ix), d
	ld	a, -7 (ix)
	sub	a, #0x4b
	ld	a, -6 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00471$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:578: if (dx >= 0) g_Players[playerId].TargetX += 12; else g_Players[playerId].TargetX -= 12;
	ld	a, -15 (ix)
	ld	-5 (ix), a
	ld	a, -14 (ix)
	ld	-4 (ix), a
	bit	7, b
	jr	NZ, 00461$
	ld	a, -5 (ix)
	add	a, #0x0c
	ld	-9 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -4 (ix)
	ld	(hl), a
	jp	00462$
00461$:
	ld	a, -5 (ix)
	add	a, #0xf4
	ld	-9 (ix), a
	ld	a, -4 (ix)
	adc	a, #0xff
	ld	-8 (ix), a
	ld	c, -9 (ix)
	ld	b, -8 (ix)
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00462$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:576: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:579: if (dy >= 0) g_Players[playerId].TargetY += 12; else g_Players[playerId].TargetY -= 12;
	bit	7, -6 (ix)
	jr	NZ, 00464$
	ld	hl, #0x000c
	add	hl, bc
	ex	de, hl
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00471$
00464$:
	ld	a, c
	add	a, #0xf4
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00471$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:569: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00655$
00472$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:584: u16 offsideY = GetOffsideLineY(playerTeamId);
	ld	a, -36 (ix)
	call	_GetOffsideLineY
	ld	-5 (ix), e
	ld	-4 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:448: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-2 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:460: g_Players[playerId].TargetY = g_Ball.Y;
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:534: if (g_Players[playerId].TargetY < 318) g_Players[playerId].TargetY = 318;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	c, (hl)
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), c
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:587: if (playerTeamId == TEAM_1) { // Attacking UP (TargetY decreases)
	ld	a, -36 (ix)
	dec	a
	jr	NZ, 00478$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:591: effectiveLimit = (g_Ball.Y < offsideY) ? g_Ball.Y : offsideY;
	ld	a, -9 (ix)
	sub	a, -5 (ix)
	ld	a, -8 (ix)
	sbc	a, -4 (ix)
	jr	NC, 00680$
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	jp	00681$
00680$:
	ld	e, -5 (ix)
	ld	d, -4 (ix)
00681$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:593: if (g_Players[playerId].TargetY < (effectiveLimit + 10)) { 
	ld	hl, #0x000a
	add	hl, de
	ex	de, hl
	ld	a, -7 (ix)
	sub	a, e
	ld	a, -6 (ix)
	sbc	a, d
	jp	NC,00662$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:594: g_Players[playerId].TargetY = effectiveLimit + 10;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00662$
00478$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:598: effectiveLimit = (g_Ball.Y > offsideY) ? g_Ball.Y : offsideY;
	ld	a, -5 (ix)
	sub	a, -9 (ix)
	ld	a, -4 (ix)
	sbc	a, -8 (ix)
	jr	NC, 00682$
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	jp	00683$
00682$:
	ld	e, -5 (ix)
	ld	d, -4 (ix)
00683$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:600: if (g_Players[playerId].TargetY > (effectiveLimit - 10)) {
	ld	a, e
	add	a, #0xf6
	ld	c, a
	ld	a, d
	adc	a, #0xff
	ld	b, a
	ld	a, c
	sub	a, -7 (ix)
	ld	a, b
	sbc	a, -6 (ix)
	jp	NC,00662$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:601: g_Players[playerId].TargetY = effectiveLimit - 10;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:606: return; 
	jp	00662$
00481$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:615: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -38 (ix)
	add	a, #0x0d
	ld	-5 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	or	a, a
	jp	NZ, 00506$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:617: if (g_Ball.ShotActive) return;
	ld	a, (#_g_Ball + 27)
	or	a, a
	jp	NZ,00662$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:624: if (playerTeamId == TEAM_1) { 
	ld	a, -36 (ix)
	dec	a
	jr	NZ, 00485$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:625: gkTargetY = FIELD_POS_Y_TEAM1_GOALKEEPER;
	ld	bc, #0x01a8
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:626: boxYMin = GK_BOX_Y_BOTTOM_MIN; boxYMax = GK_BOX_Y_BOTTOM_MAX;
	ld	-5 (ix), #0x95
	ld	-4 (ix), #0x01
	ld	-2 (ix), #0xb3
	ld	-1 (ix), #0x01
	jp	00486$
00485$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:628: gkTargetY = FIELD_POS_Y_TEAM2_GOALKEEPER;
	ld	bc, #0x0032
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:629: boxYMin = GK_BOX_Y_TOP_MIN; boxYMax = GK_BOX_Y_TOP_MAX;
	ld	-5 (ix), #0x23
	ld	-4 (ix), #0
	ld	-2 (ix), #0x4b
	ld	-1 (ix), #0
00486$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:632: u8 closestId = GetClosestPlayerToBall(playerTeamId, NO_VALUE);
	push	bc
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -36 (ix)
	call	_GetClosestPlayerToBall
	pop	bc
	ld	-11 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:633: bool ballInBox = (g_Ball.X > (boxXMin-5) && g_Ball.X < (boxXMax+5) && 
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	ld	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, #0x4b
	cp	a, -8 (ix)
	ld	a, #0x00
	sbc	a, -7 (ix)
	jr	NC, 00684$
	ld	a, -8 (ix)
	sub	a, #0xa5
	ld	a, -7 (ix)
	sbc	a, #0x00
	jr	NC, 00684$
	ld	hl, (#_g_Ball + 0)
	ld	a, -5 (ix)
	ld	d, -4 (ix)
	add	a, #0xfb
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jr	NC, 00684$
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	xor	a, a
	sbc	hl, de
	jr	C, 00685$
00684$:
	ld	-6 (ix), #0x00
	jp	00686$
00685$:
	ld	-6 (ix), #0x01
00686$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:636: if (ballInBox && closestId == playerId) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00494$
	ld	a, -3 (ix)
	sub	a, -11 (ix)
	jr	NZ, 00494$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:637: gkTargetX = g_Ball.X;
	ld	a, -10 (ix)
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	-7 (ix), a
	ld	-6 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:638: gkTargetY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	jp	00495$
00494$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:640: if (g_Ball.X > gkTargetX + 24) gkTargetX += 16;
	ld	a, #0x90
	cp	a, -8 (ix)
	ld	a, #0x00
	sbc	a, -7 (ix)
	jr	NC, 00491$
	ld	-7 (ix), #0x88
	ld	-6 (ix), #0
	jp	00495$
00491$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:641: else if (g_Ball.X < gkTargetX - 24) gkTargetX -= 16;
	ld	a, -8 (ix)
	sub	a, #0x60
	ld	a, -7 (ix)
	sbc	a, #0x00
	jr	NC, 00488$
	ld	-7 (ix), #0x68
	ld	-6 (ix), #0
	jp	00495$
00488$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:642: else gkTargetX = g_Ball.X; 
	ld	a, -10 (ix)
	ld	e, -9 (ix)
	ld	-7 (ix), a
	ld	-6 (ix), e
00495$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:645: if (gkTargetX < boxXMin) gkTargetX = boxXMin;
	ld	a, -7 (ix)
	sub	a, #0x50
	ld	a, -6 (ix)
	sbc	a, #0x00
	jr	NC, 00498$
	ld	-7 (ix), #0x50
	ld	-6 (ix), #0
00498$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:646: if (gkTargetX > boxXMax) gkTargetX = boxXMax;
	ld	a, #0xa0
	cp	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	jr	NC, 00500$
	ld	-7 (ix), #0xa0
	ld	-6 (ix), #0
00500$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:647: if (gkTargetY < boxYMin) gkTargetY = boxYMin;
	ld	a, c
	sub	a, -5 (ix)
	ld	a, b
	sbc	a, -4 (ix)
	jr	NC, 00502$
	ld	c, -5 (ix)
	ld	b, -4 (ix)
00502$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:648: if (gkTargetY > boxYMax) gkTargetY = boxYMax;
	ld	a, -2 (ix)
	sub	a, c
	ld	a, -1 (ix)
	sbc	a, b
	jr	NC, 00504$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
00504$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:650: g_Players[playerId].TargetX = gkTargetX;
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
	ld	a, -7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -6 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:651: g_Players[playerId].TargetY = gkTargetY;
	pop	hl
	push	hl
	ld	de, #0x000e
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:652: return; 
	jp	00662$
00506$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:656: u8 playerClosesestToBallId = GetClosestPlayerToBall(playerTeamId, NO_VALUE);
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -36 (ix)
	call	_GetClosestPlayerToBall
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:658: bool amIEffectiveChaser = (playerClosesestToBallId == playerId);
	ld	a, -3 (ix)
	sub	a, c
	ld	a, #0x01
	jr	Z, 02170$
	xor	a, a
02170$:
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:660: if (g_Players[playerClosesestToBallId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	e, c
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_g_Players
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	ex	de,hl
	ld	hl, #13
	add	hl, de
	ld	e, (hl)
	ld	a, e
	or	a, a
	jr	NZ, 00518$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:661: u16 limitY = (playerTeamId == TEAM_1) ? GK_BOX_Y_BOTTOM_MIN : GK_BOX_Y_TOP_MAX;
	ld	a, -36 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 02172$
	xor	a, a
02172$:
	ld	e, a
	or	a, a
	jr	Z, 00693$
	ld	hl, #0x0195
	jp	00694$
00693$:
	ld	hl, #0x004b
00694$:
	ld	-8 (ix), l
	ld	-7 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:662: bool ballFar = false;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:663: if (playerTeamId == TEAM_1 && g_Ball.Y < limitY - 10) ballFar = true;
	ld	a, e
	or	a, a
	jr	Z, 00508$
	ld	hl, (#_g_Ball + 0)
	ld	a, -8 (ix)
	ld	d, -7 (ix)
	add	a, #0xf6
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
	xor	a, a
	sbc	hl, de
	jr	NC, 00508$
	ld	-6 (ix), #0x01
00508$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:664: if (playerTeamId == TEAM_2 && g_Ball.Y > limitY + 10) ballFar = true;
	ld	a, -36 (ix)
	sub	a, #0x02
	jr	NZ, 00511$
	ld	hl, (#_g_Ball + 0)
	ld	a, -8 (ix)
	ld	d, -7 (ix)
	add	a, #0x0a
	ld	e, a
	jr	NC, 02175$
	inc	d
02175$:
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jr	NC, 00511$
	ld	-6 (ix), #0x01
00511$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:666: if (ballFar) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00518$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:667: u8 nextClosest = GetClosestPlayerToBall(playerTeamId, playerClosesestToBallId);
	push	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -36 (ix)
	call	_GetClosestPlayerToBall
	pop	bc
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:668: if (nextClosest == playerId) amIEffectiveChaser = true;
	ld	a, -3 (ix)
	sub	a, e
	jr	NZ, 00518$
	ld	b, #0x01
00518$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:672: if (amIEffectiveChaser) {
	ld	a, b
	or	a, a
	jp	Z, 00647$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:674: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	hl, #_g_Ball + 6
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:675: g_Players[playerId].TargetX = g_Ball.X;
	ld	bc, (#_g_Ball + 2)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:674: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	inc	e
	jr	NZ, 00546$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:675: g_Players[playerId].TargetX = g_Ball.X;
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:676: g_Players[playerId].TargetY = g_Ball.Y;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	c, a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	b, a
	ld	de, (#_g_Ball + 0)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jp	00662$
00546$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:682: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
	ld	-7 (ix), e
	ld	-6 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:683: i16 dy = (i16)g_Players[playerId].Y - (i16)g_Ball.Y;
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
	ld	-2 (ix), e
	ld	-1 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:684: i16 range = stats->Aggression;
	ld	l, -35 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -34 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:685: if (dx > -range && dx < range && dy > -range && dy < range) {
	xor	a, a
	ld	d, a
	sub	a, e
	ld	-9 (ix), a
	sbc	a, a
	sub	a, d
	ld	-8 (ix), a
	ld	a, -9 (ix)
	sub	a, -7 (ix)
	ld	a, -8 (ix)
	sbc	a, -6 (ix)
	jp	PO, 02180$
	xor	a, #0x80
02180$:
	jp	P, 00530$
	ld	a, -7 (ix)
	sub	a, e
	ld	a, -6 (ix)
	sbc	a, d
	jp	PO, 02181$
	xor	a, #0x80
02181$:
	jp	P, 00530$
	ld	a, -9 (ix)
	sub	a, -2 (ix)
	ld	a, -8 (ix)
	sbc	a, -1 (ix)
	jp	PO, 02182$
	xor	a, #0x80
02182$:
	jp	P, 00530$
	ld	a, -2 (ix)
	sub	a, e
	ld	a, -1 (ix)
	sbc	a, d
	jp	PO, 02183$
	xor	a, #0x80
02183$:
	jp	P, 00530$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:690: bool isHumanControlled = false;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:691: if ((playerTeamId == TEAM_1 && g_Team1ActivePlayer == playerId) || 
	ld	a, -36 (ix)
	dec	a
	jr	NZ, 00524$
	ld	a, (_g_Team1ActivePlayer+0)
	sub	a, -3 (ix)
	jr	Z, 00519$
00524$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:692: (playerTeamId == TEAM_2 && g_GameWith2Players && g_Team2ActivePlayer == playerId)) {
	ld	a, -36 (ix)
	sub	a, #0x02
	jr	NZ, 00520$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00520$
	ld	a, (_g_Team2ActivePlayer+0)
	sub	a, -3 (ix)
	jr	NZ, 00520$
00519$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:693: isHumanControlled = true;
	ld	-1 (ix), #0x01
00520$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:696: if (!isHumanControlled) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00530$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:699: if ((g_FrameCounter % 4) == 0) {
	ld	hl, (_g_FrameCounter)
	ld	a, l
	and	a, #0x03
	jr	NZ, 00530$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:700: PutBallOnPlayerFeet(playerId);
	ld	a, -3 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:701: return;
	jp	00662$
00530$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:708: i16 targetX = g_Ball.X;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:709: i16 targetY = g_Ball.Y;
	ld	a, -5 (ix)
	ld	e, -4 (ix)
	ld	-2 (ix), a
	ld	-1 (ix), e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:711: if (g_Ball.KickMoveState != 0) {
	ld	a, (#_g_Ball + 13)
	or	a, a
	jp	Z, 00544$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:713: switch(g_Ball.Direction) {
	ld	hl, #_g_Ball + 5
	ld	e, (hl)
	ld	a, #0x08
	sub	a, e
	jp	C, 00544$
	ld	d, #0x00
	ld	hl, #02193$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
02193$:
	jp	00544$
	jp	00534$
	jp	00538$
	jp	00537$
	jp	00540$
	jp	00535$
	jp	00541$
	jp	00536$
	jp	00539$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:714: case DIRECTION_UP: targetY -= 16; break;
00534$:
	ld	a, -2 (ix)
	ld	d, -1 (ix)
	add	a, #0xf0
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	-2 (ix), e
	ld	-1 (ix), a
	jp	00544$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:715: case DIRECTION_DOWN: targetY += 16; break;
00535$:
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #0x0010
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	jp	00544$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:716: case DIRECTION_LEFT: targetX -= 16; break;
00536$:
	ld	a, c
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	jp	00544$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:717: case DIRECTION_RIGHT: targetX += 16; break;
00537$:
	ld	hl, #0x0010
	add	hl, bc
	ld	c, l
	ld	b, h
	jp	00544$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:718: case DIRECTION_UP_RIGHT: targetY -= 12; targetX += 12; break;
00538$:
	ld	a, -2 (ix)
	ld	d, -1 (ix)
	add	a, #0xf4
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	-2 (ix), e
	ld	-1 (ix), a
	ld	hl, #0x000c
	add	hl, bc
	ld	c, l
	ld	b, h
	jp	00544$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:719: case DIRECTION_UP_LEFT: targetY -= 12; targetX -= 12; break;
00539$:
	ld	a, -2 (ix)
	ld	d, -1 (ix)
	add	a, #0xf4
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	-2 (ix), e
	ld	-1 (ix), a
	ld	a, c
	add	a, #0xf4
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	jp	00544$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:720: case DIRECTION_DOWN_RIGHT: targetY += 12; targetX += 12; break;
00540$:
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #0x000c
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	hl, #0x000c
	add	hl, bc
	ld	c, l
	ld	b, h
	jp	00544$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:721: case DIRECTION_DOWN_LEFT: targetY += 12; targetX -= 12; break;
00541$:
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #0x000c
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, c
	add	a, #0xf4
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:722: }
00544$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:724: g_Players[playerId].TargetX = targetX;
	pop	hl
	push	hl
	ld	de, #0x0010
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:725: g_Players[playerId].TargetY = targetY;
	pop	hl
	push	hl
	ld	de, #0x000e
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	jp	00662$
00647$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:730: u16 defGoalY = (playerTeamId == TEAM_1) ? FIELD_BOUND_Y_BOTTOM : FIELD_BOUND_Y_TOP;
	ld	a, -36 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 02195$
	xor	a, a
02195$:
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:731: bool chaserBeaten = false;
	ld	-8 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:732: bool opponentHasBall = (g_Ball.PossessionPlayerId != NO_VALUE && g_Players[g_Ball.PossessionPlayerId].TeamId != playerTeamId);
	ld	a, (#_g_Ball + 6)
	cp	a, #0xff
	jr	Z, 00697$
	ld	e, a
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_g_Players
	add	hl, de
	ld	de, #0x0009
	add	hl, de
	ld	a,-36 (ix)
	sub	a,(hl)
	jr	NZ, 00698$
00697$:
	xor	a, a
	jp	00699$
00698$:
	ld	a, #0x01
00699$:
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:734: bool forceRetreat = (g_MatchStatus == MATCH_BALL_ON_GOALKEEPER);
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0d
	ld	a, #0x01
	jr	Z, 02200$
	xor	a, a
02200$:
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:735: if (opponentHasBall && playerClosesestToBallId != NO_VALUE && !forceRetreat) {
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00556$
	inc	c
	jr	Z, 00556$
	ld	a, -6 (ix)
	or	a, a
	jr	NZ, 00556$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:736: u16 chaserY = g_Players[playerClosesestToBallId].Y;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:737: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, (#_g_Ball + 0)
	ld	a, -9 (ix)
	or	a, a
	jr	Z, 00553$
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC, 00556$
	ld	-8 (ix), #0x01
	jp	00556$
00553$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:738: else { if (g_Ball.Y < chaserY) chaserBeaten = true; }
	xor	a, a
	sbc	hl, bc
	jr	NC, 00556$
	ld	-8 (ix), #0x01
00556$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:741: if (opponentHasBall && chaserBeaten && !forceRetreat) {
	ld	a, -7 (ix)
	or	a, a
	jp	Z, 00623$
	ld	a, -8 (ix)
	or	a, a
	jp	Z, 00623$
	ld	a, -6 (ix)
	or	a, a
	jp	NZ, 00623$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:742: g_Players[playerId].TargetX = g_Ball.X;
	ld	a, -38 (ix)
	add	a, #0x10
	ld	-5 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:448: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-5 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:737: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:743: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = g_Ball.Y + 15;
	ld	a, -9 (ix)
	or	a, a
	jr	Z, 00560$
	ld	a, -2 (ix)
	add	a, #0x0f
	ld	-7 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-2 (ix), a
	ld	a, -6 (ix)
	ld	-1 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	jp	00968$
00560$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:744: else g_Players[playerId].TargetY = g_Ball.Y - 15;
	ld	a, -2 (ix)
	add	a, #0xf1
	ld	-7 (ix), a
	ld	a, -1 (ix)
	adc	a, #0xff
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-2 (ix), a
	ld	a, -6 (ix)
	ld	-1 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	jp	00968$
00623$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:615: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:748: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) {
	ld	-2 (ix), a
	sub	a, #0x05
	ld	a, #0x00
	rla
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:747: if (playerTeamId == TEAM_1) { // Defend Bottom (High Y)
	ld	a, -9 (ix)
	or	a, a
	jp	Z, 00607$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:748: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) {
	bit	0, -1 (ix)
	jr	NZ, 00582$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:750: g_Players[playerId].TargetY = FIELD_POS_Y_CENTER;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-2 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0xf3
	inc	hl
	ld	(hl), #0x00
	jp	00608$
00582$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:752: else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) {
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	C, 00579$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:754: g_Players[playerId].TargetY = 318; 
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-2 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x3e
	inc	hl
	ld	(hl), #0x01
	jp	00608$
00579$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:759: u16 defenseLineY = 350;
	ld	-13 (ix), #0x5e
	ld	-12 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:764: for(u8 k=0; k<14; k++) {
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
00657$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jr	NC, 00570$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:765: if (k==playerId) continue;
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jr	Z, 00569$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:766: if (g_Players[k].TeamId == playerTeamId && g_Players[k].Role != PLAYER_ROLE_GOALKEEPER) {
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	a, #<(_g_Players)
	add	a, -7 (ix)
	ld	-9 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	c, (hl)
	ld	a, -36 (ix)
	sub	a, c
	jr	NZ, 00569$
	ld	c, -9 (ix)
	ld	b, -8 (ix)
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00569$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:767: if (g_Players[k].Y < g_Players[playerId].Y) teammatesAhead++;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, -11 (ix)
	ld	a, b
	sbc	a, -10 (ix)
	jr	NC, 00569$
	inc	-2 (ix)
00569$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:764: for(u8 k=0; k<14; k++) {
	inc	-1 (ix)
	jp	00657$
00570$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:737: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:772: if (teammatesAhead < 2 || g_Ball.Y > 280) {
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	C, 00575$
	ld	a, -7 (ix)
	ld	-2 (ix), a
	ld	a, -6 (ix)
	ld	-1 (ix), a
	ld	a, #0x18
	cp	a, -2 (ix)
	ld	a, #0x01
	sbc	a, -1 (ix)
	jr	NC, 00576$
00575$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:775: if (g_Ball.Y < g_Players[playerId].Y) {
	ld	a, -7 (ix)
	sub	a, -11 (ix)
	ld	a, -6 (ix)
	sbc	a, -10 (ix)
	jr	NC, 00576$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:776: defenseLineY = g_Ball.Y + 40; // Maintain gap
	ld	a, -7 (ix)
	add	a, #0x28
	ld	-2 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-13 (ix), a
	ld	a, -1 (ix)
	ld	-12 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:777: if (defenseLineY > 380) defenseLineY = 380; // Cap
	ld	a, -13 (ix)
	ld	-2 (ix), a
	ld	a, -12 (ix)
	ld	-1 (ix), a
	ld	a, #0x7c
	cp	a, -2 (ix)
	ld	a, #0x01
	sbc	a, -1 (ix)
	jr	NC, 00576$
	ld	-13 (ix), #0x7c
	ld	-12 (ix), #0x01
00576$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:780: g_Players[playerId].TargetY = defenseLineY; 
	pop	hl
	push	hl
	ld	de, #0x000e
	add	hl, de
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
	jp	00608$
00607$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:784: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) {
	bit	0, -1 (ix)
	jr	NZ, 00604$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:786: g_Players[playerId].TargetY = FIELD_POS_Y_CENTER;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-2 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0xf3
	inc	hl
	ld	(hl), #0x00
	jp	00608$
00604$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:788: else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) {
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	C, 00601$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:790: g_Players[playerId].TargetY = 106;
	pop	hl
	push	hl
	ld	de, #0x000e
	add	hl, de
	ld	(hl), #0x6a
	inc	hl
	ld	(hl), #0x00
	jp	00608$
00601$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:795: u16 defenseLineY = 130;
	ld	-13 (ix), #0x82
	ld	-12 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:799: for(u8 k=0; k<14; k++) {
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
00659$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jr	NC, 00592$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:800: if (k==playerId) continue;
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jr	Z, 00591$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:801: if (g_Players[k].TeamId == playerTeamId && g_Players[k].Role != PLAYER_ROLE_GOALKEEPER) {
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	a, #<(_g_Players)
	add	a, -7 (ix)
	ld	-9 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a,-36 (ix)
	sub	a,(hl)
	jr	NZ, 00591$
	ld	c, -9 (ix)
	ld	b, -8 (ix)
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00591$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:802: if (g_Players[k].Y > g_Players[playerId].Y) teammatesAhead++;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -11 (ix)
	sub	a, c
	ld	a, -10 (ix)
	sbc	a, b
	jr	NC, 00591$
	inc	-2 (ix)
00591$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:799: for(u8 k=0; k<14; k++) {
	inc	-1 (ix)
	jp	00659$
00592$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:737: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	bc, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:806: if (teammatesAhead < 2 || g_Ball.Y < 200) {
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	C, 00597$
	ld	e, c
	ld	d, b
	ld	a, e
	sub	a, #0xc8
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00598$
00597$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:807: if (g_Ball.Y > g_Players[playerId].Y) {
	ld	a, -11 (ix)
	sub	a, c
	ld	a, -10 (ix)
	sbc	a, b
	jr	NC, 00598$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:808: defenseLineY = g_Ball.Y - 40;
	ld	a, c
	add	a, #0xd8
	ld	c, a
	ld	a, b
	adc	a, #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:809: if (defenseLineY < 100) defenseLineY = 100;
	ld	-13 (ix), c
	ld	-12 (ix), a
	ld	b, a
	ld	a, c
	sub	a, #0x64
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00598$
	ld	-13 (ix), #0x64
	ld	-12 (ix), #0
00598$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:812: g_Players[playerId].TargetY = defenseLineY;
	pop	hl
	push	hl
	ld	de, #0x000e
	add	hl, de
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
00608$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:816: if (g_Players[playerId].Role % 2 != 0) {
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	and	a, #0x01
	ld	-9 (ix), a
	ld	-8 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:449: g_Players[playerId].TargetX = finalTargetX;
	ld	a, -38 (ix)
	add	a, #0x10
	ld	-7 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:742: g_Players[playerId].TargetX = g_Ball.X;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:819: u16 intendedX = g_Ball.X - 40;
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-5 (ix), a
	ld	a, -1 (ix)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:816: if (g_Players[playerId].Role % 2 != 0) {
	ld	a, -8 (ix)
	or	a, -9 (ix)
	jr	Z, 00616$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:819: u16 intendedX = g_Ball.X - 40;
	ld	a, -5 (ix)
	add	a, #0xd8
	ld	-2 (ix), a
	ld	a, -4 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:820: if (g_Ball.X > FIELD_POS_X_CENTER && intendedX > FIELD_POS_X_CENTER + 20) {
	ld	a, #0x78
	cp	a, -5 (ix)
	ld	a, #0x00
	sbc	a, -4 (ix)
	jr	NC, 00610$
	ld	a, #0x8c
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jr	NC, 00610$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:821: intendedX = FIELD_POS_X_CENTER + 20; // Stay central
	ld	-2 (ix), #0x8c
	ld	-1 (ix), #0
00610$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:823: g_Players[playerId].TargetX = intendedX; 
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	jp	00617$
00616$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:828: u16 intendedX = g_Ball.X + 40;
	ld	a, -5 (ix)
	add	a, #0x28
	ld	-2 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:829: if (g_Ball.X < FIELD_POS_X_CENTER && intendedX < FIELD_POS_X_CENTER - 20) {
	ld	a, -5 (ix)
	sub	a, #0x78
	ld	a, -4 (ix)
	sbc	a, #0x00
	jr	NC, 00613$
	ld	a, -2 (ix)
	sub	a, #0x64
	ld	a, -1 (ix)
	sbc	a, #0x00
	jr	NC, 00613$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:830: intendedX = FIELD_POS_X_CENTER - 20; // Stay central
	ld	-2 (ix), #0x64
	ld	-1 (ix), #0
00613$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:832: g_Players[playerId].TargetX = intendedX; 
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
00617$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:835: if (g_Players[playerId].TargetX < FIELD_BOUND_X_LEFT + 20) g_Players[playerId].TargetX = FIELD_BOUND_X_LEFT + 20;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x1e
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00619$
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x1e
	inc	hl
	ld	(hl), #0x00
00619$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:836: if (g_Players[playerId].TargetX > FIELD_BOUND_X_RIGHT - 20) g_Players[playerId].TargetX = FIELD_BOUND_X_RIGHT - 20;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xe2
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00968$
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0xe2
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:840: for(u8 i=0; i<14; i++) {
00968$:
	ld	-1 (ix), #0x00
00661$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00662$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:841: if (i == playerId) continue;
	ld	a, -1 (ix)
	sub	a, -3 (ix)
	jp	Z,00644$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:842: if (g_Players[i].TeamId != playerTeamId) continue;
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_g_Players
	add	hl, de
	ex	de, hl
	ld	c, e
	ld	b, d
	ld	hl, #9
	add	hl, bc
	ld	a,-36 (ix)
	sub	a,(hl)
	jp	NZ,00644$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:843: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	c, e
	ld	b, d
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00644$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:844: i16 dx = (i16)g_Players[playerId].TargetX - (i16)g_Players[i].X;
	ld	a, -38 (ix)
	add	a, #0x10
	ld	-13 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:845: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	a, -38 (ix)
	add	a, #0x0e
	ld	-11 (ix), a
	ld	a, -37 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	-7 (ix), l
	ld	-6 (ix), a
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, -7 (ix)
	sub	a, e
	ld	e, a
	ld	a, -6 (ix)
	sbc	a, d
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:846: if (dx > -60 && dx < 60 && dy > -60 && dy < 60) {
	ld	a, #0xc4
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	jp	PO, 02211$
	xor	a, #0x80
02211$:
	jp	P, 00644$
	ld	a, c
	sub	a, #0x3c
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00644$
	ld	a, #0xc4
	cp	a, e
	ld	a, #0xff
	sbc	a, d
	jp	PO, 02212$
	xor	a, #0x80
02212$:
	jp	P, 00644$
	ld	-9 (ix), e
	ld	-8 (ix), d
	ld	a, -9 (ix)
	sub	a, #0x3c
	ld	a, -8 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00644$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:847: if (dx >= 0) g_Players[playerId].TargetX += 12; else g_Players[playerId].TargetX -= 12;
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	bit	7, b
	jr	NZ, 00634$
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x000c
	add	hl, de
	ex	de, hl
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00635$
00634$:
	ld	a, -7 (ix)
	add	a, #0xf4
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, #0xff
	ld	-4 (ix), a
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00635$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:845: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:848: if (dy >= 0) g_Players[playerId].TargetY += 12; else g_Players[playerId].TargetY -= 12;
	bit	7, -8 (ix)
	jr	NZ, 00637$
	ld	hl, #0x000c
	add	hl, bc
	ex	de, hl
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00644$
00637$:
	ld	a, c
	add	a, #0xf4
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00644$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:840: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00661$
00662$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:853: }
	ld	sp, ix
	pop	ix
	ret
_g_RDPRIM	=	0xf380
_g_WRPRIM	=	0xf385
_g_CLPRIM	=	0xf38c
_g_USRTAB	=	0xf39a
_g_CNSDFG	=	0xf3de
_g_RG0SAV	=	0xf3df
_g_RG1SAV	=	0xf3e0
_g_RG2SAV	=	0xf3e1
_g_RG3SAV	=	0xf3e2
_g_RG4SAV	=	0xf3e3
_g_RG5SAV	=	0xf3e4
_g_RG6SAV	=	0xf3e5
_g_RG7SAV	=	0xf3e6
_g_STATFL	=	0xf3e7
_g_TRGFLG	=	0xf3e8
_g_MAXUPD	=	0xf3ec
_g_MINUPD	=	0xf3ef
_g_QUEUES	=	0xf3f3
_g_FRCNEW	=	0xf3f5
_g_SCNCNT	=	0xf3f6
_g_REPCNT	=	0xf3f7
_g_PUTPNT	=	0xf3f8
_g_GETPNT	=	0xf3fa
_g_CS120	=	0xf3fc
_g_CS240	=	0xf401
_g_LOW	=	0xf406
_g_HIGH	=	0xf408
_g_HEADER	=	0xf40a
_g_ASPCT1	=	0xf40b
_g_ASPCT2	=	0xf40d
_g_QUETAB	=	0xf959
_g_QUEBAK	=	0xf971
_g_VOICAQ	=	0xf975
_g_VOICBQ	=	0xf9f5
_g_VOICCQ	=	0xfa75
_g_RS2IQ	=	0xfaf5
_g_DPPAGE	=	0xfaf5
_g_ACPAGE	=	0xfaf6
_g_AVCSAV	=	0xfaf7
_g_EXBRSA	=	0xfaf8
_g_CHRCNT	=	0xfaf9
_g_ROMA	=	0xfafa
_g_MODE	=	0xfafc
_g_NORUSE	=	0xfafd
_g_XSAVE	=	0xfafe
_g_YSAVE	=	0xfb00
_g_RSTMP	=	0xfb03
_g_TOCNT	=	0xfb03
_g_RSFCB	=	0xfb04
_g_RSIQLN	=	0xfb06
_g_MEXBIh	=	0xfb07
_g_OLDSTT	=	0xfb0c
_g_OLDINT	=	0xfb0c
_g_DEVNUM	=	0xfb16
_g_DATCNT	=	0xfb17
_g_ERRORS	=	0xfb1a
_g_FLAGS	=	0xfb1b
_g_ESTBLS	=	0xfb1c
_g_COMMSK	=	0xfb1d
_g_LSTCOM	=	0xfb1e
_g_LSTMOD	=	0xfb1f
_g_PRSCNT	=	0xfb35
_g_SAVSP	=	0xfb36
_g_VOICEN	=	0xfb38
_g_SAVVOL	=	0xfb39
_g_MCLLEN	=	0xfb3b
_g_MCLPTR	=	0xfb3c
_g_QUEUEN	=	0xfb3e
_g_MUSICF	=	0xfb3f
_g_PLYCNT	=	0xfb40
_g_VCBA	=	0xfb41
_g_VCBB	=	0xfb66
_g_VCBC	=	0xfb8b
_g_ENSTOP	=	0xfbb0
_g_BASROM	=	0xfbb1
_g_LINTTB	=	0xfbb2
_g_FSTPOS	=	0xfbca
_g_CODSAV	=	0xfbcc
_g_FNKSWI	=	0xfbcd
_g_FNKFLG	=	0xfbce
_g_ONGSBF	=	0xfbd8
_g_CLIKFL	=	0xfbd9
_g_OLDKEY	=	0xfbda
_g_NEWKEY	=	0xfbe5
_g_KEYBUF	=	0xfbf0
_g_LINWRK	=	0xfc18
_g_PATWRK	=	0xfc40
_g_BOTTOM	=	0xfc48
_g_HIMEM	=	0xfc4a
_g_TRPTBL	=	0xfc4c
_g_RTYCNT	=	0xfc9a
_g_INTFLG	=	0xfc9b
_g_PADY	=	0xfc9c
_g_PADX	=	0xfc9d
_g_JIFFY	=	0xfc9e
_g_INTVAL	=	0xfca0
_g_INTCNT	=	0xfca2
_g_LOWLIM	=	0xfca4
_g_WINWID	=	0xfca5
_g_GRPHED	=	0xfca6
_g_ESCCNT	=	0xfca7
_g_INSFLG	=	0xfca8
_g_CSRSW	=	0xfca9
_g_CSTYLE	=	0xfcaa
_g_CAPST	=	0xfcab
_g_KANAST	=	0xfcac
_g_KANAMD	=	0xfcad
_g_FLBMEM	=	0xfcae
_g_SCRMOD	=	0xfcaf
_g_OLDSCR	=	0xfcb0
_g_CASPRV	=	0xfcb1
_g_BRDATR	=	0xfcb2
_g_GXPOS	=	0xfcb3
_g_GYPOS	=	0xfcb5
_g_DRWFLG	=	0xfcbb
_g_DRWSCL	=	0xfcbc
_g_DRWANG	=	0xfcbd
_g_MNROM	=	0xfcc1
_g_EXPTBL	=	0xfcc1
_g_SLTTBL	=	0xfcc5
_g_SLTATR	=	0xfcc9
_g_SLTWRK	=	0xfd09
_g_PROCNM	=	0xfd89
_g_RG08SAV	=	0xffe7
_g_RG09SAV	=	0xffe8
_g_RG10SAV	=	0xffe9
_g_RG11SAV	=	0xffea
_g_RG12SAV	=	0xffeb
_g_RG13SAV	=	0xffec
_g_RG14SAV	=	0xffed
_g_RG15SAV	=	0xffee
_g_RG16SAV	=	0xffef
_g_RG17SAV	=	0xfff0
_g_RG18SAV	=	0xfff1
_g_RG19SAV	=	0xfff2
_g_RG20SAV	=	0xfff3
_g_RG21SAV	=	0xfff4
_g_RG22SAV	=	0xfff5
_g_RG23SAV	=	0xfff6
_g_MINROM	=	0xfff7
_g_SVFFF8	=	0xfff8
_g_RG25SAV	=	0xfffa
_g_RG26SAV	=	0xfffb
_g_RG27SAV	=	0xfffc
_g_SVFFFD	=	0xfffd
_g_CGTABL	=	0x0004
_g_VDP_DR	=	0x0006
_g_VDP_DW	=	0x0007
_g_BASRVN	=	0x002b
_g_ROMVersion	=	0x002b
_g_MSXVER	=	0x002d
_g_MSXMID	=	0x002e
_g_CHAR_16	=	0x0034
_g_SUBRID	=	0x0000
_g_STRSRC	=	0x0002
_g_KANJTABLE	=	0xf30f
_g_DISKVE	=	0xf323
_g_BREAKV	=	0xf325
_g_RAMAD0	=	0xf341
_g_RAMAD1	=	0xf342
_g_RAMAD2	=	0xf343
_g_RAMAD3	=	0xf344
_g_MASTER	=	0xf348
_g_BDOS	=	0xf37d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:855: static i32 Math_Abs32_Local(i32 v) { return (v < 0) ? -v : v; }
;	---------------------------------
; Function Math_Abs32_Local
; ---------------------------------
_Math_Abs32_Local:
	ld	c, l
	ld	b, h
	bit	7, b
	jr	Z, 00103$
	ld	hl, #0x0000
	cp	a, a
	sbc	hl, de
	ex	de, hl
	ld	hl, #0x0000
	sbc	hl, bc
	ret
00103$:
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:857: void PenaltyShots() {
;	---------------------------------
; Function PenaltyShots
; ---------------------------------
_PenaltyShots::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-56
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:858: g_MatchStatus = MATCH_PENALTY_SETUP;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x12
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:859: g_FieldScrollingActionInProgress = NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:863: while (g_FieldCurrentYPosition != centerScroll) {
00104$:
	ld	hl, (_g_FieldCurrentYPosition)
	ld	a, l
	sub	a, #0x89
	or	a, h
	jr	Z, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:864: if (g_FieldCurrentYPosition < centerScroll) g_FieldCurrentYPosition++;
	ld	de, #0x0089
	cp	a, a
	sbc	hl, de
	jr	NC, 00102$
	ld	hl, (_g_FieldCurrentYPosition)
	inc	hl
	ld	(_g_FieldCurrentYPosition), hl
	jp	00103$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:865: else g_FieldCurrentYPosition--;
	ld	hl, (_g_FieldCurrentYPosition)
	dec	hl
	ld	(_g_FieldCurrentYPosition), hl
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:866: V9_SetScrollingBY((u16)g_FieldCurrentYPosition);
	ld	hl, (_g_FieldCurrentYPosition)
	call	_V9_SetScrollingBY
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:867: UpdateV9990();
	call	_UpdateV9990
	jp	00104$
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:871: ShowHeaderInfo();
	call	_ShowHeaderInfo
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:873: V9_PrintLayerAStringAtPos(8, 10, "PENALTY SHOOTOUT");
	ld	hl, #___str_0
	push	hl
	ld	l, #0x0a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:874: for(u8 w=0; w<120; w++) UpdateV9990();
	ld	c, #0x00
00335$:
	ld	a, c
	sub	a, #0x78
	jr	NC, 00107$
	push	bc
	call	_UpdateV9990
	pop	bc
	inc	c
	jp	00335$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:875: ClearTextFromLayerA(8, 10, 16);
	ld	a, #0x10
	push	af
	inc	sp
	ld	l, #0x0a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x08
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:878: for(u8 i=0; i<15; i++) {
	ld	-1 (ix), #0x00
00338$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	NC, 00406$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:879: g_Players[i].Status = PLAYER_STATUS_NONE;
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_g_Players
	add	hl, de
	ex	de, hl
	ld	hl, #0x0012
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:882: g_Players[i].TargetY = 220 + (i/4)*15; 
	ld	hl, #0x000e
	add	hl, de
	ld	c, l
	ld	b, h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:883: g_Players[i].TargetX = 80 + (i%4)*25;
	ld	hl, #0x0010
	add	hl, de
	ld	-5 (ix), l
	ld	-4 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:881: if (i < 7) { // Team 2 (Top)
	ld	a, -1 (ix)
	sub	a, #0x07
	jr	NC, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:882: g_Players[i].TargetY = 220 + (i/4)*15; 
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	ld	e, a
	ld	d, #0x00
	bit	7, -2 (ix)
	jr	Z, 00357$
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	inc	de
	inc	de
	inc	de
00357$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	de, #0x00dc
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:883: g_Players[i].TargetX = 80 + (i%4)*25;
	ld	a, -3 (ix)
	and	a, #0x03
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #0x0050
	add	hl, bc
	ex	de, hl
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00339$
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:884: } else if (i < 14) { // Team 1 (Bottom)
	ld	a, -1 (ix)
	sub	a, #0x0e
	jr	NC, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:885: u8 k = i - 7;
	ld	a, -1 (ix)
	add	a, #0xf9
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:886: g_Players[i].TargetY = 260 + (k/4)*15;
	ld	e, a
	ld	d, #0x00
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	bit	7, d
	jr	Z, 00358$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
00358$:
	sra	h
	rr	l
	sra	h
	rr	l
	push	de
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	pop	de
	ld	a, l
	add	a, #0x04
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, #0x01
	ld	-3 (ix), l
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	(bc), a
	inc	bc
	ld	a, -2 (ix)
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:887: g_Players[i].TargetX = 80 + (k%4)*25;
	ld	a, e
	and	a, #0x03
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #0x0050
	add	hl, bc
	ex	de, hl
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00339$
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:889: g_Players[i].TargetX = 128;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x80
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:890: g_Players[i].TargetY = 243; // Midfield
	ld	a, #0xf3
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
00339$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:878: for(u8 i=0; i<15; i++) {
	inc	-1 (ix)
	jp	00338$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:895: while(true) {
00406$:
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:896: bool allArrived = true;
	ld	-8 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:897: for(u8 i=0; i<15; i++) {
	ld	-1 (ix), #0x00
00341$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	NC, 00131$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:898: bool arrived = true;
	ld	-4 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:899: if (g_Players[i].X < g_Players[i].TargetX) { g_Players[i].X++; arrived=false; g_Players[i].Direction = DIRECTION_RIGHT; }
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:902: if (g_Players[i].Y < g_Players[i].TargetY) { g_Players[i].Y++; arrived=false; g_Players[i].Direction = DIRECTION_DOWN; }
	ld	de, #_g_Players
	add	hl, de
	ld	-7 (ix), l
	ld	-6 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:899: if (g_Players[i].X < g_Players[i].TargetX) { g_Players[i].X++; arrived=false; g_Players[i].Direction = DIRECTION_RIGHT; }
	ld	a, -7 (ix)
	add	a, #0x02
	ld	-3 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	hl, #16
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jr	NC, 00118$
	inc	bc
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	-4 (ix), #0x00
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x03
	jp	00119$
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:900: else if (g_Players[i].X > g_Players[i].TargetX) { g_Players[i].X--; arrived=false; g_Players[i].Direction = DIRECTION_LEFT; }
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00119$
	dec	bc
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	-4 (ix), #0x00
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x07
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:902: if (g_Players[i].Y < g_Players[i].TargetY) { g_Players[i].Y++; arrived=false; g_Players[i].Direction = DIRECTION_DOWN; }
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	hl, #14
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jr	NC, 00123$
	inc	bc
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	-4 (ix), #0x00
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x05
	jp	00124$
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:903: else if (g_Players[i].Y > g_Players[i].TargetY) { g_Players[i].Y--; arrived=false; g_Players[i].Direction = DIRECTION_UP; }
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00124$
	dec	bc
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	-4 (ix), #0x00
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x01
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:907: g_Players[i].Status = PLAYER_STATUS_NONE;
	ld	a, -7 (ix)
	add	a, #0x12
	ld	-3 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:905: if (!arrived) {
	ld	a, -4 (ix)
	or	a, a
	jr	NZ, 00129$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:906: allArrived = false;
	ld	-8 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:907: g_Players[i].Status = PLAYER_STATUS_NONE;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00342$
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:909: g_Players[i].Status = PLAYER_STATUS_POSITIONED;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:910: if (g_Players[i].Y < 243) g_Players[i].Direction = DIRECTION_DOWN;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:902: if (g_Players[i].Y < g_Players[i].TargetY) { g_Players[i].Y++; arrived=false; g_Players[i].Direction = DIRECTION_DOWN; }
	ld	a, -7 (ix)
	add	a, #0x0a
	ld	-5 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:910: if (g_Players[i].Y < 243) g_Players[i].Direction = DIRECTION_DOWN;
	ld	a, -3 (ix)
	sub	a, #0xf3
	ld	a, -2 (ix)
	sbc	a, #0x00
	jr	NC, 00126$
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x05
	jp	00127$
00126$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:911: else g_Players[i].Direction = DIRECTION_UP;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x01
00127$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:912: g_Players[i].PatternId = (g_Players[i].Direction == DIRECTION_UP) ? PLAYER_POSE_BACK : PLAYER_POSE_FRONT;
	ld	a, -7 (ix)
	add	a, #0x08
	ld	-3 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	dec	a
	jr	NZ, 00359$
	ld	-5 (ix), #0x11
	ld	-4 (ix), #0
	jp	00360$
00359$:
	ld	-5 (ix), #0x10
	ld	-4 (ix), #0
00360$:
	ld	a, -5 (ix)
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), a
00342$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:897: for(u8 i=0; i<15; i++) {
	inc	-1 (ix)
	jp	00341$
00131$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:915: UpdateSpritesPositions();
	call	_UpdateSpritesPositions
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:916: UpdateV9990();
	call	_UpdateV9990
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:917: if (allArrived) break;
	ld	a, -8 (ix)
	or	a, a
	jp	Z, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:920: g_MatchStatus = MATCH_PENALTY_SHOOTOUT;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x11
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:931: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:932: g_Ball.KickMoveState = 0; // Ensure no dribble offset interferes with Y
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:934: while(true) {
	ld	-9 (ix), #0x04
	ld	-8 (ix), #0x00
	ld	-7 (ix), #0x00
	ld	-6 (ix), #0x04
	ld	-5 (ix), #0x00
	ld	-4 (ix), #0x00
	ld	-3 (ix), #0x00
00328$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:935: UpdateV9990();
	call	_UpdateV9990
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:938: if (turn < 10) {
	ld	a, -3 (ix)
	sub	a, #0x0a
	jp	NC, 00148$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:939: u8 rem1 = 5 - shots1;
	ld	a, -4 (ix)
	ld	-1 (ix), a
	ld	a, #0x05
	sub	a, -1 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:940: u8 rem2 = 5 - shots2;
	ld	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, #0x05
	sub	a, -2 (ix)
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:941: if (goals1 > goals2 + rem2) { TeamVictory(TEAM_1); return; }
	ld	a, -8 (ix)
	ld	-15 (ix), a
	ld	-14 (ix), #0x00
	ld	a, -2 (ix)
	ld	-13 (ix), a
	ld	-12 (ix), #0x00
	ld	a, -15 (ix)
	add	a, -13 (ix)
	ld	-11 (ix), a
	ld	a, -14 (ix)
	adc	a, -12 (ix)
	ld	-10 (ix), a
	ld	a, -7 (ix)
	ld	-13 (ix), a
	ld	-12 (ix), #0x00
	ld	a, -11 (ix)
	sub	a, -13 (ix)
	ld	a, -10 (ix)
	sbc	a, -12 (ix)
	jp	PO, 01046$
	xor	a, #0x80
01046$:
	jp	P, 00138$
	ld	a, #0x01
	call	_TeamVictory
	jp	00355$
00138$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:942: if (goals2 > goals1 + rem1) { TeamVictory(TEAM_2); return; }
	ld	a, -1 (ix)
	ld	-11 (ix), a
	ld	-10 (ix), #0x00
	ld	a, -13 (ix)
	add	a, -11 (ix)
	ld	-2 (ix), a
	ld	a, -12 (ix)
	adc	a, -10 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	sub	a, -15 (ix)
	ld	a, -1 (ix)
	sbc	a, -14 (ix)
	jp	PO, 01047$
	xor	a, #0x80
01047$:
	jp	P, 00149$
	ld	a, #0x02
	call	_TeamVictory
	jp	00355$
00148$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:945: if (shots1 == shots2) {
	ld	a, -5 (ix)
	sub	a, -4 (ix)
	jr	NZ, 00149$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:946: if (goals1 > goals2) { TeamVictory(TEAM_1); return; }
	ld	a, -8 (ix)
	sub	a, -7 (ix)
	jr	NC, 00142$
	ld	a, #0x01
	call	_TeamVictory
	jp	00355$
00142$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:947: if (goals2 > goals1) { TeamVictory(TEAM_2); return; }
	ld	a, -7 (ix)
	sub	a, -8 (ix)
	jr	NC, 00149$
	ld	a, #0x02
	call	_TeamVictory
	jp	00355$
00149$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:952: u8 kickingTeam = (turn % 2 == 0) ? TEAM_1 : TEAM_2;
	ld	a, -3 (ix)
	ld	-13 (ix), a
	ld	-12 (ix), #0x00
	bit	0, -13 (ix)
	jr	NZ, 00361$
	ld	bc, #0x0001
	jp	00362$
00361$:
	ld	bc, #0x0002
00362$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:953: u8 gkTeam = (kickingTeam == TEAM_1) ? TEAM_2 : TEAM_1;
	dec	c
	ld	a, #0x01
	jr	Z, 01053$
	xor	a, a
01053$:
	ld	-52 (ix), a
	or	a, a
	jr	Z, 00363$
	ld	-11 (ix), #0x02
	ld	-10 (ix), #0
	jp	00364$
00363$:
	ld	-11 (ix), #0x01
	ld	-10 (ix), #0
00364$:
	ld	a, -11 (ix)
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:959: u8 k = 8 + ((turn/2) % 6); // Team 1 players 8-13
	ld	a, -12 (ix)
	rlca
	and	a,#0x01
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:958: if (kickingTeam == TEAM_1) {
	ld	a, -52 (ix)
	or	a, a
	jr	Z, 00151$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:959: u8 k = 8 + ((turn/2) % 6); // Team 1 players 8-13
	ld	l, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	or	a, a
	jr	Z, 00365$
	ld	l, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
00365$:
	sra	h
	rr	l
	ld	de, #0x0006
	call	__modsint
	ld	a, e
	add	a, #0x08
	ld	-51 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:961: gkId = 0; // Team 2 GK
	ld	-50 (ix), #0x00
	jp	00152$
00151$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:963: u8 k = 1 + ((turn/2) % 6); // Team 2 players 1-6
	ld	a, -13 (ix)
	ld	-11 (ix), a
	ld	a, -12 (ix)
	ld	-10 (ix), a
	ld	a, c
	or	a, a
	jr	Z, 00366$
	ld	a, -13 (ix)
	add	a, #0x01
	ld	-11 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
00366$:
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	sra	h
	rr	l
	ld	de, #0x0006
	call	__modsint
	ld	a, e
	inc	a
	ld	-51 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:965: gkId = 7; // Team 1 GK
	ld	-50 (ix), #0x07
00152$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:973: g_Players[kickerId].TargetX = kickSpotX;
	ld	c, -51 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, #<(_g_Players)
	add	a, -11 (ix)
	ld	-49 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -10 (ix)
	ld	-48 (ix), a
	ld	a, -49 (ix)
	add	a, #0x10
	ld	-47 (ix), a
	ld	a, -48 (ix)
	adc	a, #0x00
	ld	-46 (ix), a
	ld	l, -47 (ix)
	ld	h, -46 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:974: g_Players[kickerId].TargetY = kickSpotY + 6; // Player stands behind ball
	ld	a, -49 (ix)
	add	a, #0x0e
	ld	-45 (ix), a
	ld	a, -48 (ix)
	adc	a, #0x00
	ld	-44 (ix), a
	ld	l, -45 (ix)
	ld	h, -44 (ix)
	ld	(hl), #0x67
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:975: g_Players[gkId].TargetX = kickSpotX;
	ld	c, -50 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, #<(_g_Players)
	add	a, -11 (ix)
	ld	-43 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -10 (ix)
	ld	-42 (ix), a
	ld	a, -43 (ix)
	add	a, #0x10
	ld	-41 (ix), a
	ld	a, -42 (ix)
	adc	a, #0x00
	ld	-40 (ix), a
	ld	l, -41 (ix)
	ld	h, -40 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:976: g_Players[gkId].TargetY = gkSpotY;
	ld	a, -43 (ix)
	add	a, #0x0e
	ld	-39 (ix), a
	ld	a, -42 (ix)
	adc	a, #0x00
	ld	-38 (ix), a
	ld	l, -39 (ix)
	ld	h, -38 (ix)
	ld	(hl), #0x36
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:979: g_Players[REFEREE].TargetX = 50;
	ld	hl, #0x0032
	ld	((_g_Players + 310)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:980: g_Players[REFEREE].TargetY = kickSpotY; 
	ld	l, #0x61
	ld	((_g_Players + 308)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:982: g_Players[kickerId].Status = PLAYER_STATUS_NONE;
	ld	a, -49 (ix)
	add	a, #0x12
	ld	-37 (ix), a
	ld	a, -48 (ix)
	adc	a, #0x00
	ld	-36 (ix), a
	ld	l, -37 (ix)
	ld	h, -36 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:983: g_Players[gkId].Status = PLAYER_STATUS_NONE;
	ld	a, -43 (ix)
	add	a, #0x12
	ld	-35 (ix), a
	ld	a, -42 (ix)
	adc	a, #0x00
	ld	-34 (ix), a
	ld	l, -35 (ix)
	ld	h, -34 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:984: g_Players[REFEREE].Status = PLAYER_STATUS_NONE;
	ld	hl, #0x0000
	ld	((_g_Players + 312)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:987: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:988: g_Ball.X = kickSpotX;
	ld	hl, #0x0078
	ld	((_g_Ball + 2)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:989: g_Ball.Y = kickSpotY; // Ball exactly on spot
	ld	l, #0x61
	ld	(_g_Ball), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:990: g_Ball.KickMoveState = 0;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:993: while(true) {
00191$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:994: UpdateV9990();
	call	_UpdateV9990
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:997: bool kDone = true;
	ld	-14 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:998: if (g_Players[kickerId].Y > g_Players[kickerId].TargetY) { g_Players[kickerId].Y--; kDone=false; g_Players[kickerId].Direction=DIRECTION_UP; }
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -45 (ix)
	ld	h, -44 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00156$
	dec	bc
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	-14 (ix), #0x00
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x01
	jp	00157$
00156$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:999: else if (g_Players[kickerId].Y < g_Players[kickerId].TargetY) { g_Players[kickerId].Y++; kDone=false; g_Players[kickerId].Direction=DIRECTION_DOWN; }
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jr	NC, 00157$
	inc	bc
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	-14 (ix), #0x00
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x05
00157$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1001: if (g_Players[kickerId].X > g_Players[kickerId].TargetX) { g_Players[kickerId].X--; kDone=false; g_Players[kickerId].Direction=DIRECTION_LEFT; }
	ld	a, -49 (ix)
	add	a, #0x02
	ld	-33 (ix), a
	ld	a, -48 (ix)
	adc	a, #0x00
	ld	-32 (ix), a
	ld	l, -33 (ix)
	ld	h, -32 (ix)
	ld	a, (hl)
	ld	-13 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-12 (ix), a
	ld	l, -47 (ix)
	ld	h, -46 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	sub	a, -13 (ix)
	ld	a, -10 (ix)
	sbc	a, -12 (ix)
	jr	NC, 00161$
	ld	c, -13 (ix)
	ld	b, -12 (ix)
	dec	bc
	ld	l, -33 (ix)
	ld	h, -32 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	-14 (ix), #0x00
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x07
	jp	00162$
00161$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1002: else if (g_Players[kickerId].X < g_Players[kickerId].TargetX) { g_Players[kickerId].X++; kDone=false; g_Players[kickerId].Direction=DIRECTION_RIGHT; }
	ld	a, -13 (ix)
	sub	a, -11 (ix)
	ld	a, -12 (ix)
	sbc	a, -10 (ix)
	jr	NC, 00162$
	ld	c, -13 (ix)
	ld	b, -12 (ix)
	inc	bc
	ld	l, -33 (ix)
	ld	h, -32 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	-14 (ix), #0x00
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x03
00162$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1005: bool gDone = true;
	ld	-1 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1006: if (g_Players[gkId].Y > g_Players[gkId].TargetY) { g_Players[gkId].Y--; gDone=false; g_Players[gkId].Direction=DIRECTION_UP; }
	ld	l, -43 (ix)
	ld	h, -42 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -39 (ix)
	ld	h, -38 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00166$
	dec	bc
	ld	l, -43 (ix)
	ld	h, -42 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	-1 (ix), #0x00
	ld	l, -43 (ix)
	ld	h, -42 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x01
	jp	00167$
00166$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1007: else if (g_Players[gkId].Y < g_Players[gkId].TargetY) { g_Players[gkId].Y++; gDone=false; g_Players[gkId].Direction=DIRECTION_DOWN; }
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jr	NC, 00167$
	inc	bc
	ld	l, -43 (ix)
	ld	h, -42 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	-1 (ix), #0x00
	ld	l, -43 (ix)
	ld	h, -42 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x05
00167$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1009: if (g_Players[gkId].X > g_Players[gkId].TargetX) { g_Players[gkId].X--; gDone=false; g_Players[gkId].Direction=DIRECTION_LEFT; }
	ld	a, -43 (ix)
	add	a, #0x02
	ld	-31 (ix), a
	ld	a, -42 (ix)
	adc	a, #0x00
	ld	-30 (ix), a
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, (hl)
	ld	-13 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-12 (ix), a
	ld	l, -41 (ix)
	ld	h, -40 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	sub	a, -13 (ix)
	ld	a, -10 (ix)
	sbc	a, -12 (ix)
	jr	NC, 00171$
	ld	a, -13 (ix)
	add	a, #0xff
	ld	-11 (ix), a
	ld	a, -12 (ix)
	adc	a, #0xff
	ld	-10 (ix), a
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
	ld	-1 (ix), #0x00
	ld	a, -43 (ix)
	add	a, #0x0a
	ld	-11 (ix), a
	ld	a, -42 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), #0x07
	jp	00172$
00171$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1010: else if (g_Players[gkId].X < g_Players[gkId].TargetX) { g_Players[gkId].X++; gDone=false; g_Players[gkId].Direction=DIRECTION_RIGHT; }
	ld	a, -13 (ix)
	sub	a, -11 (ix)
	ld	a, -12 (ix)
	sbc	a, -10 (ix)
	jr	NC, 00172$
	ld	a, -13 (ix)
	add	a, #0x01
	ld	-11 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
	ld	-1 (ix), #0x00
	ld	l, -43 (ix)
	ld	h, -42 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x03
00172$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1013: bool rDone = true;
	ld	-10 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1014: if (g_Players[REFEREE].Y > g_Players[REFEREE].TargetY) { g_Players[REFEREE].Y--; rDone=false; g_Players[REFEREE].Direction=DIRECTION_UP; }
	ld	bc, (#(_g_Players + 294) + 0)
	ld	de, (#(_g_Players + 308) + 0)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00176$
	dec	bc
	ld	((_g_Players + 294)), bc
	ld	-10 (ix), #0x00
	ld	hl, #(_g_Players + 304)
	ld	(hl), #0x01
	jp	00177$
00176$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1015: else if (g_Players[REFEREE].Y < g_Players[REFEREE].TargetY) { g_Players[REFEREE].Y++; rDone=false; g_Players[REFEREE].Direction=DIRECTION_DOWN; }
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jr	NC, 00177$
	inc	bc
	ld	((_g_Players + 294)), bc
	ld	-10 (ix), #0x00
	ld	hl, #(_g_Players + 304)
	ld	(hl), #0x05
00177$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1017: if (g_Players[REFEREE].X > g_Players[REFEREE].TargetX) { g_Players[REFEREE].X--; rDone=false; g_Players[REFEREE].Direction=DIRECTION_LEFT; }
	ld	bc, (#(_g_Players + 296) + 0)
	ld	de, (#(_g_Players + 310) + 0)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00181$
	dec	bc
	ld	((_g_Players + 296)), bc
	ld	-10 (ix), #0x00
	ld	hl, #(_g_Players + 304)
	ld	(hl), #0x07
	jp	00182$
00181$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1018: else if (g_Players[REFEREE].X < g_Players[REFEREE].TargetX) { g_Players[REFEREE].X++; rDone=false; g_Players[REFEREE].Direction=DIRECTION_RIGHT; }
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jr	NC, 00182$
	inc	bc
	ld	((_g_Players + 296)), bc
	ld	-10 (ix), #0x00
	ld	hl, #(_g_Players + 304)
	ld	(hl), #0x03
00182$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1021: u16 animStatus = ((g_FrameCounter % 8) == 0) ? PLAYER_STATUS_NONE : PLAYER_STATUS_POSITIONED;
	ld	hl, (_g_FrameCounter)
	ld	a, l
	and	a, #0x07
	jr	NZ, 00367$
	ld	bc, #0x0000
	jp	00368$
00367$:
	ld	bc, #0x0004
00368$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1022: g_Players[kickerId].Status = animStatus;
	ld	l, -37 (ix)
	ld	h, -36 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1023: g_Players[gkId].Status = animStatus;
	ld	l, -35 (ix)
	ld	h, -34 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1024: g_Players[REFEREE].Status = animStatus;
	ld	((_g_Players + 312)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1029: if (g_Players[kickerId].Y < (u16)g_FieldCurrentYPosition) {
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (_g_FieldCurrentYPosition)
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC, 00184$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1030: g_FieldCurrentYPosition = 0;
	ld	hl, #0x0000
	ld	(_g_FieldCurrentYPosition), hl
00184$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1033: V9_SetScrollingBY((u16)g_FieldCurrentYPosition);
	ld	hl, (_g_FieldCurrentYPosition)
	call	_V9_SetScrollingBY
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1034: UpdateSpritesPositions();
	call	_UpdateSpritesPositions
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1036: if (kDone && gDone && rDone && g_FieldCurrentYPosition == 0) {
	ld	a, -14 (ix)
	or	a, a
	jp	Z, 00191$
	ld	a, -1 (ix)
	or	a, a
	jp	Z, 00191$
	ld	a, -10 (ix)
	or	a, a
	jp	Z, 00191$
	ld	a, (_g_FieldCurrentYPosition+1)
	ld	hl, #_g_FieldCurrentYPosition
	or	a, (hl)
	jp	NZ, 00191$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1037: g_ActiveFieldZone = FIELD_NORTH_ZONE;
	ld	hl, #_g_ActiveFieldZone
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1043: g_Players[kickerId].Direction = DIRECTION_UP;
	ld	a, -49 (ix)
	add	a, #0x0a
	ld	-29 (ix), a
	ld	a, -48 (ix)
	adc	a, #0x00
	ld	-28 (ix), a
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1044: g_Players[kickerId].PatternId = PLAYER_POSE_BACK;
	ld	a, -49 (ix)
	add	a, #0x08
	ld	-27 (ix), a
	ld	a, -48 (ix)
	adc	a, #0x00
	ld	-26 (ix), a
	ld	l, -27 (ix)
	ld	h, -26 (ix)
	ld	(hl), #0x11
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1045: g_Players[gkId].Direction = DIRECTION_DOWN;
	ld	a, -43 (ix)
	add	a, #0x0a
	ld	-25 (ix), a
	ld	a, -42 (ix)
	adc	a, #0x00
	ld	-24 (ix), a
	ld	l, -25 (ix)
	ld	h, -24 (ix)
	ld	(hl), #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1046: g_Players[gkId].PatternId = PLAYER_POSE_FRONT;
	ld	a, -43 (ix)
	add	a, #0x08
	ld	-23 (ix), a
	ld	a, -42 (ix)
	adc	a, #0x00
	ld	-22 (ix), a
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	(hl), #0x10
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1048: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1049: g_Ball.X = kickSpotX;
	ld	hl, #0x0078
	ld	((_g_Ball + 2)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1050: g_Ball.Y = kickSpotY;
	ld	l, #0x61
	ld	(_g_Ball), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1052: UpdateSpritesPositions();
	call	_UpdateSpritesPositions
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1054: V9_PrintLayerAStringAtPos(10, 22, g_History1);
	ld	hl, #_g_History1
	push	hl
	ld	l, #0x16
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1055: V9_PrintLayerAStringAtPos(10, 23, g_History2);
	ld	hl, #_g_History2
	push	hl
	ld	l, #0x17
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1057: for(u8 w=0; w<60; w++) UpdateV9990();
	ld	c, #0x00
00344$:
	ld	a, c
	sub	a, #0x3c
	jr	NC, 00193$
	push	bc
	call	_UpdateV9990
	pop	bc
	inc	c
	jp	00344$
00193$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1060: u16 targetX = FIELD_POS_X_CENTER;
	ld	-21 (ix), #0x78
	ld	-20 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1061: bool shotTaken = false;
	ld	-16 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1063: if (kickingTeam == TEAM_1) {
	ld	a, -52 (ix)
	or	a, a
	jp	Z, 00205$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1064: g_ShotCursorX = FIELD_POS_X_CENTER;
	ld	hl, #0x0078
	ld	(_g_ShotCursorX), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1065: i8 arrowDir = 2;
	ld	-1 (ix), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1066: while(!shotTaken) {
00200$:
	ld	a, -16 (ix)
	or	a, a
	jp	NZ, 00206$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1067: UpdateV9990();
	call	_UpdateV9990
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1068: g_ShotCursorX += arrowDir;
	ld	a, -1 (ix)
	ld	-11 (ix), a
	rlca
	sbc	a, a
	ld	-10 (ix), a
	ld	hl, (_g_ShotCursorX)
	ld	-15 (ix), l
	ld	-14 (ix), h
	ld	a, -11 (ix)
	ld	-13 (ix), a
	ld	a, -10 (ix)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	add	a, -15 (ix)
	ld	-11 (ix), a
	ld	a, -12 (ix)
	adc	a, -14 (ix)
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(_g_ShotCursorX), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1069: if (g_ShotCursorX < GOAL_X_MIN - 10) arrowDir = 2;
	ld	de, #0x0056
	ld	hl, (_g_ShotCursorX)
	cp	a, a
	sbc	hl, de
	jr	NC, 00195$
	ld	-1 (ix), #0x02
00195$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1070: if (g_ShotCursorX > GOAL_X_MAX + 10) arrowDir = -2;
	ld	a, #0x9a
	ld	iy, #_g_ShotCursorX
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jr	NC, 00197$
	ld	-1 (ix), #0xfe
00197$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1073: attr.Y = FIELD_BOUND_Y_TOP - 20 - g_FieldCurrentYPosition;
	ld	a, (_g_FieldCurrentYPosition+0)
	ld	c, a
	ld	a, #0x1e
	sub	a, c
	ld	-56 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1074: attr.X = g_ShotCursorX;
	ld	hl, #2
	add	hl, sp
	ld	a, (_g_ShotCursorX+0)
	ld	(hl), a
	inc	hl
	ld	a, (_g_ShotCursorX+1)
	and	a, #0x03
	ld	c,a
	ld	a, (hl)
	and	a, #0xfc
	or	a, c
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1075: attr.Pattern = SPRITE_DOWN_ARROW;
	ld	-55 (ix), #0x79
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1076: attr.P = 1; attr.SC = 0; attr.D = 0;
	ld	hl, #3
	add	hl, sp
	set	5, (hl)
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	ld	(hl), a
	ld	hl, #3
	add	hl, sp
	res	4, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1077: V9_SetSpriteP1(16, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xfe40
	ld	hl, #0x0003
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1079: if (IsTeamJoystickTriggerPressed(TEAM_1)) {
	ld	a, #0x01
	call	_IsTeamJoystickTriggerPressed
	ld	-10 (ix), a
	or	a, a
	jp	Z, 00200$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1080: targetX = g_ShotCursorX;
	ld	hl, (_g_ShotCursorX)
	ld	-21 (ix), l
	ld	-20 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1081: shotTaken = true;
	ld	-16 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1082: attr.D = 1;
	ld	hl, #3
	add	hl, sp
	set	4, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1083: V9_SetSpriteP1(16, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xfe40
	ld	hl, #0x0003
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1083: V9_SetSpriteP1(16, &attr);
	jp	00200$
00205$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1087: u8 r = g_FrameCounter % 48;
	ld	hl, (_g_FrameCounter)
	ld	de, #0x0030
	call	__moduint
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1088: targetX = GOAL_X_MIN + r;
	ld	d, #0x00
	ld	hl, #0x0060
	add	hl, de
	ld	-21 (ix), l
	ld	-20 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1089: for(u8 w=0; w<120; w++) UpdateV9990(); // Wait 2 seconds
	ld	c, #0x00
00347$:
	ld	a, c
	sub	a, #0x78
	jr	NC, 00206$
	push	bc
	call	_UpdateV9990
	pop	bc
	inc	c
	jp	00347$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1090: shotTaken = true;
00206$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1095: bool goal = false;
	ld	-19 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1096: bool saved = false;
	ld	-18 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1097: u8 gkDiveDir = DIRECTION_NONE; 
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1099: if (kickingTeam == TEAM_1) {
	ld	a, -52 (ix)
	or	a, a
	jp	Z, 00229$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1100: bool isHard = (targetX < 105 || targetX > 135);
	ld	c, -21 (ix)
	ld	b, -20 (ix)
	ld	a, c
	sub	a, #0x69
	ld	a, b
	sbc	a, #0x00
	jr	C, 00370$
	ld	a, #0x87
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	C, 00370$
	xor	a, a
	jp	00371$
00370$:
	ld	a, #0x01
00371$:
	ld	-16 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1101: const TeamStats* stats = GetTeamStats(gkTeam);
	push	bc
	ld	a, -2 (ix)
	call	_GetTeamStats
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1102: u8 skill = stats->GkSkill; 
	ld	hl, #4
	add	hl, de
	ld	a, (hl)
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1103: u8 rnd = g_FrameCounter % 100;
	ld	hl, (_g_FrameCounter)
	push	bc
	ld	de, #0x0064
	call	__moduint
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1106: if (rnd < (isHard ? 20 : (40 + skill))) gkDiveDir = DIRECTION_LEFT; 
	ld	-2 (ix), e
	ld	-15 (ix), e
	ld	-14 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1105: if (targetX < 120) { 
	ld	a, c
	sub	a, #0x78
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00218$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1106: if (rnd < (isHard ? 20 : (40 + skill))) gkDiveDir = DIRECTION_LEFT; 
	ld	a, -16 (ix)
	or	a, a
	jr	Z, 00372$
	ld	-13 (ix), #0x14
	ld	-12 (ix), #0
	jp	00373$
00372$:
	ld	a, -10 (ix)
	ld	-11 (ix), a
	ld	-10 (ix), #0x00
	ld	a, -11 (ix)
	add	a, #0x28
	ld	-13 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
00373$:
	ld	a, -15 (ix)
	sub	a, -13 (ix)
	ld	a, -14 (ix)
	sbc	a, -12 (ix)
	jp	PO, 01056$
	xor	a, #0x80
01056$:
	jp	P, 00210$
	ld	-1 (ix), #0x07
	jp	00219$
00210$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1107: else if (rnd < 90) gkDiveDir = DIRECTION_RIGHT; 
	ld	a, -2 (ix)
	sub	a, #0x5a
	jr	NC, 00219$
	ld	-1 (ix), #0x03
	jp	00219$
00218$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1109: if (rnd < (isHard ? 20 : (40 + skill))) gkDiveDir = DIRECTION_RIGHT;
	ld	a, -16 (ix)
	or	a, a
	jr	Z, 00374$
	ld	-13 (ix), #0x14
	ld	-12 (ix), #0
	jp	00375$
00374$:
	ld	a, -10 (ix)
	ld	-11 (ix), a
	ld	-10 (ix), #0x00
	ld	a, -11 (ix)
	add	a, #0x28
	ld	-13 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
00375$:
	ld	a, -15 (ix)
	sub	a, -13 (ix)
	ld	a, -14 (ix)
	sbc	a, -12 (ix)
	jp	PO, 01057$
	xor	a, #0x80
01057$:
	jp	P, 00215$
	ld	-1 (ix), #0x03
	jp	00219$
00215$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1110: else if (rnd < 90) gkDiveDir = DIRECTION_LEFT;
	ld	a, -2 (ix)
	sub	a, #0x5a
	jr	NC, 00219$
	ld	-1 (ix), #0x07
00219$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1112: if (isHard && (g_FrameCounter & 1) == 0) gkDiveDir = DIRECTION_NONE; 
	ld	a, -16 (ix)
	or	a, a
	jr	Z, 00472$
	ld	hl, (_g_FrameCounter)
	bit	0, l
	jr	NZ, 00472$
	ld	-1 (ix), #0x00
	jp	00472$
00229$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1114: u8 joy = GetJoystick1Direction();
	call	_GetJoystick1Direction
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1115: if (joy == DIRECTION_LEFT) gkDiveDir = DIRECTION_LEFT;
	cp	a, #0x07
	jr	NZ, 00226$
	ld	-1 (ix), #0x07
	jp	00472$
00226$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1116: else if (joy == DIRECTION_RIGHT) gkDiveDir = DIRECTION_RIGHT;
	sub	a, #0x03
	jr	NZ, 00472$
	ld	-1 (ix), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1119: while (ballTimer < 60) {
00472$:
	ld	a, -1 (ix)
	sub	a, #0x07
	ld	a, #0x01
	jr	Z, 01065$
	xor	a, a
01065$:
	ld	-17 (ix), a
	ld	a, -1 (ix)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 01067$
	xor	a, a
01067$:
	ld	-16 (ix), a
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00249$:
	ld	a, -2 (ix)
	ld	-11 (ix), a
	ld	a, -1 (ix)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	sub	a, #0x3c
	ld	a, -10 (ix)
	sbc	a, #0x00
	jp	NC, 00251$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1120: UpdateV9990();
	call	_UpdateV9990
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1121: ballTimer++;
	inc	-2 (ix)
	jr	NZ, 01068$
	inc	-1 (ix)
01068$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1123: i16 dx = (i16)targetX - (i16)g_Ball.X;
	ld	a, -21 (ix)
	ld	-15 (ix), a
	ld	a, -20 (ix)
	ld	-14 (ix), a
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	ld	-13 (ix), a
	ld	a, -10 (ix)
	ld	-12 (ix), a
	ld	a, -15 (ix)
	sub	a, -13 (ix)
	ld	-11 (ix), a
	ld	a, -14 (ix)
	sbc	a, -12 (ix)
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1124: i16 dy = (i16)(FIELD_BOUND_Y_TOP - 10) - (i16)g_Ball.Y;
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-13 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	ld	-15 (ix), a
	ld	a, -12 (ix)
	ld	-14 (ix), a
	ld	a, #0x28
	sub	a, -15 (ix)
	ld	-13 (ix), a
	sbc	a, a
	sub	a, -14 (ix)
	ld	-12 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1125: if (Math_Abs32_Local(dy) > 2) {
	ld	a, -13 (ix)
	ld	-15 (ix), a
	ld	a, -12 (ix)
	ld	-14 (ix), a
	rlca
	sbc	a, a
	ld	-13 (ix), a
	ld	-12 (ix), a
	ld	e, -15 (ix)
	ld	d, -14 (ix)
	ld	l, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32_Local
	ld	-15 (ix), e
	ld	-14 (ix), d
	ld	-13 (ix), l
	ld	-12 (ix), h
	ld	a, #0x02
	cp	a, -15 (ix)
	ld	a, #0x00
	sbc	a, -14 (ix)
	ld	a, #0x00
	sbc	a, -13 (ix)
	ld	a, #0x00
	sbc	a, -12 (ix)
	jp	PO, 01069$
	xor	a, #0x80
01069$:
	jp	P, 00232$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1126: g_Ball.Y -= 4;
	ld	hl, (#_g_Ball + 0)
	ld	a, l
	add	a, #0xfc
	ld	c, a
	ld	a, h
	adc	a, #0xff
	ld	b, a
	ld	(_g_Ball), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1127: g_Ball.X += (dx / 10); 
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-13 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-12 (ix), a
	ld	l, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x000a
	call	__divsint
	ld	-11 (ix), e
	ld	-10 (ix), d
	ld	a, -13 (ix)
	ld	-15 (ix), a
	ld	a, -12 (ix)
	ld	-14 (ix), a
	ld	a, -11 (ix)
	ld	-13 (ix), a
	ld	a, -10 (ix)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	add	a, -15 (ix)
	ld	-11 (ix), a
	ld	a, -12 (ix)
	adc	a, -14 (ix)
	ld	-10 (ix), a
	ld	hl, #(_g_Ball + 2)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
00232$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1130: if (ballTimer < 20) {
	ld	a, -2 (ix)
	ld	b, -1 (ix)
	sub	a, #0x14
	ld	a, b
	sbc	a, #0x00
	jp	NC, 00239$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1131: if (gkDiveDir == DIRECTION_LEFT) {
	ld	a, -17 (ix)
	or	a, a
	jr	Z, 00236$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1132: g_Players[gkId].X -= 2;
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	ld	-13 (ix), a
	ld	a, -10 (ix)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	add	a, #0xfe
	ld	-11 (ix), a
	ld	a, -12 (ix)
	adc	a, #0xff
	ld	-10 (ix), a
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1133: g_Players[gkId].PatternId = PLAYER_POSE_TEAM2_GK_DOWN_LEFT;
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	(hl), #0xa0
	jp	00239$
00236$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1134: } else if (gkDiveDir == DIRECTION_RIGHT) {
	ld	a, -16 (ix)
	or	a, a
	jr	Z, 00239$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1135: g_Players[gkId].X += 2;
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	ld	-13 (ix), a
	ld	a, -10 (ix)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	add	a, #0x02
	ld	-11 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1136: g_Players[gkId].PatternId = PLAYER_POSE_TEAM2_GK_DOWN_RIGHT;
	ld	l, -23 (ix)
	ld	h, -22 (ix)
	ld	(hl), #0x2f
00239$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1140: if (g_Ball.Y <= FIELD_BOUND_Y_TOP + 5) {
	ld	hl, (#_g_Ball + 0)
	ld	a, #0x37
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	C, 00248$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1123: i16 dx = (i16)targetX - (i16)g_Ball.X;
	ld	hl, (#(_g_Ball + 2) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1141: if (g_Ball.X > GOAL_X_MIN && g_Ball.X < GOAL_X_MAX) {
	ld	-13 (ix), l
	ld	-12 (ix), h
	ld	a, #0x60
	cp	a, -13 (ix)
	ld	a, #0x00
	sbc	a, -12 (ix)
	jr	NC, 00251$
	ld	a, -13 (ix)
	sub	a, #0x90
	ld	a, -12 (ix)
	sbc	a, #0x00
	jr	NC, 00251$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1142: u16 gkX = g_Players[gkId].X;
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1143: if (g_Ball.X > gkX - 12 && g_Ball.X < gkX + 12) saved = true;
	ld	a, -2 (ix)
	ld	-11 (ix), a
	ld	a, -1 (ix)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	add	a, #0xf4
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	a, -2 (ix)
	sub	a, -13 (ix)
	ld	a, -1 (ix)
	sbc	a, -12 (ix)
	jr	NC, 00241$
	ld	a, -11 (ix)
	add	a, #0x0c
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	a, -13 (ix)
	sub	a, -2 (ix)
	ld	a, -12 (ix)
	sbc	a, -1 (ix)
	jr	NC, 00241$
	ld	-18 (ix), #0x01
	jp	00251$
00241$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1144: else goal = true;
	ld	-19 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1146: break; 
	jp	00251$
00248$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1148: UpdateSpritesPositions();
	call	_UpdateSpritesPositions
	jp	00249$
00251$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1152: if (goal) {
	ld	a, -19 (ix)
	or	a, a
	jr	Z, 00256$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1153: resChar = 'O'; // Uppercase for visibility
	ld	-1 (ix), #0x4f
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1154: if (kickingTeam == TEAM_1) goals1++; else goals2++;
	ld	a, -52 (ix)
	or	a, a
	jr	Z, 00253$
	inc	-7 (ix)
	jp	00254$
00253$:
	inc	-8 (ix)
00254$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1155: V9_PrintLayerAStringAtPos(12, 10, "GOAL!");
	ld	hl, #___str_1
	push	hl
	ld	l, #0x0a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
	jp	00257$
00256$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1157: resChar = 'X'; // Uppercase for visibility
	ld	-1 (ix), #0x58
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1158: V9_PrintLayerAStringAtPos(12, 10, saved ? "SAVED!" : "MISS!");
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00376$
	ld	-11 (ix), #<(___str_2)
	ld	-10 (ix), #>(___str_2)
	jp	00377$
00376$:
	ld	-11 (ix), #<(___str_3)
	ld	-10 (ix), #>(___str_3)
00377$:
	ld	c, -11 (ix)
	ld	b, -10 (ix)
	push	bc
	ld	l, #0x0a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
00257$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1161: if (kickingTeam == TEAM_1) { if(h1_idx < 19) { g_History1[h1_idx++] = resChar; g_History1[h1_idx] = 0; } shots1++; } 
	ld	a, -52 (ix)
	or	a, a
	jr	Z, 00263$
	ld	a, -9 (ix)
	sub	a, #0x13
	jr	NC, 00259$
	ld	a, #<(_g_History1)
	add	a, -9 (ix)
	ld	c, a
	ld	a, #>(_g_History1)
	adc	a, #0x00
	ld	b, a
	inc	-9 (ix)
	ld	a, -1 (ix)
	ld	(bc), a
	ld	a, #<(_g_History1)
	add	a, -9 (ix)
	ld	c, a
	ld	a, #>(_g_History1)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
00259$:
	inc	-4 (ix)
	jp	00264$
00263$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1162: else { if(h2_idx < 19) { g_History2[h2_idx++] = resChar; g_History2[h2_idx] = 0; } shots2++; }
	ld	a, -6 (ix)
	sub	a, #0x13
	jr	NC, 00261$
	ld	a, #<(_g_History2)
	add	a, -6 (ix)
	ld	c, a
	ld	a, #>(_g_History2)
	adc	a, #0x00
	ld	b, a
	inc	-6 (ix)
	ld	a, -1 (ix)
	ld	(bc), a
	ld	a, #<(_g_History2)
	add	a, -6 (ix)
	ld	c, a
	ld	a, #>(_g_History2)
	adc	a, #0x00
	ld	b, a
	xor	a, a
	ld	(bc), a
00261$:
	inc	-5 (ix)
00264$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1165: V9_PrintLayerAStringAtPos(10, 22, g_History1);
	ld	hl, #_g_History1
	push	hl
	ld	l, #0x16
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1166: V9_PrintLayerAStringAtPos(10, 23, g_History2);
	ld	hl, #_g_History2
	push	hl
	ld	l, #0x17
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1168: for(u8 w=0; w<120; w++) UpdateV9990();
	ld	c, #0x00
00350$:
	ld	a, c
	sub	a, #0x78
	jr	NC, 00265$
	push	bc
	call	_UpdateV9990
	pop	bc
	inc	c
	jp	00350$
00265$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1169: ClearTextFromLayerA(12, 10, 10);
	ld	a, #0x0a
	push	af
	inc	sp
	ld	l, #0x0a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1173: if (kickerId < 7) {
	ld	a, -51 (ix)
	sub	a, #0x07
	jr	NC, 00267$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1174: g_Players[kickerId].TargetY = 220 + (kickerId/4)*15; 
	ld	a, -45 (ix)
	ld	-2 (ix), a
	ld	a, -44 (ix)
	ld	-1 (ix), a
	ld	c, -51 (ix)
	ld	b, #0x00
	ld	e, c
	ld	d, b
	bit	7, b
	jr	Z, 00378$
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
00378$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	de, #0x00dc
	add	hl, de
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1175: g_Players[kickerId].TargetX = 80 + (kickerId%4)*25;
	ld	a, c
	and	a, #0x03
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #0x0050
	add	hl, bc
	ex	de, hl
	ld	l, -47 (ix)
	ld	h, -46 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00268$
00267$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1177: u8 k = kickerId - 7;
	ld	a, -51 (ix)
	add	a, #0xf9
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1178: g_Players[kickerId].TargetY = 260 + (k/4)*15;
	ld	a, -45 (ix)
	ld	-2 (ix), a
	ld	a, -44 (ix)
	ld	-1 (ix), a
	ld	b, #0x00
	ld	e, c
	ld	d, b
	bit	7, b
	jr	Z, 00379$
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
00379$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	de, #0x0104
	add	hl, de
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1179: g_Players[kickerId].TargetX = 80 + (k%4)*25;
	ld	a, c
	and	a, #0x03
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #0x0050
	add	hl, bc
	ex	de, hl
	ld	l, -47 (ix)
	ld	h, -46 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00268$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1183: if (gkId < 7) {
	ld	a, -50 (ix)
	sub	a, #0x07
	jr	NC, 00270$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1184: g_Players[gkId].TargetY = 220 + (gkId/4)*15; 
	ld	a, -39 (ix)
	ld	-2 (ix), a
	ld	a, -38 (ix)
	ld	-1 (ix), a
	ld	c, -50 (ix)
	ld	b, #0x00
	ld	e, c
	ld	d, b
	bit	7, b
	jr	Z, 00380$
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
00380$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	de, #0x00dc
	add	hl, de
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1185: g_Players[gkId].TargetX = 80 + (gkId%4)*25;
	ld	a, c
	and	a, #0x03
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #0x0050
	add	hl, bc
	ex	de, hl
	ld	l, -41 (ix)
	ld	h, -40 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00271$
00270$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1187: u8 k = gkId - 7;
	ld	a, -50 (ix)
	add	a, #0xf9
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1188: g_Players[gkId].TargetY = 260 + (k/4)*15;
	ld	a, -39 (ix)
	ld	-2 (ix), a
	ld	a, -38 (ix)
	ld	-1 (ix), a
	ld	b, #0x00
	ld	e, c
	ld	d, b
	bit	7, b
	jr	Z, 00381$
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
00381$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ld	de, #0x0104
	add	hl, de
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1189: g_Players[gkId].TargetX = 80 + (k%4)*25;
	ld	a, c
	and	a, #0x03
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #0x0050
	add	hl, bc
	ex	de, hl
	ld	l, -41 (ix)
	ld	h, -40 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00271$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1193: g_Players[REFEREE].TargetX = 128;
	ld	hl, #0x0080
	ld	((_g_Players + 310)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1194: g_Players[REFEREE].TargetY = 243;
	ld	l, #0xf3
	ld	((_g_Players + 308)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1196: while(true) {
00321$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1197: UpdateV9990();
	call	_UpdateV9990
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1198: bool kDone = true;
	ld	-14 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1199: bool gDone = true;
	ld	-13 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1200: bool rDone = true;
	ld	-12 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:998: if (g_Players[kickerId].Y > g_Players[kickerId].TargetY) { g_Players[kickerId].Y--; kDone=false; g_Players[kickerId].Direction=DIRECTION_UP; }
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	l, -45 (ix)
	ld	h, -44 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1203: if (g_Players[kickerId].Y < g_Players[kickerId].TargetY) { g_Players[kickerId].Y++; kDone=false; g_Players[kickerId].Direction=DIRECTION_DOWN; }
	ld	a, -11 (ix)
	sub	a, -2 (ix)
	ld	a, -10 (ix)
	sbc	a, -1 (ix)
	jr	NC, 00275$
	ld	a, -11 (ix)
	add	a, #0x01
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-14 (ix), #0x00
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	(hl), #0x05
	jp	00276$
00275$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1204: else if (g_Players[kickerId].Y > g_Players[kickerId].TargetY) { g_Players[kickerId].Y--; kDone=false; g_Players[kickerId].Direction=DIRECTION_UP; }
	ld	a, -2 (ix)
	sub	a, -11 (ix)
	ld	a, -1 (ix)
	sbc	a, -10 (ix)
	jr	NC, 00276$
	ld	a, -11 (ix)
	add	a, #0xff
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	l, -49 (ix)
	ld	h, -48 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-14 (ix), #0x00
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	(hl), #0x01
00276$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1001: if (g_Players[kickerId].X > g_Players[kickerId].TargetX) { g_Players[kickerId].X--; kDone=false; g_Players[kickerId].Direction=DIRECTION_LEFT; }
	ld	l, -33 (ix)
	ld	h, -32 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	l, -47 (ix)
	ld	h, -46 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1206: if (g_Players[kickerId].X < g_Players[kickerId].TargetX) { g_Players[kickerId].X++; kDone=false; if(g_Players[kickerId].Direction==DIRECTION_NONE) g_Players[kickerId].Direction=DIRECTION_RIGHT; }
	ld	a, -11 (ix)
	sub	a, -2 (ix)
	ld	a, -10 (ix)
	sbc	a, -1 (ix)
	jr	NC, 00284$
	ld	a, -11 (ix)
	add	a, #0x01
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -33 (ix)
	ld	h, -32 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-14 (ix), #0x00
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	a, (hl)
	or	a, a
	jr	NZ, 00285$
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	(hl), #0x03
	jp	00285$
00284$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1207: else if (g_Players[kickerId].X > g_Players[kickerId].TargetX) { g_Players[kickerId].X--; kDone=false; if(g_Players[kickerId].Direction==DIRECTION_NONE) g_Players[kickerId].Direction=DIRECTION_LEFT; }
	ld	a, -2 (ix)
	sub	a, -11 (ix)
	ld	a, -1 (ix)
	sbc	a, -10 (ix)
	jr	NC, 00285$
	ld	a, -11 (ix)
	add	a, #0xff
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	l, -33 (ix)
	ld	h, -32 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-14 (ix), #0x00
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	a, (hl)
	or	a, a
	jr	NZ, 00285$
	ld	l, -29 (ix)
	ld	h, -28 (ix)
	ld	(hl), #0x07
00285$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1006: if (g_Players[gkId].Y > g_Players[gkId].TargetY) { g_Players[gkId].Y--; gDone=false; g_Players[gkId].Direction=DIRECTION_UP; }
	ld	l, -43 (ix)
	ld	h, -42 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	l, -39 (ix)
	ld	h, -38 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1210: if (g_Players[gkId].Y < g_Players[gkId].TargetY) { g_Players[gkId].Y++; gDone=false; g_Players[gkId].Direction=DIRECTION_DOWN; }
	ld	a, -11 (ix)
	sub	a, -2 (ix)
	ld	a, -10 (ix)
	sbc	a, -1 (ix)
	jr	NC, 00289$
	ld	a, -11 (ix)
	add	a, #0x01
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -43 (ix)
	ld	h, -42 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-13 (ix), #0x00
	ld	l, -25 (ix)
	ld	h, -24 (ix)
	ld	(hl), #0x05
	jp	00290$
00289$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1211: else if (g_Players[gkId].Y > g_Players[gkId].TargetY) { g_Players[gkId].Y--; gDone=false; g_Players[gkId].Direction=DIRECTION_UP; }
	ld	a, -2 (ix)
	sub	a, -11 (ix)
	ld	a, -1 (ix)
	sbc	a, -10 (ix)
	jr	NC, 00290$
	ld	a, -11 (ix)
	add	a, #0xff
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	l, -43 (ix)
	ld	h, -42 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-13 (ix), #0x00
	ld	l, -25 (ix)
	ld	h, -24 (ix)
	ld	(hl), #0x01
00290$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1009: if (g_Players[gkId].X > g_Players[gkId].TargetX) { g_Players[gkId].X--; gDone=false; g_Players[gkId].Direction=DIRECTION_LEFT; }
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	l, -41 (ix)
	ld	h, -40 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1213: if (g_Players[gkId].X < g_Players[gkId].TargetX) { g_Players[gkId].X++; gDone=false; if(g_Players[gkId].Direction==DIRECTION_NONE) g_Players[gkId].Direction=DIRECTION_RIGHT; }
	ld	a, -11 (ix)
	sub	a, -2 (ix)
	ld	a, -10 (ix)
	sbc	a, -1 (ix)
	jr	NC, 00298$
	ld	a, -11 (ix)
	add	a, #0x01
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-13 (ix), #0x00
	ld	l, -25 (ix)
	ld	h, -24 (ix)
	ld	a, (hl)
	or	a, a
	jr	NZ, 00299$
	ld	l, -25 (ix)
	ld	h, -24 (ix)
	ld	(hl), #0x03
	jp	00299$
00298$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1214: else if (g_Players[gkId].X > g_Players[gkId].TargetX) { g_Players[gkId].X--; gDone=false; if(g_Players[gkId].Direction==DIRECTION_NONE) g_Players[gkId].Direction=DIRECTION_LEFT; }
	ld	a, -2 (ix)
	sub	a, -11 (ix)
	ld	a, -1 (ix)
	sbc	a, -10 (ix)
	jr	NC, 00299$
	ld	a, -11 (ix)
	add	a, #0xff
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	l, -31 (ix)
	ld	h, -30 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-13 (ix), #0x00
	ld	l, -25 (ix)
	ld	h, -24 (ix)
	ld	a, (hl)
	or	a, a
	jr	NZ, 00299$
	ld	l, -25 (ix)
	ld	h, -24 (ix)
	ld	(hl), #0x07
00299$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1014: if (g_Players[REFEREE].Y > g_Players[REFEREE].TargetY) { g_Players[REFEREE].Y--; rDone=false; g_Players[REFEREE].Direction=DIRECTION_UP; }
	ld	hl, #(_g_Players + 294)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	hl, #(_g_Players + 308)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1217: if (g_Players[REFEREE].Y < g_Players[REFEREE].TargetY) { g_Players[REFEREE].Y++; rDone=false; g_Players[REFEREE].Direction=DIRECTION_DOWN; }
	ld	a, -11 (ix)
	sub	a, -2 (ix)
	ld	a, -10 (ix)
	sbc	a, -1 (ix)
	jr	NC, 00303$
	ld	a, -11 (ix)
	add	a, #0x01
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	hl, #(_g_Players + 294)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-12 (ix), #0x00
	ld	hl, #(_g_Players + 304)
	ld	(hl), #0x05
	jp	00304$
00303$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1218: else if (g_Players[REFEREE].Y > g_Players[REFEREE].TargetY) { g_Players[REFEREE].Y--; rDone=false; g_Players[REFEREE].Direction=DIRECTION_UP; }
	ld	a, -2 (ix)
	sub	a, -11 (ix)
	ld	a, -1 (ix)
	sbc	a, -10 (ix)
	jr	NC, 00304$
	ld	a, -11 (ix)
	add	a, #0xff
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	hl, #(_g_Players + 294)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-12 (ix), #0x00
	ld	hl, #(_g_Players + 304)
	ld	(hl), #0x01
00304$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1017: if (g_Players[REFEREE].X > g_Players[REFEREE].TargetX) { g_Players[REFEREE].X--; rDone=false; g_Players[REFEREE].Direction=DIRECTION_LEFT; }
	ld	hl, #(_g_Players + 296)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	hl, #(_g_Players + 310)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1220: if (g_Players[REFEREE].X < g_Players[REFEREE].TargetX) { g_Players[REFEREE].X++; rDone=false; g_Players[REFEREE].Direction=DIRECTION_RIGHT; }
	ld	a, -11 (ix)
	sub	a, -2 (ix)
	ld	a, -10 (ix)
	sbc	a, -1 (ix)
	jr	NC, 00308$
	ld	a, -11 (ix)
	add	a, #0x01
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	hl, #(_g_Players + 296)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-12 (ix), #0x00
	ld	hl, #(_g_Players + 304)
	ld	(hl), #0x03
	jp	00309$
00308$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1221: else if (g_Players[REFEREE].X > g_Players[REFEREE].TargetX) { g_Players[REFEREE].X--; rDone=false; g_Players[REFEREE].Direction=DIRECTION_LEFT; }
	ld	a, -2 (ix)
	sub	a, -11 (ix)
	ld	a, -1 (ix)
	sbc	a, -10 (ix)
	jr	NC, 00309$
	ld	a, -11 (ix)
	add	a, #0xff
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	hl, #(_g_Players + 296)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	ld	-12 (ix), #0x00
	ld	hl, #(_g_Players + 304)
	ld	(hl), #0x07
00309$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1021: u16 animStatus = ((g_FrameCounter % 8) == 0) ? PLAYER_STATUS_NONE : PLAYER_STATUS_POSITIONED;
	ld	hl, (_g_FrameCounter)
	ld	-11 (ix), l
	ld	-10 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1224: u16 animStatus = ((g_FrameCounter % 8) == 0) ? PLAYER_STATUS_NONE : PLAYER_STATUS_POSITIONED;
	ld	a, -11 (ix)
	and	a,#0x07
	jr	NZ, 00382$
	ld	-2 (ix), a
	ld	-1 (ix), a
	jp	00383$
00382$:
	ld	-2 (ix), #0x04
	ld	-1 (ix), #0
00383$:
	ld	c, -2 (ix)
	ld	b, -1 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1227: if (goal) {
	ld	a, -19 (ix)
	or	a, a
	jr	Z, 00311$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1229: u8 anim = (g_FrameCounter / 8) % 2;
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	a, e
	and	a, #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1230: g_Players[kickerId].PatternId = (anim == 0) ? PLAYER_POSE_CELEBRATION_FRONT_1 : PLAYER_POSE_CELEBRATION_FRONT_2;
	push	af
	ld	a, -27 (ix)
	ld	-2 (ix), a
	ld	a, -26 (ix)
	ld	-1 (ix), a
	pop	af
	or	a, a
	jr	NZ, 00384$
	ld	de, #0x0030
	jp	00385$
00384$:
	ld	de, #0x0031
00385$:
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1231: g_Players[kickerId].Status = PLAYER_STATUS_POSITIONED; // Lock pattern
	ld	l, -37 (ix)
	ld	h, -36 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
	jp	00312$
00311$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1233: g_Players[kickerId].Status = animStatus;
	ld	l, -37 (ix)
	ld	h, -36 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00312$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1236: g_Players[gkId].Status = animStatus;
	ld	l, -35 (ix)
	ld	h, -34 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1237: g_Players[REFEREE].Status = animStatus;
	ld	((_g_Players + 312)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1240: if (g_FieldCurrentYPosition < 137) g_FieldCurrentYPosition++;
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x89
	ld	a, (_g_FieldCurrentYPosition+1)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00314$
	ld	hl, (_g_FieldCurrentYPosition)
	inc	hl
	ld	(_g_FieldCurrentYPosition), hl
00314$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1242: V9_SetScrollingBY((u16)g_FieldCurrentYPosition);
	ld	hl, (_g_FieldCurrentYPosition)
	call	_V9_SetScrollingBY
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1243: UpdateSpritesPositions();
	call	_UpdateSpritesPositions
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1245: if (kDone && gDone && rDone && g_FieldCurrentYPosition >= 137) break;
	ld	a, -14 (ix)
	or	a, a
	jp	Z, 00321$
	ld	a, -13 (ix)
	or	a, a
	jp	Z, 00321$
	ld	a, -12 (ix)
	or	a, a
	jp	Z, 00321$
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x89
	ld	a, (_g_FieldCurrentYPosition+1)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00321$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1249: for(u8 i=0; i<15; i++) {
	ld	-1 (ix), #0x00
00353$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	NC, 00326$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1250: if (g_Players[i].Y < 243) {
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, -11 (ix)
	add	a, #<(_g_Players)
	ld	-17 (ix), a
	ld	a, -10 (ix)
	adc	a, #>(_g_Players)
	ld	-16 (ix), a
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	ld	-15 (ix), a
	ld	a, -10 (ix)
	ld	-14 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1251: g_Players[i].Direction = DIRECTION_DOWN;
	ld	a, -17 (ix)
	add	a, #0x0a
	ld	-13 (ix), a
	ld	a, -16 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1252: g_Players[i].PatternId = PLAYER_POSE_FRONT;
	ld	a, -17 (ix)
	add	a, #0x08
	ld	-11 (ix), a
	ld	a, -16 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1250: if (g_Players[i].Y < 243) {
	ld	a, -15 (ix)
	sub	a, #0xf3
	ld	a, -14 (ix)
	sbc	a, #0x00
	jr	NC, 00324$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1251: g_Players[i].Direction = DIRECTION_DOWN;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1252: g_Players[i].PatternId = PLAYER_POSE_FRONT;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), #0x10
	jp	00325$
00324$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1254: g_Players[i].Direction = DIRECTION_UP;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1255: g_Players[i].PatternId = PLAYER_POSE_BACK;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), #0x11
00325$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1257: g_Players[i].Status = PLAYER_STATUS_POSITIONED;
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1249: for(u8 i=0; i<15; i++) {
	inc	-1 (ix)
	jp	00353$
00326$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1259: UpdateSpritesPositions();
	call	_UpdateSpritesPositions
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1261: turn++;
	inc	-3 (ix)
	jp	00328$
00355$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1263: }
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "PENALTY SHOOTOUT"
	.db 0x00
___str_1:
	.ascii "GOAL!"
	.db 0x00
___str_2:
	.ascii "SAVED!"
	.db 0x00
___str_3:
	.ascii "MISS!"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1265: void TeamVictory(u8 teamId) {
;	---------------------------------
; Function TeamVictory
; ---------------------------------
_TeamVictory::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-40
	add	hl, sp
	ld	sp, hl
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1266: g_MatchStatus = MATCH_VICTORY_LAP;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x10
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1267: g_FieldScrollingActionInProgress = NO_VALUE; // Disable ISR scrolling
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1270: u16 targetX = g_Ball.X;
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-36 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-35 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1271: u16 targetY = g_Ball.Y;
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-34 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-33 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1274: g_Ball.Y = g_FieldCurrentYPosition + 240; 
	ld	hl, (_g_FieldCurrentYPosition)
	ld	de, #0x00f0
	add	hl, de
	ex	de, hl
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1277: if (targetY < g_FieldCurrentYPosition || targetY > g_FieldCurrentYPosition + 212) {
	ld	c, -34 (ix)
	ld	b, -33 (ix)
	ld	hl, (_g_FieldCurrentYPosition)
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	C, 00101$
	ld	hl, (_g_FieldCurrentYPosition)
	ld	de, #0x00d4
	add	hl, de
	xor	a, a
	sbc	hl, bc
	jr	NC, 00200$
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1278: targetY = g_FieldCurrentYPosition + 106;
	ld	hl, (_g_FieldCurrentYPosition)
	ld	de, #0x006a
	add	hl, de
	ld	-34 (ix), l
	ld	-33 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1279: targetX = 128;
	ld	-36 (ix), #0x80
	ld	-35 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1283: for(u8 i=0; i<15; i++) {
00200$:
	ld	de, #_g_Players+0
	ld	c, #0x00
00178$:
	ld	a, c
	sub	a, #0x0f
	jr	NC, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1285: g_Players[i].Status = PLAYER_STATUS_NONE; // Active for movement
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, de
	push	de
	ld	de, #0x0012
	add	hl, de
	pop	de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1283: for(u8 i=0; i<15; i++) {
	inc	c
	jp	00178$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1291: while (true) { 
	xor	a, a
	ld	-6 (ix), a
	ld	-5 (ix), a
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
00175$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1292: UpdateV9990();
	call	_UpdateV9990
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1293: timer++;
	inc	-4 (ix)
	jr	NZ, 00391$
	inc	-3 (ix)
00391$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1297: for(u8 i=0; i<15; i++) { // Loop 0 to 14 (Includes Referee)
	ld	a, -4 (ix)
	and	a, #0x01
	ld	-32 (ix), a
	ld	-31 (ix), #0x00
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
00181$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	NC, 00167$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1299: bool isWinner = (g_Players[i].TeamId == teamId);
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a, -9 (ix)
	add	a, #<(_g_Players)
	ld	-30 (ix), a
	ld	a, -8 (ix)
	adc	a, #>(_g_Players)
	ld	-29 (ix), a
	ld	a, -30 (ix)
	ld	-9 (ix), a
	ld	a, -29 (ix)
	ld	-8 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	ld	-8 (ix), a
	ld	a, -7 (ix)
	sub	a, -8 (ix)
	ld	a, #0x01
	jr	Z, 00393$
	xor	a, a
00393$:
	ld	-8 (ix), a
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1300: if (i == REFEREE) isWinner = false; // Force Referee to be "loser" (exit field)
	ld	a, -1 (ix)
	sub	a, #0x0e
	jr	NZ, 00106$
	ld	-10 (ix), #0x00
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1306: i16 dx = (i16)targetX - (i16)g_Players[i].X;
	ld	a, -30 (ix)
	add	a, #0x02
	ld	-28 (ix), a
	ld	a, -29 (ix)
	adc	a, #0x00
	ld	-27 (ix), a
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1302: if (isWinner) {
	ld	a, -10 (ix)
	or	a, a
	jp	Z, 00164$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1306: i16 dx = (i16)targetX - (i16)g_Players[i].X;
	ld	a, -36 (ix)
	ld	-13 (ix), a
	ld	a, -35 (ix)
	ld	-12 (ix), a
	ld	a, -9 (ix)
	ld	-11 (ix), a
	ld	a, -8 (ix)
	ld	-10 (ix), a
	ld	a, -13 (ix)
	sub	a, -11 (ix)
	ld	-9 (ix), a
	ld	a, -12 (ix)
	sbc	a, -10 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-26 (ix), a
	ld	a, -8 (ix)
	ld	-25 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1307: i16 dy = (i16)targetY - (i16)g_Players[i].Y;
	ld	a, -34 (ix)
	ld	-13 (ix), a
	ld	a, -33 (ix)
	ld	-12 (ix), a
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-11 (ix), a
	ld	a, -8 (ix)
	ld	-10 (ix), a
	ld	a, -13 (ix)
	sub	a, -11 (ix)
	ld	-9 (ix), a
	ld	a, -12 (ix)
	sbc	a, -10 (ix)
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1310: u16 dist = (u16)(Math_Abs32_Local(dx) + Math_Abs32_Local(dy));
	ld	a, -26 (ix)
	ld	-24 (ix), a
	ld	a, -25 (ix)
	ld	-23 (ix), a
	rlca
	sbc	a, a
	ld	-22 (ix), a
	ld	-21 (ix), a
	ld	e, -24 (ix)
	ld	d, -23 (ix)
	ld	l, -22 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -21 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32_Local
	ld	-13 (ix), e
	ld	-12 (ix), d
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, -9 (ix)
	ld	-20 (ix), a
	ld	a, -8 (ix)
	ld	-19 (ix), a
	rlca
	sbc	a, a
	ld	-18 (ix), a
	ld	-17 (ix), a
	ld	e, -20 (ix)
	ld	d, -19 (ix)
	ld	l, -18 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32_Local
	inc	sp
	inc	sp
	push	de
	ld	-38 (ix), l
	ld	-37 (ix), h
	ld	a, -13 (ix)
	ld	-15 (ix), a
	ld	a, -12 (ix)
	ld	-14 (ix), a
	ld	a, -40 (ix)
	ld	-13 (ix), a
	ld	a, -39 (ix)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	add	a, -15 (ix)
	ld	-11 (ix), a
	ld	a, -12 (ix)
	adc	a, -14 (ix)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	ld	-38 (ix), a
	ld	a, -10 (ix)
	ld	-37 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1313: u8 stopDist = 35 + (i % 7) * 10; 
	ld	a, -1 (ix)
	ld	-16 (ix), a
	ld	-15 (ix), #0x00
	ld	de, #0x0007
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	ld	-11 (ix), e
	ld	-10 (ix), d
	ld	a, -11 (ix)
	ld	-10 (ix), a
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	ld	-10 (ix), a
	add	a, #0x23
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1315: if (dist > stopDist) {
	ld	-14 (ix), a
	ld	-13 (ix), a
	ld	-12 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1327: g_Players[i].Status = PLAYER_STATUS_NONE; // Running animation
	ld	a, -30 (ix)
	add	a, #0x12
	ld	-11 (ix), a
	ld	a, -29 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1315: if (dist > stopDist) {
	ld	a, -13 (ix)
	sub	a, -38 (ix)
	ld	a, -12 (ix)
	sbc	a, -37 (ix)
	jp	NC, 00144$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1317: if (dx > 0) g_Players[i].X++; else if (dx < 0) g_Players[i].X--;
	ld	a, -26 (ix)
	ld	-13 (ix), a
	ld	a, -25 (ix)
	ld	-12 (ix), a
	xor	a, a
	cp	a, -13 (ix)
	sbc	a, -12 (ix)
	jp	PO, 00396$
	xor	a, #0x80
00396$:
	rlca
	and	a,#0x01
	ld	-16 (ix), a
	or	a, a
	jr	Z, 00110$
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	a, (hl)
	ld	-15 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-14 (ix), a
	ld	a, -15 (ix)
	add	a, #0x01
	ld	-13 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
	jp	00111$
00110$:
	bit	7, -12 (ix)
	jr	Z, 00111$
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1318: if (dy > 0) g_Players[i].Y++; else if (dy < 0) g_Players[i].Y--;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 00397$
	xor	a, #0x80
00397$:
	rlca
	and	a,#0x01
	ld	-14 (ix), a
	or	a, a
	jr	Z, 00115$
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	a, (hl)
	ld	-13 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	add	a, #0x01
	ld	-9 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	a, -9 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -8 (ix)
	ld	(hl), a
	jp	00116$
00115$:
	bit	7, -8 (ix)
	jr	Z, 00116$
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1321: if (Math_Abs32_Local(dx) > Math_Abs32_Local(dy)) {
	ld	e, -24 (ix)
	ld	d, -23 (ix)
	ld	l, -22 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -21 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32_Local
	ld	-24 (ix), e
	ld	-23 (ix), d
	ld	-22 (ix), l
	ld	-21 (ix), h
	ld	e, -20 (ix)
	ld	d, -19 (ix)
	ld	l, -18 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32_Local
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1322: g_Players[i].Direction = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
	ld	a, -30 (ix)
	add	a, #0x0a
	ld	-9 (ix), a
	ld	a, -29 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1321: if (Math_Abs32_Local(dx) > Math_Abs32_Local(dy)) {
	ld	a, e
	sub	a, -24 (ix)
	ld	a, d
	sbc	a, -23 (ix)
	ld	a, l
	sbc	a, -22 (ix)
	ld	a, h
	sbc	a, -21 (ix)
	jp	PO, 00398$
	xor	a, #0x80
00398$:
	jp	P, 00118$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1322: g_Players[i].Direction = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
	ld	a, -16 (ix)
	or	a, a
	jr	Z, 00184$
	ld	-13 (ix), #0x03
	ld	-12 (ix), #0
	jp	00185$
00184$:
	ld	-13 (ix), #0x07
	ld	-12 (ix), #0
00185$:
	ld	a, -13 (ix)
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
	jp	00119$
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1324: g_Players[i].Direction = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
	ld	a, -14 (ix)
	or	a, a
	jr	Z, 00186$
	ld	-13 (ix), #0x05
	ld	-12 (ix), #0
	jp	00187$
00186$:
	ld	-13 (ix), #0x01
	ld	-12 (ix), #0
00187$:
	ld	a, -13 (ix)
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), a
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1327: g_Players[i].Status = PLAYER_STATUS_NONE; // Running animation
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00166$
00144$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1331: g_Players[i].Status = PLAYER_STATUS_POSITIONED; // Lock pose
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1334: bool animFrame = (timer / 8) % 2 == 0;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	e, c
	ld	d, b
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	a, e
	and	a, #0x01
	ld	e, a
	ld	d, #0x00
	ld	a, e
	or	a, a
	or	a, d
	ld	a, #0x01
	jr	Z, 00400$
	xor	a, a
00400$:
	ld	-13 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1337: if ((timer % 3) == 0) { // Slow speed
	push	bc
	ld	de, #0x0003
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__moduint
	pop	bc
	ld	a, d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1338: i8 moveX = 0;
	or	a,e
	jp	NZ,00139$
	ld	e,a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1339: i8 moveY = 0;
	ld	-12 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1341: if (dy > 10) moveX = 1; else if (dy < -10) moveX = -1;
	ld	a, -9 (ix)
	ld	-11 (ix), a
	ld	a, -8 (ix)
	ld	-10 (ix), a
	ld	a, #0x0a
	cp	a, -11 (ix)
	ld	a, #0x00
	sbc	a, -10 (ix)
	jp	PO, 00401$
	xor	a, #0x80
00401$:
	jp	P, 00123$
	ld	e, #0x01
	jp	00124$
00123$:
	ld	a, -9 (ix)
	sub	a, #0xf6
	ld	a, -8 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00124$
	ld	e, #0xff
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1342: if (dx > 10) moveY = -1; else if (dx < -10) moveY = 1;
	ld	a, -26 (ix)
	ld	-9 (ix), a
	ld	a, -25 (ix)
	ld	-8 (ix), a
	ld	a, #0x0a
	cp	a, -9 (ix)
	ld	a, #0x00
	sbc	a, -8 (ix)
	jp	PO, 00402$
	xor	a, #0x80
00402$:
	jp	P, 00128$
	ld	-12 (ix), #0xff
	jp	00129$
00128$:
	ld	a, -26 (ix)
	sub	a, #0xf6
	ld	a, -25 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00129$
	ld	-12 (ix), #0x01
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1344: g_Players[i].X += moveX;
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	rlca
	sbc	a, a
	ld	d, a
	add	hl, de
	ex	de, hl
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1345: g_Players[i].Y += moveY;
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, -12 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ex	de, hl
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1348: u16 currentDist = (u16)(Math_Abs32_Local(dx) + Math_Abs32_Local(dy));
	push	bc
	ld	e, -24 (ix)
	ld	d, -23 (ix)
	ld	l, -22 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -21 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32_Local
	ld	-24 (ix), e
	ld	-23 (ix), d
	ld	-22 (ix), l
	ld	-21 (ix), h
	ld	e, -20 (ix)
	ld	d, -19 (ix)
	ld	l, -18 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32_Local
	push	hl
	pop	iy
	pop	bc
	ld	l, -24 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -23 (ix)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1349: if (currentDist > stopDist + 15) {
	ld	a, -14 (ix)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	jr	NC, 00403$
	inc	h
00403$:
	xor	a, a
	sbc	hl, de
	jr	NC, 00139$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1306: i16 dx = (i16)targetX - (i16)g_Players[i].X;
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	a, (hl)
	ld	-18 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-17 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1350: if (dx > 0) g_Players[i].X++; else g_Players[i].X--;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 00404$
	xor	a, #0x80
00404$:
	jp	P, 00131$
	ld	e, -18 (ix)
	ld	d, -17 (ix)
	inc	de
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00132$
00131$:
	ld	e, -18 (ix)
	ld	d, -17 (ix)
	dec	de
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00132$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1307: i16 dy = (i16)targetY - (i16)g_Players[i].Y;
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1351: if (dy > 0) g_Players[i].Y++; else g_Players[i].Y--;
	xor	a, a
	cp	a, -11 (ix)
	sbc	a, -10 (ix)
	jp	PO, 00405$
	xor	a, #0x80
00405$:
	jp	P, 00134$
	inc	de
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00139$
00134$:
	dec	de
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00139$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1356: bool showBack = ((timer + i * 17) / 60) & 1;
	ld	e, -16 (ix)
	ld	d, -15 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	de, #0x003c
	call	__divuint
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1359: g_Players[i].PatternId = animFrame ? PLAYER_POSE_CELEBRATION_BACK_1 : PLAYER_POSE_CELEBRATION_BACK_2;
	ld	a, -30 (ix)
	add	a, #0x08
	ld	-9 (ix), a
	ld	a, -29 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1356: bool showBack = ((timer + i * 17) / 60) & 1;
	bit	0, e
	jr	Z, 00141$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1358: if (showBack) {
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1359: g_Players[i].PatternId = animFrame ? PLAYER_POSE_CELEBRATION_BACK_1 : PLAYER_POSE_CELEBRATION_BACK_2;
	ld	a, -13 (ix)
	or	a, a
	jr	Z, 00188$
	ld	bc, #0x0032
	jp	00189$
00188$:
	ld	bc, #0x0033
00189$:
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), c
	jp	00166$
00141$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1361: g_Players[i].PatternId = animFrame ? PLAYER_POSE_CELEBRATION_FRONT_1 : PLAYER_POSE_CELEBRATION_FRONT_2;
	ld	a, -13 (ix)
	or	a, a
	jr	Z, 00190$
	ld	de, #0x0030
	jp	00191$
00190$:
	ld	de, #0x0031
00191$:
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), e
	jp	00166$
00164$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1368: if (g_Players[i].X < 8) {
	ld	a, -9 (ix)
	ld	b, -8 (ix)
	sub	a, #0x08
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00147$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1370: g_Players[i].Y = (g_FieldCurrentYPosition > 32) ? g_FieldCurrentYPosition - 32 : 0;
	ld	c, -30 (ix)
	ld	b, -29 (ix)
	ld	a, #0x20
	ld	iy, #_g_FieldCurrentYPosition
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00407$
	xor	a, #0x80
00407$:
	jp	P, 00192$
	ld	a, (_g_FieldCurrentYPosition+0)
	add	a, #0xe0
	ld	e, a
	ld	a, (_g_FieldCurrentYPosition+1)
	adc	a, #0xff
	ld	d, a
	jp	00193$
00192$:
	ld	de, #0x0000
00193$:
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1371: continue; // Skip movement, count as exited
	jp	00166$
00147$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1374: losersOnField++;
	inc	-2 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1377: i16 dx = (i16)0 - (i16)g_Players[i].X;
	ld	a, -9 (ix)
	ld	c, -8 (ix)
	neg
	ld	e, a
	sbc	a, a
	sub	a, c
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1378: i16 dy = (i16)FIELD_POS_Y_CENTER - (i16)g_Players[i].Y;
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xf3
	sub	a, c
	ld	-11 (ix), a
	sbc	a, a
	sub	a, b
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1381: if ((timer & 1) == 0) {
	ld	a, -31 (ix)
	or	a, -32 (ix)
	jr	NZ, 00159$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1382: if (dx > 0) g_Players[i].X++; else if (dx < 0) g_Players[i].X--;
	ld	c, e
	ld	b, d
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00408$
	xor	a, #0x80
00408$:
	jp	P, 00151$
	ld	c, -9 (ix)
	ld	b, -8 (ix)
	inc	bc
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00152$
00151$:
	bit	7, b
	jr	Z, 00152$
	ld	c, -9 (ix)
	ld	b, -8 (ix)
	dec	bc
	ld	l, -28 (ix)
	ld	h, -27 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00152$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1383: if (dy > 0) g_Players[i].Y++; else if (dy < 0) g_Players[i].Y--;
	ld	c, -11 (ix)
	ld	b, -10 (ix)
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00409$
	xor	a, #0x80
00409$:
	jp	P, 00156$
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00159$
00156$:
	bit	7, b
	jr	Z, 00159$
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00159$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1387: if (Math_Abs32_Local(dx) > Math_Abs32_Local(dy)) {
	ld	c, e
	ld	a, d
	ld	b, a
	rlca
	sbc	hl, hl
	push	de
	ld	e, c
	ld	d, b
	call	_Math_Abs32_Local
	ld	-19 (ix), e
	ld	-18 (ix), d
	ld	-17 (ix), l
	ld	-16 (ix), h
	pop	de
	ld	c, -11 (ix)
	ld	a, -10 (ix)
	ld	b, a
	rlca
	sbc	hl, hl
	push	de
	ld	e, c
	ld	d, b
	call	_Math_Abs32_Local
	ld	-15 (ix), e
	ld	-14 (ix), d
	ld	-13 (ix), l
	ld	-12 (ix), h
	pop	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1388: g_Players[i].Direction = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
	ld	a, -30 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -29 (ix)
	adc	a, #0x00
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1387: if (Math_Abs32_Local(dx) > Math_Abs32_Local(dy)) {
	ld	a, -15 (ix)
	sub	a, -19 (ix)
	ld	a, -14 (ix)
	sbc	a, -18 (ix)
	ld	a, -13 (ix)
	sbc	a, -17 (ix)
	ld	a, -12 (ix)
	sbc	a, -16 (ix)
	jp	PO, 00410$
	xor	a, #0x80
00410$:
	jp	P, 00161$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1388: g_Players[i].Direction = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00411$
	xor	a, #0x80
00411$:
	jp	P, 00194$
	ld	de, #0x0003
	jp	00195$
00194$:
	ld	de, #0x0007
00195$:
	ld	a, e
	ld	(bc), a
	jp	00162$
00161$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1390: g_Players[i].Direction = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00412$
	xor	a, #0x80
00412$:
	jp	P, 00196$
	ld	de, #0x0005
	jp	00197$
00196$:
	ld	de, #0x0001
00197$:
	ld	a, e
	ld	(bc), a
00162$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1393: g_Players[i].Status = PLAYER_STATUS_NONE; // Walking animation
	ld	l, -30 (ix)
	ld	h, -29 (ix)
	ld	de, #0x0012
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00166$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1297: for(u8 i=0; i<15; i++) { // Loop 0 to 14 (Includes Referee)
	inc	-1 (ix)
	jp	00181$
00167$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1397: UpdateSpritesPositions();
	call	_UpdateSpritesPositions
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1399: if (losersOnField == 0) {
	ld	a, -2 (ix)
	or	a, a
	jr	NZ, 00171$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1400: extraTime++;
	inc	-6 (ix)
	jr	NZ, 00413$
	inc	-5 (ix)
00413$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1401: if (extraTime > 120) break; // 2 seconds after last exit
	ld	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	ld	-1 (ix), a
	ld	a, #0x78
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jr	C, 00176$
00171$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1405: if (timer > 1200) break;
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, #0xb0
	cp	a, -2 (ix)
	ld	a, #0x04
	sbc	a, -1 (ix)
	jp	NC, 00175$
00176$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1408: ShowMenu();
	call	_ShowMenu
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s22_b2.c:1409: }
	ld	sp, ix
	pop	ix
	ret
	.area _SEG22
	.area _INITIALIZER
	.area _CABS (ABS)
