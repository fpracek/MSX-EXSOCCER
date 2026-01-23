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
	.globl _DEBUG_LOGNUM
	.globl _DEBUG_BREAK
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
	.globl _g_Font_MGL_Sample6
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1964: void PutBallOnPlayerFeet(u8 playerId){
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1966: g_Ball.PossessionPlayerId=playerId;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1967: g_Ball.LastTouchTeamId=g_Players[playerId].TeamId;
	ld	de, #_g_Players+0
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, de
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	de, #5
	add	hl, de
	ld	a, (hl)
	ld	(#(_g_Ball + 14)),a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1968: g_Ball.PassTargetPlayerId = NO_VALUE; // Clear any pending pass
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1969: g_Ball.ShotActive = 0; // Clear any pending shot
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1970: SetPlayerBallPossession(g_Ball.PossessionPlayerId);
	ld	a, c
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1974: const u8 BallBaseDistX[] = { 0, 0, 4, 6, 4, 0, 4, 6, 4 };
	ld	-51 (ix), #0x00
	ld	-50 (ix), #0x00
	ld	-49 (ix), #0x04
	ld	-48 (ix), #0x06
	ld	-47 (ix), #0x04
	ld	-46 (ix), #0x00
	ld	-45 (ix), #0x04
	ld	-44 (ix), #0x06
	ld	-43 (ix), #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1975: const u8 BallBaseDistY[] = { 0, 6, 4, 0, 4, 6, 4, 2, 4 };
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1977: const u8 DribbleAnimOffsets[] = {5, 4, 2, 0};
	ld	-33 (ix), #0x05
	ld	-32 (ix), #0x04
	ld	-31 (ix), #0x02
	ld	-30 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1978: const u8 DribbleAnimOffsetsDiag[] = {3, 3, 1, 0};
	ld	-29 (ix), #0x03
	ld	-28 (ix), #0x03
	ld	-27 (ix), #0x01
	ld	-26 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1982: const i8 BallAlignCorrectX[] = { 0, 0, 0, 0, 2, 0, -2, 0, 0 };
	ld	-25 (ix), #0x00
	ld	-24 (ix), #0x00
	ld	-23 (ix), #0x00
	ld	-22 (ix), #0x00
	ld	-21 (ix), #0x02
	ld	-20 (ix), #0x00
	ld	-19 (ix), #0xfe
	ld	-18 (ix), #0x00
	ld	-17 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1983: const i8 BallAlignCorrectY[] = { 0, 0, 0, 4, 2, 4, 2, 4, 0 };
	ld	-16 (ix), #0x00
	ld	-15 (ix), #0x00
	ld	-14 (ix), #0x00
	ld	-13 (ix), #0x04
	ld	-12 (ix), #0x02
	ld	-11 (ix), #0x04
	ld	-10 (ix), #0x02
	ld	-9 (ix), #0x04
	ld	-8 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1985: u8 dir = g_Players[playerId].Direction;
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	hl, #6
	add	hl, de
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1986: if(dir == DIRECTION_NONE) dir = g_Players[playerId].PreviousDirection; // Fallback se fermo
	ld	-5 (ix), a
	or	a, a
	jr	NZ, 00102$
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	hl, #7
	add	hl, de
	ld	a, (hl)
	ld	-5 (ix), a
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1989: u8 animStep = g_Ball.KickMoveState;
	ld	hl, #_g_Ball + 13
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1990: if (animStep > 3) animStep = 3; // Default/Reset to 3 (Close) if NO_VALUE (255)
	ld	a, #0x03
	sub	a, e
	jr	NC, 00104$
	ld	e, #0x03
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1992: u8 currentOffset = DribbleAnimOffsets[animStep];
	push	de
	ld	d, #0x00
	ld	hl, #22
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1993: u8 currentOffsetDiag = DribbleAnimOffsetsDiag[animStep];
	ld	d, #0x00
	ld	hl, #24
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1995: u8 distX = BallBaseDistX[dir] + ((dir==DIRECTION_UP || dir==DIRECTION_DOWN) ? 0 : (dir == DIRECTION_LEFT || dir == DIRECTION_RIGHT ? currentOffset : currentOffsetDiag));
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
	jr	Z, 00176$
	xor	a, a
00176$:
	ld	-52 (ix), a
	ld	a, -5 (ix)
	sub	a, #0x07
	ld	a, #0x01
	jr	Z, 00178$
	xor	a, a
00178$:
	ld	e, a
	bit	0, -52 (ix)
	jr	NZ, 00119$
	ld	a, -5 (ix)
	sub	a, #0x05
	jr	NZ, 00116$
00119$:
	xor	a, a
	jp	00117$
00116$:
	bit	0, e
	jr	NZ, 00124$
	ld	a, -5 (ix)
	sub	a, #0x03
	jr	NZ, 00121$
00124$:
	ld	a, -4 (ix)
	jp	00122$
00121$:
	ld	a, -1 (ix)
00122$:
00117$:
	add	a, l
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1996: u8 distY = BallBaseDistY[dir] + ((dir==DIRECTION_LEFT || dir==DIRECTION_RIGHT) ? 0 : (dir == DIRECTION_UP || dir == DIRECTION_DOWN ? currentOffset : currentOffsetDiag));
	ld	l, -5 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	-2 (ix), a
	bit	0, e
	jr	NZ, 00129$
	ld	a, -5 (ix)
	sub	a, #0x03
	jr	NZ, 00126$
00129$:
	ld	hl, #0x0000
	ex	(sp), hl
	jp	00127$
00126$:
	bit	0, -52 (ix)
	jr	NZ, 00134$
	ld	a, -5 (ix)
	sub	a, #0x05
	jr	NZ, 00131$
00134$:
	ld	a, -4 (ix)
	ld	-1 (ix), a
00131$:
	ld	a, -1 (ix)
	ld	-53 (ix), a
	ld	-52 (ix), #0x00
00127$:
	ld	a, -53 (ix)
	ld	c, -2 (ix)
	add	a, c
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1998: switch (dir){
	ld	a, #0x08
	sub	a, -5 (ix)
	jp	C, 00113$
	ld	e, -5 (ix)
	ld	d, #0x00
	ld	hl, #00187$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00187$:
	jp	00113$
	jp	00105$
	jp	00110$
	jp	00108$
	jp	00112$
	jp	00106$
	jp	00111$
	jp	00107$
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1999: case DIRECTION_UP:
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2000: g_Ball.X=g_Players[playerId].X + BallAlignCorrectX[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2001: g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2002: break;
	jp	00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2003: case DIRECTION_DOWN:
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2004: g_Ball.X=g_Players[playerId].X + BallAlignCorrectX[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2005: g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2006: break;
	jp	00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2007: case DIRECTION_LEFT:
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2008: g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2009: g_Ball.Y=g_Players[playerId].Y + BallAlignCorrectY[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2010: break;
	jp	00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2011: case DIRECTION_RIGHT:
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2012: g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2013: g_Ball.Y=g_Players[playerId].Y + BallAlignCorrectY[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2014: break;
	jp	00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2015: case DIRECTION_UP_LEFT:
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2016: g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2017: g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2018: break;
	jp	00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2019: case DIRECTION_UP_RIGHT:
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2020: g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2021: g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2022: break;
	jp	00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2023: case DIRECTION_DOWN_LEFT:
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2024: g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2025: g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2026: break;
	jp	00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2027: case DIRECTION_DOWN_RIGHT:
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2028: g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2029: g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[dir];
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2031: }
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2032: g_Ball.PreviousY=g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2033: g_Ball.Direction=dir;
	ld	hl, #(_g_Ball + 5)
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2034: }
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
_g_Font_MGL_Sample6:
	.db #0x88	; 136
	.db #0x68	; 104	'h'
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xc8	; 200
	.db #0xc8	; 200
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x94	; 148
	.db #0x94	; 148
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x64	; 100	'd'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc8	; 200
	.db #0x88	; 136
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x88	; 136
	.db #0xc8	; 200
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x88	; 136
	.db #0xa8	; 168
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x84	; 132
	.db #0xb4	; 180
	.db #0xb4	; 180
	.db #0x84	; 132
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x84	; 132
	.db #0xb4	; 180
	.db #0xa4	; 164
	.db #0xb4	; 180
	.db #0x84	; 132
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x44	; 68	'D'
	.db #0xd4	; 212
	.db #0xd4	; 212
	.db #0xd4	; 212
	.db #0x44	; 68	'D'
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xd4	; 212
	.db #0xc8	; 200
	.db #0xd4	; 212
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x7c	; 124
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x7c	; 124
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x38	; 56	'8'
	.db #0x14	; 20
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x64	; 100	'd'
	.db #0x68	; 104	'h'
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x2c	; 44
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x54	; 84	'T'
	.db #0x48	; 72	'H'
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x4c	; 76	'L'
	.db #0x54	; 84	'T'
	.db #0x64	; 100	'd'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x48	; 72	'H'
	.db #0x7c	; 124
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x04	; 4
	.db #0x34	; 52	'4'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x70	; 112	'p'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x4c	; 76	'L'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x48	; 72	'H'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x48	; 72	'H'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x6c	; 108	'l'
	.db #0x54	; 84	'T'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x64	; 100	'd'
	.db #0x64	; 100	'd'
	.db #0x54	; 84	'T'
	.db #0x4c	; 76	'L'
	.db #0x4c	; 76	'L'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x48	; 72	'H'
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x40	; 64
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x20	; 32
	.db #0x70	; 112	'p'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x64	; 100	'd'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x78	; 120	'x'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x64	; 100	'd'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x78	; 120	'x'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x4c	; 76	'L'
	.db #0x34	; 52	'4'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x24	; 36
	.db #0x64	; 100	'd'
	.db #0xfc	; 252
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x64	; 100	'd'
	.db #0xfc	; 252
	.db #0x64	; 100	'd'
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0x78	; 120	'x'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x38	; 56	'8'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xe8	; 232
	.db #0x08	; 8
	.db #0xe8	; 232
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x5f	; 95
	.db #0x40	; 64
	.db #0x5f	; 95
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x2f	; 47
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xe8	; 232
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x2f	; 47
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xe8	; 232
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x88	; 136
	.db #0x22	; 34
	.db #0x88	; 136
	.db #0x22	; 34
	.db #0x88	; 136
	.db #0x22	; 34
	.db #0x88	; 136
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xee	; 238
	.db #0xbb	; 187
	.db #0xee	; 238
	.db #0xbb	; 187
	.db #0xee	; 238
	.db #0xbb	; 187
	.db #0xee	; 238
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x81	; 129
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x44	; 68	'D'
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x44	; 68	'D'
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xd8	; 216
	.db #0x88	; 136
	.db #0xd8	; 216
	.db #0x50	; 80	'P'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xd8	; 216
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xd8	; 216
	.db #0x08	; 8
	.db #0xd8	; 216
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x98	; 152
	.db #0x88	; 136
	.db #0xd8	; 216
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0xd8	; 216
	.db #0x88	; 136
	.db #0xd8	; 216
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xc8	; 200
	.db #0x88	; 136
	.db #0xd8	; 216
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xd8	; 216
	.db #0x80	; 128
	.db #0xd8	; 216
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0xd8	; 216
	.db #0x88	; 136
	.db #0xc8	; 200
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0xc8	; 200
	.db #0xe8	; 232
	.db #0xc8	; 200
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0xb8	; 184
	.db #0x98	; 152
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x90	; 144
	.db #0xd8	; 216
	.db #0xfc	; 252
	.db #0xd8	; 216
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x6c	; 108	'l'
	.db #0xfc	; 252
	.db #0x6c	; 108	'l'
	.db #0x24	; 36
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x7c	; 124
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0xf8	; 248
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0xa0	; 160
	.db #0x20	; 32
	.db #0x28	; 40
	.db #0x9c	; 156
	.db #0x08	; 8
	.db #0x00	; 0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2035: void TickBallCollision(){
;	---------------------------------
; Function TickBallCollision
; ---------------------------------
_TickBallCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-19
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2036: if(g_MatchStatus!=MATCH_IN_ACTION){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2037: return;
	jp	NZ,00169$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2041: bool impossibleToReach = false;
	ld	-19 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2042: if (g_Ball.PossessionPlayerId == NO_VALUE) { // Ball in air
	ld	hl, #(_g_Ball + 6)
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2045: if (g_Ball.ShotActive == 1) {
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2046: i16 diffStart = (i16)g_Ball.X - (i16)g_Ball.PassStartX; 
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2042: if (g_Ball.PossessionPlayerId == NO_VALUE) { // Ball in air
	inc	c
	jr	NZ, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2043: if (g_Ball.Size >= 5) impossibleToReach = true;
	ld	a, (#_g_Ball + 4)
	sub	a, #0x05
	jr	C, 00104$
	ld	-19 (ix), #0x01
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2045: if (g_Ball.ShotActive == 1) {
	ld	a, (#(_g_Ball + 27) + 0)
	dec	a
	jr	NZ, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2046: i16 diffStart = (i16)g_Ball.X - (i16)g_Ball.PassStartX; 
	ld	bc, (#_g_Ball + 2)
	ld	hl, (#(_g_Ball + 17) + 0)
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2047: if (diffStart < 0) diffStart = -diffStart;
	ld	e, c
	ld	d, b
	bit	7, d
	jr	Z, 00106$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2048: if (diffStart < 20) impossibleToReach = true;
	ld	a, c
	sub	a, #0x14
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00112$
	ld	-19 (ix), #0x01
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2052: for(u8 i=0; i<14; i++){
	ld	-18 (ix), #0x00
	ld	-1 (ix), #0x00
00168$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00169$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2053: if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
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
	ld	-17 (ix), l
	ld	-16 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2129: g_Players[i].Status = PLAYER_STATUS_POSITIONED; // Lock it
	ld	a, -17 (ix)
	add	a, #0x0e
	ld	-15 (ix), a
	ld	a, -16 (ix)
	adc	a, #0x00
	ld	-14 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2053: if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00165$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2042: if (g_Ball.PossessionPlayerId == NO_VALUE) { // Ball in air
	ld	a, (#(_g_Ball + 6) + 0)
	ld	-13 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2054: if(g_Ball.PossessionPlayerId == i) continue; // Skip self
	ld	a, -1 (ix)
	sub	a, -13 (ix)
	jp	Z,00165$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2059: u8 hitDist = 10;
	ld	-12 (ix), #0x0a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2060: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -17 (ix)
	add	a, #0x09
	ld	-11 (ix), a
	ld	a, -16 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	or	a, a
	jr	NZ, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2061: if (g_Ball.ShotActive) hitDist = 20; // 15px + tolerance
	ld	a, (#(_g_Ball + 27) + 0)
	ld	-2 (ix), a
	or	a, a
	jr	Z, 00118$
	ld	-12 (ix), #0x14
	jp	00121$
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2062: else hitDist = 14; 
	ld	-12 (ix), #0x0e
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2066: u16 diffX = (g_Ball.X > g_Players[i].X) ? (g_Ball.X - g_Players[i].X) : (g_Players[i].X - g_Ball.X);
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
	ld	a, -17 (ix)
	add	a, #0x02
	ld	-7 (ix), a
	ld	a, -16 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	sub	a, -9 (ix)
	ld	a, -4 (ix)
	sbc	a, -8 (ix)
	jr	NC, 00171$
	ld	a, -9 (ix)
	sub	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -8 (ix)
	sbc	a, -4 (ix)
	ld	-2 (ix), a
	jp	00172$
00171$:
	ld	a, -5 (ix)
	sub	a, -9 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	sbc	a, -8 (ix)
	ld	-2 (ix), a
00172$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2067: u16 diffY = (g_Ball.Y > g_Players[i].Y) ? (g_Ball.Y - g_Players[i].Y) : (g_Players[i].Y - g_Ball.Y);
	ld	bc, (#_g_Ball + 0)
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00173$
	ld	a, c
	sub	a, e
	ld	-5 (ix), a
	ld	a, b
	sbc	a, d
	ld	-4 (ix), a
	jp	00174$
00173$:
	ld	a, e
	sub	a, c
	ld	-5 (ix), a
	ld	a, d
	sbc	a, b
	ld	-4 (ix), a
00174$:
	ld	l, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2069: if(diffX < hitDist && diffY < hitDist){ 
	ld	c, -12 (ix)
	ld	b, #0x00
	ld	a, -3 (ix)
	sub	a, c
	ld	a, -2 (ix)
	sbc	a, b
	jp	NC, 00165$
	xor	a, a
	sbc	hl, bc
	jp	NC, 00165$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2070: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	a, -13 (ix)
	inc	a
	jp	NZ,00160$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2075: if (g_Ball.ShotActive != 1) {
	ld	a, (#(_g_Ball + 27) + 0)
	dec	a
	jr	Z, 00123$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2076: DEBUG_LOGNUM(">>>>",g_MatchStatus);
	ld	a, (_g_MatchStatus+0)
	push	af
	inc	sp
	ld	hl, #___str_0
	call	_DEBUG_LOGNUM
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2077: DEBUG_LOGNUM("\nM:", g_FieldScrollingActionInProgress);
	ld	a, (_g_FieldScrollingActionInProgress+0)
	push	af
	inc	sp
	ld	hl, #___str_1
	call	_DEBUG_LOGNUM
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2078: DEBUG_BREAK();
	call	_DEBUG_BREAK
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2084: bool impossibleForPlayer = impossibleToReach;
	ld	c, -19 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2085: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER && g_Ball.ShotActive) impossibleForPlayer = false; // GK catches shots always
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	b, (hl)
	ld	a, b
	or	a, a
	jr	NZ, 00125$
	ld	a, (#(_g_Ball + 27) + 0)
	or	a, a
	jr	Z, 00125$
	ld	c, #0x00
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2087: if (impossibleForPlayer) continue; 
	ld	a, c
	or	a, a
	jp	NZ, 00165$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2089: if (g_Ball.Size >= 4 && g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) continue;
	ld	a, (#(_g_Ball + 4) + 0)
	sub	a, #0x04
	jr	C, 00130$
	ld	a, b
	or	a, a
	jp	NZ, 00165$
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2094: if (g_Ball.ShotActive != 0) {
	ld	hl, #(_g_Ball + 27)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z, 00139$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2095: i16 dxStart = (i16)g_Ball.X - (i16)g_Ball.PassStartX;
	ld	de, (#(_g_Ball + 2) + 0)
	ld	hl, (#(_g_Ball + 17) + 0)
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2096: i16 dyStart = (i16)g_Ball.Y - (i16)g_Ball.PassStartY;
	ld	hl, (#_g_Ball + 0)
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	hl, (#_g_Ball + 19)
	ld	a, -3 (ix)
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	sbc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2097: if (dxStart < 0) dxStart = -dxStart;
	ld	-3 (ix), e
	ld	-2 (ix), d
	bit	7, -2 (ix)
	jr	Z, 00133$
	xor	a, a
	sub	a, e
	ld	e, a
	sbc	a, a
	sub	a, d
	ld	d, a
00133$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2098: if (dyStart < 0) dyStart = -dyStart;
	ld	-3 (ix), l
	ld	-2 (ix), h
	bit	7, -2 (ix)
	jr	Z, 00135$
	xor	a, a
	sub	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	sbc	a, a
	sub	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2099: if ((dxStart + dyStart) < 20) continue; 
	add	hl, de
	ld	de, #0x8014
	add	hl, hl
	ccf
	rr	h
	rr	l
	sbc	hl, de
	jp	C, 00165$
00139$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2137: g_Ball.PassTargetPlayerId = NO_VALUE;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2103: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, b
	or	a, a
	jp	NZ, 00156$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2117: u8 team = g_Players[i].TeamId;
	ld	a, -17 (ix)
	add	a, #0x05
	ld	-2 (ix), a
	ld	a, -16 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2106: if (g_Ball.ShotActive) {
	ld	a, c
	or	a, a
	jr	Z, 00154$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2107: i16 signedDiffX = (i16)g_Ball.X - (i16)g_Players[i].X;
	ld	bc, (#(_g_Ball + 2) + 0)
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2110: if (signedDiffX >= -5 && signedDiffX <= 5) {
	ld	c, e
	ld	b, d
	ld	a, #0x05
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00344$
	xor	a, #0x80
00344$:
	rlca
	and	a,#0x01
	ld	c, a
	ld	a, e
	sub	a, #0xfb
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00150$
	bit	0, c
	jr	Z, 00154$
00150$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2117: u8 team = g_Players[i].TeamId;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2121: if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_RIGHT;
	dec	a
	ld	a, #0x01
	jr	Z, 00346$
	xor	a, a
00346$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2120: if (signedDiffX > 5) { // Ball to Right
	inc	c
	dec	c
	jr	Z, 00147$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2121: if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_RIGHT;
	or	a, a
	jr	Z, 00141$
	ld	c, #0x3f
	jp	00148$
00141$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2122: else divePose = PLAYER_POSE_TEAM2_GK_DOWN_RIGHT;
	ld	c, #0x3f
	jp	00148$
00147$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2124: if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_LEFT;
	or	a, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2125: else divePose = PLAYER_POSE_TEAM2_GK_DOWN_LEFT;
	ld	c, #0xa0
	jr	NZ, 00148$
	ld	c, #0x90
00148$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2128: g_Players[i].PatternId = divePose;
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	(hl), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2129: g_Players[i].Status = PLAYER_STATUS_POSITIONED; // Lock it
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00154$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2133: PutBallOnPlayerFeet(i);
	ld	a, -18 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2134: GoalkeeperWithBall(g_Players[i].TeamId, 0); 
	ld	l, -2 (ix)
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	l, #0x00
	call	_GoalkeeperWithBall
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2137: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2138: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2139: g_Ball.Size = 2;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2141: return; // Stop checking
	jp	00169$
00156$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2145: g_Ball.PassTargetPlayerId = NO_VALUE; 
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2146: g_Ball.ShotActive = 0; 
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2147: g_Ball.KickMoveState = 0;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2148: g_Ball.Size = 1; // On feet = small
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2149: PutBallOnPlayerFeet(i);
	ld	a, -18 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2150: g_Players[i].Status = PLAYER_STATUS_HAS_BALL;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2151: return; // Stop checking
	jp	00169$
00160$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2155: u8 currentOwner = g_Ball.PossessionPlayerId;
	ld	c, -13 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2156: if (g_Players[i].TeamId != g_Players[currentOwner].TeamId) {
	ld	e, -17 (ix)
	ld	d, -16 (ix)
	ld	hl, #5
	add	hl, de
	ld	e, (hl)
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
	ld	c, (hl)
	ld	a, e
	sub	a, c
	jr	Z, 00165$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2158: PutBallOnPlayerFeet(i);
	ld	a, -18 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2160: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2161: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2162: return;
	jp	00169$
00165$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2052: for(u8 i=0; i<14; i++){
	inc	-1 (ix)
	ld	a, -1 (ix)
	ld	-18 (ix), a
	jp	00168$
00169$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2167: }
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii ">>>>"
	.db 0x00
___str_1:
	.db 0x0a
	.ascii "M:"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2169: void HandleOffside(u8 offsidePlayerId) {
;	---------------------------------
; Function HandleOffside
; ---------------------------------
_HandleOffside::
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2170: V9_PrintLayerAStringAtPos(10,18,"OFFSIDE");
	push	de
	ld	hl, #___str_2
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
	pop	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2171: g_MatchStatus=MATCH_BEFORE_OFFSIDE;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2172: u8 teamId = g_Players[offsidePlayerId].TeamId;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2173: g_RestartKickTeamId = (teamId == TEAM_1) ? TEAM_2 : TEAM_1;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2174: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2175: }
	ret
___str_2:
	.ascii "OFFSIDE"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2177: bool IsOffside(u8 playerId) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2178: u8 teamId = g_Players[playerId].TeamId;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2179: u16 playerY = g_Players[playerId].Y;
	ld	a, (de)
	ld	-6 (ix), a
	inc	de
	ld	a, (de)
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2180: u8 opponentCount = 0;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2184: if (teamId == TEAM_1) {
	ld	a, -7 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00205$
	xor	a, a
00205$:
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2185: if (playerY >= FIELD_POS_Y_CENTER) return FALSE; // Own half
	ld	a, -6 (ix)
	ld	-3 (ix), a
	ld	a, -5 (ix)
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2184: if (teamId == TEAM_1) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2185: if (playerY >= FIELD_POS_Y_CENTER) return FALSE; // Own half
	ld	a, -3 (ix)
	sub	a, #0xf3
	ld	a, -2 (ix)
	sbc	a, #0x00
	jr	C, 00107$
	xor	a, a
	jp	00131$
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2187: if (playerY <= FIELD_POS_Y_CENTER) return FALSE; // Own half
	ld	a, #0xf3
	cp	a, -3 (ix)
	ld	a, #0x00
	sbc	a, -2 (ix)
	jr	C, 00107$
	xor	a, a
	jp	00131$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2192: if (teamId == TEAM_1) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2193: if (playerY >= g_Ball.Y) return FALSE; 
	ld	hl, (#_g_Ball + 0)
	ld	a, -6 (ix)
	sub	a, l
	ld	a, -5 (ix)
	sbc	a, h
	jr	C, 00144$
	xor	a, a
	jp	00131$
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2195: if (playerY <= g_Ball.Y) return FALSE;
	ld	hl, (#_g_Ball + 0)
	ld	a, l
	sub	a, -6 (ix)
	ld	a, h
	sbc	a, -5 (ix)
	jr	C, 00144$
	xor	a, a
	jp	00131$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2199: for (i = 0; i < 14; i++) {
00144$:
	ld	c, #0x00
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2200: if (g_Players[i].TeamId == teamId) continue;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2201: if (g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	ld	hl, #14
	add	hl, de
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jr	Z, 00126$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2205: if (g_Players[i].Y <= playerY) opponentCount++;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2204: if (teamId == TEAM_1) { // Attacking UP
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00124$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2205: if (g_Players[i].Y <= playerY) opponentCount++;
	ld	a, -6 (ix)
	sub	a, e
	ld	a, -5 (ix)
	sbc	a, d
	jr	C, 00126$
	inc	-1 (ix)
	jp	00126$
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2207: if (g_Players[i].Y >= playerY) opponentCount++;
	ld	a, e
	sub	a, -6 (ix)
	ld	a, d
	sbc	a, -5 (ix)
	jr	C, 00126$
	inc	-1 (ix)
00126$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2199: for (i = 0; i < 14; i++) {
	inc	c
	ld	a, c
	sub	a, #0x0e
	jr	C, 00130$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2211: if (opponentCount < 2) return TRUE;
	ld	a, -1 (ix)
	sub	a, #0x02
	jr	NC, 00129$
	ld	a, #0x01
	jp	00131$
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2212: return FALSE;
	xor	a, a
00131$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2213: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2215: void PerformPass(u8 toPlayerId) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2217: u8 fromId = g_Ball.PossessionPlayerId;
	ld	a, (#(_g_Ball + 6) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2221: if (fromId == NO_VALUE) return;
	ld	-2 (ix), a
	inc	a
	jp	Z,00133$
	jp	00102$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2222: if (toPlayerId == NO_VALUE) return;
	ld	a, -1 (ix)
	inc	a
	jp	Z,00133$
	jp	00104$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2226: if (g_Players[fromId].Role != PLAYER_ROLE_GOALKEEPER) {
	ld	bc, #_g_Players+0
	ld	e, -2 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ex	(sp), hl
	pop	de
	push	de
	ld	hl, #9
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2227: if (IsOffside(toPlayerId)) {
	push	bc
	ld	a, -1 (ix)
	call	_IsOffside
	pop	bc
	or	a, a
	jr	Z, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2228: HandleOffside(toPlayerId);
	ld	a, -1 (ix)
	call	_HandleOffside
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2229: return;
	jp	00133$
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2234: dx = (i16)g_Players[toPlayerId].X - (i16)g_Players[fromId].X;
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	-17 (ix), l
	ld	-16 (ix), h
	ld	a, -17 (ix)
	add	a, #0x02
	ld	-15 (ix), a
	ld	a, -16 (ix)
	adc	a, #0x00
	ld	-14 (ix), a
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -19 (ix)
	add	a, #0x02
	ld	-13 (ix), a
	ld	a, -18 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2235: dy = (i16)g_Players[toPlayerId].Y - (i16)g_Players[fromId].Y;
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	-11 (ix), a
	ld	a, b
	sbc	a, d
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2236: adx = (dx < 0) ? -dx : dx;
	ld	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, -4 (ix)
	ld	-8 (ix), a
	bit	7, -8 (ix)
	jr	Z, 00135$
	xor	a, a
	sub	a, -5 (ix)
	ld	-3 (ix), a
	sbc	a, a
	sub	a, -4 (ix)
	ld	-2 (ix), a
	jp	00136$
00135$:
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
00136$:
	ld	a, -3 (ix)
	ld	-7 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2237: ady = (dy < 0) ? -dy : dy;
	ld	a, -11 (ix)
	ld	-5 (ix), a
	ld	a, -10 (ix)
	ld	-4 (ix), a
	bit	7, -4 (ix)
	jr	Z, 00137$
	xor	a, a
	sub	a, -11 (ix)
	ld	-3 (ix), a
	sbc	a, a
	sub	a, -10 (ix)
	ld	-2 (ix), a
	jp	00138$
00137$:
	ld	a, -11 (ix)
	ld	-3 (ix), a
	ld	a, -10 (ix)
	ld	-2 (ix), a
00138$:
	ld	c, -3 (ix)
	ld	b, -2 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2239: if (adx > ady * 2) {
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00260$
	xor	a, #0x80
00260$:
	jp	P, 00116$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2240: newDir = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 00261$
	xor	a, #0x80
00261$:
	jp	P, 00139$
	ld	bc, #0x0003
	jp	00140$
00139$:
	ld	bc, #0x0007
00140$:
	ld	-2 (ix), c
	jp	00117$
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2241: } else if (ady > adx * 2) {
	ex	de, hl
	add	hl, hl
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2242: newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
	xor	a, a
	cp	a, -5 (ix)
	sbc	a, -4 (ix)
	jp	PO, 00262$
	xor	a, #0x80
00262$:
	rlca
	and	a,#0x01
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2241: } else if (ady > adx * 2) {
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00263$
	xor	a, #0x80
00263$:
	jp	P, 00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2242: newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
	ld	a, l
	or	a, a
	jr	Z, 00141$
	ld	bc, #0x0005
	jp	00142$
00141$:
	ld	bc, #0x0001
00142$:
	ld	-2 (ix), c
	jp	00117$
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2244: if (dx > 0) newDir = (dy > 0) ? DIRECTION_DOWN_RIGHT : DIRECTION_UP_RIGHT;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 00264$
	xor	a, #0x80
00264$:
	jp	P, 00110$
	ld	a, l
	or	a, a
	jr	Z, 00143$
	ld	bc, #0x0004
	jp	00144$
00143$:
	ld	bc, #0x0002
00144$:
	ld	-2 (ix), c
	jp	00117$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2245: else newDir = (dy > 0) ? DIRECTION_DOWN_LEFT : DIRECTION_UP_LEFT;
	ld	a, l
	or	a, a
	jr	Z, 00145$
	ld	bc, #0x0006
	jp	00146$
00145$:
	ld	bc, #0x0008
00146$:
	ld	-2 (ix), c
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2247: g_Players[fromId].Direction = newDir;
	pop	hl
	push	hl
	ld	de, #0x0006
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2250: if (newDir == DIRECTION_UP || newDir == DIRECTION_UP_LEFT || newDir == DIRECTION_UP_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_FRONT;
	ld	a, -2 (ix)
	dec	a
	jr	Z, 00128$
	ld	a, -2 (ix)
	sub	a, #0x08
	jr	Z, 00128$
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	NZ, 00129$
00128$:
	ld	a, -19 (ix)
	add	a, #0x04
	ld	-3 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x18
	jp	00130$
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2251: else if (newDir == DIRECTION_DOWN || newDir == DIRECTION_DOWN_LEFT || newDir == DIRECTION_DOWN_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_BACK;
	ld	a, -2 (ix)
	sub	a, #0x05
	jr	Z, 00123$
	ld	a, -2 (ix)
	sub	a, #0x06
	jr	Z, 00123$
	ld	a, -2 (ix)
	sub	a, #0x04
	jr	NZ, 00124$
00123$:
	pop	hl
	push	hl
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0x15
	jp	00130$
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2252: else if (newDir == DIRECTION_LEFT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_LEFT;
	ld	a, -2 (ix)
	sub	a, #0x07
	jr	NZ, 00121$
	pop	hl
	push	hl
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0xa4
	jp	00130$
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2253: else if (newDir == DIRECTION_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_RIGHT;
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	NZ, 00130$
	pop	hl
	push	hl
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0x1b
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2255: g_Players[fromId].Status = PLAYER_STATUS_POSITIONED; // Lock pose for this frame
	pop	hl
	push	hl
	ld	de, #0x000e
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2258: g_Players[fromId].TargetX = g_Players[fromId].X;
	ld	a, -19 (ix)
	add	a, #0x0c
	ld	c, a
	ld	a, -18 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2259: g_Players[fromId].TargetY = g_Players[fromId].Y;
	ld	a, -19 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	b, a
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2262: SetPlayerBallPossession(NO_VALUE); 
	ld	a, #0xff
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2263: g_Ball.PossessionPlayerId = NO_VALUE; 
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2265: g_Ball.PassTargetPlayerId = toPlayerId;
	ld	hl, #(_g_Ball + 16)
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2266: g_Ball.ShotActive = 0; // Not a shot
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2267: g_Ball.PassStartX = g_Ball.X;
	ld	bc, (#(_g_Ball + 2) + 0)
	ld	((_g_Ball + 17)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2268: g_Ball.PassStartY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 19)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2270: dx = (i16)g_Players[toPlayerId].X - (i16)g_Ball.X;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2271: dy = (i16)g_Players[toPlayerId].Y - (i16)g_Ball.Y;
	ld	l, -17 (ix)
	ld	h, -16 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2272: g_Ball.PassTotalDist = (u16)((dx<0?-dx:dx) + (dy<0?-dy:dy)); 
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	Z, 00147$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
00147$:
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	Z, 00149$
	ld	hl, #0x0000
	cp	a, a
	sbc	hl, de
	jp	00150$
00149$:
	ex	de, hl
00150$:
	add	hl, bc
	ex	de, hl
	ld	((_g_Ball + 21)), de
00133$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2273: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2451: void InitPalette()
;	---------------------------------
; Function InitPalette
; ---------------------------------
_InitPalette::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2453: V9_SetPalette(0, 16, g_GameFieldLayerATilesPalette);
	ld	hl, #_g_GameFieldLayerATilesPalette+0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: 0x44, /* .#...#.. */ 
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2453: V9_SetPalette(0, 16, g_GameFieldLayerATilesPalette);
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2454: V9_SetPalette(16, 16, g_GameFieldLayerBTilesPalette);
	ld	hl, #_g_GameFieldLayerBTilesPalette+0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: 0x44, /* .#...#.. */ 
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2454: V9_SetPalette(16, 16, g_GameFieldLayerBTilesPalette);
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2455: V9_SelectPaletteP1(0,1);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2456: }
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2460: void SetTeam1Palette(){
;	---------------------------------
; Function SetTeam1Palette
; ---------------------------------
_SetTeam1Palette::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2461: V9_SetPalette(32, 16, GetTeamPaletteById(g_Team1PaletteId));
	ld	a, (_g_Team1PaletteId+0)
	call	_GetTeamPaletteById
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: 0x44, /* .#...#.. */ 
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2461: V9_SetPalette(32, 16, GetTeamPaletteById(g_Team1PaletteId));
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2462: }
	jp	00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2463: void SetTeam2Palette(){
;	---------------------------------
; Function SetTeam2Palette
; ---------------------------------
_SetTeam2Palette::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2464: V9_SetPalette(48, 16, GetTeamPaletteById(g_Team2PaletteId));
	ld	a, (_g_Team2PaletteId+0)
	call	_GetTeamPaletteById
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: 0x44, /* .#...#.. */ 
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2464: V9_SetPalette(48, 16, GetTeamPaletteById(g_Team2PaletteId));
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2465: }
	jp	00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2466: const u16* GetTeamPaletteById(u8 id){
;	---------------------------------
; Function GetTeamPaletteById
; ---------------------------------
_GetTeamPaletteById::
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2467: const u16* palette=g_Sprites1_palette_ita;
	ld	de, #_g_Sprites1_palette_ita
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2468: switch (id){
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2469: case TEAM_AUS:
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2470: if(g_FioBre){
	ld	a, (_g_FioBre+0)
	or	a, a
	jr	Z, 00103$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2471: palette=g_Sprites1_palette_fio;
	ld	de, #_g_Sprites1_palette_fio
	ret
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2474: palette=g_Sprites1_palette_aus;
	ld	de, #_g_Sprites1_palette_aus
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2476: break; 
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2477: case TEAM_BRA:
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2478: palette=g_Sprites1_palette_bra;
	ld	de, #_g_Sprites1_palette_bra
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2479: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2480: case TEAM_ITA:
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2481: palette=g_Sprites1_palette_ita;
	ld	de, #_g_Sprites1_palette_ita
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2482: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2483: case TEAM_GBR:
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2484: palette=g_Sprites1_palette_gbr;
	ld	de, #_g_Sprites1_palette_gbr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2485: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2486: case TEAM_GER:
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2487: palette=g_Sprites1_palette_ger;
	ld	de, #_g_Sprites1_palette_ger
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2488: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2489: case TEAM_FRA:
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2490: palette=g_Sprites1_palette_fra;
	ld	de, #_g_Sprites1_palette_fra
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2492: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2493: return palette;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2494: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2497: void TickFieldScrollingAction(){
;	---------------------------------
; Function TickFieldScrollingAction
; ---------------------------------
_TickFieldScrollingAction::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2499: if(g_FieldScrollingActionInProgress!=NO_VALUE){
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	ret	Z
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2501: switch (g_FieldScrollingActionInProgress){
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2502: case FIELD_NORTH_ZONE:
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2503: g_FieldCurrentYPosition=g_FieldCurrentYPosition-g_FieldScrollSpeed;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2504: if(g_FieldCurrentYPosition<0){
	ld	a, (_g_FieldCurrentYPosition+1)
	bit	7, a
	jp	Z, 00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2505: g_FieldCurrentYPosition=1;
	ld	hl, #0x0001
	ld	(_g_FieldCurrentYPosition), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2506: g_FieldScrollingActionInProgress=NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2507: g_ActiveFieldZone=FIELD_NORTH_ZONE;
	ld	iy, #_g_ActiveFieldZone
	ld	0 (iy), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2509: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2510: case FIELD_CENTRAL_ZONE:
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2511: if(g_FieldCurrentYPosition!=136){
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x88
	ld	iy, #_g_FieldCurrentYPosition
	or	a, 1 (iy)
	jr	Z, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2503: g_FieldCurrentYPosition=g_FieldCurrentYPosition-g_FieldScrollSpeed;
	ld	a, (_g_FieldScrollSpeed+0)
	ld	c, a
	ld	b, #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2512: if(g_FieldCurrentYPosition>FIELD_CENTRAL_Y){
	ld	a, #0x8c
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00186$
	xor	a, #0x80
00186$:
	jp	P, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2513: g_FieldCurrentYPosition=g_FieldCurrentYPosition-g_FieldScrollSpeed;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2516: g_FieldCurrentYPosition=g_FieldCurrentYPosition+g_FieldScrollSpeed;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2521: g_FieldScrollingActionInProgress=NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2522: g_ActiveFieldZone=FIELD_CENTRAL_ZONE;
	ld	iy, #_g_ActiveFieldZone
	ld	0 (iy), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2523: if(g_MatchStatus==MATCH_NOT_STARTED){
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jr	NZ, 00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2524: g_MatchStatus=MATCH_BEFORE_KICK_OFF;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2525: for(u8 i=0;i<15;i++){
	ld	c, #0x00
00121$:
	ld	a, c
	sub	a, #0x0f
	jr	NC, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2526: SetPlayerTarget(i);
	push	bc
	ld	a, c
	call	_SetPlayerTarget
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2525: for(u8 i=0;i<15;i++){
	inc	c
	jp	00121$
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2528: TickPlayerToOwnTarget();
	call	_TickPlayerToOwnTarget
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2532: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2533: case FIELD_SOUTH_ZONE:
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2534: g_FieldCurrentYPosition=g_FieldCurrentYPosition+g_FieldScrollSpeed;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2535: if(g_FieldCurrentYPosition>=FIELD_BOTTOM_Y){
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x18
	ld	a, (_g_FieldCurrentYPosition+1)
	rla
	ccf
	rra
	sbc	a, #0x81
	jr	C, 00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2536: g_ActiveFieldZone=FIELD_SOUTH_ZONE;
	ld	hl, #_g_ActiveFieldZone
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2537: g_FieldScrollingActionInProgress=NO_VALUE;
	ld	iy, #_g_FieldScrollingActionInProgress
	ld	0 (iy), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2540: }
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2541: V9_SetScrollingBY(g_FieldCurrentYPosition);
	ld	hl, (_g_FieldCurrentYPosition)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2543: }
	jp	_V9_SetScrollingBY
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2544: void TickShowKickOff(){
;	---------------------------------
; Function TickShowKickOff
; ---------------------------------
_TickShowKickOff::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2545: if(g_MatchStatus==MATCH_KICK_OFF){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x07
	jr	NZ, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2546: if(g_Timer==1){
	ld	a, (_g_Timer+0)
	dec	a
	jr	NZ, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2547: V9_PrintLayerAStringAtPos(12,18,"KICK OFF");
	ld	hl, #___str_3
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2548: g_Timer=2;
	ld	hl, #_g_Timer
	ld	(hl), #0x02
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2550: if(g_Timer==3){
	ld	a, (_g_Timer+0)
	sub	a, #0x03
	jr	NZ, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2551: ClearTextFromLayerA(12,18,9);
	ld	a, #0x09
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2552: g_Timer=NO_VALUE;
	ld	hl, #_g_Timer
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2554: if(g_RestartKickTeamId==TEAM_1){
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2555: playerId=GetPlayerIdByRole(TEAM_1,PLAYER_ROLE_RIGHT_HALFFIELDER);
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_GetPlayerIdByRole
	ld	c, a
	jp	00105$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2558: playerId=GetPlayerIdByRole(TEAM_2,PLAYER_ROLE_LEFT_HALFFIELDER);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_GetPlayerIdByRole
	ld	c, a
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2560: PutBallOnPlayerFeet(playerId);
	ld	a, c
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2561: g_MatchStatus=MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2564: if(g_MatchStatus==MATCH_BEFORE_OFFSIDE){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0e
	ret	NZ
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2565: if(g_Timer >= 2) { 
	ld	a, (_g_Timer+0)
	sub	a, #0x02
	ret	C
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2566: ClearTextFromLayerA(10,18,7);
	ld	a, #0x07
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2567: g_Timer = NO_VALUE;
	ld	hl, #_g_Timer
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2569: u8 team = g_RestartKickTeamId; 
	ld	a, (_g_RestartKickTeamId+0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2570: u8 newOwner = GetClosestPlayerToBall(team, NO_VALUE);
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0xff
	call	_GetClosestPlayerToBall
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2571: if (newOwner != NO_VALUE) {
	ld	c, a
	inc	a
	jr	Z, 00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2572: PutBallOnPlayerFeet(newOwner);
	ld	a, c
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2573: g_Ball.KickMoveState = NO_VALUE;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0xff
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2576: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2579: }
	ret
___str_3:
	.ascii "KICK OFF"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2581: void ResetBallInfo(bool resetPossessionPlayer){
;	---------------------------------
; Function ResetBallInfo
; ---------------------------------
_ResetBallInfo::
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2582: g_Ball.PreviousY=g_Ball.Y;
	ld	de, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2583: g_Ball.KickMoveState=NO_VALUE;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2584: g_Ball.Size=1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2585: g_Ball.Direction=DIRECTION_NONE;
	ld	hl, #(_g_Ball + 5)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2586: if(resetPossessionPlayer){
	ld	a, c
	or	a, a
	ret	Z
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2587: g_Ball.PossessionPlayerId=NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:2589: }
	ret
	.area _SEG1
	.area _INITIALIZER
	.area _CABS (ABS)
