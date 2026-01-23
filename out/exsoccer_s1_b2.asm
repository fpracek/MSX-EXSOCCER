;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module exsoccer_s1_b2
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _IsOffside
	.globl _HandleOffside
	.globl _PerformShot
	.globl _GetOffsideLineY
	.globl _GetClosestPlayerToBall
	.globl _GoalkeeperWithBall
	.globl _SetPlayerBallPossession
	.globl _GetPlayerIdByRole
	.globl _ClearTextFromLayerA
	.globl _SetPlayerTarget
	.globl _TickPlayerToOwnTarget
	.globl _V9_PrintLayerAStringAtPos
	.globl _V9_SetPaletteEntry
	.globl _V9_SetScrollingBY
	.globl _V9_SetRegister
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
	.globl _g_Sprites1_palette_fio
	.globl _g_Sprites1_palette_bra
	.globl _g_Sprites1_palette_gbr
	.globl _g_Sprites1_palette_ger
	.globl _g_Sprites1_palette_fra
	.globl _g_Sprites1_palette_aus
	.globl _g_Sprites1_palette_ita
	.globl _g_GameFieldLayerBTilesPalette
	.globl _g_GameFieldLayerATilesPalette
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
	.globl _PutBallOnPlayerFeet
	.globl _TickBallCollision
	.globl _PerformPass
	.globl _InitPalette
	.globl _SetTeam1Palette
	.globl _SetTeam2Palette
	.globl _GetTeamPaletteById
	.globl _TickFieldScrollingAction
	.globl _TickShowKickOff
	.globl _ResetBallInfo
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
	.area _SEG1
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:36: void TickAI(u8 playerId){
;	---------------------------------
; Function TickAI
; ---------------------------------
_TickAI::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-34
	add	hl, sp
	ld	sp, hl
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:37: if(g_MatchStatus==MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER){
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jr	Z, 00554$
	sub	a, #0x0d
	jp	NZ,00563$
00554$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:43: u16 refX = g_Players[playerId].X;
	ld	c, -3 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-2 (ix), l
	ld	-1 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:40: if (playerId == REFEREE) {
	ld	a, -3 (ix)
	sub	a, #0x0e
	jp	NZ,00174$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:41: u16 ballX = g_Ball.X;
	ld	bc, (#_g_Ball + 2)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:42: u16 ballY = g_Ball.Y;
	ld	de, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:43: u16 refX = g_Players[playerId].X;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:44: u16 refY = g_Players[playerId].Y;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:48: u16 targetY = ballY;
	ld	-7 (ix), e
	ld	-6 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:51: if (ballY > 230 && ballY < 260 && ballX > 110 && ballX < 140) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:52: targetY = ballY - 40; 
	ld	a, e
	add	a, #0xd8
	ld	c, a
	ld	a, d
	adc	a, #0xff
	ld	-7 (ix), c
	ld	-6 (ix), a
	jp	00108$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:55: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#_g_Ball + 6)
	cp	a, #0xff
	jr	Z, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:56: if (g_Players[g_Ball.PossessionPlayerId].TeamId == TEAM_1) targetY = ballY - 20;
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc, #_g_Players
	add	hl, bc
	ld	bc, #0x0005
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:57: else targetY = ballY + 20;
	ld	hl, #0x0014
	add	hl, de
	ld	-7 (ix), l
	ld	-6 (ix), h
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:68: if (ballX < 128) targetX = ballX + 60; // Ball Left -> Ref Right
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:69: else targetX = ballX - 60;             // Ball Right -> Ref Left
	ld	a, -5 (ix)
	add	a, #0xc4
	ld	-2 (ix), a
	ld	a, -4 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
	ld	c, -2 (ix)
	ld	b, -1 (ix)
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:72: if (targetX < FIELD_BOUND_X_LEFT + 10) targetX = FIELD_BOUND_X_LEFT + 10;
	ld	a, c
	sub	a, #0x14
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00116$
	ld	bc, #0x0014
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:73: if (targetX > FIELD_BOUND_X_RIGHT - 10) targetX = FIELD_BOUND_X_RIGHT - 10;
	ld	a, #0xec
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00118$
	ld	bc, #0x00ec
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:78: u8 moveDir = DIRECTION_NONE;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:79: i16 diffY = (i16)targetY - (i16)refY;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:80: i16 diffX = (i16)targetX - (i16)refX;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:83: if (diffY < -8) moveDir = DIRECTION_UP;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:84: else if (diffY > 8) moveDir = DIRECTION_DOWN;
	ld	a, #0x08
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 01742$
	xor	a, #0x80
01742$:
	jp	P, 00123$
	ld	-1 (ix), #0x05
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:87: bool moveX = false;
	ld	e, #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:88: if (diffX < -16) moveX = true; // Need to go Left
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:89: else if (diffX > 16) moveX = true; // Need to go Right
	ld	d, c
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x10
	cp	a, d
	ld	a, #0x00
	sbc	a, l
	jp	PO, 01743$
	xor	a, #0x80
01743$:
	jp	P, 00128$
	ld	e, #0x01
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:91: if (moveX) {
	ld	a, e
	or	a, a
	jr	Z, 00145$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:89: else if (diffX > 16) moveX = true; // Need to go Right
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:93: if (diffX > 0) moveDir = DIRECTION_UP_RIGHT;
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 01744$
	xor	a, #0x80
01744$:
	rlca
	and	a,#0x01
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:92: if (moveDir == DIRECTION_UP) {
	ld	a, -1 (ix)
	dec	a
	jr	NZ, 00142$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:93: if (diffX > 0) moveDir = DIRECTION_UP_RIGHT;
	ld	a, c
	or	a, a
	jr	Z, 00130$
	ld	-1 (ix), #0x02
	jp	00145$
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:94: else moveDir = DIRECTION_UP_LEFT;
	ld	-1 (ix), #0x08
	jp	00145$
00142$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:95: } else if (moveDir == DIRECTION_DOWN) {
	ld	a, -1 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:96: if (diffX > 0) moveDir = DIRECTION_DOWN_RIGHT;
	sub	a,#0x05
	jr	NZ, 00139$
	or	a,c
	jr	Z, 00133$
	ld	-1 (ix), #0x04
	jp	00145$
00133$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:97: else moveDir = DIRECTION_DOWN_LEFT;
	ld	-1 (ix), #0x06
	jp	00145$
00139$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:99: if (diffX > 0) moveDir = DIRECTION_RIGHT;
	ld	a, c
	or	a, a
	jr	Z, 00136$
	ld	-1 (ix), #0x03
	jp	00145$
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:100: else moveDir = DIRECTION_LEFT;
	ld	-1 (ix), #0x07
00145$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:104: g_Players[playerId].Direction = moveDir;
	ld	a, -15 (ix)
	add	a, #0x06
	ld	c, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, -1 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:107: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	(bc), a
	ld	e, a
	ld	a, -1 (ix)
	dec	a
	jr	Z, 00146$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:108: g_Players[playerId].Direction == DIRECTION_UP_RIGHT ||
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:109: g_Players[playerId].Direction == DIRECTION_UP_LEFT) {
	ld	a,e
	cp	a,#0x02
	jr	Z, 00146$
	sub	a, #0x08
	jr	NZ, 00147$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:110: g_Players[playerId].Y--;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:107: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	a, (bc)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:112: if (g_Players[playerId].Direction == DIRECTION_DOWN ||
	cp	a, #0x05
	jr	Z, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:113: g_Players[playerId].Direction == DIRECTION_DOWN_RIGHT ||
	cp	a, #0x04
	jr	Z, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:114: g_Players[playerId].Direction == DIRECTION_DOWN_LEFT) {
	sub	a, #0x06
	jr	NZ, 00151$
00150$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:115: g_Players[playerId].Y++;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:107: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	a, (bc)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:117: if (g_Players[playerId].Direction == DIRECTION_LEFT ||
	cp	a, #0x07
	jr	Z, 00154$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:118: g_Players[playerId].Direction == DIRECTION_UP_LEFT ||
	cp	a, #0x08
	jr	Z, 00154$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:119: g_Players[playerId].Direction == DIRECTION_DOWN_LEFT) {
	sub	a, #0x06
	jr	NZ, 00155$
00154$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:120: g_Players[playerId].X--;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:107: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	a, (bc)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:122: if (g_Players[playerId].Direction == DIRECTION_RIGHT ||
	cp	a, #0x03
	jr	Z, 00158$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:123: g_Players[playerId].Direction == DIRECTION_UP_RIGHT ||
	cp	a, #0x02
	jr	Z, 00158$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:124: g_Players[playerId].Direction == DIRECTION_DOWN_RIGHT) {
	sub	a, #0x04
	jr	NZ, 00159$
00158$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:125: g_Players[playerId].X++;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:129: if(g_Players[playerId].Y < FIELD_BOUND_Y_TOP) g_Players[playerId].Y = FIELD_BOUND_Y_TOP;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:130: if(g_Players[playerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[playerId].Y = FIELD_BOUND_Y_BOTTOM;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:131: if(g_Players[playerId].X < FIELD_BOUND_X_LEFT) g_Players[playerId].X = FIELD_BOUND_X_LEFT;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:132: if(g_Players[playerId].X > FIELD_BOUND_X_RIGHT) g_Players[playerId].X = FIELD_BOUND_X_RIGHT;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:138: g_Players[playerId].Status = PLAYER_STATUS_NONE; // Force not positioned
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x000e
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:137: if (moveDir != DIRECTION_NONE) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00171$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:138: g_Players[playerId].Status = PLAYER_STATUS_NONE; // Force not positioned
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00563$
00171$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:140: g_Players[playerId].Status = PLAYER_STATUS_POSITIONED; // Allow rest
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:143: return;
	jp	00563$
00174$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:146: u8 playerTeamId = g_Players[playerId].TeamId;
	ld	a, #<(_g_Players)
	add	a, -2 (ix)
	ld	-34 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -1 (ix)
	ld	-33 (ix), a
	pop	bc
	push	bc
	ld	hl, #5
	add	hl, bc
	ld	a, (hl)
	ld	-32 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:147: bool ballPossessionByPlayerTeam = false;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:149: if (g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0d
	jr	NZ, 00187$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:152: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#(_g_Ball + 6) + 0)
	ld	-1 (ix), a
	inc	a
	jp	Z,00188$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:153: if (g_Players[g_Ball.PossessionPlayerId].TeamId == playerTeamId) ballPossessionByPlayerTeam = true;
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
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
	ld	de, #0x0005
	add	hl, de
	ld	a,-32 (ix)
	sub	a,(hl)
	jr	NZ, 00188$
	ld	-6 (ix), #0x01
	jp	00188$
00187$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:157: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#_g_Ball + 6)
	ld	-1 (ix), a
	inc	a
	jr	Z, 00184$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:158: if (g_Players[g_Ball.PossessionPlayerId].TeamId == playerTeamId) {
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
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
	ld	de, #0x0005
	add	hl, de
	ld	a,-32 (ix)
	sub	a,(hl)
	jr	NZ, 00188$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:159: ballPossessionByPlayerTeam = true;
	ld	-6 (ix), #0x01
	jp	00188$
00184$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:163: if (g_Ball.LastTouchTeamId == playerTeamId) {
	ld	hl, #_g_Ball + 14
	ld	a,-32 (ix)
	sub	a,(hl)
	jr	NZ, 00188$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:164: ballPossessionByPlayerTeam = true;
	ld	-6 (ix), #0x01
00188$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:172: if (ballPossessionByPlayerTeam) {
	ld	a, -6 (ix)
	or	a, a
	jp	Z, 00416$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:175: if (g_Ball.PossessionPlayerId == playerId) {
	ld	a, (#_g_Ball + 6)
	ld	-1 (ix), a
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jp	NZ,00343$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:178: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) return;
	pop	bc
	push	bc
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	ld	-31 (ix), a
	or	a, a
	jp	Z,00563$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:184: if (playerTeamId == TEAM_1) { 
	ld	a, -32 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 01778$
	xor	a, a
01778$:
	ld	-30 (ix), a
	or	a, a
	jr	Z, 00192$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:185: targetY_Goal = goalTopY - 20; 
	ld	-29 (ix), #0x37
	ld	-28 (ix), #0
	jp	00193$
00192$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:187: targetY_Goal = goalBottomY + 20;
	ld	-29 (ix), #0xa9
	ld	-28 (ix), #0x01
00193$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:191: targetX_Goal = g_Players[playerId].X;
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-27 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-26 (ix), a
	ld	a, -27 (ix)
	ld	-25 (ix), a
	ld	a, -26 (ix)
	ld	-24 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:192: if (targetX_Goal > 100 && targetX_Goal < 156) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:193: if ((g_Players[playerId].Role % 2) != 0) targetX_Goal = 60; // Go Left
	bit	0, -31 (ix)
	jr	Z, 00195$
	ld	-25 (ix), #0x3c
	ld	-24 (ix), #0
	jp	00198$
00195$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:194: else targetX_Goal = 190; // Go Right
	ld	-25 (ix), #0xbe
	ld	-24 (ix), #0
00198$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:197: if (targetX_Goal < FIELD_BOUND_X_LEFT + 20) targetX_Goal = FIELD_BOUND_X_LEFT + 20;
	ld	a, -25 (ix)
	sub	a, #0x1e
	ld	a, -24 (ix)
	sbc	a, #0x00
	jr	NC, 00201$
	ld	-25 (ix), #0x1e
	ld	-24 (ix), #0
00201$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:198: if (targetX_Goal > FIELD_BOUND_X_RIGHT - 20) targetX_Goal = FIELD_BOUND_X_RIGHT - 20;
	ld	a, #0xe2
	cp	a, -25 (ix)
	ld	a, #0x00
	sbc	a, -24 (ix)
	jr	NC, 00203$
	ld	-25 (ix), #0xe2
	ld	-24 (ix), #0
00203$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:202: bool obstacleRight = false;
	ld	-23 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:203: bool obstacleLeft = false;
	ld	-22 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:204: bool obstacleFront = false;
	ld	-21 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:205: bool obstacleFrontNonGK = false;
	ld	-20 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:206: bool dangerousOpponent = false;
	ld	-19 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:209: for(i=0; i<14; i++) { 
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
00557$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:210: if (g_Players[i].TeamId == playerTeamId) continue;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
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
	ld	hl, #5
	add	hl, bc
	ld	a,-32 (ix)
	sub	a,(hl)
	jp	Z,00244$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:211: if (g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -16 (ix)
	ld	b, -15 (ix)
	ld	hl, #14
	add	hl, bc
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00244$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:212: if (i == playerId) continue;
	ld	c, -3 (ix)
	ld	b, #0x00
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	cp	a, a
	sbc	hl, bc
	jp	Z,00244$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:214: i16 relX = (i16)g_Players[i].X - (i16)g_Players[playerId].X;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:215: i16 relY = (i16)g_Players[i].Y - (i16)g_Players[playerId].Y;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:221: bool isFront = false;
	ld	-10 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:222: bool isBehind = false;
	ld	-4 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:225: if (relY < 0 && relY > -obstacleDetDist) isFront = true;
	ld	a, -12 (ix)
	ld	-9 (ix), a
	ld	a, -11 (ix)
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:224: if (playerTeamId == TEAM_1) { // Moving UP (Y decreases)
	ld	a, -30 (ix)
	or	a, a
	jr	Z, 00221$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:225: if (relY < 0 && relY > -obstacleDetDist) isFront = true;
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
	jp	PO, 01782$
	xor	a, #0x80
01782$:
	jp	P, 00211$
	ld	-10 (ix), #0x01
00211$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:226: if (relY >= 0) isBehind = true;
	bit	0, c
	jr	NZ, 00222$
	ld	-4 (ix), #0x01
	jp	00222$
00221$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:228: if (relY > 0 && relY < obstacleDetDist) isFront = true;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 01783$
	xor	a, #0x80
01783$:
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:229: if (relY <= 0) isBehind = true;
	bit	0, c
	jr	NZ, 00222$
	ld	-4 (ix), #0x01
00222$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:234: u8 safeDist = isBehind ? 12 : 16; 
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00565$
	ld	bc, #0x000c
	jp	00566$
00565$:
	ld	bc, #0x0010
00566$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:235: if (relX > -safeDist && relX < safeDist && relY > -safeDist && relY < safeDist) {
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
	jp	PO, 01784$
	xor	a, #0x80
01784$:
	jp	P, 00224$
	ld	b, #0x00
	ld	a, -14 (ix)
	sub	a, c
	ld	a, -13 (ix)
	sbc	a, b
	jp	PO, 01785$
	xor	a, #0x80
01785$:
	jp	P, 00224$
	ld	a, -7 (ix)
	sub	a, -9 (ix)
	ld	a, -6 (ix)
	sbc	a, -8 (ix)
	jp	PO, 01786$
	xor	a, #0x80
01786$:
	jp	P, 00224$
	ld	a, -12 (ix)
	sub	a, c
	ld	a, -11 (ix)
	sbc	a, b
	jp	PO, 01787$
	xor	a, #0x80
01787$:
	jp	P, 00224$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:236: dangerousOpponent = true;
	ld	-19 (ix), #0x01
00224$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:240: if (isFront && relX > -10 && relX < 10) {
	ld	a, -10 (ix)
	or	a, a
	jr	Z, 00231$
	ld	a, #0xf6
	cp	a, -14 (ix)
	ld	a, #0xff
	sbc	a, -13 (ix)
	jp	PO, 01788$
	xor	a, #0x80
01788$:
	jp	P, 00231$
	ld	a, -5 (ix)
	sub	a, #0x0a
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00231$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:241: obstacleFront = true;
	ld	-21 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:242: if (g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) obstacleFrontNonGK = true;
	ld	c, -16 (ix)
	ld	b, -15 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00231$
	ld	-20 (ix), #0x01
00231$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:245: if (isFront || (relY < 18 && relY > -18)) { 
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
	jp	PO, 01789$
	xor	a, #0x80
01789$:
	jp	P, 00244$
00240$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:246: if (relX >= 0 && relX < 24) obstacleRight = true; // Obstacle is to my right
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:247: if (relX < 0 && relX > -24) obstacleLeft = true; // Obstacle is to my left
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00244$
	ld	a, #0xe8
	cp	a, -14 (ix)
	ld	a, #0xff
	sbc	a, -13 (ix)
	jp	PO, 01790$
	xor	a, #0x80
01790$:
	jp	P, 00244$
	ld	-22 (ix), #0x01
00244$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:209: for(i=0; i<14; i++) { 
	inc	-2 (ix)
	jr	NZ, 01791$
	inc	-1 (ix)
01791$:
	ld	a, -2 (ix)
	sub	a, #0x0e
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00557$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:256: bool isHumanControlled = false;
	ld	-2 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:257: if ((playerTeamId == TEAM_1 && g_Team1ActivePlayer == playerId) || 
	ld	a, -30 (ix)
	or	a, a
	jr	Z, 00258$
	ld	a, (_g_Team1ActivePlayer+0)
	sub	a, -3 (ix)
	jr	Z, 00253$
00258$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:258: (playerTeamId == TEAM_2 && g_GameWith2Players && g_Team2ActivePlayer == playerId)) {
	ld	a, -32 (ix)
	sub	a, #0x02
	jr	NZ, 00254$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00254$
	ld	a, (_g_Team2ActivePlayer+0)
	sub	a, -3 (ix)
	jr	NZ, 00254$
00253$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:259: isHumanControlled = true;
	ld	-2 (ix), #0x01
00254$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:262: if (!isHumanControlled) {
	ld	a, -2 (ix)
	or	a, a
	jp	NZ, 00281$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:264: bool inRealShootingRange = false;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:265: bool inDangerousZone = false;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:268: if (playerTeamId == TEAM_1) {
	ld	a, -30 (ix)
	or	a, a
	jr	Z, 00268$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:272: if (g_Players[playerId].Y < (FIELD_BOUND_Y_TOP + 90)) inRealShootingRange = true;
	ld	a, -18 (ix)
	ld	-5 (ix), a
	ld	a, -17 (ix)
	ld	-4 (ix), a
	ld	a, -18 (ix)
	sub	a, #0x8c
	ld	a, -17 (ix)
	sbc	a, #0x00
	jr	NC, 00260$
	ld	-6 (ix), #0x01
00260$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:275: if (g_Players[playerId].Y < (FIELD_BOUND_Y_TOP + 60)) inDangerousZone = true; 
	ld	a, -5 (ix)
	sub	a, #0x6e
	ld	a, -4 (ix)
	sbc	a, #0x00
	jr	NC, 00262$
	ld	-1 (ix), #0x01
00262$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:276: goalTargetY = FIELD_BOUND_Y_TOP - 10; 
	ld	-5 (ix), #0x28
	ld	-4 (ix), #0
	jp	00269$
00268$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:280: if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 90)) inRealShootingRange = true;
	ld	a, -18 (ix)
	ld	-5 (ix), a
	ld	a, -17 (ix)
	ld	-4 (ix), a
	ld	a, #0x54
	cp	a, -5 (ix)
	ld	a, #0x01
	sbc	a, -4 (ix)
	jr	NC, 00264$
	ld	-6 (ix), #0x01
00264$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:283: if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 60)) inDangerousZone = true;
	ld	a, #0x72
	cp	a, -5 (ix)
	ld	a, #0x01
	sbc	a, -4 (ix)
	jr	NC, 00266$
	ld	-1 (ix), #0x01
00266$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:284: goalTargetY = FIELD_BOUND_Y_BOTTOM + 10; 
	ld	-5 (ix), #0xb8
	ld	-4 (ix), #0x01
00269$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:288: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -31 (ix)
	or	a, a
	jr	NZ, 00271$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:289: inRealShootingRange = false;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:290: inDangerousZone = false;
	ld	-1 (ix), #0x00
00271$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:293: if (inRealShootingRange) {
	ld	a, -6 (ix)
	or	a, a
	jp	Z, 00281$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:302: bool clearShot = !obstacleFrontNonGK;
	ld	a, -20 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:305: if (inDangerousZone) clearShot = true;
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00273$
	ld	-6 (ix), #0x01
00273$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:309: if (clearShot) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00281$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:310: u16 shotX = 86 + ((g_FrameCounter + playerId * 13) % 68);
	ld	a, -3 (ix)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	c, a
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	hl, (_g_FrameCounter)
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -1 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, -9 (ix)
	ld	-2 (ix), a
	ld	a, -6 (ix)
	adc	a, -8 (ix)
	ld	-1 (ix), a
	ld	de, #0x0044
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__moduint
	ld	-7 (ix), e
	ld	-6 (ix), d
	ld	a, -7 (ix)
	add	a, #0x56
	ld	-2 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:311: PerformShot(shotX, goalTargetY);
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_PerformShot
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:312: return;
	jp	00563$
00281$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:318: bool shouldPass = false;
	ld	-5 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:319: bool isPanicPass = false;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:325: bool checkPassing = false;
	ld	-4 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:327: if (dangerousOpponent) {
	ld	a, -19 (ix)
	or	a, a
	jr	Z, 00292$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:329: shouldPass = true;
	ld	-5 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:330: isPanicPass = true;
	ld	-1 (ix), #0x01
	jp	00293$
00292$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:332: else if (obstacleFront) {
	ld	a, -21 (ix)
	or	a, a
	jr	Z, 00289$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:335: bool canGoRight = (g_Players[playerId].X < FIELD_BOUND_X_RIGHT - 20) && !obstacleRight;
	ld	a, -27 (ix)
	sub	a, #0xe2
	ld	a, -26 (ix)
	sbc	a, #0x00
	jr	NC, 00567$
	ld	a, -23 (ix)
	or	a, a
	jr	Z, 00568$
00567$:
	ld	-5 (ix), #0x00
	jp	00569$
00568$:
	ld	-5 (ix), #0x01
00569$:
	ld	a, -5 (ix)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:336: bool canGoLeft = (g_Players[playerId].X > FIELD_BOUND_X_LEFT + 20) && !obstacleLeft;
	ld	a, #0x1e
	cp	a, -27 (ix)
	ld	a, #0x00
	sbc	a, -26 (ix)
	jr	NC, 00570$
	ld	a, -22 (ix)
	or	a, a
	jr	Z, 00571$
00570$:
	ld	-5 (ix), #0x00
	jp	00572$
00571$:
	ld	-5 (ix), #0x01
00572$:
	ld	c, -5 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:338: if (canGoRight || canGoLeft) {
	ld	a, -6 (ix)
	or	a,a
	jr	NZ, 00282$
	or	a,c
	jr	Z, 00283$
00282$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:340: shouldPass = false;
	ld	-5 (ix), #0x00
	jp	00293$
00283$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:343: shouldPass = true;
	ld	-5 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:344: isPanicPass = true;
	ld	-1 (ix), #0x01
	jp	00293$
00289$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:350: if ((g_FrameCounter & 1) == 0) checkPassing = true;
	ld	hl, (_g_FrameCounter)
	bit	0, l
	jr	NZ, 00293$
	ld	-4 (ix), #0x01
00293$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:353: if (checkPassing) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00295$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:356: shouldPass = true; 
	ld	-5 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:357: isPanicPass = false;
	ld	-1 (ix), #0x00
00295$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:360: if (shouldPass) {
	ld	a, -5 (ix)
	or	a, a
	jp	Z, 00330$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:361: if (!isHumanControlled) {
	ld	a, -2 (ix)
	or	a, a
	jp	NZ, 00330$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:362: u8 bestT = NO_VALUE;
	ld	-2 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:363: i32 bestScore = -2100000000;
	ld	-11 (ix), #0x00
	ld	-10 (ix), #0x8b
	ld	-9 (ix), #0xd4
	ld	-8 (ix), #0x82
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:365: for(t=0; t<14; t++) {
	ld	a, -18 (ix)
	ld	-7 (ix), a
	ld	a, -17 (ix)
	ld	-6 (ix), a
	xor	a, a
	ld	-5 (ix), a
	ld	-4 (ix), a
00558$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:366: if(g_Players[t].TeamId != playerTeamId) continue;
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_g_Players
	add	hl, de
	ld	-13 (ix), l
	ld	-12 (ix), h
	ld	bc,#5
	add	hl,bc
	ld	a,-32 (ix)
	sub	a,(hl)
	jp	NZ,00319$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:367: if(t == playerId) continue;
	ld	c, -3 (ix)
	ld	b, #0x00
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	cp	a, a
	sbc	hl, bc
	jp	Z,00319$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:368: if(g_Players[t].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -13 (ix)
	ld	b, -12 (ix)
	ld	hl, #14
	add	hl, bc
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00319$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:369: if(g_Players[t].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	c, -13 (ix)
	ld	b, -12 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00319$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:371: i16 dx = (i16)g_Players[t].X - (i16)g_Players[playerId].X;
	ld	l, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -12 (ix)
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
	ld	-19 (ix), l
	ld	-18 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:372: i16 dy = (i16)g_Players[t].Y - (i16)g_Players[playerId].Y;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	a, (hl)
	ld	-17 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-16 (ix), a
	ld	l, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	cp	a, a
	sbc	hl, bc
	ld	-15 (ix), l
	ld	-14 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:373: u16 adx = (dx < 0) ? -dx : dx;
	ld	b, -18 (ix)
	bit	7, b
	jr	Z, 00573$
	xor	a, a
	sub	a, -19 (ix)
	ld	-13 (ix), a
	sbc	a, a
	sub	a, -18 (ix)
	ld	-12 (ix), a
	jp	00574$
00573$:
	ld	a, -19 (ix)
	ld	-13 (ix), a
	ld	a, -18 (ix)
	ld	-12 (ix), a
00574$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:374: u16 ady = (dy < 0) ? -dy : dy;
	ld	b, -14 (ix)
	bit	7, b
	jr	Z, 00575$
	xor	a, a
	sub	a, -15 (ix)
	ld	-19 (ix), a
	sbc	a, a
	sub	a, -14 (ix)
	ld	-18 (ix), a
	jp	00576$
00575$:
	ld	a, -15 (ix)
	ld	-19 (ix), a
	ld	a, -14 (ix)
	ld	-18 (ix), a
00576$:
	ld	c, -19 (ix)
	ld	b, -18 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:375: if (adx < 40 && ady < 40) continue; // Minimum pass distance
	ld	a, -13 (ix)
	sub	a, #0x28
	ld	a, -12 (ix)
	sbc	a, #0x00
	jr	NC, 00305$
	ld	a, c
	sub	a, #0x28
	ld	a, b
	sbc	a, #0x00
	jp	C, 00319$
00305$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:378: if (g_Players[t].Y < g_FieldCurrentYPosition - 40 || 
	ld	a, (_g_FieldCurrentYPosition+0)
	add	a, #0xd8
	ld	e, a
	ld	a, (_g_FieldCurrentYPosition+1)
	adc	a, #0xff
	ld	d, a
	ld	c, -17 (ix)
	ld	b, -16 (ix)
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	C, 00319$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:379: g_Players[t].Y > (g_FieldCurrentYPosition + 252)) continue;
	ld	hl, (_g_FieldCurrentYPosition)
	ld	de, #0x00fc
	add	hl, de
	xor	a, a
	sbc	hl, bc
	jp	C, 00319$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:381: i32 advanceScore = (playerTeamId == TEAM_1) ? -dy : dy;
	ld	a, -30 (ix)
	or	a, a
	jr	Z, 00577$
	xor	a, a
	sub	a, -15 (ix)
	ld	c, a
	sbc	a, a
	sub	a, -14 (ix)
	jp	00578$
00577$:
	ld	c, -15 (ix)
	ld	a, -14 (ix)
00578$:
	ld	b, a
	rlca
	sbc	a, a
	ld	e, a
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:384: if (!isPanicPass) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00315$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:385: if (advanceScore < 40) continue; // Must gain at least 40px ground
	ld	a, c
	sub	a, #0x28
	ld	a, b
	sbc	a, #0x00
	ld	a, e
	sbc	a, #0x00
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00316$
	jp	00319$
00315$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:388: if (advanceScore < -150) continue;
	ld	a, c
	sub	a, #0x6a
	ld	a, b
	sbc	a, #0xff
	ld	a, e
	sbc	a, #0xff
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00319$
00316$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:391: i32 score = advanceScore - (adx/4); // Minimal lateral penalty
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	srl	h
	rr	l
	srl	h
	rr	l
	ld	-15 (ix), l
	ld	-14 (ix), h
	xor	a, a
	ld	-13 (ix), a
	ld	-12 (ix), a
	ld	a, c
	sub	a, -15 (ix)
	ld	c, a
	ld	a, b
	sbc	a, -14 (ix)
	ld	b, a
	ld	a, e
	sbc	a, -13 (ix)
	ld	e, a
	ld	a, d
	sbc	a, -12 (ix)
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:393: if (score > bestScore) {
	ld	a, -11 (ix)
	sub	a, c
	ld	a, -10 (ix)
	sbc	a, b
	ld	a, -9 (ix)
	sbc	a, e
	ld	a, -8 (ix)
	sbc	a, d
	jp	PO, 01802$
	xor	a, #0x80
01802$:
	jp	P, 00319$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:394: bestScore = score;
	ld	-11 (ix), c
	ld	-10 (ix), b
	ld	-9 (ix), e
	ld	-8 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:395: bestT = t;
	ld	a, -5 (ix)
	ld	-2 (ix), a
00319$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:365: for(t=0; t<14; t++) {
	inc	-5 (ix)
	jr	NZ, 01803$
	inc	-4 (ix)
01803$:
	ld	a, -5 (ix)
	sub	a, #0x0e
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00558$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:400: if (bestT != NO_VALUE) {
	ld	a, -2 (ix)
	inc	a
	jr	Z, 00330$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:403: i32 threshold = isPanicPass ? -80 : 10;
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00579$
	ld	bc, #0xffb0
	jp	00580$
00579$:
	ld	bc, #0x000a
00580$:
	ld	-7 (ix), c
	ld	a, b
	ld	-6 (ix), a
	rlca
	sbc	a, a
	ld	-5 (ix), a
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:405: if (bestScore > threshold) {
	ld	a, -7 (ix)
	sub	a, -11 (ix)
	ld	a, -6 (ix)
	sbc	a, -10 (ix)
	ld	a, -5 (ix)
	sbc	a, -9 (ix)
	ld	a, -4 (ix)
	sbc	a, -8 (ix)
	jp	PO, 01805$
	xor	a, #0x80
01805$:
	jp	P, 00330$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:406: if (g_Ball.PossessionTimer < 15) return; // Wait 15 frames before passing
	ld	a, (#_g_Ball + 28)
	ld	-1 (ix), a
	sub	a, #0x0f
	jp	C,00563$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:407: PerformPass(bestT);
	ld	a, -2 (ix)
	call	_PerformPass
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:408: return; // End tick
	jp	00563$
00330$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:414: u16 finalTargetX = targetX_Goal;
	ld	a, -25 (ix)
	ld	-2 (ix), a
	ld	a, -24 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:415: u16 finalTargetY = targetY_Goal;
	ld	a, -29 (ix)
	ld	-5 (ix), a
	ld	a, -28 (ix)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:417: if (obstacleFront) {
	ld	a, -21 (ix)
	or	a, a
	jp	Z, 00341$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:418: if (!obstacleRight) {
	ld	a, -23 (ix)
	or	a, a
	jr	NZ, 00338$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:419: finalTargetX = g_Players[playerId].X + 24;
	ld	a, -27 (ix)
	ld	-7 (ix), a
	ld	a, -26 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, #0x18
	ld	-2 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:420: if (finalTargetX > FIELD_BOUND_X_RIGHT) finalTargetX = FIELD_BOUND_X_RIGHT;
	ld	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -1 (ix)
	ld	-6 (ix), a
	ld	a, #0xf6
	cp	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	jr	NC, 00341$
	ld	-2 (ix), #0xf6
	ld	-1 (ix), #0
	jp	00341$
00338$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:421: } else if (!obstacleLeft) {
	ld	a, -22 (ix)
	or	a, a
	jr	NZ, 00341$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:422: finalTargetX = g_Players[playerId].X - 24; 
	ld	a, -27 (ix)
	ld	-7 (ix), a
	ld	a, -26 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	add	a, #0xe8
	ld	-2 (ix), a
	ld	a, -6 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:423: if (finalTargetX < FIELD_BOUND_X_LEFT) finalTargetX = FIELD_BOUND_X_LEFT;
	ld	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -1 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	sub	a, #0x0a
	ld	a, -6 (ix)
	sbc	a, #0x00
	jr	NC, 00341$
	ld	-2 (ix), #0x0a
	ld	-1 (ix), #0
00341$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:426: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -34 (ix)
	add	a, #0x0a
	ld	-7 (ix), a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -4 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:427: g_Players[playerId].TargetX = finalTargetX;
	ld	a, -34 (ix)
	add	a, #0x0c
	ld	-5 (ix), a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:428: return; // IMPORTANT: Ball Carrier handled. Stop.
	jp	00563$
00343$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:434: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	a, -1 (ix)
	inc	a
	jr	NZ, 00347$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:436: if (GetClosestPlayerToBall(playerTeamId, NO_VALUE) == playerId) {
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -32 (ix)
	call	_GetClosestPlayerToBall
	ld	c, a
	ld	a, -3 (ix)
	sub	a, c
	jr	NZ, 00347$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:437: g_Players[playerId].TargetX = g_Ball.X;
	ld	a, -34 (ix)
	add	a, #0x0c
	ld	c, a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	b, a
	ld	de, (#_g_Ball + 2)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:438: g_Players[playerId].TargetY = g_Ball.Y;
	ld	a, -34 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	b, a
	ld	de, (#_g_Ball + 0)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:439: return;
	jp	00563$
00347$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:448: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER || 
	ld	a, -34 (ix)
	add	a, #0x09
	ld	c, a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	cp	a, #0x05
	jr	Z, 00383$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:449: g_Players[playerId].Role == PLAYER_ROLE_RIGHT_STRIKER) {
	cp	a, #0x06
	jr	NZ, 00384$
00383$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:426: g_Players[playerId].TargetY = finalTargetY;
	pop	hl
	push	hl
	ld	de, #0x000a
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:452: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = GK_BOX_Y_TOP_MAX - 10;
	ld	a, -32 (ix)
	dec	a
	jr	NZ, 00349$
	ld	(hl), #0x41
	inc	hl
	ld	(hl), #0x00
	jp	00350$
00349$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:453: else g_Players[playerId].TargetY = GK_BOX_Y_BOTTOM_MIN + 10;
	ld	(hl), #0x9f
	inc	hl
	ld	(hl), #0x01
00350$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:455: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetX = 64;
	ld	a, (bc)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:427: g_Players[playerId].TargetX = finalTargetX;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:455: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetX = 64;
	ld	a, c
	sub	a, #0x05
	jr	NZ, 00352$
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x00
	jp	00753$
00352$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:456: else g_Players[playerId].TargetX = 192;
	ld	(hl), #0xc0
	inc	hl
	ld	(hl), #0x00
	jp	00753$
00384$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:458: } else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER || 
	cp	a, #0x03
	jr	Z, 00379$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:459: g_Players[playerId].Role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
	cp	a, #0x04
	jr	NZ, 00380$
00379$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:426: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -34 (ix)
	add	a, #0x0a
	ld	-5 (ix), a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:438: g_Players[playerId].TargetY = g_Ball.Y;
	ld	hl, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:462: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = g_Ball.Y - 60;
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, -32 (ix)
	dec	a
	jr	NZ, 00355$
	ld	a, -2 (ix)
	add	a, #0xc4
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0xff
	ld	d, a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00356$
00355$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:463: else g_Players[playerId].TargetY = g_Ball.Y + 60;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x003c
	add	hl, de
	ex	de, hl
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00356$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:465: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetX = 48;
	ld	a, (bc)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:427: g_Players[playerId].TargetX = finalTargetX;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:465: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetX = 48;
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00358$
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x00
	jp	00753$
00358$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:466: else g_Players[playerId].TargetX = 208;
	ld	(hl), #0xd0
	inc	hl
	ld	(hl), #0x00
	jp	00753$
00380$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:468: } else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER || 
	cp	a, #0x01
	jr	Z, 00375$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:469: g_Players[playerId].Role == PLAYER_ROLE_RIGHT_DEFENDER) {
	cp	a, #0x02
	jp	NZ,00376$
00375$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:426: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -34 (ix)
	add	a, #0x0a
	ld	-2 (ix), a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:438: g_Players[playerId].TargetY = g_Ball.Y;
	ld	de, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:462: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = g_Ball.Y - 60;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:472: if (playerTeamId == TEAM_1) {
	ld	a, -32 (ix)
	dec	a
	jr	NZ, 00365$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:473: g_Players[playerId].TargetY = g_Ball.Y + 30;
	ld	hl, #0x001e
	add	hl, de
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:475: if (g_Players[playerId].TargetY < (midFieldY - 30)) g_Players[playerId].TargetY = (midFieldY - 30);
	ld	a, e
	sub	a, #0xd2
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00366$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0xd2
	inc	hl
	ld	(hl), #0x00
	jp	00366$
00365$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:477: g_Players[playerId].TargetY = g_Ball.Y - 30;
	ld	a, e
	add	a, #0xe2
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:478: if (g_Players[playerId].TargetY > (midFieldY + 30)) g_Players[playerId].TargetY = (midFieldY + 30);
	ld	a, #0x0e
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00366$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x0e
	inc	hl
	ld	(hl), #0x01
00366$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:481: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) g_Players[playerId].TargetX = 80;
	ld	a, (bc)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:427: g_Players[playerId].TargetX = finalTargetX;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:481: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) g_Players[playerId].TargetX = 80;
	dec	c
	jr	NZ, 00368$
	ld	(hl), #0x50
	inc	hl
	ld	(hl), #0x00
	jp	00753$
00368$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:482: else g_Players[playerId].TargetX = 176;
	ld	(hl), #0xb0
	inc	hl
	ld	(hl), #0x00
	jp	00753$
00376$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:484: } else if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	or	a, a
	jr	NZ, 00753$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:485: g_Players[playerId].TargetX = FIELD_POS_X_CENTER;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:426: g_Players[playerId].TargetY = finalTargetY;
	pop	hl
	push	hl
	ld	de, #0x000a
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:486: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = GK_BOX_Y_BOTTOM_MIN + 20;
	ld	a, -32 (ix)
	dec	a
	jr	NZ, 00371$
	ld	(hl), #0xa9
	inc	hl
	ld	(hl), #0x01
	jp	00563$
00371$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:487: else g_Players[playerId].TargetY = GK_BOX_Y_TOP_MAX - 20;
	ld	(hl), #0x37
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:488: return; // GK Done
	jp	00563$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:492: for(u8 i=0; i<14; i++) {
00753$:
	ld	-1 (ix), #0x00
00560$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00407$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:493: if (i == playerId) continue;
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jp	Z,00406$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:494: if (g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_g_Players
	add	hl, de
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	bc,#14
	add	hl,bc
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00406$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:495: if (g_Players[i].TeamId != playerTeamId) continue;
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	ld	hl, #5
	add	hl, bc
	ld	a,-32 (ix)
	sub	a,(hl)
	jp	NZ,00406$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:496: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00406$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:498: i16 dx = (i16)g_Players[playerId].TargetX - (i16)g_Players[i].X;
	ld	a, -34 (ix)
	add	a, #0x0c
	ld	c, a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	-11 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-10 (ix), a
	dec	bc
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
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
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	-5 (ix), e
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:499: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	a, -34 (ix)
	add	a, #0x0a
	ld	-9 (ix), a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -7 (ix)
	ld	h, -6 (ix)
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
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:500: if (dx > -75 && dx < 75 && dy > -75 && dy < 75) {
	ld	a, #0xb5
	cp	a, -5 (ix)
	ld	a, #0xff
	sbc	a, -4 (ix)
	jp	PO, 01836$
	xor	a, #0x80
01836$:
	jp	P, 00406$
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	sub	a, #0x4b
	ld	a, -6 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00406$
	ld	a, #0xb5
	cp	a, e
	ld	a, #0xff
	sbc	a, d
	jp	PO, 01837$
	xor	a, #0x80
01837$:
	jp	P, 00406$
	ld	-5 (ix), e
	ld	-4 (ix), d
	ld	a, -5 (ix)
	sub	a, #0x4b
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00406$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:501: if (dx >= 0) g_Players[playerId].TargetX += 12; else g_Players[playerId].TargetX -= 12;
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	bit	7, -6 (ix)
	jr	NZ, 00396$
	ld	hl, #0x000c
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jp	00397$
00396$:
	ld	a, e
	add	a, #0xf4
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
00397$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:499: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:502: if (dy >= 0) g_Players[playerId].TargetY += 12; else g_Players[playerId].TargetY -= 12;
	bit	7, -4 (ix)
	jr	NZ, 00399$
	ld	hl, #0x000c
	add	hl, bc
	ex	de, hl
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00406$
00399$:
	ld	a, c
	add	a, #0xf4
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00406$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:492: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00560$
00407$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:507: u16 offsideY = GetOffsideLineY(playerTeamId);
	ld	a, -32 (ix)
	call	_GetOffsideLineY
	ld	c, e
	ld	b, d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:426: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -34 (ix)
	add	a, #0x0a
	ld	e, a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:438: g_Players[playerId].TargetY = g_Ball.Y;
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:516: if (g_Players[playerId].TargetY < (effectiveLimit + 10)) { 
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	-2 (ix), l
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:510: if (playerTeamId == TEAM_1) { // Attacking UP (TargetY decreases)
	ld	a, -32 (ix)
	dec	a
	jr	NZ, 00413$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:514: effectiveLimit = (g_Ball.Y < offsideY) ? g_Ball.Y : offsideY;
	ld	a, -5 (ix)
	sub	a, c
	ld	a, -4 (ix)
	sbc	a, b
	jr	NC, 00581$
	ld	c, -5 (ix)
	ld	b, -4 (ix)
00581$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:516: if (g_Players[playerId].TargetY < (effectiveLimit + 10)) { 
	ld	hl, #0x000a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, -2 (ix)
	sub	a, c
	ld	a, -1 (ix)
	sbc	a, b
	jp	NC,00563$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:517: g_Players[playerId].TargetY = effectiveLimit + 10;
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	jp	00563$
00413$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:521: effectiveLimit = (g_Ball.Y > offsideY) ? g_Ball.Y : offsideY;
	ld	a, c
	sub	a, -5 (ix)
	ld	a, b
	sbc	a, -4 (ix)
	jr	NC, 00583$
	ld	c, -5 (ix)
	ld	b, -4 (ix)
00583$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:523: if (g_Players[playerId].TargetY > (effectiveLimit - 10)) {
	ld	a, c
	add	a, #0xf6
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	ld	a, c
	sub	a, -2 (ix)
	ld	a, b
	sbc	a, -1 (ix)
	jp	NC,00563$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:524: g_Players[playerId].TargetY = effectiveLimit - 10;
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:529: return; 
	jp	00563$
00416$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:538: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -34 (ix)
	add	a, #0x09
	ld	-11 (ix), a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	or	a, a
	jp	NZ, 00439$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:544: if (playerTeamId == TEAM_1) { 
	ld	a, -32 (ix)
	dec	a
	jr	NZ, 00418$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:545: gkTargetY = FIELD_POS_Y_TEAM1_GOALKEEPER;
	ld	bc, #0x01a8
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:546: boxYMin = GK_BOX_Y_BOTTOM_MIN; boxYMax = GK_BOX_Y_BOTTOM_MAX;
	ld	-5 (ix), #0x95
	ld	-4 (ix), #0x01
	ld	-2 (ix), #0xb3
	ld	-1 (ix), #0x01
	jp	00419$
00418$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:548: gkTargetY = FIELD_POS_Y_TEAM2_GOALKEEPER;
	ld	bc, #0x0032
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:549: boxYMin = GK_BOX_Y_TOP_MIN; boxYMax = GK_BOX_Y_TOP_MAX;
	ld	-5 (ix), #0x23
	ld	-4 (ix), #0
	ld	-2 (ix), #0x4b
	ld	-1 (ix), #0
00419$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:552: u8 closestId = GetClosestPlayerToBall(playerTeamId, NO_VALUE);
	push	bc
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -32 (ix)
	call	_GetClosestPlayerToBall
	pop	bc
	ld	-11 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:553: bool ballInBox = (g_Ball.X > (boxXMin-5) && g_Ball.X < (boxXMax+5) && 
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
	jr	NC, 00585$
	ld	a, -8 (ix)
	sub	a, #0xa5
	ld	a, -7 (ix)
	sbc	a, #0x00
	jr	NC, 00585$
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
	jr	NC, 00585$
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	xor	a, a
	sbc	hl, de
	jr	C, 00586$
00585$:
	ld	-6 (ix), #0x00
	jp	00587$
00586$:
	ld	-6 (ix), #0x01
00587$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:556: if (ballInBox && closestId == playerId) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00427$
	ld	a, -3 (ix)
	sub	a, -11 (ix)
	jr	NZ, 00427$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:557: gkTargetX = g_Ball.X;
	ld	a, -10 (ix)
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	-7 (ix), a
	ld	-6 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:558: gkTargetY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	jp	00428$
00427$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:560: if (g_Ball.X > gkTargetX + 24) gkTargetX += 16;
	ld	a, #0x90
	cp	a, -8 (ix)
	ld	a, #0x00
	sbc	a, -7 (ix)
	jr	NC, 00424$
	ld	-7 (ix), #0x88
	ld	-6 (ix), #0
	jp	00428$
00424$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:561: else if (g_Ball.X < gkTargetX - 24) gkTargetX -= 16;
	ld	a, -8 (ix)
	sub	a, #0x60
	ld	a, -7 (ix)
	sbc	a, #0x00
	jr	NC, 00421$
	ld	-7 (ix), #0x68
	ld	-6 (ix), #0
	jp	00428$
00421$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:562: else gkTargetX = g_Ball.X; 
	ld	a, -10 (ix)
	ld	e, -9 (ix)
	ld	-7 (ix), a
	ld	-6 (ix), e
00428$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:565: if (gkTargetX < boxXMin) gkTargetX = boxXMin;
	ld	a, -7 (ix)
	sub	a, #0x50
	ld	a, -6 (ix)
	sbc	a, #0x00
	jr	NC, 00431$
	ld	-7 (ix), #0x50
	ld	-6 (ix), #0
00431$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:566: if (gkTargetX > boxXMax) gkTargetX = boxXMax;
	ld	a, #0xa0
	cp	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	jr	NC, 00433$
	ld	-7 (ix), #0xa0
	ld	-6 (ix), #0
00433$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:567: if (gkTargetY < boxYMin) gkTargetY = boxYMin;
	ld	a, c
	sub	a, -5 (ix)
	ld	a, b
	sbc	a, -4 (ix)
	jr	NC, 00435$
	ld	c, -5 (ix)
	ld	b, -4 (ix)
00435$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:568: if (gkTargetY > boxYMax) gkTargetY = boxYMax;
	ld	a, -2 (ix)
	sub	a, c
	ld	a, -1 (ix)
	sbc	a, b
	jr	NC, 00437$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
00437$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:570: g_Players[playerId].TargetX = gkTargetX;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
	ld	a, -7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -6 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:571: g_Players[playerId].TargetY = gkTargetY;
	pop	hl
	push	hl
	ld	de, #0x000a
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:572: return; 
	jp	00563$
00439$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:576: u8 playerClosesestToBallId = GetClosestPlayerToBall(playerTeamId, NO_VALUE);
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -32 (ix)
	call	_GetClosestPlayerToBall
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:578: bool amIEffectiveChaser = (playerClosesestToBallId == playerId);
	ld	a, -3 (ix)
	sub	a, b
	ld	a, #0x01
	jr	Z, 01845$
	xor	a, a
01845$:
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:580: if (g_Players[playerClosesestToBallId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_g_Players
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	de, #9
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	NZ, 00451$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:581: u16 limitY = (playerTeamId == TEAM_1) ? GK_BOX_Y_BOTTOM_MIN : GK_BOX_Y_TOP_MAX;
	ld	a, -32 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 01847$
	xor	a, a
01847$:
	ld	c, a
	or	a, a
	jr	Z, 00594$
	ld	de, #0x0195
	jp	00595$
00594$:
	ld	de, #0x004b
00595$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:582: bool ballFar = false;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:583: if (playerTeamId == TEAM_1 && g_Ball.Y < limitY - 10) ballFar = true;
	ld	a, c
	or	a, a
	jr	Z, 00441$
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, e
	ld	c, d
	add	a, #0xf6
	ld	-5 (ix), a
	ld	a, c
	adc	a, #0xff
	ld	-4 (ix), a
	ld	a, -2 (ix)
	sub	a, -5 (ix)
	ld	a, -1 (ix)
	sbc	a, -4 (ix)
	jr	NC, 00441$
	ld	-6 (ix), #0x01
00441$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:584: if (playerTeamId == TEAM_2 && g_Ball.Y > limitY + 10) ballFar = true;
	ld	a, -32 (ix)
	sub	a, #0x02
	jr	NZ, 00444$
	ld	hl, (#_g_Ball + 0)
	ld	a, e
	add	a, #0x0a
	ld	c, a
	jr	NC, 01850$
	inc	d
01850$:
	ld	a, c
	sub	a, l
	ld	a, d
	sbc	a, h
	jr	NC, 00444$
	ld	-6 (ix), #0x01
00444$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:586: if (ballFar) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00451$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:587: u8 nextClosest = GetClosestPlayerToBall(playerTeamId, playerClosesestToBallId);
	push	bc
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -32 (ix)
	call	_GetClosestPlayerToBall
	pop	bc
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:588: if (nextClosest == playerId) amIEffectiveChaser = true;
	ld	a, -3 (ix)
	sub	a, c
	jr	NZ, 00451$
	ld	-9 (ix), #0x01
00451$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:592: if (amIEffectiveChaser) {
	ld	a, -9 (ix)
	or	a, a
	jp	Z, 00552$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:594: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	hl, #_g_Ball + 6
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:595: g_Players[playerId].TargetX = g_Ball.X;
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:594: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	inc	c
	jr	NZ, 00479$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:595: g_Players[playerId].TargetX = g_Ball.X;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
	ld	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -4 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:596: g_Players[playerId].TargetY = g_Ball.Y;
	ld	a, -34 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	b, a
	ld	de, (#_g_Ball + 0)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jp	00563$
00479$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:602: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ex	de, hl
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	cp	a, a
	sbc	hl, bc
	ex	de, hl
	ld	-2 (ix), e
	ld	-1 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:603: i16 dy = (i16)g_Players[playerId].Y - (i16)g_Ball.Y;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, (#_g_Ball + 0)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:604: if (dx > -12 && dx < 12 && dy > -12 && dy < 12) {
	ld	a, #0xf4
	cp	a, -2 (ix)
	ld	a, #0xff
	sbc	a, -1 (ix)
	jp	PO, 01855$
	xor	a, #0x80
01855$:
	jp	P, 00463$
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	ld	h, -1 (ix)
	sub	a, #0x0c
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00463$
	ld	a, #0xf4
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	jp	PO, 01856$
	xor	a, #0x80
01856$:
	jp	P, 00463$
	ld	a, c
	sub	a, #0x0c
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00463$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:609: bool isHumanControlled = false;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:610: if ((playerTeamId == TEAM_1 && g_Team1ActivePlayer == playerId) || 
	ld	a, -32 (ix)
	dec	a
	jr	NZ, 00457$
	ld	a, (_g_Team1ActivePlayer+0)
	sub	a, -3 (ix)
	jr	Z, 00452$
00457$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:611: (playerTeamId == TEAM_2 && g_GameWith2Players && g_Team2ActivePlayer == playerId)) {
	ld	a, -32 (ix)
	sub	a, #0x02
	jr	NZ, 00453$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00453$
	ld	a, (_g_Team2ActivePlayer+0)
	sub	a, -3 (ix)
	jr	NZ, 00453$
00452$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:612: isHumanControlled = true;
	ld	-1 (ix), #0x01
00453$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:615: if (!isHumanControlled) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00463$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:618: if ((g_FrameCounter % 4) == 0) {
	ld	hl, (_g_FrameCounter)
	ld	a, l
	and	a, #0x03
	jr	NZ, 00463$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:619: PutBallOnPlayerFeet(playerId);
	ld	a, -3 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:620: return;
	jp	00563$
00463$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:627: i16 targetX = g_Ball.X;
	ld	c, -5 (ix)
	ld	b, -4 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:628: i16 targetY = g_Ball.Y;
	ld	-2 (ix), e
	ld	-1 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:630: if (g_Ball.KickMoveState != 0) {
	ld	a, (#_g_Ball + 13)
	or	a, a
	jp	Z, 00477$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:632: switch(g_Ball.Direction) {
	ld	hl, #_g_Ball + 5
	ld	e, (hl)
	ld	a, #0x08
	sub	a, e
	jp	C, 00477$
	ld	d, #0x00
	ld	hl, #01866$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
01866$:
	jp	00477$
	jp	00467$
	jp	00471$
	jp	00470$
	jp	00473$
	jp	00468$
	jp	00474$
	jp	00469$
	jp	00472$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:633: case DIRECTION_UP: targetY -= 16; break;
00467$:
	ld	a, -2 (ix)
	ld	d, -1 (ix)
	add	a, #0xf0
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	-2 (ix), e
	ld	-1 (ix), a
	jp	00477$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:634: case DIRECTION_DOWN: targetY += 16; break;
00468$:
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #0x0010
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	jp	00477$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:635: case DIRECTION_LEFT: targetX -= 16; break;
00469$:
	ld	a, c
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	jp	00477$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:636: case DIRECTION_RIGHT: targetX += 16; break;
00470$:
	ld	hl, #0x0010
	add	hl, bc
	ld	c, l
	ld	b, h
	jp	00477$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:637: case DIRECTION_UP_RIGHT: targetY -= 12; targetX += 12; break;
00471$:
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
	jp	00477$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:638: case DIRECTION_UP_LEFT: targetY -= 12; targetX -= 12; break;
00472$:
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
	jp	00477$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:639: case DIRECTION_DOWN_RIGHT: targetY += 12; targetX += 12; break;
00473$:
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
	jp	00477$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:640: case DIRECTION_DOWN_LEFT: targetY += 12; targetX -= 12; break;
00474$:
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:641: }
00477$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:643: g_Players[playerId].TargetX = targetX;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:644: g_Players[playerId].TargetY = targetY;
	pop	hl
	push	hl
	ld	de, #0x000a
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	jp	00563$
00552$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:649: u16 defGoalY = (playerTeamId == TEAM_1) ? FIELD_BOUND_Y_BOTTOM : FIELD_BOUND_Y_TOP;
	ld	a, -32 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 01868$
	xor	a, a
01868$:
	ld	-4 (ix), a
	or	a, a
	jr	Z, 00596$
	ld	de, #0x01ae
	jp	00597$
00596$:
	ld	de, #0x0032
00597$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:650: bool chaserBeaten = false;
	ld	-2 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:651: bool opponentHasBall = (g_Ball.PossessionPlayerId != NO_VALUE && g_Players[g_Ball.PossessionPlayerId].TeamId != playerTeamId);
	ld	a, (#_g_Ball + 6)
	cp	a, #0xff
	jr	Z, 00598$
	push	de
	ld	e, a
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_g_Players
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	pop	de
	ld	a,-32 (ix)
	sub	a,(hl)
	jr	NZ, 00599$
00598$:
	ld	c, #0x00
	jp	00600$
00599$:
	ld	c, #0x01
00600$:
	ld	-1 (ix), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:653: if (opponentHasBall && playerClosesestToBallId != NO_VALUE) {
	ld	a, c
	or	a, a
	jr	Z, 00489$
	inc	b
	jr	Z, 00489$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:654: u16 chaserY = g_Players[playerClosesestToBallId].Y;
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:655: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, (#_g_Ball + 0)
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00486$
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC, 00489$
	ld	-2 (ix), #0x01
	jp	00489$
00486$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:656: else { if (g_Ball.Y < chaserY) chaserBeaten = true; }
	xor	a, a
	sbc	hl, bc
	jr	NC, 00489$
	ld	-2 (ix), #0x01
00489$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:426: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -34 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:427: g_Players[playerId].TargetX = finalTargetX;
	ld	a, -34 (ix)
	add	a, #0x0c
	ld	-6 (ix), a
	ld	a, -33 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:660: g_Players[playerId].TargetX = g_Ball.X;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:659: if (opponentHasBall && chaserBeaten) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00529$
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00529$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:660: g_Players[playerId].TargetX = g_Ball.X;
	ld	de, (#(_g_Ball + 2) + 0)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:655: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:661: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = g_Ball.Y + 15;
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00492$
	ld	de, #0x000f
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jp	00827$
00492$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:662: else g_Players[playerId].TargetY = g_Ball.Y - 15;
	ld	de, #0xfff1
	add	hl, de
	ex	de,hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jp	00827$
00529$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:538: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:666: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = FIELD_POS_Y_CENTER - 40;
	ld	-2 (ix), a
	sub	a, #0x05
	ld	a, #0x00
	rla
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:665: if (playerTeamId == TEAM_1) { // Defend Bottom (High Y)
	ld	a, -4 (ix)
	or	a, a
	jp	Z, 00519$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:666: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = FIELD_POS_Y_CENTER - 40;
	bit	0, -1 (ix)
	jr	NZ, 00498$
	ld	l, c
	ld	h, b
	ld	(hl), #0xcb
	inc	hl
	ld	(hl), #0x00
	jp	00499$
00498$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:655: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:667: else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetY = (g_Ball.Y + defGoalY) / 2 - 50; 
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	C, 00495$
	ld	a, -8 (ix)
	add	a, e
	ld	e, a
	ld	a, -7 (ix)
	adc	a, d
	ld	d, a
	srl	d
	rr	e
	ld	a, e
	add	a, #0xce
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00499$
00495$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:668: else g_Players[playerId].TargetY = g_Ball.Y + 40; 
	ld	e, -8 (ix)
	ld	d, -7 (ix)
	ld	hl, #0x0028
	add	hl, de
	ex	de, hl
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
00499$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:670: if (g_Players[playerId].Role <= PLAYER_ROLE_RIGHT_DEFENDER && g_Players[playerId].TargetY < 300) 
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	e, (hl)
	ld	a, #0x02
	sub	a, e
	jr	C, 00501$
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, #0x2c
	ld	a, d
	sbc	a, #0x01
	jr	NC, 00501$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:671: g_Players[playerId].TargetY = 300;
	ld	l, c
	ld	h, b
	ld	(hl), #0x2c
	inc	hl
	ld	(hl), #0x01
00501$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:674: if (g_Players[playerId].TargetY > 380 && g_Ball.Y < 380) {
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x7c
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jp	NC, 00520$
	ld	hl, (#_g_Ball + 0)
	ld	de, #0x017c
	cp	a, a
	sbc	hl, de
	jp	NC, 00520$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:675: g_Players[playerId].TargetY = 380;
	ld	a, #0x7c
	ld	(bc), a
	inc	bc
	ld	a, #0x01
	ld	(bc), a
	jp	00520$
00519$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:679: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = FIELD_POS_Y_CENTER + 40;
	bit	0, -1 (ix)
	jr	NZ, 00510$
	ld	l, c
	ld	h, b
	ld	(hl), #0x1b
	inc	hl
	ld	(hl), #0x01
	jp	00511$
00510$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:655: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:680: else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetY = (g_Ball.Y + defGoalY) / 2 + 50;
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	C, 00507$
	ld	a, -8 (ix)
	add	a, e
	ld	e, a
	ld	a, -7 (ix)
	adc	a, d
	ld	d, a
	srl	d
	rr	e
	ld	hl, #0x0032
	add	hl, de
	ex	de, hl
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00511$
00507$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:681: else g_Players[playerId].TargetY = g_Ball.Y - 40;
	ld	a, -8 (ix)
	ld	d, -7 (ix)
	add	a, #0xd8
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
00511$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:683: if (g_Players[playerId].Role <= PLAYER_ROLE_RIGHT_DEFENDER && g_Players[playerId].TargetY > 180) 
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	e, (hl)
	ld	a, #0x02
	sub	a, e
	jr	C, 00513$
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0xb4
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00513$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:684: g_Players[playerId].TargetY = 180;
	ld	l, c
	ld	h, b
	ld	(hl), #0xb4
	inc	hl
	ld	(hl), #0x00
00513$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:687: if (g_Players[playerId].TargetY < 100 && g_Ball.Y > 100) {
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, #0x64
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00520$
	ld	hl, (#_g_Ball + 0)
	ld	a, #0x64
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00520$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:688: g_Players[playerId].TargetY = 100;
	ld	a, #0x64
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
00520$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:692: if (g_Players[playerId].Role % 2 != 0) g_Players[playerId].TargetX = g_Ball.X - 40; 
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	and	a, #0x01
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:660: g_Players[playerId].TargetX = g_Ball.X;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:692: if (g_Players[playerId].Role % 2 != 0) g_Players[playerId].TargetX = g_Ball.X - 40; 
	xor	a, a
	ld	de, (#(_g_Ball + 2) + 0)
	or	a, c
	jr	Z, 00522$
	ld	a, e
	add	a, #0xd8
	ld	c, a
	ld	a, d
	adc	a, #0xff
	ld	b, a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00523$
00522$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:693: else g_Players[playerId].TargetX = g_Ball.X + 40; 
	ld	hl, #0x0028
	add	hl, de
	ex	de, hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00523$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:695: if (g_Players[playerId].TargetX < FIELD_BOUND_X_LEFT + 20) g_Players[playerId].TargetX = FIELD_BOUND_X_LEFT + 20;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x1e
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00525$
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), #0x1e
	inc	hl
	ld	(hl), #0x00
00525$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:696: if (g_Players[playerId].TargetX > FIELD_BOUND_X_RIGHT - 20) g_Players[playerId].TargetX = FIELD_BOUND_X_RIGHT - 20;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xe2
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00827$
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), #0xe2
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:700: for(u8 i=0; i<14; i++) {
00827$:
	ld	-1 (ix), #0x00
00562$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00563$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:701: if (i == playerId) continue;
	ld	a, -1 (ix)
	sub	a, -3 (ix)
	jp	Z,00549$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:702: if (g_Players[i].TeamId != playerTeamId) continue;
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_g_Players
	add	hl, de
	ex	de, hl
	ld	c, e
	ld	b, d
	ld	hl, #5
	add	hl, bc
	ld	a,-32 (ix)
	sub	a,(hl)
	jp	NZ,00549$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:703: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	c, e
	ld	b, d
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00549$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:704: i16 dx = (i16)g_Players[playerId].TargetX - (i16)g_Players[i].X;
	ld	a, -34 (ix)
	add	a, #0x0c
	ld	-13 (ix), a
	ld	a, -33 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:705: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	a, -34 (ix)
	add	a, #0x0a
	ld	-11 (ix), a
	ld	a, -33 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:706: if (dx > -60 && dx < 60 && dy > -60 && dy < 60) {
	ld	a, #0xc4
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	jp	PO, 01876$
	xor	a, #0x80
01876$:
	jp	P, 00549$
	ld	a, c
	sub	a, #0x3c
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00549$
	ld	a, #0xc4
	cp	a, e
	ld	a, #0xff
	sbc	a, d
	jp	PO, 01877$
	xor	a, #0x80
01877$:
	jp	P, 00549$
	ld	-9 (ix), e
	ld	-8 (ix), d
	ld	a, -9 (ix)
	sub	a, #0x3c
	ld	a, -8 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00549$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:707: if (dx >= 0) g_Players[playerId].TargetX += 12; else g_Players[playerId].TargetX -= 12;
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	bit	7, b
	jr	NZ, 00539$
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
	jp	00540$
00539$:
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
00540$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:705: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:708: if (dy >= 0) g_Players[playerId].TargetY += 12; else g_Players[playerId].TargetY -= 12;
	bit	7, -8 (ix)
	jr	NZ, 00542$
	ld	hl, #0x000c
	add	hl, bc
	ex	de, hl
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00549$
00542$:
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
00549$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:700: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00562$
00563$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:713: }
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:716: void PutBallOnPlayerFeet(u8 playerId){
;	---------------------------------
; Function PutBallOnPlayerFeet
; ---------------------------------
_PutBallOnPlayerFeet::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-53
	add	hl, sp
	ld	sp, hl
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:718: if (g_Ball.PossessionPlayerId != playerId) {
	ld	hl, #(_g_Ball + 6)
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:720: g_Ball.LastTouchTeamId=g_Players[playerId].TeamId;
	ld	e, c
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:718: if (g_Ball.PossessionPlayerId != playerId) {
	ld	a, c
	sub	a, b
	jr	Z, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:719: g_Ball.PossessionPlayerId=playerId;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:720: g_Ball.LastTouchTeamId=g_Players[playerId].TeamId;
	ld	iy, #_g_Players
	add	iy, de
	ld	a, 5 (iy)
	ld	(#(_g_Ball + 14)),a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:721: g_Ball.PassTargetPlayerId = NO_VALUE; // Clear any pending pass
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:722: g_Ball.ShotActive = 0; // Clear any pending shot
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:723: SetPlayerBallPossession(g_Ball.PossessionPlayerId);
	push	de
	ld	a, c
	call	_SetPlayerBallPossession
	pop	de
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:728: const u8 BallBaseDistX[] = { 0, 0, 4, 6, 4, 0, 4, 6, 4 };
	ld	-51 (ix), #0x00
	ld	-50 (ix), #0x00
	ld	-49 (ix), #0x04
	ld	-48 (ix), #0x06
	ld	-47 (ix), #0x04
	ld	-46 (ix), #0x00
	ld	-45 (ix), #0x04
	ld	-44 (ix), #0x06
	ld	-43 (ix), #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:729: const u8 BallBaseDistY[] = { 0, 6, 4, 0, 4, 6, 4, 2, 4 };
	ld	hl, #11
	add	hl, sp
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
	ld	-41 (ix), #0x06
	ld	-40 (ix), #0x04
	ld	-39 (ix), #0x00
	ld	-38 (ix), #0x04
	ld	-37 (ix), #0x06
	ld	-36 (ix), #0x04
	ld	-35 (ix), #0x02
	ld	-34 (ix), #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:731: const u8 DribbleAnimOffsets[] = {5, 4, 2, 0};
	ld	-33 (ix), #0x05
	ld	-32 (ix), #0x04
	ld	-31 (ix), #0x02
	ld	-30 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:732: const u8 DribbleAnimOffsetsDiag[] = {3, 3, 1, 0};
	ld	-29 (ix), #0x03
	ld	-28 (ix), #0x03
	ld	-27 (ix), #0x01
	ld	-26 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:736: const i8 BallAlignCorrectX[] = { 0, 0, 0, 0, 2, 0, -2, 0, 0 };
	ld	-25 (ix), #0x00
	ld	-24 (ix), #0x00
	ld	-23 (ix), #0x00
	ld	-22 (ix), #0x00
	ld	-21 (ix), #0x02
	ld	-20 (ix), #0x00
	ld	-19 (ix), #0xfe
	ld	-18 (ix), #0x00
	ld	-17 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:737: const i8 BallAlignCorrectY[] = { 0, 0, 0, 4, 2, 4, 2, 4, 0 };
	ld	-16 (ix), #0x00
	ld	-15 (ix), #0x00
	ld	-14 (ix), #0x00
	ld	-13 (ix), #0x04
	ld	-12 (ix), #0x02
	ld	-11 (ix), #0x04
	ld	-10 (ix), #0x02
	ld	-9 (ix), #0x04
	ld	-8 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:739: u8 dir = g_Players[playerId].Direction;
	ld	hl, #_g_Players
	add	hl, de
	ld	-7 (ix), l
	ld	-6 (ix), h
	ex	de,hl
	ld	hl, #6
	add	hl, de
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:740: if(dir == DIRECTION_NONE) dir = g_Players[playerId].PreviousDirection; // Fallback se fermo
	ld	-5 (ix), a
	or	a, a
	jr	NZ, 00104$
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	hl, #7
	add	hl, de
	ld	a, (hl)
	ld	-5 (ix), a
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:743: u8 animStep = g_Ball.KickMoveState;
	ld	hl, #_g_Ball + 13
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:744: if (animStep > 3) animStep = 3; // Default/Reset to 3 (Close) if NO_VALUE (255)
	ld	a, #0x03
	sub	a, e
	jr	NC, 00106$
	ld	e, #0x03
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:746: u8 currentOffset = DribbleAnimOffsets[animStep];
	push	de
	ld	d, #0x00
	ld	hl, #22
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:747: u8 currentOffsetDiag = DribbleAnimOffsetsDiag[animStep];
	ld	d, #0x00
	ld	hl, #24
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:749: u8 distX = BallBaseDistX[dir] + ((dir==DIRECTION_UP || dir==DIRECTION_DOWN) ? 0 : (dir == DIRECTION_LEFT || dir == DIRECTION_RIGHT ? currentOffset : currentOffsetDiag));
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #2
	add	hl, sp
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	ld	a, -5 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00184$
	xor	a, a
00184$:
	ld	-52 (ix), a
	ld	a, -5 (ix)
	sub	a, #0x07
	ld	a, #0x01
	jr	Z, 00186$
	xor	a, a
00186$:
	ld	e, a
	bit	0, -52 (ix)
	jr	NZ, 00121$
	ld	a, -5 (ix)
	sub	a, #0x05
	jr	NZ, 00118$
00121$:
	xor	a, a
	jp	00119$
00118$:
	bit	0, e
	jr	NZ, 00126$
	ld	a, -5 (ix)
	sub	a, #0x03
	jr	NZ, 00123$
00126$:
	ld	a, -4 (ix)
	jp	00124$
00123$:
	ld	a, -1 (ix)
00124$:
00119$:
	add	a, l
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:750: u8 distY = BallBaseDistY[dir] + ((dir==DIRECTION_LEFT || dir==DIRECTION_RIGHT) ? 0 : (dir == DIRECTION_UP || dir == DIRECTION_DOWN ? currentOffset : currentOffsetDiag));
	ld	l, -5 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	-2 (ix), a
	bit	0, e
	jr	NZ, 00131$
	ld	a, -5 (ix)
	sub	a, #0x03
	jr	NZ, 00128$
00131$:
	ld	hl, #0x0000
	ex	(sp), hl
	jp	00129$
00128$:
	bit	0, -52 (ix)
	jr	NZ, 00136$
	ld	a, -5 (ix)
	sub	a, #0x05
	jr	NZ, 00133$
00136$:
	ld	a, -4 (ix)
	ld	-1 (ix), a
00133$:
	ld	a, -1 (ix)
	ld	-53 (ix), a
	ld	-52 (ix), #0x00
00129$:
	ld	a, -53 (ix)
	ld	c, -2 (ix)
	add	a, c
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:752: switch (dir){
	ld	a, #0x08
	sub	a, -5 (ix)
	jp	C, 00115$
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #00195$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00195$:
	jp	00115$
	jp	00107$
	jp	00112$
	jp	00110$
	jp	00114$
	jp	00108$
	jp	00113$
	jp	00109$
	jp	00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:753: case DIRECTION_UP:
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:754: g_Ball.X=g_Players[playerId].X + BallAlignCorrectX[dir];
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #30
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
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
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:755: g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[dir];
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #37
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:756: break;
	jp	00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:757: case DIRECTION_DOWN:
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:758: g_Ball.X=g_Players[playerId].X + BallAlignCorrectX[dir];
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #30
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
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
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:759: g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[dir];
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x00
	ex	de, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #37
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:760: break;
	jp	00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:761: case DIRECTION_LEFT:
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:762: g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[dir];
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
	ld	e, -3 (ix)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #28
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:763: g_Ball.Y=g_Players[playerId].Y + BallAlignCorrectY[dir];
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #37
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:764: break;
	jp	00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:765: case DIRECTION_RIGHT:
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:766: g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[dir];
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
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #28
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:767: g_Ball.Y=g_Players[playerId].Y + BallAlignCorrectY[dir];
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #37
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:768: break;
	jp	00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:769: case DIRECTION_UP_LEFT:
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:770: g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[dir];
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
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
	ld	e, -3 (ix)
	ld	d, #0x00
	cp	a, a
	sbc	hl, de
	push	hl
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #30
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
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
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:771: g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[dir];
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #37
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:772: break;
	jp	00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:773: case DIRECTION_UP_RIGHT:
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:774: g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[dir];
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	push	hl
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #30
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
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
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:775: g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[dir];
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x00
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
	ld	b, a
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #37
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:776: break;
	jp	00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:777: case DIRECTION_DOWN_LEFT:
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:778: g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[dir];
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
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
	ld	e, -3 (ix)
	ld	d, #0x00
	cp	a, a
	sbc	hl, de
	push	hl
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #30
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
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
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:779: g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[dir];
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x00
	ex	de, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #37
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:780: break;
	jp	00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:781: case DIRECTION_DOWN_RIGHT:
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:782: g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[dir];
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	push	hl
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #30
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
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
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:783: g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[dir];
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	b, #0x00
	ex	de, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #37
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ex	de, hl
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:785: }
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:786: g_Ball.PreviousY=g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:787: g_Ball.Direction=dir;
	ld	hl, #(_g_Ball + 5)
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:788: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:789: void TickBallCollision(){
;	---------------------------------
; Function TickBallCollision
; ---------------------------------
_TickBallCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-26
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:790: if(g_MatchStatus!=MATCH_IN_ACTION){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:791: return;
	jp	NZ,00164$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:795: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	bc, #_g_Ball + 6
	ld	a, (bc)
	inc	a
	jr	Z, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:796: if (g_Ball.PossessionTimer < 255) g_Ball.PossessionTimer++;
	ld	de, #_g_Ball + 28
	ld	a, (de)
	cp	a, #0xff
	jr	NC, 00106$
	inc	a
	ld	(de), a
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:801: if (g_Ball.PossessionPlayerId == NO_VALUE) { // Ball in air
	ld	a, (bc)
	ld	-22 (ix), a
	inc	a
	ld	a, #0x01
	jr	Z, 00304$
	xor	a, a
00304$:
	ld	-21 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:804: if (g_Ball.ShotActive == 1) {
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:805: i16 diffStart = (i16)g_Ball.X - (i16)g_Ball.PassStartX; 
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:804: if (g_Ball.ShotActive == 1) {
	ld	a, (#(_g_Ball + 27) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:811: for(u8 i=0; i<14; i++){
	ld	-20 (ix), #0x00
	ld	-19 (ix), a
	ld	a, (#(_g_Ball + 16) + 0)
	inc	a
	ld	a, #0x01
	jr	Z, 00306$
	xor	a, a
00306$:
	ld	-18 (ix), a
	ld	c, -22 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-17 (ix), l
	ld	-16 (ix), h
	ld	-5 (ix), #0x00
00163$:
	ld	a, -5 (ix)
	sub	a, #0x0e
	jp	NC, 00164$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:812: if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -5 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_g_Players
	add	hl, de
	ld	-15 (ix), l
	ld	-14 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:883: g_Players[i].Status = PLAYER_STATUS_POSITIONED; // Lock it
	ld	a, -15 (ix)
	add	a, #0x0e
	ld	-13 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:812: if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00160$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:813: if(g_Ball.PossessionPlayerId == i) continue; // Skip self
	ld	a, -22 (ix)
	sub	a, -5 (ix)
	jp	Z,00160$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:818: u8 hitDist = 14;
	ld	-3 (ix), #0x0e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:819: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	c, -15 (ix)
	ld	b, -14 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	ld	-11 (ix), a
	or	a, a
	jr	NZ, 00125$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:820: if (g_Ball.ShotActive) hitDist = 20; // 15px + tolerance
	ld	a, -19 (ix)
	or	a, a
	jr	Z, 00122$
	ld	-3 (ix), #0x14
	jp	00125$
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:821: else hitDist = 14; 
	ld	-3 (ix), #0x0e
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:825: u16 diffX = (g_Ball.X > g_Players[i].X) ? (g_Ball.X - g_Players[i].X) : (g_Players[i].X - g_Ball.X);
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	ld	l, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -14 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	sub	a, -10 (ix)
	ld	a, -7 (ix)
	sbc	a, -9 (ix)
	jr	NC, 00166$
	ld	a, -10 (ix)
	sub	a, -8 (ix)
	ld	-2 (ix), a
	ld	a, -9 (ix)
	sbc	a, -7 (ix)
	ld	-1 (ix), a
	jp	00167$
00166$:
	ld	a, -8 (ix)
	sub	a, -10 (ix)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	sbc	a, -9 (ix)
	ld	-1 (ix), a
00167$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:826: u16 diffY = (g_Ball.Y > g_Players[i].Y) ? (g_Ball.Y - g_Players[i].Y) : (g_Players[i].Y - g_Ball.Y);
	ld	bc, (#_g_Ball + 0)
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00168$
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	jp	00169$
00168$:
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
00169$:
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:828: if(diffX < hitDist && diffY < hitDist){ 
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	sub	a, l
	ld	a, -1 (ix)
	sbc	a, h
	jp	NC, 00160$
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	NC, 00160$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:829: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	a, -21 (ix)
	or	a, a
	jp	Z, 00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:848: if (g_Ball.ShotActive == 1 || g_Ball.PassTargetPlayerId != NO_VALUE) {
	ld	a, -19 (ix)
	ld	-6 (ix), a
	ld	a, -19 (ix)
	dec	a
	jr	Z, 00132$
	bit	0, -18 (ix)
	jp	NZ, 00133$
00132$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:849: i16 dxStart = (i16)g_Ball.X - (i16)g_Ball.PassStartX;
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	hl, (#(_g_Ball + 17) + 0)
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	-4 (ix), e
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:850: i16 dyStart = (i16)g_Ball.Y - (i16)g_Ball.PassStartY;
	inc	sp
	inc	sp
	push	bc
	ld	hl, #_g_Ball + 19
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-24 (ix), a
	ld	a, -1 (ix)
	ld	-23 (ix), a
	ld	a, -26 (ix)
	sub	a, -24 (ix)
	ld	-2 (ix), a
	ld	a, -25 (ix)
	sbc	a, -23 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:851: if (dxStart < 0) dxStart = -dxStart;
	ld	b, -3 (ix)
	bit	7, b
	jr	Z, 00127$
	xor	a, a
	sub	a, -4 (ix)
	ld	-4 (ix), a
	sbc	a, a
	sub	a, -3 (ix)
	ld	-3 (ix), a
00127$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:852: if (dyStart < 0) dyStart = -dyStart;
	ld	b, -1 (ix)
	bit	7, b
	jr	Z, 00129$
	xor	a, a
	sub	a, -2 (ix)
	ld	-2 (ix), a
	sbc	a, a
	sub	a, -1 (ix)
	ld	-1 (ix), a
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:853: if ((dxStart + dyStart) < 24) continue; 
	ld	a, -2 (ix)
	add	a, -4 (ix)
	ld	c, a
	ld	a, -1 (ix)
	adc	a, -3 (ix)
	ld	b, a
	ld	a, c
	sub	a, #0x18
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00160$
00133$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:893: g_Ball.Size = 2;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:857: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -11 (ix)
	or	a, a
	jp	NZ, 00151$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:871: u8 team = g_Players[i].TeamId;
	ld	a, -15 (ix)
	add	a, #0x05
	ld	-2 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:860: if (g_Ball.ShotActive) {
	ld	a, -6 (ix)
	or	a, a
	jp	Z, 00149$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:861: i16 signedDiffX = (i16)g_Ball.X - (i16)g_Players[i].X;
	ld	a, -10 (ix)
	ld	-4 (ix), a
	ld	a, -9 (ix)
	ld	-3 (ix), a
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -4 (ix)
	sub	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -3 (ix)
	sbc	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:864: if (signedDiffX >= -5 && signedDiffX <= 5) {
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, #0x05
	cp	a, -6 (ix)
	ld	a, #0x00
	sbc	a, -5 (ix)
	jp	PO, 00309$
	xor	a, #0x80
00309$:
	rlca
	and	a,#0x01
	ld	b, a
	ld	a, -4 (ix)
	sub	a, #0xfb
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00145$
	bit	0, b
	jr	Z, 00149$
00145$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:871: u8 team = g_Players[i].TeamId;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:875: if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_RIGHT;
	dec	a
	ld	a, #0x01
	jr	Z, 00311$
	xor	a, a
00311$:
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:874: if (signedDiffX > 5) { // Ball to Right
	ld	a, b
	or	a, a
	jr	Z, 00142$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:875: if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_RIGHT;
	ld	a, c
	or	a, a
	jr	Z, 00136$
	ld	c, #0x3f
	jp	00143$
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:876: else divePose = PLAYER_POSE_TEAM2_GK_DOWN_RIGHT;
	ld	c, #0x3f
	jp	00143$
00142$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:878: if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_LEFT;
	ld	a, c
	or	a, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:879: else divePose = PLAYER_POSE_TEAM2_GK_DOWN_LEFT;
	ld	c, #0xa0
	jr	NZ, 00143$
	ld	c, #0x90
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:882: g_Players[i].PatternId = divePose;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	(hl), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:883: g_Players[i].Status = PLAYER_STATUS_POSITIONED; // Lock it
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00149$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:887: PutBallOnPlayerFeet(i);
	ld	a, -20 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:888: GoalkeeperWithBall(g_Players[i].TeamId, 0); 
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	l, #0x00
	call	_GoalkeeperWithBall
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:891: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:892: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:893: g_Ball.Size = 2;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:895: return; // Stop checking
	jp	00164$
00151$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:899: g_Ball.PassTargetPlayerId = NO_VALUE; 
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:900: g_Ball.ShotActive = 0; 
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:901: g_Ball.KickMoveState = 0;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:902: g_Ball.Size = 1; // On feet = small
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:903: PutBallOnPlayerFeet(i);
	ld	a, -20 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:904: g_Players[i].Status = PLAYER_STATUS_HAS_BALL;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:905: return; // Stop checking
	jp	00164$
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:910: if (g_Players[i].TeamId != g_Players[currentOwner].TeamId) {
	ld	c, -15 (ix)
	ld	b, -14 (ix)
	ld	hl, #5
	add	hl, bc
	ld	c, (hl)
	ld	a, #<(_g_Players)
	add	a, -17 (ix)
	ld	e, a
	ld	a, #>(_g_Players)
	adc	a, -16 (ix)
	ld	d, a
	ld	hl, #5
	add	hl, de
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	Z, 00160$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:912: PutBallOnPlayerFeet(i);
	ld	a, -20 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:914: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:915: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:916: return;
	jp	00164$
00160$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:811: for(u8 i=0; i<14; i++){
	inc	-5 (ix)
	ld	a, -5 (ix)
	ld	-20 (ix), a
	jp	00163$
00164$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:921: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:923: void HandleOffside(u8 offsidePlayerId) {
;	---------------------------------
; Function HandleOffside
; ---------------------------------
_HandleOffside::
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:924: V9_PrintLayerAStringAtPos(10,18,"OFFSIDE");
	push	de
	ld	hl, #___str_0
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
	pop	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:925: g_MatchStatus=MATCH_BEFORE_OFFSIDE;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:926: u8 teamId = g_Players[offsidePlayerId].TeamId;
	ld	bc, #_g_Players+0
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	de, #0x0005
	add	hl, de
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:927: g_RestartKickTeamId = (teamId == TEAM_1) ? TEAM_2 : TEAM_1;
	dec	a
	jr	NZ, 00103$
	ld	a, #0x02
	ld	c, #0x00
	jp	00104$
00103$:
	ld	a, #0x01
	ld	c, #0x00
00104$:
	ld	(_g_RestartKickTeamId+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:928: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:929: }
	ret
___str_0:
	.ascii "OFFSIDE"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:931: bool IsOffside(u8 playerId) {
;	---------------------------------
; Function IsOffside
; ---------------------------------
_IsOffside::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-7
	add	hl, sp
	ld	sp, hl
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:932: u8 teamId = g_Players[playerId].TeamId;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_g_Players
	add	hl, de
	ex	de, hl
	push	de
	pop	iy
	ld	a, 5 (iy)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:933: u16 playerY = g_Players[playerId].Y;
	ld	a, (de)
	ld	-6 (ix), a
	inc	de
	ld	a, (de)
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:934: u8 opponentCount = 0;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:938: if (teamId == TEAM_1) {
	ld	a, -7 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00205$
	xor	a, a
00205$:
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:939: if (playerY >= FIELD_POS_Y_CENTER) return FALSE; // Own half
	ld	a, -6 (ix)
	ld	-3 (ix), a
	ld	a, -5 (ix)
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:938: if (teamId == TEAM_1) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:939: if (playerY >= FIELD_POS_Y_CENTER) return FALSE; // Own half
	ld	a, -3 (ix)
	sub	a, #0xf3
	ld	a, -2 (ix)
	sbc	a, #0x00
	jr	C, 00107$
	xor	a, a
	jp	00131$
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:941: if (playerY <= FIELD_POS_Y_CENTER) return FALSE; // Own half
	ld	a, #0xf3
	cp	a, -3 (ix)
	ld	a, #0x00
	sbc	a, -2 (ix)
	jr	C, 00107$
	xor	a, a
	jp	00131$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:946: if (teamId == TEAM_1) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:947: if (playerY >= g_Ball.Y) return FALSE; 
	ld	hl, (#_g_Ball + 0)
	ld	a, -6 (ix)
	sub	a, l
	ld	a, -5 (ix)
	sbc	a, h
	jr	C, 00144$
	xor	a, a
	jp	00131$
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:949: if (playerY <= g_Ball.Y) return FALSE;
	ld	hl, (#_g_Ball + 0)
	ld	a, l
	sub	a, -6 (ix)
	ld	a, h
	sbc	a, -5 (ix)
	jr	C, 00144$
	xor	a, a
	jp	00131$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:953: for (i = 0; i < 14; i++) {
00144$:
	ld	c, #0x00
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:954: if (g_Players[i].TeamId == teamId) continue;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_g_Players
	add	hl, de
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	de, #5
	add	hl, de
	ld	a,-7 (ix)
	sub	a,(hl)
	jr	Z, 00126$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:955: if (g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #14
	add	hl, de
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jr	Z, 00126$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:959: if (g_Players[i].Y <= playerY) opponentCount++;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:958: if (teamId == TEAM_1) { // Attacking UP
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00124$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:959: if (g_Players[i].Y <= playerY) opponentCount++;
	ld	a, -6 (ix)
	sub	a, e
	ld	a, -5 (ix)
	sbc	a, d
	jr	C, 00126$
	inc	-1 (ix)
	jp	00126$
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:961: if (g_Players[i].Y >= playerY) opponentCount++;
	ld	a, e
	sub	a, -6 (ix)
	ld	a, d
	sbc	a, -5 (ix)
	jr	C, 00126$
	inc	-1 (ix)
00126$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:953: for (i = 0; i < 14; i++) {
	inc	c
	ld	a, c
	sub	a, #0x0e
	jr	C, 00130$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:965: if (opponentCount < 2) return TRUE;
	ld	a, -1 (ix)
	sub	a, #0x02
	jr	NC, 00129$
	ld	a, #0x01
	jp	00131$
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:966: return FALSE;
	xor	a, a
00131$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:967: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:969: void PerformPass(u8 toPlayerId) {
;	---------------------------------
; Function PerformPass
; ---------------------------------
_PerformPass::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-19
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:971: u8 fromId = g_Ball.PossessionPlayerId;
	ld	a, (#(_g_Ball + 6) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:975: if (fromId == NO_VALUE) return;
	ld	-2 (ix), a
	inc	a
	jp	Z,00129$
	jp	00102$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:976: if (toPlayerId == NO_VALUE) return;
	ld	a, -1 (ix)
	inc	a
	jp	Z,00129$
	jp	00104$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:990: dx = (i16)g_Players[toPlayerId].X - (i16)g_Players[fromId].X;
	ld	de, #_g_Players+0
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, de
	ex	(sp), hl
	ld	a, -19 (ix)
	add	a, #0x02
	ld	-17 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-16 (ix), a
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	de
	ld	e, -2 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	add	hl, de
	ld	-15 (ix), l
	ld	-14 (ix), h
	ld	a, -15 (ix)
	add	a, #0x02
	ld	-13 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	-5 (ix), a
	ld	a, b
	sbc	a, d
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:991: dy = (i16)g_Players[toPlayerId].Y - (i16)g_Players[fromId].Y;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	-11 (ix), a
	ld	a, b
	sbc	a, d
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:992: adx = (dx < 0) ? -dx : dx;
	ld	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, -4 (ix)
	ld	-8 (ix), a
	bit	7, -8 (ix)
	jr	Z, 00131$
	xor	a, a
	sub	a, -5 (ix)
	ld	-3 (ix), a
	sbc	a, a
	sub	a, -4 (ix)
	ld	-2 (ix), a
	jp	00132$
00131$:
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
00132$:
	ld	a, -3 (ix)
	ld	-7 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:993: ady = (dy < 0) ? -dy : dy;
	ld	a, -11 (ix)
	ld	-5 (ix), a
	ld	a, -10 (ix)
	ld	-4 (ix), a
	bit	7, -4 (ix)
	jr	Z, 00133$
	xor	a, a
	sub	a, -11 (ix)
	ld	-3 (ix), a
	sbc	a, a
	sub	a, -10 (ix)
	ld	-2 (ix), a
	jp	00134$
00133$:
	ld	a, -11 (ix)
	ld	-3 (ix), a
	ld	a, -10 (ix)
	ld	-2 (ix), a
00134$:
	ld	c, -3 (ix)
	ld	b, -2 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:995: if (adx > ady * 2) {
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00246$
	xor	a, #0x80
00246$:
	jp	P, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:996: newDir = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 00247$
	xor	a, #0x80
00247$:
	jp	P, 00135$
	ld	bc, #0x0003
	jp	00136$
00135$:
	ld	bc, #0x0007
00136$:
	ld	-2 (ix), c
	jp	00113$
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:997: } else if (ady > adx * 2) {
	ex	de, hl
	add	hl, hl
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:998: newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
	xor	a, a
	cp	a, -5 (ix)
	sbc	a, -4 (ix)
	jp	PO, 00248$
	xor	a, #0x80
00248$:
	rlca
	and	a,#0x01
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:997: } else if (ady > adx * 2) {
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00249$
	xor	a, #0x80
00249$:
	jp	P, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:998: newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
	ld	a, l
	or	a, a
	jr	Z, 00137$
	ld	bc, #0x0005
	jp	00138$
00137$:
	ld	bc, #0x0001
00138$:
	ld	-2 (ix), c
	jp	00113$
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1000: if (dx > 0) newDir = (dy > 0) ? DIRECTION_DOWN_RIGHT : DIRECTION_UP_RIGHT;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 00250$
	xor	a, #0x80
00250$:
	jp	P, 00106$
	ld	a, l
	or	a, a
	jr	Z, 00139$
	ld	bc, #0x0004
	jp	00140$
00139$:
	ld	bc, #0x0002
00140$:
	ld	-2 (ix), c
	jp	00113$
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1001: else newDir = (dy > 0) ? DIRECTION_DOWN_LEFT : DIRECTION_UP_LEFT;
	ld	a, l
	or	a, a
	jr	Z, 00141$
	ld	bc, #0x0006
	jp	00142$
00141$:
	ld	bc, #0x0008
00142$:
	ld	-2 (ix), c
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1003: g_Players[fromId].Direction = newDir;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x0006
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1006: if (newDir == DIRECTION_UP || newDir == DIRECTION_UP_LEFT || newDir == DIRECTION_UP_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_FRONT;
	ld	a, -2 (ix)
	dec	a
	jr	Z, 00124$
	ld	a, -2 (ix)
	sub	a, #0x08
	jr	Z, 00124$
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	NZ, 00125$
00124$:
	ld	a, -15 (ix)
	add	a, #0x04
	ld	-3 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x18
	jp	00126$
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1007: else if (newDir == DIRECTION_DOWN || newDir == DIRECTION_DOWN_LEFT || newDir == DIRECTION_DOWN_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_BACK;
	ld	a, -2 (ix)
	sub	a, #0x05
	jr	Z, 00119$
	ld	a, -2 (ix)
	sub	a, #0x06
	jr	Z, 00119$
	ld	a, -2 (ix)
	sub	a, #0x04
	jr	NZ, 00120$
00119$:
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0x15
	jp	00126$
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1008: else if (newDir == DIRECTION_LEFT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_LEFT;
	ld	a, -2 (ix)
	sub	a, #0x07
	jr	NZ, 00117$
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0xa4
	jp	00126$
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1009: else if (newDir == DIRECTION_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_RIGHT;
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	NZ, 00126$
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0x1b
00126$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1011: g_Players[fromId].Status = PLAYER_STATUS_POSITIONED; // Lock pose for this frame
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1014: g_Players[fromId].TargetX = g_Players[fromId].X;
	ld	a, -15 (ix)
	add	a, #0x0c
	ld	c, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	b, a
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1015: g_Players[fromId].TargetY = g_Players[fromId].Y;
	ld	a, -15 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	b, a
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1018: SetPlayerBallPossession(NO_VALUE); 
	ld	a, #0xff
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1019: g_Ball.PossessionPlayerId = NO_VALUE; 
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1021: g_Ball.PassTargetPlayerId = toPlayerId;
	ld	hl, #(_g_Ball + 16)
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1022: g_Ball.ShotActive = 0; // Not a shot
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1023: g_Ball.PassStartX = g_Ball.X;
	ld	bc, (#(_g_Ball + 2) + 0)
	ld	((_g_Ball + 17)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1024: g_Ball.PassStartY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 19)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1026: dx = (i16)g_Players[toPlayerId].X - (i16)g_Ball.X;
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (#(_g_Ball + 2) + 0)
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1027: dy = (i16)g_Players[toPlayerId].Y - (i16)g_Ball.Y;
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, (#_g_Ball + 0)
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: g_Ball.PassTotalDist = (u16)((dx<0?-dx:dx) + (dy<0?-dy:dy)); 
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	Z, 00143$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
00143$:
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	Z, 00145$
	ld	hl, #0x0000
	cp	a, a
	sbc	hl, de
	jp	00146$
00145$:
	ex	de, hl
00146$:
	add	hl, bc
	ex	de, hl
	ld	((_g_Ball + 21)), de
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1029: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1207: void InitPalette()
;	---------------------------------
; Function InitPalette
; ---------------------------------
_InitPalette::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1209: V9_SetPalette(0, 16, g_GameFieldLayerATilesPalette);
	ld	hl, #_g_GameFieldLayerATilesPalette+0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: g_Ball.PassTotalDist = (u16)((dx<0?-dx:dx) + (dy<0?-dy:dy)); 
	ld	bc, #0x0
00107$:
	ld	a, b
	sub	a, #0x10
	jr	NC, 00102$
	push	iy
	ex	(sp), hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ex	(sp), hl
	pop	iy
	inc	c
	push	hl
	push	bc
	ld	e, l
	ld	d, h
	push	iy
	ex	(sp), hl
	ld	a, l
	ex	(sp), hl
	pop	iy
	call	_V9_SetPaletteEntry
	pop	bc
	pop	hl
	inc	hl
	inc	hl
	inc	hl
	inc	b
	jp	00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1209: V9_SetPalette(0, 16, g_GameFieldLayerATilesPalette);
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1210: V9_SetPalette(16, 16, g_GameFieldLayerBTilesPalette);
	ld	hl, #_g_GameFieldLayerBTilesPalette+0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: g_Ball.PassTotalDist = (u16)((dx<0?-dx:dx) + (dy<0?-dy:dy)); 
	ld	bc, #0x10
00110$:
	ld	a, b
	sub	a, #0x10
	jr	NC, 00104$
	push	iy
	ex	(sp), hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ex	(sp), hl
	pop	iy
	inc	c
	push	hl
	push	bc
	ld	e, l
	ld	d, h
	push	iy
	ex	(sp), hl
	ld	a, l
	ex	(sp), hl
	pop	iy
	call	_V9_SetPaletteEntry
	pop	bc
	pop	hl
	inc	hl
	inc	hl
	inc	hl
	inc	b
	jp	00110$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1210: V9_SetPalette(16, 16, g_GameFieldLayerBTilesPalette);
00104$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:1047: inline void V9_SelectPaletteP1(u8 a, u8 b) { V9_SetRegister(13, ((b & 0x3) << 2) + (a & 0x3)); }
	ld	a, #0x01
	and	a, #0x03
	add	a, a
	add	a, a
	ld	c, a
	xor	a, a
	and	a, #0x03
	add	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1211: V9_SelectPaletteP1(0,1);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1212: }
	jp	_V9_SetRegister
_g_GameFieldLayerATilesPalette:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
_g_GameFieldLayerBTilesPalette:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x17	; 23
	.db #0x1b	; 27
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
_g_Sprites1_palette_ita:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x09	; 9
	.db #0x16	; 22
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_g_Sprites1_palette_aus:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_g_Sprites1_palette_fra:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_g_Sprites1_palette_ger:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_g_Sprites1_palette_gbr:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_g_Sprites1_palette_bra:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
_g_Sprites1_palette_fio:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x09	; 9
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x1b	; 27
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x1b	; 27
	.db #0x02	; 2
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x1b	; 27
	.db #0x13	; 19
	.db #0x09	; 9
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x01	; 1
	.db #0x1d	; 29
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1216: void SetTeam1Palette(){
;	---------------------------------
; Function SetTeam1Palette
; ---------------------------------
_SetTeam1Palette::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1217: V9_SetPalette(32, 16, GetTeamPaletteById(g_Team1PaletteId));
	ld	a, (_g_Team1PaletteId+0)
	call	_GetTeamPaletteById
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: g_Ball.PassTotalDist = (u16)((dx<0?-dx:dx) + (dy<0?-dy:dy)); 
	ld	bc, #0x20
00104$:
	ld	a, b
	sub	a, #0x10
	ret	NC
	push	iy
	ex	(sp), hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ex	(sp), hl
	pop	iy
	inc	c
	push	hl
	push	bc
	ld	e, l
	ld	d, h
	push	iy
	ex	(sp), hl
	ld	a, l
	ex	(sp), hl
	pop	iy
	call	_V9_SetPaletteEntry
	pop	bc
	pop	hl
	inc	hl
	inc	hl
	inc	hl
	inc	b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1217: V9_SetPalette(32, 16, GetTeamPaletteById(g_Team1PaletteId));
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1218: }
	jp	00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1219: void SetTeam2Palette(){
;	---------------------------------
; Function SetTeam2Palette
; ---------------------------------
_SetTeam2Palette::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1220: V9_SetPalette(48, 16, GetTeamPaletteById(g_Team2PaletteId));
	ld	a, (_g_Team2PaletteId+0)
	call	_GetTeamPaletteById
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: g_Ball.PassTotalDist = (u16)((dx<0?-dx:dx) + (dy<0?-dy:dy)); 
	ld	bc, #0x30
00104$:
	ld	a, b
	sub	a, #0x10
	ret	NC
	push	iy
	ex	(sp), hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ex	(sp), hl
	pop	iy
	inc	c
	push	hl
	push	bc
	ld	e, l
	ld	d, h
	push	iy
	ex	(sp), hl
	ld	a, l
	ex	(sp), hl
	pop	iy
	call	_V9_SetPaletteEntry
	pop	bc
	pop	hl
	inc	hl
	inc	hl
	inc	hl
	inc	b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1220: V9_SetPalette(48, 16, GetTeamPaletteById(g_Team2PaletteId));
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1221: }
	jp	00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1222: const u16* GetTeamPaletteById(u8 id){
;	---------------------------------
; Function GetTeamPaletteById
; ---------------------------------
_GetTeamPaletteById::
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1223: const u16* palette=g_Sprites1_palette_ita;
	ld	de, #_g_Sprites1_palette_ita
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1224: switch (id){
	ld	a, #0x05
	sub	a, c
	ret	C
	ld	b, #0x00
	ld	hl, #00123$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00123$:
	jp	00101$
	jp	00105$
	jp	00106$
	jp	00109$
	jp	00107$
	jp	00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1225: case TEAM_AUS:
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1226: if(g_FioBre){
	ld	a, (_g_FioBre+0)
	or	a, a
	jr	Z, 00103$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1227: palette=g_Sprites1_palette_fio;
	ld	de, #_g_Sprites1_palette_fio
	ret
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1230: palette=g_Sprites1_palette_aus;
	ld	de, #_g_Sprites1_palette_aus
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1232: break; 
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1233: case TEAM_BRA:
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1234: palette=g_Sprites1_palette_bra;
	ld	de, #_g_Sprites1_palette_bra
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1235: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1236: case TEAM_ITA:
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1237: palette=g_Sprites1_palette_ita;
	ld	de, #_g_Sprites1_palette_ita
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1238: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1239: case TEAM_GBR:
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1240: palette=g_Sprites1_palette_gbr;
	ld	de, #_g_Sprites1_palette_gbr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1241: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1242: case TEAM_GER:
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1243: palette=g_Sprites1_palette_ger;
	ld	de, #_g_Sprites1_palette_ger
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1244: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1245: case TEAM_FRA:
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1246: palette=g_Sprites1_palette_fra;
	ld	de, #_g_Sprites1_palette_fra
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1248: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1249: return palette;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1250: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1253: void TickFieldScrollingAction(){
;	---------------------------------
; Function TickFieldScrollingAction
; ---------------------------------
_TickFieldScrollingAction::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1255: if(g_FieldScrollingActionInProgress!=NO_VALUE){
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	ret	Z
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1257: switch (g_FieldScrollingActionInProgress){
	ld	a, (_g_FieldScrollingActionInProgress+0)
	or	a, a
	jr	Z, 00101$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	dec	a
	jr	Z, 00104$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	sub	a, #0x02
	jp	Z,00114$
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1258: case FIELD_NORTH_ZONE:
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1259: g_FieldCurrentYPosition=g_FieldCurrentYPosition-g_FieldScrollSpeed;
	ld	a, (_g_FieldScrollSpeed+0)
	ld	c, a
	ld	b, #0x00
	ld	hl, #_g_FieldCurrentYPosition
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1260: if(g_FieldCurrentYPosition<0){
	ld	a, (_g_FieldCurrentYPosition+1)
	bit	7, a
	jp	Z, 00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1261: g_FieldCurrentYPosition=1;
	ld	hl, #0x0001
	ld	(_g_FieldCurrentYPosition), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1262: g_FieldScrollingActionInProgress=NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1263: g_ActiveFieldZone=FIELD_NORTH_ZONE;
	ld	iy, #_g_ActiveFieldZone
	ld	0 (iy), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1265: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1266: case FIELD_CENTRAL_ZONE:
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1267: if(g_FieldCurrentYPosition!=136){
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x88
	ld	iy, #_g_FieldCurrentYPosition
	or	a, 1 (iy)
	jr	Z, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1259: g_FieldCurrentYPosition=g_FieldCurrentYPosition-g_FieldScrollSpeed;
	ld	a, (_g_FieldScrollSpeed+0)
	ld	c, a
	ld	b, #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1268: if(g_FieldCurrentYPosition>FIELD_CENTRAL_Y){
	ld	a, #0x8c
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00186$
	xor	a, #0x80
00186$:
	jp	P, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1269: g_FieldCurrentYPosition=g_FieldCurrentYPosition-g_FieldScrollSpeed;
	ld	hl, #_g_FieldCurrentYPosition
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	(hl), a
	jp	00117$
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1272: g_FieldCurrentYPosition=g_FieldCurrentYPosition+g_FieldScrollSpeed;
	ld	hl, #_g_FieldCurrentYPosition
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
	jp	00117$
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1277: g_FieldScrollingActionInProgress=NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1278: g_ActiveFieldZone=FIELD_CENTRAL_ZONE;
	ld	iy, #_g_ActiveFieldZone
	ld	0 (iy), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1279: if(g_MatchStatus==MATCH_NOT_STARTED){
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jr	NZ, 00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1280: g_MatchStatus=MATCH_BEFORE_KICK_OFF;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1281: for(u8 i=0;i<15;i++){
	ld	c, #0x00
00121$:
	ld	a, c
	sub	a, #0x0f
	jr	NC, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1282: SetPlayerTarget(i);
	push	bc
	ld	a, c
	call	_SetPlayerTarget
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1281: for(u8 i=0;i<15;i++){
	inc	c
	jp	00121$
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1284: TickPlayerToOwnTarget();
	call	_TickPlayerToOwnTarget
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1288: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1289: case FIELD_SOUTH_ZONE:
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1290: g_FieldCurrentYPosition=g_FieldCurrentYPosition+g_FieldScrollSpeed;
	ld	a, (_g_FieldScrollSpeed+0)
	ld	c, a
	ld	b, #0x00
	ld	a, c
	ld	iy, #_g_FieldCurrentYPosition
	add	a, 0 (iy)
	ld	(_g_FieldCurrentYPosition+0), a
	ld	a, b
	adc	a, 1 (iy)
	ld	(_g_FieldCurrentYPosition+1), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1291: if(g_FieldCurrentYPosition>=FIELD_BOTTOM_Y){
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x18
	ld	a, (_g_FieldCurrentYPosition+1)
	rla
	ccf
	rra
	sbc	a, #0x81
	jr	C, 00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1292: g_ActiveFieldZone=FIELD_SOUTH_ZONE;
	ld	hl, #_g_ActiveFieldZone
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1293: g_FieldScrollingActionInProgress=NO_VALUE;
	ld	iy, #_g_FieldScrollingActionInProgress
	ld	0 (iy), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1296: }
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1297: V9_SetScrollingBY(g_FieldCurrentYPosition);
	ld	hl, (_g_FieldCurrentYPosition)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1299: }
	jp	_V9_SetScrollingBY
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1300: void TickShowKickOff(){
;	---------------------------------
; Function TickShowKickOff
; ---------------------------------
_TickShowKickOff::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1301: if(g_MatchStatus==MATCH_KICK_OFF){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x07
	jr	NZ, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1302: if(g_Timer==1){
	ld	a, (_g_Timer+0)
	dec	a
	jr	NZ, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1303: V9_PrintLayerAStringAtPos(12,18,"KICK OFF");
	ld	hl, #___str_1
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1304: g_Timer=2;
	ld	hl, #_g_Timer
	ld	(hl), #0x02
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1306: if(g_Timer==3){
	ld	a, (_g_Timer+0)
	sub	a, #0x03
	jr	NZ, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1307: ClearTextFromLayerA(12,18,9);
	ld	a, #0x09
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1308: g_Timer=NO_VALUE;
	ld	hl, #_g_Timer
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1310: if(g_RestartKickTeamId==TEAM_1){
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1311: playerId=GetPlayerIdByRole(TEAM_1,PLAYER_ROLE_RIGHT_HALFFIELDER);
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_GetPlayerIdByRole
	ld	c, a
	jp	00105$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1314: playerId=GetPlayerIdByRole(TEAM_2,PLAYER_ROLE_LEFT_HALFFIELDER);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_GetPlayerIdByRole
	ld	c, a
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1316: PutBallOnPlayerFeet(playerId);
	ld	a, c
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1317: g_MatchStatus=MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1320: if(g_MatchStatus==MATCH_BEFORE_OFFSIDE){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0e
	ret	NZ
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1321: if(g_Timer >= 2) { 
	ld	a, (_g_Timer+0)
	sub	a, #0x02
	ret	C
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1322: ClearTextFromLayerA(10,18,7);
	ld	a, #0x07
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1323: g_Timer = NO_VALUE;
	ld	hl, #_g_Timer
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1325: u8 team = g_RestartKickTeamId; 
	ld	a, (_g_RestartKickTeamId+0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1326: u8 newOwner = GetClosestPlayerToBall(team, NO_VALUE);
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0xff
	call	_GetClosestPlayerToBall
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1327: if (newOwner != NO_VALUE) {
	ld	c, a
	inc	a
	jr	Z, 00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1328: PutBallOnPlayerFeet(newOwner);
	ld	a, c
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1329: g_Ball.KickMoveState = NO_VALUE;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0xff
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1332: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1335: }
	ret
___str_1:
	.ascii "KICK OFF"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1337: void ResetBallInfo(bool resetPossessionPlayer){
;	---------------------------------
; Function ResetBallInfo
; ---------------------------------
_ResetBallInfo::
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1338: g_Ball.PreviousY=g_Ball.Y;
	ld	de, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1339: g_Ball.KickMoveState=NO_VALUE;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1340: g_Ball.Size=1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1341: g_Ball.Direction=DIRECTION_NONE;
	ld	hl, #(_g_Ball + 5)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1342: if(resetPossessionPlayer){
	ld	a, c
	or	a, a
	ret	Z
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1343: g_Ball.PossessionPlayerId=NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1345: }
	ret
	.area _SEG1
	.area _INITIALIZER
	.area _CABS (ABS)
