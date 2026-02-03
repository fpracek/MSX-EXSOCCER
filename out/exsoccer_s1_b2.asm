;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module exsoccer_s1_b2
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _HandleOffside
	.globl _GetTeamStats
	.globl _PerformPass
	.globl _GetClosestPlayerToBall
	.globl _GoalkeeperWithBall
	.globl _PerformShot
	.globl _GetNoMovingPlayerPatternId
	.globl _SetPlayerBallPossession
	.globl _GetPlayerIdByRole
	.globl _PutBallOnPlayerFeet
	.globl _ClearTextFromLayerA
	.globl _ResetPlayersInfo
	.globl _IsTeamJoystickTriggerPressed
	.globl _GetJoystick2Direction
	.globl _GetJoystick1Direction
	.globl _SetPlayerTarget
	.globl _ShowHeaderInfo
	.globl _ShowFieldZone
	.globl _V9_PrintLayerAStringAtPos
	.globl _V9_SetPaletteEntry
	.globl _V9_GetRegister
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
	.globl _GoalKick
	.globl _BallInGoal
	.globl _GetBestPassTarget
	.globl _BallThrowIn
	.globl _CornerKick
	.globl _UpdatePassTarget
	.globl _TickGoalKick
	.globl _SpriteBlinking
	.globl _SetTeamsPresentationSpritesPosition
	.globl _TickCornerKick
	.globl _TickTeamJoystick
	.globl _TickBallCollision
	.globl _EnforcePenaltyBoxRestriction
	.globl _InitPalette
	.globl _TickTeamSelection
	.globl _SetTeam1Palette
	.globl _SetTeam2Palette
	.globl _GetTeamPaletteById
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
_UpdatePassTarget_passUpdateTimer_65537_1206:
	.ds 1
_TickCornerKick_s_ForceKickTimer_65537_1291:
	.ds 2
_TickCornerKick_joyMoved_196614_1325:
	.ds 1
_TickCornerKick_t1Latched_196615_1330:
	.ds 1
_TickCornerKick_joyMoved_196613_1333:
	.ds 1
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:367: static u8 passUpdateTimer = 0;
	ld	iy, #_UpdatePassTarget_passUpdateTimer_65537_1206
	ld	0 (iy), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:628: static u16 s_ForceKickTimer = 0;
	ld	hl, #0x0000
	ld	(_TickCornerKick_s_ForceKickTimer_65537_1291), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:778: static bool joyMoved = false;
	ld	iy, #_TickCornerKick_joyMoved_196614_1325
	ld	0 (iy), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:804: static bool t1Latched = false;
	ld	iy, #_TickCornerKick_t1Latched_196615_1330
	ld	0 (iy), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:824: static bool joyMoved = false;
	ld	iy, #_TickCornerKick_joyMoved_196613_1333
	ld	0 (iy), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _SEG1
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:43: void GoalKick(u8 teamId){
;	---------------------------------
; Function GoalKick
; ---------------------------------
_GoalKick::
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:45: V9_PrintLayerAStringAtPos(10,18,"GOAL KICK");
	push	bc
	ld	hl, #___str_0
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:46: g_MatchStatus=MATCH_BEFORE_GOAL_KICK;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:47: g_RestartKickTeamId = teamId;
	ld	hl, #_g_RestartKickTeamId
	ld	(hl), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:48: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:51: if (g_Ball.X < FIELD_POS_X_CENTER) g_GoalKickSide = CORNER_SIDE_LEFT;
	ld	hl, (#(_g_Ball + 2) + 0)
	ld	de, #0x0078
	cp	a, a
	sbc	hl, de
	jr	NC, 00102$
	ld	hl, #_g_GoalKickSide
	ld	(hl), #0x00
	ret
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:52: else g_GoalKickSide = CORNER_SIDE_RIGHT;
	ld	hl, #_g_GoalKickSide
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:53: }
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
___str_0:
	.ascii "GOAL KICK"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:54: void BallInGoal(u8 teamScored){
;	---------------------------------
; Function BallInGoal
; ---------------------------------
_BallInGoal::
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:56: V9_PrintLayerAStringAtPos(12,18,"IN  GOAL");
	push	bc
	ld	hl, #___str_1
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:58: g_GoalScorerId = g_Ball.PossessionPlayerId;
	ld	hl, #(_g_Ball + 6)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:61: if (g_GoalScorerId == NO_VALUE) {
	ld	(_g_GoalScorerId+0), a
	inc	a
	jr	NZ, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:62: g_GoalScorerId = GetClosestPlayerToBall(teamScored, NO_VALUE);
	push	bc
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_GetClosestPlayerToBall
	pop	bc
	ld	(_g_GoalScorerId+0), a
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:65: if(teamScored==TEAM_1){
	dec	c
	ld	a, #0x01
	jr	Z, 00128$
	xor	a, a
00128$:
	ld	c, a
	or	a, a
	jr	Z, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:67: g_Ball.Y = FIELD_BOUND_Y_TOP - 12;
	ld	hl, #0x0026
	ld	(_g_Ball), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:68: g_Team1Score++;
	ld	hl, #_g_Team1Score
	inc	(hl)
	jp	00105$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:72: g_Ball.Y = FIELD_BOUND_Y_BOTTOM + 12L;
	ld	hl, #0x01ba
	ld	(_g_Ball), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:73: g_Team2Score++;
	ld	hl, #_g_Team2Score
	inc	(hl)
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:75: ShowHeaderInfo();
	push	bc
	call	_ShowHeaderInfo
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:77: g_MatchStatus=MATCH_AFTER_IN_GOAL;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x06
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:78: g_RestartKickTeamId = (teamScored == TEAM_1) ? TEAM_2 : TEAM_1;
	ld	a, c
	or	a, a
	jr	Z, 00108$
	ld	a, #0x02
	ld	c, #0x00
	jp	00109$
00108$:
	ld	a, #0x01
	ld	c, #0x00
00109$:
	ld	(_g_RestartKickTeamId+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:79: g_Timer = 0; // Start timer for celebration/reset
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:80: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:81: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:82: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:83: }
	ret
___str_1:
	.ascii "IN  GOAL"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:84: u8 GetBestPassTarget(u8 passerId) {
;	---------------------------------
; Function GetBestPassTarget
; ---------------------------------
_GetBestPassTarget::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-32
	add	hl, sp
	ld	sp, hl
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:85: u8 bestTarget = NO_VALUE;
	ld	-32 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:86: i32 bestScore = -2100000000;
	ld	-31 (ix), #0x00
	ld	-30 (ix), #0x8b
	ld	-29 (ix), #0xd4
	ld	-28 (ix), #0x82
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:87: u8 teamId = g_Players[passerId].TeamId;
	ld	c, -2 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_g_Players
	add	hl, de
	ld	c, l
	ld	b, h
	push	bc
	pop	iy
	ld	a, 9 (iy)
	ld	-27 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:88: u8 dir = g_Players[passerId].Direction;
	push	bc
	pop	iy
	ld	e, 10 (iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:89: i16 px = (i16)g_Players[passerId].X;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
	inc	hl
	ld	a, (hl)
	ld	-26 (ix), d
	ld	-25 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:90: i16 py = (i16)g_Players[passerId].Y;
	ld	l, c
	ld	h, b
	ld	d, (hl)
	inc	hl
	ld	a, (hl)
	ld	-24 (ix), d
	ld	-23 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:93: i16 dirX = 0, dirY = 0;
	xor	a, a
	ld	-22 (ix), a
	ld	-21 (ix), a
	xor	a, a
	ld	-20 (ix), a
	ld	-19 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:96: if (dir == DIRECTION_NONE) dir = g_Players[passerId].PreviousDirection;
	ld	a, e
	or	a, a
	jr	NZ, 00102$
	ld	e, c
	ld	d, b
	ld	hl, #11
	add	hl, de
	ld	e, (hl)
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:98: if (dir == DIRECTION_UP) dirY = -100;
	ld	a, e
	dec	a
	jr	NZ, 00128$
	ld	-20 (ix), #0x9c
	ld	-19 (ix), #0xff
	jp	00180$
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:99: else if (dir == DIRECTION_DOWN) dirY = 100;
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00125$
	ld	-20 (ix), #0x64
	ld	-19 (ix), #0
	jp	00180$
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:100: else if (dir == DIRECTION_LEFT) dirX = -100;
	ld	a, e
	sub	a, #0x07
	jr	NZ, 00122$
	ld	-22 (ix), #0x9c
	ld	-21 (ix), #0xff
	jp	00180$
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:101: else if (dir == DIRECTION_RIGHT) dirX = 100;
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00119$
	ld	-22 (ix), #0x64
	ld	-21 (ix), #0
	jp	00180$
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:102: else if (dir == DIRECTION_UP_RIGHT) { dirX = 70; dirY = -70; }
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00116$
	ld	-22 (ix), #0x46
	xor	a, a
	ld	-21 (ix), a
	ld	-20 (ix), #0xba
	ld	-19 (ix), #0xff
	jp	00180$
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:103: else if (dir == DIRECTION_UP_LEFT) { dirX = -70; dirY = -70; }
	ld	a, e
	sub	a, #0x08
	jr	NZ, 00113$
	ld	-22 (ix), #0xba
	ld	-21 (ix), #0xff
	ld	-20 (ix), #0xba
	ld	-19 (ix), #0xff
	jp	00180$
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:104: else if (dir == DIRECTION_DOWN_RIGHT) { dirX = 70; dirY = 70; }
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00110$
	ld	-22 (ix), #0x46
	ld	-21 (ix), #0
	ld	-20 (ix), #0x46
	ld	-19 (ix), #0
	jp	00180$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:105: else if (dir == DIRECTION_DOWN_LEFT) { dirX = -70; dirY = 70; }
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00107$
	ld	-22 (ix), #0xba
	ld	-21 (ix), #0xff
	ld	-20 (ix), #0x46
	ld	-19 (ix), #0
	jp	00180$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:107: if (teamId == TEAM_1) dirY = -100; 
	ld	a, -27 (ix)
	dec	a
	jr	NZ, 00104$
	ld	-20 (ix), #0x9c
	ld	-19 (ix), #0xff
	jp	00180$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:108: else dirY = 100; 
	ld	-20 (ix), #0x64
	ld	-19 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:111: for(i=0; i<14; i++) {
00180$:
	ld	-18 (ix), c
	ld	-17 (ix), b
	ld	-1 (ix), #0x00
00152$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:116: if(g_Players[i].TeamId != teamId) continue;
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
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	bc,#9
	add	hl,bc
	ld	a,-27 (ix)
	sub	a,(hl)
	jp	NZ,00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:117: if(i == passerId) continue;
	ld	a, -2 (ix)
	sub	a, -1 (ix)
	jp	Z,00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:119: if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue; 
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:122: if (g_Players[i].Y < g_FieldCurrentYPosition || g_Players[i].Y > (g_FieldCurrentYPosition + 220)) {
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	e, c
	ld	d, b
	ld	hl, (_g_FieldCurrentYPosition)
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	C, 00150$
	ld	iy, #0x00dc
	push	bc
	ld	bc, (_g_FieldCurrentYPosition)
	add	iy, bc
	pop	bc
	push	iy
	pop	hl
	xor	a, a
	sbc	hl, de
	jp	C, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:126: dx = (i16)g_Players[i].X - px;
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, -26 (ix)
	ld	e, a
	ld	a, d
	sbc	a, -25 (ix)
	ld	-6 (ix), e
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:127: dy = (i16)g_Players[i].Y - py;
	ld	a, c
	sub	a, -24 (ix)
	ld	c, a
	ld	a, b
	sbc	a, -23 (ix)
	ld	-4 (ix), c
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:131: adx = (dx < 0) ? -dx : dx;
	ld	b, -5 (ix)
	bit	7, b
	jr	Z, 00155$
	xor	a, a
	sub	a, -6 (ix)
	ld	-8 (ix), a
	sbc	a, a
	sub	a, -5 (ix)
	ld	-7 (ix), a
	jp	00156$
00155$:
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
00156$:
	ld	c, -8 (ix)
	ld	b, -7 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:132: ady = (dy < 0) ? -dy : dy;
	ld	d, -3 (ix)
	bit	7, d
	jr	Z, 00157$
	xor	a, a
	sub	a, -4 (ix)
	ld	e, a
	sbc	a, a
	sub	a, -3 (ix)
	jp	00158$
00157$:
	ld	e, -4 (ix)
	ld	a, -3 (ix)
00158$:
	ld	-16 (ix), e
	ld	-15 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:133: if (adx < 32 && ady < 32) continue;
	ld	e, c
	ld	d, b
	ld	a, e
	sub	a, #0x20
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00140$
	ld	e, -16 (ix)
	ld	d, -15 (ix)
	ld	a, e
	sub	a, #0x20
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00150$
00140$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:136: if (g_Players[passerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	de, #0x000d
	add	hl, de
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:138: if (((i32)dx*(i32)dx + (i32)dy*(i32)dy) > 40000) continue;
	ld	a, -6 (ix)
	ld	-14 (ix), a
	ld	a, -5 (ix)
	ld	-13 (ix), a
	rlca
	sbc	a, a
	ld	-12 (ix), a
	ld	-11 (ix), a
	ld	a, -4 (ix)
	ld	-10 (ix), a
	ld	a, -3 (ix)
	ld	-9 (ix), a
	rlca
	sbc	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:136: if (g_Players[passerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, e
	or	a, a
	jr	NZ, 00145$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:138: if (((i32)dx*(i32)dx + (i32)dy*(i32)dy) > 40000) continue;
	push	bc
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -14 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -14 (ix)
	ld	d, -13 (ix)
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
	ld	-6 (ix), e
	ld	-5 (ix), d
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
	pop	bc
	ld	a, e
	add	a, -6 (ix)
	ld	e, a
	ld	a, d
	adc	a, -5 (ix)
	ld	d, a
	ld	a, l
	adc	a, -4 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, -3 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x40
	cp	a, e
	ld	a, #0x9c
	sbc	a, d
	ld	a, #0x00
	sbc	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00296$
	xor	a, #0x80
00296$:
	jp	M, 00150$
00145$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:141: dot = ((i32)dx * dirX) + ((i32)dy * dirY);
	ld	e, -22 (ix)
	ld	a, -21 (ix)
	ld	d, a
	rlca
	sbc	hl, hl
	push	bc
	push	hl
	push	de
	ld	e, -14 (ix)
	ld	d, -13 (ix)
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
	ld	-6 (ix), e
	ld	-5 (ix), d
	ld	-4 (ix), l
	ld	-3 (ix), h
	pop	bc
	ld	e, -20 (ix)
	ld	a, -19 (ix)
	ld	d, a
	rlca
	sbc	hl, hl
	push	bc
	push	hl
	push	de
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mullong
	pop	af
	pop	af
	pop	bc
	ld	a, e
	add	a, -6 (ix)
	ld	e, a
	ld	a, d
	adc	a, -5 (ix)
	ld	d, a
	ld	a, l
	adc	a, -4 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	adc	a, -3 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	-6 (ix), e
	ld	-5 (ix), d
	ld	-4 (ix), l
	ld	-3 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:144: if (dot <= 0) {
	xor	a, a
	cp	a, -6 (ix)
	sbc	a, -5 (ix)
	ld	a, #0x00
	sbc	a, -4 (ix)
	ld	a, #0x00
	sbc	a, -3 (ix)
	jp	PO, 00297$
	xor	a, #0x80
00297$:
	jp	P, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:155: score = dot - ((i32)(adx + ady) * 40); 
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0028
	call	___mulsint2slong
	ld	-14 (ix), e
	ld	-13 (ix), d
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	a, -6 (ix)
	sub	a, -14 (ix)
	ld	-10 (ix), a
	ld	a, -5 (ix)
	sbc	a, -13 (ix)
	ld	-9 (ix), a
	ld	a, -4 (ix)
	sbc	a, -12 (ix)
	ld	-8 (ix), a
	ld	a, -3 (ix)
	sbc	a, -11 (ix)
	ld	-7 (ix), a
	ld	hl, #26
	add	hl, sp
	ex	de, hl
	ld	hl, #22
	add	hl, sp
	ld	bc, #4
	ldir
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:157: if (score > bestScore) {
	ld	a, -31 (ix)
	sub	a, -6 (ix)
	ld	a, -30 (ix)
	sbc	a, -5 (ix)
	ld	a, -29 (ix)
	sbc	a, -4 (ix)
	ld	a, -28 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00298$
	xor	a, #0x80
00298$:
	jp	P, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:158: bestScore = score;
	ld	hl, #1
	add	hl, sp
	ex	de, hl
	ld	hl, #26
	add	hl, sp
	ld	bc, #4
	ldir
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:159: bestTarget = i;
	ld	a, -1 (ix)
	ld	-32 (ix), a
00150$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:111: for(i=0; i<14; i++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	C, 00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:195: return bestTarget;
	ld	a, -32 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:196: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:197: void BallThrowIn(u8 teamId){
;	---------------------------------
; Function BallThrowIn
; ---------------------------------
_BallThrowIn::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:200: V9_PrintLayerAStringAtPos(10,18,"THROW IN");
	ld	hl, #___str_2
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:201: g_MatchStatus=MATCH_BEFORE_THROW_IN;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:202: g_RestartKickTeamId = teamId;
	ld	a, -2 (ix)
	ld	(_g_RestartKickTeamId+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:203: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:206: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:207: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:208: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:211: for(i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:212: g_Players[i].TargetX = g_Players[i].X;
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
	ld	de, #_g_Players
	add	hl, de
	ex	(sp), hl
	ld	a, -8 (ix)
	add	a, #0x10
	ld	-6 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:213: g_Players[i].TargetY = g_Players[i].Y;
	ld	a, -8 (ix)
	add	a, #0x0e
	ld	e, a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	d, a
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, e
	ld	h, d
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:215: if (g_Players[i].TargetX < FIELD_BOUND_X_LEFT) g_Players[i].TargetX = FIELD_BOUND_X_LEFT;
	ld	a, -4 (ix)
	ld	b, -3 (ix)
	sub	a, #0x0a
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00102$
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(hl), #0x0a
	inc	hl
	ld	(hl), #0x00
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:216: if (g_Players[i].TargetX > FIELD_BOUND_X_RIGHT) g_Players[i].TargetX = FIELD_BOUND_X_RIGHT;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xf6
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00104$
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(hl), #0xf6
	inc	hl
	ld	(hl), #0x00
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:217: if (g_Players[i].TargetY < FIELD_BOUND_Y_TOP) g_Players[i].TargetY = FIELD_BOUND_Y_TOP;
	ld	l, e
	ld	h, d
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x32
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00106$
	ld	l, e
	ld	h, d
	ld	(hl), #0x32
	inc	hl
	ld	(hl), #0x00
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:218: if (g_Players[i].TargetY > FIELD_BOUND_Y_BOTTOM) g_Players[i].TargetY = FIELD_BOUND_Y_BOTTOM;
	ld	l, e
	ld	h, d
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xae
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	jr	NC, 00108$
	ld	a, #0xae
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:220: g_Players[i].Status = PLAYER_STATUS_NONE;
	pop	hl
	push	hl
	ld	de, #0x0012
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:211: for(i=0; i<14; i++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	C, 00110$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:222: }
	ld	sp, ix
	pop	ix
	ret
___str_2:
	.ascii "THROW IN"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:224: void CornerKick(u8 teamId){
;	---------------------------------
; Function CornerKick
; ---------------------------------
_CornerKick::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-25
	add	hl, sp
	ld	sp, hl
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:226: V9_PrintLayerAStringAtPos(10,12,"CORNER KICK");
	ld	hl, #___str_3
	push	hl
	ld	l, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:227: g_MatchStatus=MATCH_BEFORE_CORNER_KICK;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:228: g_RestartKickTeamId = teamId;
	ld	a, -2 (ix)
	ld	(_g_RestartKickTeamId+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:229: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:230: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:233: if (g_Ball.X < FIELD_POS_X_CENTER) g_CornerKickSide = CORNER_SIDE_LEFT;
	ld	bc, #_g_Ball+0
	ld	hl, (#(_g_Ball + 2) + 0)
	ld	de, #0x0078
	cp	a, a
	sbc	hl, de
	jr	NC, 00102$
	ld	hl, #_g_CornerKickSide
	ld	(hl), #0x00
	jp	00103$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:234: else g_CornerKickSide = CORNER_SIDE_RIGHT;
	ld	hl, #_g_CornerKickSide
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:239: u16 kickX = (g_CornerKickSide == CORNER_SIDE_LEFT) ? FIELD_BOUND_X_LEFT : FIELD_BOUND_X_RIGHT;
	jp	00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:234: else g_CornerKickSide = CORNER_SIDE_RIGHT;
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:239: u16 kickX = (g_CornerKickSide == CORNER_SIDE_LEFT) ? FIELD_BOUND_X_LEFT : FIELD_BOUND_X_RIGHT;
	ld	de, #0x000a
	jp	00156$
00155$:
	ld	de, #0x00f6
00156$:
	ld	-23 (ix), e
	ld	-22 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:240: u16 kickY = (teamId == TEAM_1) ? FIELD_BOUND_Y_TOP : FIELD_BOUND_Y_BOTTOM;
	ld	a, -2 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00323$
	xor	a, a
00323$:
	ld	-3 (ix), a
	or	a, a
	jr	Z, 00157$
	ld	de, #0x0032
	jp	00158$
00157$:
	ld	de, #0x01ae
00158$:
	ld	-21 (ix), e
	ld	-20 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:243: if (teamId == TEAM_1) ShowFieldZone(FIELD_NORTH_ZONE);
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00105$
	push	bc
	xor	a, a
	call	_ShowFieldZone
	pop	bc
	jp	00106$
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:244: else ShowFieldZone(FIELD_SOUTH_ZONE);
	push	bc
	ld	a, #0x02
	call	_ShowFieldZone
	pop	bc
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:248: if (g_CornerKickSide == CORNER_SIDE_LEFT) kickerId = GetPlayerIdByRole(teamId, PLAYER_ROLE_LEFT_STRIKER);
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00108$
	push	bc
	ld	l, #0x05
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	call	_GetPlayerIdByRole
	pop	bc
	ld	-19 (ix), a
	jp	00109$
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:249: else kickerId = GetPlayerIdByRole(teamId, PLAYER_ROLE_RIGHT_STRIKER);
	push	bc
	ld	l, #0x06
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	call	_GetPlayerIdByRole
	pop	bc
	ld	-19 (ix), a
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:252: g_Ball.PossessionPlayerId = NO_VALUE; 
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:253: SetPlayerBallPossession(NO_VALUE);
	push	bc
	ld	a, #0xff
	call	_SetPlayerBallPossession
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:254: if(teamId == TEAM_1) g_Team1ActivePlayer = kickerId; // Ensure kicker is selected active
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00111$
	ld	a, -19 (ix)
	ld	(_g_Team1ActivePlayer+0), a
	jp	00112$
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:255: else g_Team2ActivePlayer = kickerId;
	ld	a, -19 (ix)
	ld	(_g_Team2ActivePlayer+0), a
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:263: i8 offX = 0; i8 offY = 0;
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:264: if (teamId == TEAM_2 && g_CornerKickSide == CORNER_SIDE_RIGHT) {
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	NZ, 00114$
	ld	a, (_g_CornerKickSide+0)
	dec	a
	jr	NZ, 00114$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:265: offX = -30;
	ld	l, #0xe2
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:266: offY = -5;
	ld	-1 (ix), #0xfb
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:269: g_Ball.X = kickX + offX;
	ld	a, l
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, -23 (ix)
	ld	d, -22 (ix)
	add	hl, de
	ex	de, hl
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:270: g_Ball.Y = kickY + offY;
	ld	a, -1 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, -21 (ix)
	ld	d, -20 (ix)
	add	hl, de
	ex	de, hl
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:271: g_Ball.PreviousY = g_Ball.Y;
	ld	((_g_Ball + 7)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:275: bool attackingUp = (teamId == TEAM_1);
	ld	a, -3 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:279: u16 yBoxInside     = (attackingUp) ? (FIELD_BOUND_Y_TOP + 40) : (FIELD_BOUND_Y_BOTTOM - 40);
	ld	-18 (ix), a
	or	a, a
	jr	Z, 00161$
	ld	bc, #0x005a
	jp	00162$
00161$:
	ld	bc, #0x0186
00162$:
	ld	-17 (ix), c
	ld	-16 (ix), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:280: u16 yBoxOutside    = (attackingUp) ? (FIELD_BOUND_Y_TOP + 90) : (FIELD_BOUND_Y_BOTTOM - 90);
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00163$
	ld	bc, #0x008c
	jp	00164$
00163$:
	ld	bc, #0x0154
00164$:
	ld	-15 (ix), c
	ld	-14 (ix), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:281: u16 yMidfieldAdv   = (attackingUp) ? (FIELD_BOUND_Y_TOP + 160) : (FIELD_BOUND_Y_BOTTOM - 160);
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00165$
	ld	bc, #0x00d2
	jp	00166$
00165$:
	ld	bc, #0x010e
00166$:
	ld	-13 (ix), c
	ld	-12 (ix), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:283: u16 ySafety        = (attackingUp) ? (FIELD_BOUND_Y_BOTTOM - 100) : (FIELD_BOUND_Y_TOP + 100);
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00167$
	ld	bc, #0x014a
	jp	00168$
00167$:
	ld	bc, #0x0096
00168$:
	ld	-11 (ix), c
	ld	-10 (ix), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:285: for(u8 i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00152$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00153$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:286: g_Players[i].Status = PLAYER_STATUS_NONE;
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
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	a, -6 (ix)
	add	a, #<(_g_Players)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	adc	a, #>(_g_Players)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	add	a, #0x12
	ld	-6 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:287: g_Players[i].TargetX = g_Players[i].X;
	ld	a, -4 (ix)
	add	a, #0x10
	ld	-9 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:288: g_Players[i].TargetY = g_Players[i].Y;
	ld	a, -4 (ix)
	add	a, #0x0e
	ld	-7 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:290: u8 role = g_Players[i].Role;
	ld	a, -4 (ix)
	ld	-25 (ix), a
	ld	a, -3 (ix)
	ld	-24 (ix), a
	pop	hl
	push	hl
	ld	de, #0x000d
	add	hl, de
	ld	a, (hl)
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:291: bool isAttacker = (g_Players[i].TeamId == teamId);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a,-2 (ix)
	sub	a,(hl)
	ld	a, #0x01
	jr	Z, 00329$
	xor	a, a
00329$:
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:294: if (i == kickerId) {
	ld	a, -19 (ix)
	sub	a, -1 (ix)
	jr	NZ, 00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:295: g_Players[i].TargetX = kickX;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, -23 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -22 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:296: g_Players[i].TargetY = kickY;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -21 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -20 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:297: continue;
	jp	00149$
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:300: if (isAttacker) {
	ld	a, c
	or	a, a
	jp	Z, 00147$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:302: if (role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00133$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:304: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:305: g_Players[i].TargetY = (attackingUp) ? FIELD_BOUND_Y_BOTTOM - 20 : FIELD_BOUND_Y_TOP + 20;
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00169$
	ld	de, #0x019a
	jp	00170$
00169$:
	ld	de, #0x0046
00170$:
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00149$
00133$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:307: else if (role == PLAYER_ROLE_LEFT_DEFENDER || role == PLAYER_ROLE_RIGHT_DEFENDER) {
	ld	a, -5 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00333$
	xor	a, a
00333$:
	ld	c, a
	or	a, a
	jr	NZ, 00128$
	ld	a, -5 (ix)
	sub	a, #0x02
	jr	NZ, 00129$
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:308: if (role == PLAYER_ROLE_LEFT_DEFENDER) {
	ld	a, c
	or	a, a
	jr	Z, 00119$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:310: g_Players[i].TargetX = FIELD_POS_X_CENTER - 30;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:311: g_Players[i].TargetY = yMidfieldAdv;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
	jp	00149$
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:314: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:315: g_Players[i].TargetY = ySafety;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
	jp	00149$
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:318: else if (role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
	ld	a, -5 (ix)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00337$
	xor	a, a
00337$:
	ld	c, a
	or	a, a
	jr	NZ, 00124$
	ld	a, -5 (ix)
	sub	a, #0x04
	jr	NZ, 00125$
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:319: if (role == PLAYER_ROLE_LEFT_HALFFIELDER) {
	ld	a, c
	or	a, a
	jr	Z, 00122$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:321: g_Players[i].TargetX = FIELD_POS_X_CENTER - 50; 
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x46
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:322: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00149$
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:325: g_Players[i].TargetX = FIELD_POS_X_CENTER + 30;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x96
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:326: g_Players[i].TargetY = yMidfieldAdv;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
	jp	00149$
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:332: g_Players[i].TargetX = FIELD_POS_X_CENTER + 50;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0xaa
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:333: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00149$
00147$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:338: if (role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00144$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:340: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:341: g_Players[i].TargetY = (attackingUp) ? FIELD_POS_Y_TEAM2_GOALKEEPER : FIELD_POS_Y_TEAM1_GOALKEEPER;
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00171$
	ld	de, #0x0032
	jp	00172$
00171$:
	ld	de, #0x01a8
00172$:
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00149$
00144$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:343: else if (role == PLAYER_ROLE_LEFT_DEFENDER || role == PLAYER_ROLE_RIGHT_DEFENDER) {
	ld	a, -5 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00341$
	xor	a, a
00341$:
	ld	c, a
	or	a, a
	jr	NZ, 00139$
	ld	a, -5 (ix)
	sub	a, #0x02
	jr	NZ, 00140$
00139$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:345: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_DEFENDER) ? FIELD_POS_X_CENTER - 20 : FIELD_POS_X_CENTER + 20;
	ld	a, c
	or	a, a
	ld	c, #0x64
	jr	NZ, 00174$
	ld	c, #0x8c
00174$:
	ld	b, #0x00
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:346: g_Players[i].TargetY = yBoxInside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -17 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -16 (ix)
	ld	(hl), a
	jp	00149$
00140$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:348: else if (role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
	ld	a, -5 (ix)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00345$
	xor	a, a
00345$:
	ld	c, a
	or	a, a
	jr	NZ, 00135$
	ld	a, -5 (ix)
	sub	a, #0x04
	jr	NZ, 00136$
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:350: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_HALFFIELDER) ? FIELD_POS_X_CENTER - 40 : FIELD_POS_X_CENTER + 40;
	ld	a, c
	or	a, a
	ld	c, #0x50
	jr	NZ, 00176$
	ld	c, #0xa0
00176$:
	ld	b, #0x00
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:351: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00149$
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:355: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_STRIKER) ? FIELD_POS_X_LEFT + 20 : FIELD_POS_X_RIGHT - 20;
	ld	a, -9 (ix)
	ld	-4 (ix), a
	ld	a, -8 (ix)
	ld	-3 (ix), a
	ld	a, -5 (ix)
	sub	a, #0x05
	ld	c, #0x3c
	jr	Z, 00178$
	ld	c, #0xb2
00178$:
	ld	b, #0x00
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:356: g_Players[i].TargetY = yMidfield;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0xf3
	inc	hl
	ld	(hl), #0x00
00149$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:285: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00152$
00153$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:360: }
	ld	sp, ix
	pop	ix
	ret
___str_3:
	.ascii "CORNER KICK"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:361: void UpdatePassTarget() {
;	---------------------------------
; Function UpdatePassTarget
; ---------------------------------
_UpdatePassTarget::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:363: if (g_MatchStatus != MATCH_IN_ACTION && g_MatchStatus != MATCH_BALL_ON_GOALKEEPER) {
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jr	Z, 00102$
	sub	a, #0x0d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:364: return; 
	ret	NZ
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:368: u8 carrier = g_Ball.PossessionPlayerId;
	ld	a, (#_g_Ball + 6)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:370: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	inc	a
	jr	NZ, 00105$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:371: g_PassTargetPlayer = NO_VALUE;
	ld	hl, #_g_PassTargetPlayer
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:372: return;
	ret
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:376: passUpdateTimer++;
	ld	hl, #_UpdatePassTarget_passUpdateTimer_65537_1206
	inc	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:377: if (passUpdateTimer < 8) return;
	ld	a, (_UpdatePassTarget_passUpdateTimer_65537_1206+0)
	sub	a, #0x08
	ret	C
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:378: passUpdateTimer = 0;
	ld	hl, #_UpdatePassTarget_passUpdateTimer_65537_1206
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:380: if (carrier != NO_VALUE) {
	ld	a, c
	inc	a
	jr	Z, 00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:381: g_PassTargetPlayer = GetBestPassTarget(carrier);
	ld	a, c
	call	_GetBestPassTarget
	ld	(_g_PassTargetPlayer+0), a
	ret
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:383: if (g_Ball.PassTargetPlayerId == NO_VALUE) g_PassTargetPlayer = NO_VALUE;
	ld	a, (#_g_Ball + 16)
	inc	a
	ret	NZ
	ld	hl, #_g_PassTargetPlayer
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:385: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:386: void TickGoalKick() {
;	---------------------------------
; Function TickGoalKick
; ---------------------------------
_TickGoalKick::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:387: if (g_MatchStatus != MATCH_BEFORE_GOAL_KICK) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x05
	jp	NZ,00197$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:391: if (g_RestartKickTeamId == TEAM_1) gkId = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_GOALKEEPER);
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00104$
	ld	l,a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_GetPlayerIdByRole
	ld	-10 (ix), a
	jp	00105$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:392: else gkId = GetPlayerIdByRole(TEAM_2, PLAYER_ROLE_GOALKEEPER);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_GetPlayerIdByRole
	ld	-10 (ix), a
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:394: if (gkId == NO_VALUE) return; 
	ld	a, -10 (ix)
	inc	a
	jp	Z,00197$
	jp	00107$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:397: if (g_Timer < 60) {
	ld	a, (_g_Timer+0)
	sub	a, #0x3c
	jr	NC, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:398: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:399: return;
	jp	00197$
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:401: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:403: if (g_Timer == 60) {
	ld	a, (_g_Timer+0)
	sub	a, #0x3c
	jp	NZ,00175$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:406: if (g_GoalKickSide == CORNER_SIDE_LEFT) targetX = GK_BOX_X_MIN;
	ld	a, (_g_GoalKickSide+0)
	or	a, a
	jr	NZ, 00111$
	ld	bc, #0x0050
	jp	00112$
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:407: else targetX = GK_BOX_X_MAX;
	ld	bc, #0x00a0
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:410: if (g_RestartKickTeamId == TEAM_1) { // Bottom Goal
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00114$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:411: ballY = GK_BOX_Y_BOTTOM_MIN; 
	ld	de, #0x0195
	jp	00115$
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:413: ballY = GK_BOX_Y_TOP_MAX; 
	ld	de, #0x004b
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:417: g_Ball.X = targetX;
	ld	((_g_Ball + 2)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:418: g_Ball.Y = ballY;
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:419: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:424: runStartY = ballY + 32; 
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:423: if (g_RestartKickTeamId == TEAM_1) {
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:424: runStartY = ballY + 32; 
	ld	hl, #0x0020
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:425: if(runStartY > FIELD_BOUND_Y_BOTTOM) runStartY = FIELD_BOUND_Y_BOTTOM;
	ld	-2 (ix), l
	ld	-1 (ix), h
	ex	de,hl
	ld	a, #0xae
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00122$
	ld	-2 (ix), #0xae
	ld	-1 (ix), #0x01
	jp	00122$
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:427: runStartY = ballY - 32;
	ld	a, e
	add	a, #0xe0
	ld	e, a
	ld	a, d
	adc	a, #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:428: if(runStartY < FIELD_BOUND_Y_TOP) runStartY = FIELD_BOUND_Y_TOP;
	ld	-2 (ix), e
	ld	-1 (ix), a
	ld	d, a
	ld	a, e
	sub	a, #0x32
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00122$
	ld	-2 (ix), #0x32
	ld	-1 (ix), #0
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:431: g_Players[gkId].TargetX = targetX;
	ld	e, -10 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de, hl
	ld	hl, #_g_Players
	add	hl, de
	ex	de, hl
	ld	hl, #0x0010
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:432: g_Players[gkId].TargetY = runStartY;
	ld	hl, #0x000e
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:433: g_Players[gkId].Status = PLAYER_STATUS_NONE; 
	ld	hl, #0x0012
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:435: if (g_RestartKickTeamId == TEAM_1) g_Players[gkId].Direction = DIRECTION_UP;
	ld	hl, #0x000a
	add	hl, de
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00124$
	ld	(hl), #0x01
	jp	00125$
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:436: else g_Players[gkId].Direction = DIRECTION_DOWN;
	ld	(hl), #0x05
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:438: if (g_RestartKickTeamId == TEAM_1) ShowFieldZone(FIELD_SOUTH_ZONE);
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00127$
	ld	a, #0x02
	call	_ShowFieldZone
	jp	00239$
00127$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:439: else ShowFieldZone(FIELD_NORTH_ZONE);
	xor	a, a
	call	_ShowFieldZone
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:442: for(u8 i=0; i<14; i++){
00239$:
	ld	-1 (ix), #0x00
00196$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00175$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:443: if(i == gkId) continue;
	ld	a, -10 (ix)
	sub	a, -1 (ix)
	jp	Z,00172$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:444: if(g_Players[i].TeamId == REFEREE) continue;
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
	ld	de, #_g_Players
	add	hl, de
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	iy, #0x0009
	ld	e, -9 (ix)
	ld	d, -8 (ix)
	add	iy, de
	ld	a, 0 (iy)
	sub	a, #0x0e
	jp	Z,00172$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:445: if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	a, -9 (ix)
	add	a, #0x0d
	ld	e, a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	or	a, a
	jp	Z, 00172$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:448: g_Players[i].Status = PLAYER_STATUS_NONE;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	bc, #0x0012
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:451: u16 targetX = g_Players[i].X;
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:444: if(g_Players[i].TeamId == REFEREE) continue;
	ld	c, 0 (iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:445: if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	a, (de)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:458: if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 200;
	ld	-5 (ix), a
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00432$
	xor	a, a
00432$:
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:459: if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 350; // Defenders move out of box
	ld	a, -5 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00434$
	xor	a, a
00434$:
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:453: if (g_RestartKickTeamId == TEAM_1) {
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00166$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:455: if(g_Players[i].TeamId == TEAM_1) {
	dec	c
	jr	NZ, 00148$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:457: targetY = 300; // Midfielders
	ld	-3 (ix), #0x2c
	ld	-2 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:458: if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 200;
	ld	a, e
	or	a, a
	jr	NZ, 00135$
	ld	a, -5 (ix)
	sub	a, #0x06
	jr	NZ, 00136$
00135$:
	ld	-3 (ix), #0xc8
	ld	-2 (ix), #0
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:459: if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 350; // Defenders move out of box
	ld	a, -4 (ix)
	or	a, a
	jr	NZ, 00138$
	ld	a, -5 (ix)
	sub	a, #0x02
	jp	NZ,00167$
00138$:
	ld	-3 (ix), #0x5e
	ld	-2 (ix), #0x01
	jp	00167$
00148$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:461: targetY = 250;
	ld	-3 (ix), #0xfa
	ld	-2 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:462: if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 320; // Pressing High (but not too close)
	ld	a, e
	or	a, a
	jr	NZ, 00141$
	ld	a, -5 (ix)
	sub	a, #0x06
	jr	NZ, 00142$
00141$:
	ld	-3 (ix), #0x40
	ld	-2 (ix), #0x01
00142$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:463: if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 150;
	ld	a, -4 (ix)
	or	a, a
	jr	NZ, 00144$
	ld	a, -5 (ix)
	sub	a, #0x02
	jr	NZ, 00167$
00144$:
	ld	-3 (ix), #0x96
	ld	-2 (ix), #0
	jp	00167$
00166$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:467: if(g_Players[i].TeamId == TEAM_2) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00163$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:469: targetY = 150; 
	ld	-3 (ix), #0x96
	ld	-2 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:470: if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 250;
	ld	a, e
	or	a, a
	jr	NZ, 00150$
	ld	a, -5 (ix)
	sub	a, #0x06
	jr	NZ, 00151$
00150$:
	ld	-3 (ix), #0xfa
	ld	-2 (ix), #0
00151$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:471: if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 120; // Defenders move out of box
	ld	a, -4 (ix)
	or	a, a
	jr	NZ, 00153$
	ld	a, -5 (ix)
	sub	a, #0x02
	jr	NZ, 00167$
00153$:
	ld	-3 (ix), #0x78
	ld	-2 (ix), #0
	jp	00167$
00163$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:473: targetY = 200;
	ld	-3 (ix), #0xc8
	ld	-2 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:474: if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 160; // Pressing High (but not too close)
	ld	a, e
	or	a, a
	jr	NZ, 00156$
	ld	a, -5 (ix)
	sub	a, #0x06
	jr	NZ, 00157$
00156$:
	ld	-3 (ix), #0xa0
	ld	-2 (ix), #0
00157$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:475: if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 300;
	ld	a, -4 (ix)
	or	a, a
	jr	NZ, 00159$
	ld	a, -5 (ix)
	sub	a, #0x02
	jr	NZ, 00167$
00159$:
	ld	-3 (ix), #0x2c
	ld	-2 (ix), #0x01
00167$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:480: if (targetX < 30) targetX = 30;
	ld	a, -7 (ix)
	ld	b, -6 (ix)
	sub	a, #0x1e
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00169$
	ld	-7 (ix), #0x1e
	ld	-6 (ix), #0
00169$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:481: if (targetX > 220) targetX = 220;
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	ld	a, #0xdc
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00171$
	ld	-7 (ix), #0xdc
	ld	-6 (ix), #0
00171$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:483: g_Players[i].TargetX = targetX;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	de, #0x0010
	add	hl, de
	ld	a, -7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -6 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:484: g_Players[i].TargetY = targetY;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
00172$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:442: for(u8 i=0; i<14; i++){
	inc	-1 (ix)
	jp	00196$
00175$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:489: i16 dx = (i16)g_Players[gkId].X - (i16)g_Players[gkId].TargetX;
	ld	bc, #_g_Players+0
	ld	e, -10 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ex	(sp), hl
	ld	a, -16 (ix)
	add	a, #0x02
	ld	-14 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-13 (ix), a
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
	ld	a, -16 (ix)
	ld	-2 (ix), a
	ld	a, -15 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0010
	add	hl, de
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
	ld	a, -12 (ix)
	ld	-4 (ix), a
	ld	a, -11 (ix)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	sub	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	sbc	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -1 (ix)
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:490: i16 dy = (i16)g_Players[gkId].Y - (i16)g_Players[gkId].TargetY;
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
	ld	a, -16 (ix)
	add	a, #0x0e
	ld	-6 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -8 (ix)
	sub	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	sbc	a, -3 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:492: bool arrived = (dx >= -4 && dx <= 4 && dy >= -4 && dy <= 4);
	ld	a, -10 (ix)
	sub	a, #0xfc
	ld	a, -9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00199$
	ld	c, -10 (ix)
	ld	b, -9 (ix)
	ld	a, #0x04
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00457$
	xor	a, #0x80
00457$:
	jp	M, 00199$
	ld	a, -2 (ix)
	sub	a, #0xfc
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00199$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	a, #0x04
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00458$
	xor	a, #0x80
00458$:
	jp	P, 00200$
00199$:
	ld	-1 (ix), #0x00
	jp	00201$
00200$:
	ld	-1 (ix), #0x01
00201$:
	ld	a, -1 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:494: if (arrived) {
	or	a, a
	jp	Z, 00193$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:495: g_Players[gkId].X = g_Players[gkId].TargetX;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, -12 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -11 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:496: g_Players[gkId].Y = g_Players[gkId].TargetY;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	pop	hl
	push	hl
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:498: if (g_RestartKickTeamId == TEAM_1) g_Players[gkId].Direction = DIRECTION_UP;
	ld	a, -16 (ix)
	add	a, #0x0a
	ld	-8 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00177$
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	(hl), #0x01
	jp	00178$
00177$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:499: else g_Players[gkId].Direction = DIRECTION_DOWN;
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	(hl), #0x05
00178$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:500: g_Players[gkId].PatternId = GetNoMovingPlayerPatternId(g_Players[gkId].Direction);
	ld	a, -16 (ix)
	add	a, #0x08
	ld	-3 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	call	_GetNoMovingPlayerPatternId
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:501: g_Players[gkId].Status = PLAYER_STATUS_POSITIONED;
	ld	a, -16 (ix)
	add	a, #0x12
	ld	-2 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:490: i16 dy = (i16)g_Players[gkId].Y - (i16)g_Players[gkId].TargetY;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:504: u16 distY = (g_Players[gkId].Y > g_Ball.Y) ? (g_Players[gkId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[gkId].Y);
	ld	hl, (#_g_Ball + 0)
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jr	NC, 00208$
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	jp	00209$
00208$:
	ld	a, l
	sub	a, c
	ld	c, a
	ld	a, h
	sbc	a, b
00209$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:506: if (distY > 16) {
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:398: g_Timer++;
	ld	a, (_g_Timer+0)
	inc	a
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:506: if (distY > 16) {
	ld	a, #0x10
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00187$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:508: g_Timer++;
	ld	a, -3 (ix)
	ld	(_g_Timer+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:509: if (g_Timer > 100) {
	ld	a, #0x64
	ld	hl, #_g_Timer
	sub	a, (hl)
	jr	NC, 00197$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:504: u16 distY = (g_Players[gkId].Y > g_Ball.Y) ? (g_Players[gkId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[gkId].Y);
	ld	hl, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:512: if (g_RestartKickTeamId == TEAM_1) kickY = g_Ball.Y + 6; 
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00180$
	ld	bc, #0x0006
	add	hl, bc
	ld	c, l
	ld	b, h
	jp	00181$
00180$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:513: else kickY = g_Ball.Y - 6;
	ld	bc, #0xfffa
	add	hl,bc
	ld	c, l
	ld	b, h
00181$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:515: g_Players[gkId].TargetY = kickY;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:516: g_Players[gkId].Status = PLAYER_STATUS_NONE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00197$
00187$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:520: g_Timer++;
	ld	a, -3 (ix)
	ld	(_g_Timer+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:521: if (g_Timer > 110) {
	ld	a, #0x6e
	ld	hl, #_g_Timer
	sub	a, (hl)
	jr	NC, 00197$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:522: ClearTextFromLayerA(10, 18, 9); 
	ld	a, #0x09
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:523: GoalkeeperWithBall(g_RestartKickTeamId, true); 
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GoalkeeperWithBall
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:524: g_GkRecoilY = 0;
	ld	hl, #_g_GkRecoilY
	ld	(hl), #0x00
	jp	00197$
00193$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:529: if (g_Timer < 100) g_Timer = 61; // Hold at 61 while moving to start
	ld	a, (_g_Timer+0)
	sub	a, #0x64
	jr	NC, 00190$
	ld	hl, #_g_Timer
	ld	(hl), #0x3d
	jp	00197$
00190$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:530: else g_Timer = 101; // Hold at 101 while moving to ball
	ld	hl, #_g_Timer
	ld	(hl), #0x65
00197$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:532: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:534: void SpriteBlinking(){
;	---------------------------------
; Function SpriteBlinking
; ---------------------------------
_SpriteBlinking::
	dec	sp
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:535: u8 ms=g_MatchStatus;
	ld	a, (_g_MatchStatus+0)
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	res	6, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	6, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:574: inline void V9_SetInterrupt(u8 flags) { V9_SetRegister(9, flags); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:539: g_MatchStatus=MATCH_PRESENTATION;
	ld	a, #0x0f
	ld	(#_g_MatchStatus), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:541: g_Timer=0;  
	xor	a, a
	ld	(#_g_Timer), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:542: while (g_Timer<=20)
00101$:
	ld	a, #0x14
	ld	iy, #_g_Timer
	sub	a, 0 (iy)
	jr	C, 00134$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:544: ResetPlayersInfo();
	call	_ResetPlayersInfo
	jp	00101$
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:730: inline void V9_SetSpriteEnable(bool enable) { V9_SetFlag(8, V9_R08_SPD_OFF, enable ? 0 : V9_R08_SPD_OFF); }
00134$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	6, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:550: g_Timer=0;  
	xor	a, a
	ld	(#_g_Timer), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:551: while (g_Timer<=20)
00104$:
	ld	a, #0x14
	ld	iy, #_g_Timer
	sub	a, 0 (iy)
	jr	C, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:553: ResetPlayersInfo();
	call	_ResetPlayersInfo
	jp	00104$
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:730: inline void V9_SetSpriteEnable(bool enable) { V9_SetFlag(8, V9_R08_SPD_OFF, enable ? 0 : V9_R08_SPD_OFF); }
00135$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	res	6, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	6, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:558: g_Timer=0;  
	xor	a, a
	ld	(#_g_Timer), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:559: while (g_Timer<=20)
00107$:
	ld	a, #0x14
	ld	iy, #_g_Timer
	sub	a, 0 (iy)
	jr	C, 00138$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:561: ResetPlayersInfo();
	call	_ResetPlayersInfo
	jp	00107$
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:730: inline void V9_SetSpriteEnable(bool enable) { V9_SetFlag(8, V9_R08_SPD_OFF, enable ? 0 : V9_R08_SPD_OFF); }
00138$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	6, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:565: g_Timer=0;  
	xor	a, a
	ld	(#_g_Timer), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:566: while (g_Timer<=20)
00110$:
	ld	a, #0x14
	ld	iy, #_g_Timer
	sub	a, 0 (iy)
	jr	C, 00139$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:568: ResetPlayersInfo();
	call	_ResetPlayersInfo
	jp	00110$
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:730: inline void V9_SetSpriteEnable(bool enable) { V9_SetFlag(8, V9_R08_SPD_OFF, enable ? 0 : V9_R08_SPD_OFF); }
00139$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	res	6, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	6, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:573: g_Timer=0;  
	xor	a, a
	ld	(#_g_Timer), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:574: while (g_Timer<=20)
00113$:
	ld	a, #0x14
	ld	iy, #_g_Timer
	sub	a, 0 (iy)
	jr	C, 00142$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:576: ResetPlayersInfo();
	call	_ResetPlayersInfo
	jp	00113$
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:730: inline void V9_SetSpriteEnable(bool enable) { V9_SetFlag(8, V9_R08_SPD_OFF, enable ? 0 : V9_R08_SPD_OFF); }
00142$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	6, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:579: g_MatchStatus=ms;
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	ld	(_g_MatchStatus+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:581: }
	inc	sp
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:582: void SetTeamsPresentationSpritesPosition(){
;	---------------------------------
; Function SetTeamsPresentationSpritesPosition
; ---------------------------------
_SetTeamsPresentationSpritesPosition::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:583: g_MatchStatus=MATCH_NOT_STARTED;
	ld	hl, #_g_MatchStatus
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:584: for(u8 i=0;i<7;i++){
	ld	(hl), #0x00
	ld	c, (hl)
00105$:
	ld	a, c
	sub	a, #0x07
	jr	NC, 00101$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:585: g_Players[i].Y=230;
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
	ex	(sp), hl
	pop	hl
	push	hl
	ld	(hl), #0xe6
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:586: g_Players[i].X=72+i*20;
	ld	a, -4 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	e, c
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #0x0048
	add	hl, de
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:587: g_Players[i].PatternId=PLAYER_POSE_FRONT;
	pop	hl
	push	hl
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0x10
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:588: g_Players[i].TeamId=TEAM_2;
	pop	hl
	push	hl
	ld	de, #0x0009
	add	hl, de
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:584: for(u8 i=0;i<7;i++){
	inc	c
	jp	00105$
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:591: for(u8 i=7;i<14;i++){
	ld	c, #0x07
00108$:
	ld	a, c
	sub	a, #0x0e
	jr	NC, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:592: g_Players[i].Y=250;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_g_Players
	add	hl, de
	ld	e, l
	ld	d, h
	ld	(hl), #0xfa
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:593: g_Players[i].X=72+(i-7)*20;
	ld	hl, #0x0002
	add	hl, de
	ex	(sp), hl
	ld	a, c
	ld	b, #0x00
	add	a, #0xf9
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	de
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	ld	a, l
	add	a, #0x48
	ld	b, a
	ld	a, h
	adc	a, #0x00
	ld	-2 (ix), b
	ld	-1 (ix), a
	pop	hl
	push	hl
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:594: g_Players[i].PatternId=PLAYER_POSE_BACK;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x11
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:595: g_Players[i].TeamId=TEAM_1;
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:591: for(u8 i=7;i<14;i++){
	inc	c
	jp	00108$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:597: g_Players[REFEREE].Y=FIELD_POS_Y_CENTER;
	ld	hl, #0x00f3
	ld	((_g_Players + 294)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:598: g_Players[REFEREE].X=30;
	ld	l, #0x1e
	ld	((_g_Players + 296)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:599: g_Players[REFEREE].PatternId=PLAYER_POSE_RIGHT;
	ld	hl, #(_g_Players + 302)
	ld	(hl), #0x9d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:600: g_Players[REFEREE].TeamId=REFEREE;
	ld	hl, #(_g_Players + 303)
	ld	(hl), #0x0e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:601: g_Players[REFEREE].LastPose=0;
	ld	hl, #(_g_Players + 306)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:602: g_Players[REFEREE].Direction=DIRECTION_RIGHT;
	ld	hl, #(_g_Players + 304)
	ld	(hl), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:603: g_Players[REFEREE].Role=NO_VALUE;
	ld	hl, #(_g_Players + 307)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:604: g_Players[REFEREE].Status=PLAYER_STATUS_NONE;
	ld	hl, #0x0000
	ld	((_g_Players + 312)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:605: ResetPlayersInfo();
	call	_ResetPlayersInfo
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:606: SetPlayerTarget(REFEREE); 
	ld	a, #0x0e
	call	_SetPlayerTarget
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:614: for(u8 i=0;i<14;i++){
	ld	c, #0x00
00111$:
	ld	a, c
	sub	a, #0x0e
	jr	NC, 00103$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:615: g_Players[i].AiTickCounter=0;
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
	ld	hl, #0x0014
	add	hl, de
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:616: g_Players[i].Role = k_PlayerRoles[i % 7];
	ld	hl, #0x000d
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0007
	call	__modsint
	pop	bc
	ld	hl, #_SetTeamsPresentationSpritesPosition_k_PlayerRoles_65537_1287
	add	hl, de
	ld	a, (hl)
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:614: for(u8 i=0;i<14;i++){
	inc	c
	jp	00111$
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:618: g_Ball.X=FIELD_POS_X_CENTER;
	ld	hl, #0x0078
	ld	((_g_Ball + 2)), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:619: g_Ball.Y=FIELD_POS_Y_CENTER;
	ld	l, #0xf3
	ld	(_g_Ball), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:620: g_Ball.PreviousY=g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:621: ResetBallInfo(true);
	ld	a, #0x01
	call	_ResetBallInfo
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:623: }
	ld	sp, ix
	pop	ix
	ret
_SetTeamsPresentationSpritesPosition_k_PlayerRoles_65537_1287:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x06	; 6
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:625: void TickCornerKick() {
;	---------------------------------
; Function TickCornerKick
; ---------------------------------
_TickCornerKick::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-23
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:626: if (g_MatchStatus != MATCH_BEFORE_CORNER_KICK) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x02
	jp	NZ,00270$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:629: if (g_Timer == 0) s_ForceKickTimer = 0;
	ld	a, (_g_Timer+0)
	or	a, a
	jr	NZ, 00104$
	ld	hl, #0x0000
	ld	(_TickCornerKick_s_ForceKickTimer_65537_1291), hl
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:635: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#(_g_Ball + 6) + 0)
	cp	a, #0xff
	jr	Z, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:636: kickerId = g_Ball.PossessionPlayerId;
	ld	-23 (ix), a
	jp	00110$
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:638: if (g_CornerKickSide == CORNER_SIDE_LEFT) kickerId = GetPlayerIdByRole(g_RestartKickTeamId, PLAYER_ROLE_LEFT_STRIKER);
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00106$
	ld	l, #0x05
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetPlayerIdByRole
	ld	-23 (ix), a
	jp	00110$
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:639: else kickerId = GetPlayerIdByRole(g_RestartKickTeamId, PLAYER_ROLE_RIGHT_STRIKER);
	ld	l, #0x06
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetPlayerIdByRole
	ld	-23 (ix), a
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:643: if (kickerId == NO_VALUE) {
	ld	a, -23 (ix)
	inc	a
	jr	NZ, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:644: kickerId = GetClosestPlayerToBall(g_RestartKickTeamId, NO_VALUE);
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	-23 (ix), a
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:652: bool kickerArrived = false;
	ld	-22 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:653: if (kickerId != NO_VALUE) {
	ld	a, -23 (ix)
	inc	a
	ld	a, #0x01
	jr	Z, 00800$
	xor	a, a
00800$:
	ld	-21 (ix), a
	bit	0, -21 (ix)
	jp	NZ, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:654: i16 dx = (i16)g_Players[kickerId].X - (i16)g_Players[kickerId].TargetX;
	ld	c, -23 (ix)
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
	ld	a, #<(_g_Players)
	add	a, -2 (ix)
	ld	-16 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -1 (ix)
	ld	-15 (ix), a
	ld	a, -16 (ix)
	add	a, #0x02
	ld	-14 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-13 (ix), a
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
	ld	a, -16 (ix)
	ld	-2 (ix), a
	ld	a, -15 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0010
	add	hl, de
	ld	a, (hl)
	ld	-12 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
	ld	a, -12 (ix)
	ld	-4 (ix), a
	ld	a, -11 (ix)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	sub	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	sbc	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-10 (ix), a
	ld	a, -1 (ix)
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:655: i16 dy = (i16)g_Players[kickerId].Y - (i16)g_Players[kickerId].TargetY;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
	ld	a, -16 (ix)
	add	a, #0x0e
	ld	-6 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -8 (ix)
	sub	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	sbc	a, -3 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:657: if (dx >= -2 && dx <= 2 && dy >= -2 && dy <= 2) {
	ld	a, -10 (ix)
	sub	a, #0xfe
	ld	a, -9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jp	C, 00121$
	ld	c, -10 (ix)
	ld	b, -9 (ix)
	ld	a, #0x02
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00801$
	xor	a, #0x80
00801$:
	jp	M, 00121$
	ld	a, -2 (ix)
	sub	a, #0xfe
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00121$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	a, #0x02
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00802$
	xor	a, #0x80
00802$:
	jp	M, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:658: kickerArrived = true;
	ld	-22 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:659: g_Players[kickerId].X = g_Players[kickerId].TargetX;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, -12 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -11 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:660: g_Players[kickerId].Y = g_Players[kickerId].TargetY;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:661: g_Players[kickerId].Status = PLAYER_STATUS_POSITIONED;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:663: if (g_Ball.PossessionPlayerId != kickerId) {
	ld	hl, #(_g_Ball + 6)
	ld	a,-23 (ix)
	sub	a,(hl)
	jr	Z, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:664: SetPlayerBallPossession(kickerId);
	ld	a, -23 (ix)
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:665: g_Ball.PossessionPlayerId = kickerId;
	ld	hl, #(_g_Ball + 6)
	ld	a, -23 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:666: PutBallOnPlayerFeet(kickerId);
	ld	a, -23 (ix)
	call	_PutBallOnPlayerFeet
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:672: bool teammatesArrived = true;
	ld	-20 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:673: for(u8 i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00263$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00134$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:674: if (g_Players[i].TeamId == g_RestartKickTeamId && i != kickerId && g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) {
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
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	a, -3 (ix)
	add	a, #<(_g_Players)
	ld	-19 (ix), a
	ld	a, -2 (ix)
	adc	a, #>(_g_Players)
	ld	-18 (ix), a
	ld	a, -19 (ix)
	ld	-3 (ix), a
	ld	a, -18 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	c, (hl)
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, c
	jp	NZ,00264$
	ld	a, -1 (ix)
	sub	a, -23 (ix)
	jp	Z,00264$
	ld	a, -19 (ix)
	ld	-3 (ix), a
	ld	a, -18 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x000d
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	or	a, a
	jp	Z, 00264$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:676: if (g_Players[i].Status != PLAYER_STATUS_POSITIONED) {
	ld	a, -19 (ix)
	add	a, #0x12
	ld	-17 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-16 (ix), a
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	sub	a, #0x04
	or	a, -2 (ix)
	jp	Z,00264$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:677: i16 dx = (i16)g_Players[i].X - (i16)g_Players[i].TargetX;
	ld	a, -19 (ix)
	add	a, #0x02
	ld	-15 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-14 (ix), a
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -19 (ix)
	ld	-3 (ix), a
	ld	a, -18 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0010
	add	hl, de
	ld	a, (hl)
	ld	-13 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-12 (ix), a
	ld	l, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -5 (ix)
	sub	a, l
	ld	-3 (ix), a
	ld	a, -4 (ix)
	sbc	a, h
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-11 (ix), a
	ld	a, -2 (ix)
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:678: i16 dy = (i16)g_Players[i].Y - (i16)g_Players[i].TargetY;
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-9 (ix), a
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -19 (ix)
	add	a, #0x0e
	ld	-7 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -9 (ix)
	sub	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -8 (ix)
	sbc	a, -4 (ix)
	ld	-2 (ix), a
	ld	c, -3 (ix)
	ld	b, -2 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:679: if (dx < -6 || dx > 6 || dy < -6 || dy > 6) {
	ld	a, -11 (ix)
	sub	a, #0xfa
	ld	a, -10 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00122$
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	ld	a, #0x06
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00808$
	xor	a, #0x80
00808$:
	jp	M, 00122$
	ld	a, c
	sub	a, #0xfa
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00122$
	ld	a, #0x06
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00809$
	xor	a, #0x80
00809$:
	jp	P, 00123$
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:680: teammatesArrived = false; // Someone is still far away
	ld	-20 (ix), #0x00
	jp	00264$
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:683: g_Players[i].X = g_Players[i].TargetX;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:684: g_Players[i].Y = g_Players[i].TargetY;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:685: g_Players[i].Status = PLAYER_STATUS_POSITIONED;
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00264$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:673: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00263$
00134$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:692: if (g_Timer < 180 || (kickerId != NO_VALUE && !kickerArrived) || !teammatesArrived) {
	ld	a, (_g_Timer+0)
	sub	a, #0xb4
	ld	a, #0x00
	rla
	ld	c, a
	or	a, a
	jr	NZ, 00165$
	bit	0, -21 (ix)
	jr	NZ, 00169$
	ld	a, -22 (ix)
	or	a, a
	jr	Z, 00165$
00169$:
	ld	a, -20 (ix)
	or	a, a
	jp	NZ, 00166$
00165$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:693: if (g_Timer < 180) g_Timer++;
	ld	a, c
	or	a, a
	jr	Z, 00346$
	ld	hl, #_g_Timer
	inc	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:696: for(u8 i=0; i<14; i++) {
00346$:
	ld	c, #0x00
00266$:
	ld	a, c
	sub	a, #0x0e
	jp	NC,00270$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:698: if (i != kickerId && g_Players[i].Status != PLAYER_STATUS_POSITIONED && 
	ld	a, -23 (ix)
	sub	a, c
	ld	a, #0x01
	jr	Z, 00811$
	xor	a, a
00811$:
	ld	-3 (ix), a
	bit	0, -3 (ix)
	jr	NZ, 00138$
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
	ld	iy, #_g_Players
	add	iy, de
	push	iy
	pop	de
	ld	hl, #18
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, #0x04
	or	a, d
	jr	Z, 00138$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:699: !(g_Players[i].X == g_Players[i].TargetX && g_Players[i].Y == g_Players[i].TargetY)) continue;
	push	iy
	pop	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	iy
	pop	hl
	push	bc
	ld	bc, #0x0010
	add	hl, bc
	pop	bc
	ld	b, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, b
	cp	a, a
	sbc	hl, de
	jp	NZ,00163$
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	push	iy
	pop	hl
	push	bc
	ld	bc, #0x000e
	add	hl, bc
	pop	bc
	ld	b, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, b
	cp	a, a
	sbc	hl, de
	jp	NZ,00163$
00138$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:703: if (i == kickerId) {
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00159$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:705: if (g_RestartKickTeamId == TEAM_1) lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_DOWN_RIGHT : DIRECTION_DOWN_LEFT;
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00143$
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00272$
	ld	de, #0x0004
	jp	00273$
00272$:
	ld	de, #0x0006
00273$:
	ld	-1 (ix), e
	jp	00160$
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:706: else lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_UP_RIGHT : DIRECTION_UP_LEFT;
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00274$
	ld	de, #0x0002
	jp	00275$
00274$:
	ld	de, #0x0008
00275$:
	ld	-1 (ix), e
	jp	00160$
00159$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:708: else if (g_Players[i].TeamId == g_RestartKickTeamId) {
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_g_Players
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	de, #9
	add	hl, de
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:710: if (g_RestartKickTeamId == TEAM_1 && i != kickerId) { 
	ld	a,(_g_RestartKickTeamId+0)
	cp	a,b
	jr	NZ, 00156$
	dec	a
	ld	a, #0x01
	jr	Z, 00822$
	xor	a, a
00822$:
	ld	-1 (ix), a
	or	a, a
	jr	Z, 00146$
	bit	0, -3 (ix)
	jr	NZ, 00146$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:712: lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_UP_LEFT : DIRECTION_UP_RIGHT;
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00276$
	ld	de, #0x0008
	jp	00277$
00276$:
	ld	de, #0x0002
00277$:
	ld	-1 (ix), e
	jp	00160$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:715: lookDir = (g_RestartKickTeamId == TEAM_1) ? DIRECTION_UP : DIRECTION_DOWN;
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00278$
	ld	de, #0x0001
	jp	00279$
00278$:
	ld	de, #0x0005
00279$:
	ld	-1 (ix), e
	jp	00160$
00156$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:719: i16 dx = (i16)g_Ball.X - (i16)g_Players[i].X;
	ld	de, (#_g_Ball + 2)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
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
	ld	b, a
	ld	a, d
	sbc	a, h
	ld	-4 (ix), b
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:720: i16 dy = (i16)g_Ball.Y - (i16)g_Players[i].Y;
	ld	de, (#_g_Ball + 0)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:722: if (dy < -20) lookDir = (dx > 20) ? DIRECTION_UP_RIGHT : ((dx < -20) ? DIRECTION_UP_LEFT : DIRECTION_UP);
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, e
	sub	a, #0xec
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00153$
	ld	a, #0x14
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00823$
	xor	a, #0x80
00823$:
	jp	P, 00280$
	ld	de, #0x0002
	jp	00281$
00280$:
	ld	a, -4 (ix)
	sub	a, #0xec
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00282$
	ld	de, #0x0008
	jp	00283$
00282$:
	ld	de, #0x0001
00283$:
00281$:
	ld	-1 (ix), e
	jp	00160$
00153$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:723: else if (dy > 20) lookDir = (dx > 20) ? DIRECTION_DOWN_RIGHT : ((dx < -20) ? DIRECTION_DOWN_LEFT : DIRECTION_DOWN);
	ld	a, #0x14
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00824$
	xor	a, #0x80
00824$:
	jp	P, 00150$
	ld	a, #0x14
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00825$
	xor	a, #0x80
00825$:
	jp	P, 00284$
	ld	de, #0x0004
	jp	00285$
00284$:
	ld	a, -4 (ix)
	sub	a, #0xec
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00286$
	ld	de, #0x0006
	jp	00287$
00286$:
	ld	de, #0x0005
00287$:
00285$:
	ld	-1 (ix), e
	jp	00160$
00150$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:724: else lookDir = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00826$
	xor	a, #0x80
00826$:
	jp	P, 00288$
	ld	de, #0x0003
	jp	00289$
00288$:
	ld	de, #0x0007
00289$:
	ld	-1 (ix), e
00160$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:727: if (lookDir != DIRECTION_NONE) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00163$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:728: g_Players[i].Direction = lookDir;
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
	ld	hl, #0x000a
	add	hl, de
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:729: g_Players[i].PatternId = GetNoMovingPlayerPatternId(lookDir);
	ld	hl, #0x0008
	add	hl, de
	push	hl
	push	bc
	ld	a, -1 (ix)
	call	_GetNoMovingPlayerPatternId
	pop	bc
	pop	hl
	ld	(hl), a
00163$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:696: for(u8 i=0; i<14; i++) {
	inc	c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:732: return; // END SETUP PHASE
	jp	00266$
00166$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:736: ClearTextFromLayerA(10, 12, 11);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:743: if (kickerId != NO_VALUE) {
	bit	0, -21 (ix)
	jp	NZ, 00171$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:744: g_Players[kickerId].X = g_Players[kickerId].TargetX;
	ld	c, -23 (ix)
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
	ld	a, -2 (ix)
	add	a, #<(_g_Players)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	adc	a, #>(_g_Players)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0010
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:745: g_Players[kickerId].Y = g_Players[kickerId].TargetY;
	ld	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
00171$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:705: if (g_RestartKickTeamId == TEAM_1) lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_DOWN_RIGHT : DIRECTION_DOWN_LEFT;
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	ld	a, #0x01
	jr	Z, 00828$
	xor	a, a
00828$:
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:748: bool isHuman = (g_RestartKickTeamId == TEAM_1 || (g_GameWith2Players && g_RestartKickTeamId == TEAM_2));
	ld	b, c
	bit	0, b
	jr	NZ, 00291$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00290$
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, #0x02
	jr	Z, 00291$
00290$:
	xor	a, a
	jp	00292$
00291$:
	ld	a, #0x01
00292$:
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:751: if (isHuman) s_ForceKickTimer++;
	or	a, a
	jr	Z, 00173$
	ld	hl, (_TickCornerKick_s_ForceKickTimer_65537_1291)
	inc	hl
	ld	(_TickCornerKick_s_ForceKickTimer_65537_1291), hl
00173$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:753: if (isHuman) {
	ld	a, b
	or	a, a
	jp	Z, 00260$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:754: if (g_RestartKickTeamId == TEAM_1) {
	ld	a, c
	or	a, a
	jp	Z, 00246$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:756: u8 candLeft = NO_VALUE;
	ld	-7 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:757: u8 candRight = NO_VALUE;
	ld	-6 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:759: for(u8 c=0; c<14; c++) {
	ld	-1 (ix), #0x00
00268$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00184$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:760: if (g_Players[c].TeamId == TEAM_1 && c != kickerId && g_Players[c].Role != PLAYER_ROLE_GOALKEEPER) {
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
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	a, -3 (ix)
	add	a, #<(_g_Players)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	adc	a, #>(_g_Players)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	dec	a
	jr	NZ, 00269$
	ld	a, -23 (ix)
	sub	a, -1 (ix)
	jr	Z, 00269$
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x000d
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	or	a, a
	jr	Z, 00269$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:761: u8 tx = g_Players[c].TargetX;
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0010
	add	hl, de
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:763: if (tx >= 40 && tx <= 110) candLeft = c;
	ld	-2 (ix), a
	sub	a, #0x28
	jr	C, 00175$
	ld	a, #0x6e
	sub	a, -2 (ix)
	jr	C, 00175$
	ld	a, -1 (ix)
	ld	-7 (ix), a
00175$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:764: if (tx >= 130 && tx <= 220) candRight = c;
	ld	a, -2 (ix)
	sub	a, #0x82
	jr	C, 00269$
	ld	a, #0xdc
	sub	a, -2 (ix)
	jr	C, 00269$
	ld	a, -1 (ix)
	ld	-6 (ix), a
00269$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:759: for(u8 c=0; c<14; c++) {
	inc	-1 (ix)
	jp	00268$
00184$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:767: if (candLeft == NO_VALUE) candLeft = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_LEFT_HALFFIELDER);
	ld	a, -7 (ix)
	inc	a
	jr	NZ, 00186$
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_GetPlayerIdByRole
	ld	-7 (ix), a
00186$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:768: if (candRight == NO_VALUE) candRight = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_RIGHT_HALFFIELDER);
	ld	a, -6 (ix)
	inc	a
	jr	NZ, 00188$
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_GetPlayerIdByRole
	ld	-6 (ix), a
00188$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:771: if (g_CornerKickTargetId == NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	NZ, 00195$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:772: if (candLeft != NO_VALUE) g_CornerKickTargetId = candLeft;
	ld	a, -7 (ix)
	inc	a
	jr	Z, 00192$
	ld	a, -7 (ix)
	ld	(_g_CornerKickTargetId+0), a
	jp	00195$
00192$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:773: else if (candRight != NO_VALUE) g_CornerKickTargetId = candRight; 
	ld	a, -6 (ix)
	inc	a
	jr	Z, 00195$
	ld	a, -6 (ix)
	ld	(_g_CornerKickTargetId+0), a
00195$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:777: u8 joyDir = GetJoystick1Direction();
	call	_GetJoystick1Direction
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:780: if (joyDir == DIRECTION_LEFT && !joyMoved && candLeft != NO_VALUE) {
	ld	c, a
	sub	a, #0x07
	jr	NZ, 00204$
	ld	a, (_TickCornerKick_joyMoved_196614_1325+0)
	or	a, a
	jr	NZ, 00204$
	ld	a, -7 (ix)
	inc	a
	jr	Z, 00204$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:781: g_CornerKickTargetId = candLeft; joyMoved = true;
	ld	a, -7 (ix)
	ld	(_g_CornerKickTargetId+0), a
	ld	hl, #_TickCornerKick_joyMoved_196614_1325
	ld	(hl), #0x01
	jp	00205$
00204$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:782: } else if (joyDir == DIRECTION_RIGHT && !joyMoved && candRight != NO_VALUE) {
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00199$
	ld	a, (_TickCornerKick_joyMoved_196614_1325+0)
	or	a, a
	jr	NZ, 00199$
	ld	a, -6 (ix)
	inc	a
	jr	Z, 00199$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:783: g_CornerKickTargetId = candRight; joyMoved = true;
	ld	a, -6 (ix)
	ld	(_g_CornerKickTargetId+0), a
	ld	hl, #_TickCornerKick_joyMoved_196614_1325
	ld	(hl), #0x01
	jp	00205$
00199$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:784: } else if (joyDir == DIRECTION_NONE) {
	ld	a, c
	or	a, a
	jr	NZ, 00205$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:785: joyMoved = false;
	ld	hl, #_TickCornerKick_joyMoved_196614_1325
	ld	(hl), #0x00
00205$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:792: if (kickerId != NO_VALUE) {
	bit	0, -21 (ix)
	jp	NZ, 00209$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:793: u8 kDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_DOWN_RIGHT : DIRECTION_DOWN_LEFT;
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00296$
	ld	-2 (ix), #0x04
	ld	-1 (ix), #0
	jp	00297$
00296$:
	ld	-2 (ix), #0x06
	ld	-1 (ix), #0
00297$:
	ld	a, -2 (ix)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:794: g_Players[kickerId].Direction = kDir;
	ld	c, -23 (ix)
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
	ld	a, #<(_g_Players)
	add	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -1 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	add	a, #0x0a
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:795: g_Players[kickerId].PatternId = GetNoMovingPlayerPatternId(kDir);
	ld	a, -6 (ix)
	add	a, #0x08
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	a, -3 (ix)
	call	_GetNoMovingPlayerPatternId
	ld	-3 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:796: g_Players[kickerId].X = g_Players[kickerId].TargetX;
	ld	a, -6 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0010
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:797: g_Players[kickerId].Y = g_Players[kickerId].TargetY;
	ld	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:799: g_Players[kickerId].Status = PLAYER_STATUS_POSITIONED; 
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00209$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:803: bool t1Trigger = IsTeamJoystickTriggerPressed(TEAM_1);
	ld	a, #0x01
	call	_IsTeamJoystickTriggerPressed
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:805: if (g_Timer == 180) t1Latched = true;
	ld	a, (_g_Timer+0)
	sub	a, #0xb4
	jr	NZ, 00211$
	ld	hl, #_TickCornerKick_t1Latched_196615_1330
	ld	(hl), #0x01
00211$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:806: if (!t1Trigger) t1Latched = false;
	ld	a, c
	or	a, a
	jr	NZ, 00213$
	ld	hl, #_TickCornerKick_t1Latched_196615_1330
	ld	(hl), #0x00
00213$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:809: if (g_CornerKickTargetId != NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	Z, 00215$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:810: g_Ball.PassTargetPlayerId = g_CornerKickTargetId;
	ld	hl, #(_g_Ball + 16)
	ld	a, (_g_CornerKickTargetId+0)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:811: g_PassTargetPlayer = g_CornerKickTargetId;
	ld	a, (_g_CornerKickTargetId+0)
	ld	(_g_PassTargetPlayer+0), a
00215$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:814: if ((t1Trigger && !t1Latched || s_ForceKickTimer > 240) && g_CornerKickTargetId != NO_VALUE) {
	ld	a, c
	or	a, a
	jr	Z, 00219$
	ld	a, (_TickCornerKick_t1Latched_196615_1330+0)
	or	a, a
	jr	Z, 00220$
00219$:
	ld	hl, (_TickCornerKick_s_ForceKickTimer_65537_1291)
	ld	a, #0xf0
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	NC, 00270$
00220$:
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jp	Z,00270$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:815: PerformPass(g_CornerKickTargetId);
	ld	a, (_g_CornerKickTargetId+0)
	call	_PerformPass
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:816: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:817: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
	jp	00270$
00246$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:822: u8 joyDir = GetJoystick2Direction();
	call	_GetJoystick2Direction
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:823: bool trigger = IsTeamJoystickTriggerPressed(TEAM_2);
	push	bc
	ld	a, #0x02
	call	_IsTeamJoystickTriggerPressed
	pop	bc
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:826: if (g_CornerKickTargetId == NO_VALUE) g_CornerKickTargetId = GetPlayerIdByRole(TEAM_2, PLAYER_ROLE_LEFT_STRIKER);
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	NZ, 00222$
	push	bc
	ld	l, #0x05
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_GetPlayerIdByRole
	pop	bc
	ld	(_g_CornerKickTargetId+0), a
00222$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:828: if ((joyDir == DIRECTION_LEFT || joyDir == DIRECTION_RIGHT) && !joyMoved) {
	ld	a,b
	cp	a,#0x07
	jr	Z, 00238$
	sub	a, #0x03
	jr	NZ, 00235$
00238$:
	ld	a, (_TickCornerKick_joyMoved_196613_1333+0)
	or	a, a
	jr	NZ, 00235$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:829: u8 curr = g_CornerKickTargetId;
	ld	a, (_g_CornerKickTargetId+0)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:831: do {
	ld	a, b
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00857$
	xor	a, a
00857$:
	ld	-3 (ix), a
	ld	-1 (ix), #0x00
00229$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:832: curr = (joyDir==DIRECTION_RIGHT) ? curr+1 : curr-1;
	ld	-2 (ix), c
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00298$
	ld	c, -2 (ix)
	inc	c
	jp	00299$
00298$:
	ld	c, -2 (ix)
	dec	c
00299$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:833: if (curr > 13) curr = 0;
	ld	a, #0x0d
	sub	a, c
	jr	NC, 00224$
	ld	c, #0x00
00224$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:834: if (g_Players[curr].TeamId == TEAM_2 && g_Players[curr].Role != PLAYER_ROLE_GOALKEEPER && curr != kickerId) {
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
	push	de
	pop	iy
	ld	a, 9 (iy)
	sub	a, #0x02
	jr	NZ, 00226$
	ld	hl, #13
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00226$
	ld	a, -23 (ix)
	sub	a, c
	jr	Z, 00226$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:835: g_CornerKickTargetId = curr; break;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), c
	jp	00231$
00226$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:837: loop++;
	inc	-1 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:838: } while (loop < 15);
	ld	a, -1 (ix)
	sub	a, #0x0f
	jr	C, 00229$
00231$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:839: joyMoved = true;
	ld	hl, #_TickCornerKick_joyMoved_196613_1333
	ld	(hl), #0x01
	jp	00236$
00235$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:840: } else if (joyDir == DIRECTION_NONE) joyMoved = false;
	ld	a, b
	or	a, a
	jr	NZ, 00236$
	ld	hl, #_TickCornerKick_joyMoved_196613_1333
	ld	(hl), #0x00
00236$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:842: if (g_CornerKickTargetId != NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	Z, 00240$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:843: g_Ball.PassTargetPlayerId = g_CornerKickTargetId;
	ld	hl, #(_g_Ball + 16)
	ld	a, (_g_CornerKickTargetId+0)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:844: g_PassTargetPlayer = g_CornerKickTargetId;
	ld	a, (_g_CornerKickTargetId+0)
	ld	(_g_PassTargetPlayer+0), a
00240$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:847: if ((trigger || s_ForceKickTimer > 240) && g_CornerKickTargetId != NO_VALUE) {
	ld	a, -4 (ix)
	or	a, a
	jr	NZ, 00244$
	ld	hl, (_TickCornerKick_s_ForceKickTimer_65537_1291)
	ld	a, #0xf0
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	NC, 00270$
00244$:
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	Z, 00270$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:848: PerformPass(g_CornerKickTargetId);
	ld	a, (_g_CornerKickTargetId+0)
	call	_PerformPass
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:849: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:850: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
	jp	00270$
00260$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:856: if (g_CornerKickTargetId == NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	NZ, 00253$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:857: u8 randomRole = ((g_Timer & 1) == 0) ? PLAYER_ROLE_LEFT_STRIKER : PLAYER_ROLE_RIGHT_STRIKER;
	ld	a, (_g_Timer+0)
	rrca
	jr	C, 00300$
	ld	hl, #0x0005
	jp	00301$
00300$:
	ld	hl, #0x0006
00301$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:858: u8 strikerId = GetPlayerIdByRole(g_RestartKickTeamId, randomRole);
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetPlayerIdByRole
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:861: if (strikerId != NO_VALUE && strikerId != kickerId) {
	ld	c, a
	inc	a
	jr	Z, 00249$
	ld	a, -23 (ix)
	sub	a, c
	jr	Z, 00249$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:862: g_CornerKickTargetId = strikerId;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), c
	jp	00253$
00249$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:864: g_CornerKickTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, kickerId);
	ld	l, -23 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	(_g_CornerKickTargetId+0), a
00253$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:868: if (g_Timer > 200) {
	ld	a, #0xc8
	ld	hl, #_g_Timer
	sub	a, (hl)
	jr	NC, 00257$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:869: if (g_CornerKickTargetId == NO_VALUE) g_CornerKickTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, kickerId);
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	NZ, 00255$
	ld	l, -23 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	(_g_CornerKickTargetId+0), a
00255$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:871: PerformPass(g_CornerKickTargetId);
	ld	a, (_g_CornerKickTargetId+0)
	call	_PerformPass
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:872: g_MatchStatus = MATCH_IN_ACTION; 
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:873: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
	jp	00270$
00257$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:875: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
00270$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:878: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:879: void TickTeamJoystick(u8 teamId, u8 direction){
;	---------------------------------
; Function TickTeamJoystick
; ---------------------------------
_TickTeamJoystick::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-61
	add	iy, sp
	ld	sp, iy
	ld	-1 (ix), a
	ld	-2 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:882: if (g_MatchStatus == MATCH_NOT_STARTED || 
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jp	Z,00261$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:883: g_MatchStatus == MATCH_PLAYERS_PRESENTATION || 
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:884: g_MatchStatus == MATCH_AFTER_IN_GOAL || 
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0b
	jp	Z,00261$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:885: g_MatchStatus == MATCH_BEFORE_CORNER_KICK || 
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:886: g_MatchStatus == MATCH_BEFORE_GOAL_KICK || 
	cp	a,#0x06
	jp	Z,00261$
	cp	a,#0x02
	jp	Z,00261$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:887: g_MatchStatus == MATCH_BEFORE_THROW_IN ||
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:888: g_MatchStatus == MATCH_BEFORE_OFFSIDE) {
	cp	a,#0x05
	jp	Z,00261$
	cp	a,#0x03
	jp	Z,00261$
	sub	a, #0x0e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:889: return;
	jp	Z,00261$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:893: if(teamId==TEAM_1){
	ld	a, -1 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00732$
	xor	a, a
00732$:
	ld	-61 (ix), a
	or	a, a
	jr	Z, 00116$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:894: if(g_Team1ActivePlayer==NO_VALUE){
	ld	a, (_g_Team1ActivePlayer+0)
	inc	a
	jp	Z,00261$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:895: return;
	jp	00110$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:898: playerId=g_Team1ActivePlayer;
	ld	a, (_g_Team1ActivePlayer+0)
	ld	-3 (ix), a
	jp	00117$
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:902: if(g_Team2ActivePlayer==NO_VALUE){
	ld	a, (_g_Team2ActivePlayer+0)
	inc	a
	jp	Z,00261$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:903: return;
	jp	00113$
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:906: playerId=g_Team2ActivePlayer;
	ld	a, (_g_Team2ActivePlayer+0)
	ld	-3 (ix), a
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:912: bool frameTriggerPressed = IsTeamJoystickTriggerPressed(teamId);
	ld	a, -1 (ix)
	call	_IsTeamJoystickTriggerPressed
	ld	-60 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:915: bool canSwitch = false;
	ld	-4 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:916: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	a, (#(_g_Ball + 6) + 0)
	cp	a, #0xff
	jr	NZ, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:917: canSwitch = true; // Always allow switch on loose ball
	ld	-4 (ix), #0x01
	jp	00122$
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:919: u8 ballOwner = g_Ball.PossessionPlayerId;
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:920: if (g_Players[ballOwner].TeamId != teamId) {
	ld	bc, #_g_Players+0
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	de, #0x0009
	add	hl, de
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	Z, 00122$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:921: canSwitch = true;
	ld	-4 (ix), #0x01
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:925: if (canSwitch) {
	ld	a, -4 (ix)
	or	a, a
	jp	Z, 00144$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:928: bool forceSwitch = frameTriggerPressed;
	ld	a, -60 (ix)
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:932: bool inputActive = (direction != DIRECTION_NONE);
	ld	a, -2 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	-4 (ix), a
	xor	a, #0x01
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:934: if (!inputActive || forceSwitch) {
	or	a, a
	jr	Z, 00140$
	ld	a, -60 (ix)
	or	a, a
	jp	Z, 00144$
00140$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:936: u8 closestId = GetClosestPlayerToBall(teamId, NO_VALUE);
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_GetClosestPlayerToBall
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:939: if (closestId != NO_VALUE && g_Players[closestId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	-11 (ix), a
	inc	a
	jr	Z, 00124$
	ld	c, -11 (ix)
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
	ld	-5 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -6 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	de, #0x000d
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00124$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:941: closestId = GetClosestPlayerToBall(teamId, closestId);
	ld	l, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_GetClosestPlayerToBall
	ld	-11 (ix), a
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:944: if (closestId != playerId && closestId != NO_VALUE) {
	ld	a, -11 (ix)
	sub	a, -3 (ix)
	jp	Z,00144$
	ld	a, -11 (ix)
	inc	a
	jp	Z,00144$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:946: if (forceSwitch) {
	ld	a, -8 (ix)
	or	a, a
	jr	Z, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:948: if (teamId == TEAM_1) g_Team1ActivePlayer = closestId;
	ld	a, -61 (ix)
	or	a, a
	jr	Z, 00127$
	ld	a, -11 (ix)
	ld	(_g_Team1ActivePlayer+0), a
	jp	00128$
00127$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:949: else g_Team2ActivePlayer = closestId;
	ld	a, -11 (ix)
	ld	(_g_Team2ActivePlayer+0), a
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:950: playerId = closestId; 
	ld	a, -11 (ix)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:953: frameTriggerPressed = false;
	ld	-60 (ix), #0x00
	jp	00144$
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:958: u8 histThreshold = (g_Ball.PossessionPlayerId == NO_VALUE) ? 10 : 30;
	ld	a, (#(_g_Ball + 6) + 0)
	inc	a
	jr	NZ, 00263$
	ld	-5 (ix), #0x0a
	ld	-4 (ix), #0
	jp	00264$
00263$:
	ld	-5 (ix), #0x1e
	ld	-4 (ix), #0
00264$:
	ld	a, -5 (ix)
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:961: u16 distX_Curr = (g_Players[playerId].X > g_Ball.X) ? (g_Players[playerId].X - g_Ball.X) : (g_Ball.X - g_Players[playerId].X);
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
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	a, #<(_g_Players)
	add	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -4 (ix)
	ld	-8 (ix), a
	ld	a, -9 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-13 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-12 (ix), a
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	sub	a, -13 (ix)
	ld	a, -6 (ix)
	sbc	a, -12 (ix)
	jr	NC, 00265$
	ld	a, -13 (ix)
	sub	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -12 (ix)
	sbc	a, -6 (ix)
	ld	-4 (ix), a
	jp	00266$
00265$:
	ld	a, -7 (ix)
	sub	a, -13 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	sbc	a, -12 (ix)
	ld	-4 (ix), a
00266$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:962: u16 distY_Curr = (g_Players[playerId].Y > g_Ball.Y) ? (g_Players[playerId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[playerId].Y);
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, (#_g_Ball + 0)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00267$
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	jp	00268$
00267$:
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
00268$:
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:963: u16 distCurr = distX_Curr + distY_Curr;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	add	hl, bc
	ld	-9 (ix), l
	ld	-8 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:965: u16 distX_New = (g_Players[closestId].X > g_Ball.X) ? (g_Players[closestId].X - g_Ball.X) : (g_Ball.X - g_Players[closestId].X);
	ld	c, -11 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_g_Players
	add	hl,bc
;	spillPairReg hl
;	spillPairReg hl
	ld	-5 (ix), l
	ld	-4 (ix), h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -7 (ix)
	sub	a, c
	ld	a, -6 (ix)
	sbc	a, b
	jr	NC, 00269$
	ld	a, c
	sub	a, -7 (ix)
	ld	c, a
	ld	a, b
	sbc	a, -6 (ix)
	jp	00270$
00269$:
	ld	a, -7 (ix)
	sub	a, c
	ld	c, a
	ld	a, -6 (ix)
	sbc	a, b
00270$:
	ld	-7 (ix), c
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:966: u16 distY_New = (g_Players[closestId].Y > g_Ball.Y) ? (g_Players[closestId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[closestId].Y);
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00271$
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	jp	00272$
00271$:
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
00272$:
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:967: u16 distNew = distX_New + distY_New;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	add	hl, bc
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:969: if (distNew < (distCurr - histThreshold)) {
	ld	c, -10 (ix)
	ld	b, #0x00
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	cp	a, a
	sbc	hl, bc
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jr	NC, 00144$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:970: if (teamId == TEAM_1) g_Team1ActivePlayer = closestId;
	ld	a, -61 (ix)
	or	a, a
	jr	Z, 00130$
	ld	a, -11 (ix)
	ld	(_g_Team1ActivePlayer+0), a
	jp	00131$
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:971: else g_Team2ActivePlayer = closestId;
	ld	a, -11 (ix)
	ld	(_g_Team2ActivePlayer+0), a
00131$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:972: playerId = closestId;
	ld	a, -11 (ix)
	ld	-3 (ix), a
00144$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:979: if (g_Players[playerId].Status == PLAYER_STATUS_POSITIONED) return;
	ld	bc, #_g_Players+0
	ld	e, -3 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	-15 (ix), l
	ld	-14 (ix), h
	ld	a, -15 (ix)
	add	a, #0x12
	ld	-13 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x04
	or	a, b
	jp	Z,00261$
	jp	00146$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:986: if (g_ActionCooldown > 0) frameTriggerPressed = false;
	ld	a, (_g_ActionCooldown+0)
	or	a, a
	jr	Z, 00148$
	ld	-60 (ix), #0x00
00148$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:989: if (frameTriggerPressed && g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	a, -60 (ix)
	or	a, a
	jp	Z, 00155$
	ld	a, (#(_g_Ball + 6) + 0)
	inc	a
	jp	NZ,00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:990: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
	ld	a, -15 (ix)
	ld	-5 (ix), a
	ld	a, -14 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	hl, (#_g_Ball + 2)
	ld	a, -5 (ix)
	sub	a, l
	ld	c, a
	ld	a, -4 (ix)
	sbc	a, h
	ld	b, a
	ld	-11 (ix), c
	ld	-10 (ix), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:991: i16 dy = (i16)g_Players[playerId].Y - (i16)g_Ball.Y;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, -4 (ix)
	ld	-8 (ix), a
	ld	hl, #_g_Ball
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
	ld	c, -5 (ix)
	ld	b, -4 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:992: if (dx > -16 && dx < 16 && dy > -16 && dy < 16) {
	ld	a, #0xf0
	cp	a, -11 (ix)
	ld	a, #0xff
	sbc	a, -10 (ix)
	jp	PO, 00749$
	xor	a, #0x80
00749$:
	jp	P, 00155$
	ld	a, -11 (ix)
	ld	d, -10 (ix)
	sub	a, #0x10
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00155$
	ld	a, #0xf0
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	jp	PO, 00750$
	xor	a, #0x80
00750$:
	jp	P, 00155$
	ld	a, c
	sub	a, #0x10
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:993: PutBallOnPlayerFeet(playerId);
	ld	a, -3 (ix)
	call	_PutBallOnPlayerFeet
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:997: if(g_Ball.PossessionPlayerId==playerId){
	ld	hl, #(_g_Ball + 6)
	ld	a,-3 (ix)
	sub	a,(hl)
	jp	NZ,00259$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1002: if (frameTriggerPressed) {
	ld	a, -60 (ix)
	or	a, a
	jp	Z, 00202$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1006: if (g_MatchStatus == MATCH_IN_ACTION) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jp	NZ,00196$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1008: if (g_ActionCooldown > 0) {
	ld	a, (_g_ActionCooldown+0)
	or	a, a
	jp	NZ, 00196$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1011: bool isShooting = false;
	ld	-10 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1018: u16 plY = g_Players[playerId].Y;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1019: u16 plX = g_Players[playerId].X;
	ld	a, -15 (ix)
	ld	-5 (ix), a
	ld	a, -14 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1023: if (plY >= FIELD_BOUND_Y_TOP && plY <= (FIELD_BOUND_Y_TOP + 120)) { 
	ld	a, -9 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1021: if (teamId == TEAM_1) { // Attacking UP (Towards Top)
	ld	a, -61 (ix)
	or	a, a
	jr	Z, 00186$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1023: if (plY >= FIELD_BOUND_Y_TOP && plY <= (FIELD_BOUND_Y_TOP + 120)) { 
	ld	a, -5 (ix)
	sub	a, #0x32
	ld	a, -4 (ix)
	sbc	a, #0x00
	jp	C, 00187$
	ld	a, #0xaa
	cp	a, -9 (ix)
	ld	a, #0x00
	sbc	a, -8 (ix)
	jp	C, 00187$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1024: if (checkDir == DIRECTION_UP || checkDir == DIRECTION_UP_LEFT || checkDir == DIRECTION_UP_RIGHT) {
	ld	a, -2 (ix)
	dec	a
	jr	Z, 00164$
	ld	a, -2 (ix)
	sub	a, #0x08
	jr	Z, 00164$
	ld	a, -2 (ix)
	sub	a, #0x02
	jp	NZ,00187$
00164$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1027: bool allowed = true;
	ld	-4 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: if (plY < (FIELD_BOUND_Y_TOP + 20)) {
	ld	a, -9 (ix)
	sub	a, #0x46
	ld	a, -8 (ix)
	sbc	a, #0x00
	jr	NC, 00161$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1029: if (plX < (GOAL_X_MIN - 5) || plX > (GOAL_X_MAX + 5)) allowed = false;
	ld	a, -7 (ix)
	sub	a, #0x5b
	ld	a, -6 (ix)
	sbc	a, #0x00
	jr	C, 00157$
	ld	a, #0x95
	cp	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	jr	NC, 00161$
00157$:
	ld	-4 (ix), #0x00
00161$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1032: if (allowed) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00187$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1033: isShooting = true;
	ld	-10 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1034: PerformShot(g_ShotCursorX, FIELD_BOUND_Y_TOP - 40);
	ld	de, #0x000a
	ld	hl, (_g_ShotCursorX)
	call	_PerformShot
	jp	00187$
00186$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1040: if (plY <= FIELD_BOUND_Y_BOTTOM && plY >= (FIELD_BOUND_Y_BOTTOM - 120)) { 
	ld	a, #0xae
	cp	a, -5 (ix)
	ld	a, #0x01
	sbc	a, -4 (ix)
	jr	C, 00187$
	ld	a, -5 (ix)
	sub	a, #0x36
	ld	a, -4 (ix)
	sbc	a, #0x01
	jr	C, 00187$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1041: if (checkDir == DIRECTION_DOWN || checkDir == DIRECTION_DOWN_LEFT || checkDir == DIRECTION_DOWN_RIGHT) {
	ld	a, -2 (ix)
	sub	a, #0x05
	jr	Z, 00178$
	ld	a, -2 (ix)
	sub	a, #0x06
	jr	Z, 00178$
	ld	a, -2 (ix)
	sub	a, #0x04
	jr	NZ, 00187$
00178$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1044: bool allowed = true;
	ld	e, #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1045: if (plY > (FIELD_BOUND_Y_BOTTOM - 20)) {
	ld	a, #0x9a
	cp	a, -5 (ix)
	ld	a, #0x01
	sbc	a, -4 (ix)
	jr	NC, 00175$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1046: if (plX < (GOAL_X_MIN - 5) || plX > (GOAL_X_MAX + 5)) allowed = false;
	ld	a, -7 (ix)
	sub	a, #0x5b
	ld	a, -6 (ix)
	sbc	a, #0x00
	jr	C, 00171$
	ld	a, #0x95
	cp	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	jr	NC, 00175$
00171$:
	ld	e, #0x00
00175$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1049: if (allowed) {
	ld	a, e
	or	a, a
	jr	Z, 00187$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1050: isShooting = true;
	ld	-10 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1051: PerformShot(g_ShotCursorX, FIELD_BOUND_Y_BOTTOM + 40);
	ld	de, #0x01d6
	ld	hl, (_g_ShotCursorX)
	call	_PerformShot
00187$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1057: if (isShooting) {
	ld	a, -10 (ix)
	or	a, a
	jr	Z, 00196$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1058: if (g_ShootCooldown > 0) return; // Prevent shooting if cooldown active
	ld	a, (_g_ShootCooldown+0)
	or	a, a
	jp	NZ,00261$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1059: g_ActionCooldown = 20;
	ld	hl, #_g_ActionCooldown
	ld	(hl), #0x14
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1060: return;
	jp	00261$
00196$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1070: if(direction != DIRECTION_NONE){
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1071: g_Players[playerId].Direction = direction;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
00198$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1075: g_PassTargetPlayer = GetBestPassTarget(playerId);
	ld	a, -3 (ix)
	call	_GetBestPassTarget
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1077: if (g_PassTargetPlayer != NO_VALUE) {
	ld	(_g_PassTargetPlayer+0), a
	inc	a
	jr	Z, 00202$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1079: PerformPass(g_PassTargetPlayer);
	ld	a, (_g_PassTargetPlayer+0)
	call	_PerformPass
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1082: return; 
	jp	00261$
00202$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1086: if((g_FrameCounter % 3)!=0){ 
	ld	hl, (_g_FrameCounter)
	ld	de, #0x0003
	call	__moduint
	ld	a, d
	or	a, e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1087: return;
	jp	NZ,00261$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1090: if(g_Ball.KickMoveState==NO_VALUE){
	ld	bc, #_g_Ball + 13
	ld	a, (bc)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1091: g_Ball.KickMoveState=0;
	inc	a
	jr	NZ, 00206$
	ld	(bc), a
00206$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1094: u8 moveDir = direction;
	ld	a, -2 (ix)
	ld	-11 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1095: if(g_Ball.KickMoveState != 0){
	ld	a, (bc)
	or	a, a
	jr	Z, 00208$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1096: moveDir = g_Players[playerId].Direction;
	ld	e, -15 (ix)
	ld	d, -14 (ix)
	ld	hl, #10
	add	hl, de
	ld	a, (hl)
	ld	-11 (ix), a
00208$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1102: if(g_Players[playerId].PreviousDirection!=DIRECTION_NONE){
	ld	a, -15 (ix)
	add	a, #0x0b
	ld	-10 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1099: if(moveDir==DIRECTION_NONE){
	ld	a, -11 (ix)
	or	a, a
	jr	NZ, 00223$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1100: g_Players[playerId].Status=PLAYER_STATUS_POSITIONED;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1101: PutBallOnPlayerFeet(playerId);
	push	bc
	ld	a, -3 (ix)
	call	_PutBallOnPlayerFeet
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1102: if(g_Players[playerId].PreviousDirection!=DIRECTION_NONE){
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	e, (hl)
	ld	a, e
	or	a, a
	jr	Z, 00210$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1103: g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
	ld	a, -15 (ix)
	add	a, #0x08
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	bc
	ld	a, e
	call	_GetNoMovingPlayerPatternId
	pop	bc
	pop	hl
	ld	(hl), a
00210$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1105: g_Ball.KickMoveState=0;
	xor	a, a
	ld	(bc), a
	jp	00261$
00223$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1111: const u8 BallBaseDistX[] = { 0, 0, 4, 6, 4, 0, 4, 6, 4 };
	ld	-59 (ix), #0x00
	ld	-58 (ix), #0x00
	ld	-57 (ix), #0x04
	ld	-56 (ix), #0x06
	ld	-55 (ix), #0x04
	ld	-54 (ix), #0x00
	ld	-53 (ix), #0x04
	ld	-52 (ix), #0x06
	ld	-51 (ix), #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1112: const u8 BallBaseDistY[] = { 0, 6, 4, 0, 4, 6, 4, 0, 4 };
	ld	-50 (ix), #0x00
	ld	-49 (ix), #0x06
	ld	-48 (ix), #0x04
	ld	-47 (ix), #0x00
	ld	-46 (ix), #0x04
	ld	-45 (ix), #0x06
	ld	-44 (ix), #0x04
	ld	-43 (ix), #0x00
	ld	-42 (ix), #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1131: const i8 BallAlignCorrectX[] = { 0, 0, 0, 0, 2, 0, -2, 0, 0 };
	ld	-41 (ix), #0x00
	ld	-40 (ix), #0x00
	ld	-39 (ix), #0x00
	ld	-38 (ix), #0x00
	ld	-37 (ix), #0x02
	ld	-36 (ix), #0x00
	ld	-35 (ix), #0xfe
	ld	-34 (ix), #0x00
	ld	-33 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1132: const i8 BallAlignCorrectY[] = { 0, 0, 0, 8, 2, -2, 2, 8, 0 };
	ld	-32 (ix), #0x00
	ld	-31 (ix), #0x00
	ld	-30 (ix), #0x00
	ld	-29 (ix), #0x08
	ld	-28 (ix), #0x02
	ld	-27 (ix), #0xfe
	ld	-26 (ix), #0x02
	ld	-25 (ix), #0x08
	ld	-24 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1134: const u8 DribbleAnimOffsets[] = {5, 4, 2, 0};
	ld	-23 (ix), #0x05
	ld	-22 (ix), #0x04
	ld	-21 (ix), #0x02
	ld	-20 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1135: const u8 DribbleAnimOffsetsDiag[] = {3, 3, 1, 0};
	ld	-19 (ix), #0x03
	ld	-18 (ix), #0x03
	ld	-17 (ix), #0x01
	ld	-16 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1137: u8 animStep = g_Ball.KickMoveState;
	ld	a, (bc)
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1138: u8 diagStep = (animStep % 2) ? 1 : 2;
	bit	0, e
	jr	Z, 00273$
	ld	hl, #0x0001
	jp	00274$
00273$:
	ld	hl, #0x0002
00274$:
	ld	-8 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1140: u8 currentOffset = DribbleAnimOffsets[animStep];
	push	de
	ld	d, #0x00
	ld	hl, #40
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1141: u8 currentOffsetDiag = DribbleAnimOffsetsDiag[animStep];
	ld	d, #0x00
	ld	hl, #42
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1143: u8 distX = BallBaseDistX[moveDir] + ((moveDir==DIRECTION_UP || moveDir==DIRECTION_DOWN) ? 0 : (moveDir == DIRECTION_LEFT || moveDir == DIRECTION_RIGHT ? currentOffset : currentOffsetDiag));
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #2
	add	hl, sp
	add	hl, de
	ld	e, (hl)
	ld	a, -11 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00768$
	xor	a, a
00768$:
	ld	-5 (ix), a
	ld	a, -11 (ix)
	sub	a, #0x07
	ld	a, #0x01
	jr	Z, 00770$
	xor	a, a
00770$:
	ld	-4 (ix), a
	bit	0, -5 (ix)
	jr	NZ, 00278$
	ld	a, -11 (ix)
	sub	a, #0x05
	jr	NZ, 00275$
00278$:
	xor	a, a
	jp	00276$
00275$:
	bit	0, -4 (ix)
	jr	NZ, 00283$
	ld	a, -11 (ix)
	sub	a, #0x03
	jr	NZ, 00280$
00283$:
	ld	a, -7 (ix)
	jp	00281$
00280$:
	ld	a, -6 (ix)
00281$:
00276$:
	add	a, e
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1144: u8 distY = BallBaseDistY[moveDir] + ((moveDir==DIRECTION_LEFT || moveDir==DIRECTION_RIGHT) ? 0 : (moveDir == DIRECTION_UP || moveDir == DIRECTION_DOWN ? currentOffset : currentOffsetDiag));
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #11
	add	hl, sp
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	bit	0, -4 (ix)
	jr	NZ, 00288$
	ld	a, -11 (ix)
	sub	a, #0x03
	jr	NZ, 00285$
00288$:
	xor	a, a
	ld	-5 (ix), a
	ld	-4 (ix), a
	jp	00286$
00285$:
	bit	0, -5 (ix)
	jr	NZ, 00293$
	ld	a, -11 (ix)
	sub	a, #0x05
	jr	NZ, 00290$
00293$:
	ld	a, -7 (ix)
	jp	00291$
00290$:
	ld	a, -6 (ix)
00291$:
	ld	-5 (ix), a
	ld	-4 (ix), #0x00
00286$:
	ld	a, -5 (ix)
	add	a, l
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:990: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
	ld	a, -15 (ix)
	add	a, #0x02
	ld	-5 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1146: switch(moveDir){
	ld	a, #0x08
	sub	a, -11 (ix)
	jp	C, 00219$
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #00779$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00779$:
	jp	00219$
	jp	00211$
	jp	00215$
	jp	00214$
	jp	00217$
	jp	00212$
	jp	00218$
	jp	00213$
	jp	00216$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1147: case DIRECTION_UP:
00211$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1148: g_Players[playerId].Y -= 2;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
	dec	de
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1149: g_Ball.Y = g_Players[playerId].Y - distY + BallAlignCorrectY[moveDir];
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
	push	de
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #31
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
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1150: g_Ball.X = g_Players[playerId].X + BallAlignCorrectX[moveDir];
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #22
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1151: break;
	jp	00219$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1152: case DIRECTION_DOWN:
00212$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1153: g_Players[playerId].Y += 2;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	inc	de
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1154: g_Ball.Y = g_Players[playerId].Y + distY + BallAlignCorrectY[moveDir]+5;
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	push	hl
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #31
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
	ld	de, #0x0005
	add	hl, de
	ex	de, hl
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1155: g_Ball.X = g_Players[playerId].X + BallAlignCorrectX[moveDir];
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #22
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1156: break;
	jp	00219$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1157: case DIRECTION_LEFT:
00213$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1158: g_Players[playerId].X -= 2;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
	dec	de
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1159: g_Ball.X = g_Players[playerId].X - distX + BallAlignCorrectX[moveDir];
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
	push	de
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #22
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1160: g_Ball.Y = g_Players[playerId].Y + BallAlignCorrectY[moveDir]-4;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #31
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
	ld	a, l
	add	a, #0xfc
	ld	e, a
	ld	a, h
	adc	a, #0xff
	ld	d, a
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1161: break;
	jp	00219$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1162: case DIRECTION_RIGHT:
00214$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1163: g_Players[playerId].X += 2;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	inc	de
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1164: g_Ball.X = g_Players[playerId].X + distX + BallAlignCorrectX[moveDir];
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	push	hl
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #22
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1165: g_Ball.Y = g_Players[playerId].Y + BallAlignCorrectY[moveDir]-4;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #31
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
	ld	a, l
	add	a, #0xfc
	ld	e, a
	ld	a, h
	adc	a, #0xff
	ld	d, a
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1166: break;
	jp	00219$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1167: case DIRECTION_UP_RIGHT:
00215$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1168: g_Players[playerId].Y -= diagStep;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, -8 (ix)
	ld	d, #0x00
	cp	a, a
	sbc	hl, de
	ex	(sp), hl
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, -61 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -60 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1169: g_Players[playerId].X += diagStep;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1170: g_Ball.Y = g_Players[playerId].Y - distY + BallAlignCorrectY[moveDir];
	ld	e, -6 (ix)
	ld	d, #0x00
	pop	hl
	push	hl
	cp	a, a
	sbc	hl, de
	push	hl
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #31
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
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1171: g_Ball.X = g_Players[playerId].X + distX + BallAlignCorrectX[moveDir];
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, -8 (ix)
	ld	d, -7 (ix)
	add	hl, de
	push	hl
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #22
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1172: break;
	jp	00219$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1173: case DIRECTION_UP_LEFT:
00216$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1174: g_Players[playerId].Y -= diagStep;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, -8 (ix)
	ld	d, #0x00
	cp	a, a
	sbc	hl, de
	ex	(sp), hl
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, -61 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -60 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1175: g_Players[playerId].X -= diagStep;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	cp	a, a
	sbc	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1176: g_Ball.Y = g_Players[playerId].Y - distY + BallAlignCorrectY[moveDir];
	ld	e, -6 (ix)
	ld	d, #0x00
	pop	hl
	push	hl
	cp	a, a
	sbc	hl, de
	push	hl
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #31
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
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1177: g_Ball.X = g_Players[playerId].X - distX + BallAlignCorrectX[moveDir];
	ld	e, -3 (ix)
	ld	d, #0x00
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	cp	a, a
	sbc	hl, de
	push	hl
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #22
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1178: break;
	jp	00219$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1179: case DIRECTION_DOWN_RIGHT:
00217$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1180: g_Players[playerId].Y += diagStep;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, -8 (ix)
	ld	d, #0x00
	add	hl, de
	ex	(sp), hl
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, -61 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -60 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1181: g_Players[playerId].X += diagStep;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1182: g_Ball.Y = g_Players[playerId].Y + distY + BallAlignCorrectY[moveDir];
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	pop	de
	push	de
	add	hl, de
	push	hl
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #31
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
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1183: g_Ball.X = g_Players[playerId].X + distX + BallAlignCorrectX[moveDir];
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	e, -8 (ix)
	ld	d, -7 (ix)
	add	hl, de
	push	hl
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #22
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1184: break;
	jp	00219$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1185: case DIRECTION_DOWN_LEFT:
00218$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1186: g_Players[playerId].Y += diagStep;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	-8 (ix), l
	ld	-7 (ix), h
	add	hl, de
	ex	de, hl
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1187: g_Players[playerId].X -= diagStep;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, -8 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	sbc	a, -7 (ix)
	ld	-8 (ix), l
	ld	-7 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -8 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -7 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1188: g_Ball.Y = g_Players[playerId].Y + distY + BallAlignCorrectY[moveDir];
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	push	hl
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #31
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
	ld	(_g_Ball), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1189: g_Ball.X = g_Players[playerId].X - distX + BallAlignCorrectX[moveDir];
	ld	e, -3 (ix)
	ld	d, #0x00
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	cp	a, a
	sbc	hl, de
	push	hl
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #22
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1191: }
00219$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1192: g_Players[playerId].TargetY=g_Players[playerId].Y;
	ld	a, -15 (ix)
	add	a, #0x0e
	ld	-7 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1193: g_Players[playerId].TargetX=g_Players[playerId].X;
	ld	a, -15 (ix)
	add	a, #0x10
	ld	-7 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1194: g_Players[playerId].Status=PLAYER_STATUS_HAS_BALL; 
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1195: g_Players[playerId].Direction=moveDir;
	ld	a, -15 (ix)
	add	a, #0x0a
	ld	e, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -11 (ix)
	ld	(de), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1197: g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
	ld	a, -15 (ix)
	add	a, #0x08
	ld	-4 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	l, (hl)
;	spillPairReg hl
	push	bc
	push	de
	ld	a, l
	call	_GetNoMovingPlayerPatternId
	pop	de
	pop	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1198: g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
	ld	a, (de)
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1200: g_Ball.Direction = moveDir;
	ld	hl, #(_g_Ball + 5)
	ld	a, -11 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1202: g_Ball.KickMoveState++;
	ld	a, (bc)
	inc	a
	ld	e, a
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1203: if(g_Ball.KickMoveState>3){
	ld	a, #0x03
	sub	a, e
	jp	NC, 00261$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1204: g_Ball.KickMoveState=0;
	xor	a, a
	ld	(bc), a
	jp	00261$
00259$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1211: if (frameTriggerPressed) {
	ld	a, -60 (ix)
	or	a, a
	jp	Z, 00244$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1212: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
	ld	l, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -14 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (#_g_Ball + 2)
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1213: i16 dy = (i16)g_Players[playerId].Y - (i16)g_Ball.Y;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1216: if (dx > -16 && dx < 16 && dy > -16 && dy < 16) {
	ld	a, #0xf0
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	jp	PO, 00780$
	xor	a, #0x80
00780$:
	jp	P, 00244$
	ld	a, c
	sub	a, #0x10
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00244$
	ld	a, #0xf0
	cp	a, e
	ld	a, #0xff
	sbc	a, d
	jp	PO, 00781$
	xor	a, #0x80
00781$:
	jp	P, 00244$
	ld	a, e
	sub	a, #0x10
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00244$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1227: if (dx < 0) slidePose = PLAYER_POSE_TACKLE_FROM_UP_LEFT;    // UP-LEFT -> Slides towards Bottom-Right?
	ld	a, b
	rlca
	and	a,#0x01
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1225: if (dy < 0) {
	bit	7, d
	jr	Z, 00232$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1227: if (dx < 0) slidePose = PLAYER_POSE_TACKLE_FROM_UP_LEFT;    // UP-LEFT -> Slides towards Bottom-Right?
	ld	a, c
	or	a, a
	jr	Z, 00226$
	ld	b, #0x24
	jp	00233$
00226$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1228: else        slidePose = PLAYER_POSE_TACKLE_FROM_UP_RIGHT;   // UP-RIGHT -> Slides towards Bottom-Left?
	ld	b, #0xac
	jp	00233$
00232$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1231: if (dx < 0) slidePose = PLAYER_POSE_TACKLE_FROM_DOWN_LEFT;  // DOWN-LEFT -> Slides towards Top-Right?
	ld	a, c
	or	a, a
	jr	Z, 00229$
	ld	b, #0x22
	jp	00233$
00229$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1232: else        slidePose = PLAYER_POSE_TACKLE_FROM_DOWN_RIGHT; // DOWN-RIGHT -> Slides towards Top-Left?
	ld	b, #0xae
00233$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1235: if (slidePose != 0) {
	ld	a, b
	or	a, a
	jr	Z, 00235$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1236: g_Players[playerId].PatternId = slidePose;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x0008
	add	hl, de
	ld	(hl), b
00235$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1240: PutBallOnPlayerFeet(playerId);
	push	bc
	ld	a, -3 (ix)
	call	_PutBallOnPlayerFeet
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1242: if (slidePose != 0) {
	ld	a, b
	or	a, a
	jr	Z, 00237$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1243: g_Players[playerId].Status = PLAYER_STATUS_POSITIONED; // Lock visual (Override HAS_BALL)
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00237$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1246: g_ActionCooldown = 15; // Set 15 frames cooldown to avoid immediate pass
	ld	hl, #_g_ActionCooldown
	ld	(hl), #0x0f
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1247: return;
	jp	00261$
00244$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1251: if((g_FrameCounter % 3)!=0){ 
	ld	hl, (_g_FrameCounter)
	ld	de, #0x0003
	call	__moduint
	ld	a, d
	or	a, e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1252: return;
	jp	NZ,00261$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:990: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
	ld	a, -15 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1258: if (direction <= 8) {
	ld	a, #0x08
	sub	a, -2 (ix)
	jr	C, 00248$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1259: g_Players[playerId].X += k_MoveDX[direction];
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, #_TickTeamJoystick_k_MoveDX_131075_1403+0
	ld	l, -2 (ix)
	ld	h, #0x00
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
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1260: g_Players[playerId].Y += k_MoveDY[direction];
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, #_TickTeamJoystick_k_MoveDY_131075_1403+0
	ld	l, -2 (ix)
	ld	h, #0x00
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
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00248$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1264: if(g_Players[playerId].Y < FIELD_BOUND_Y_TOP) g_Players[playerId].Y = FIELD_BOUND_Y_TOP;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x32
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00250$
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), #0x32
	inc	hl
	ld	(hl), #0x00
00250$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1265: if(g_Players[playerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[playerId].Y = FIELD_BOUND_Y_BOTTOM;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xae
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	jr	NC, 00252$
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), #0xae
	inc	hl
	ld	(hl), #0x01
00252$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1267: g_Players[playerId].TargetY=g_Players[playerId].Y;
	ld	a, -15 (ix)
	add	a, #0x0e
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1268: g_Players[playerId].TargetX=g_Players[playerId].X;
	ld	a, -15 (ix)
	add	a, #0x10
	ld	c, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	b, a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1102: if(g_Players[playerId].PreviousDirection!=DIRECTION_NONE){
	ld	a, -15 (ix)
	add	a, #0x0b
	ld	-4 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1269: if(direction==DIRECTION_NONE){
	ld	a, -2 (ix)
	or	a, a
	jr	NZ, 00256$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1270: g_Players[playerId].Status=PLAYER_STATUS_POSITIONED;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1271: if(g_Players[playerId].PreviousDirection!=DIRECTION_NONE){
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-7 (ix), a
	or	a, a
	jr	Z, 00257$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1272: g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
	ld	a, -15 (ix)
	add	a, #0x08
	ld	-6 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	a, -7 (ix)
	call	_GetNoMovingPlayerPatternId
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), a
	jp	00257$
00256$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1277: g_Players[playerId].Status=PLAYER_STATUS_NONE;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00257$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1280: g_Players[playerId].Direction=direction;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1281: g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
00261$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1286: }
	ld	sp, ix
	pop	ix
	ret
_TickTeamJoystick_k_MoveDX_131075_1403:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x00	;  0
	.db #0xfe	; -2
	.db #0xfe	; -2
	.db #0xfe	; -2
_TickTeamJoystick_k_MoveDY_131075_1403:
	.db #0x00	;  0
	.db #0xfe	; -2
	.db #0xfe	; -2
	.db #0x00	;  0
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x02	;  2
	.db #0x00	;  0
	.db #0xfe	; -2
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1289: void TickBallCollision(){
;	---------------------------------
; Function TickBallCollision
; ---------------------------------
_TickBallCollision::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-21
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1290: if(g_MatchStatus!=MATCH_IN_ACTION){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1291: return;
	jp	NZ,00168$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1295: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#(_g_Ball + 6) + 0)
	inc	a
	jr	Z, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1296: if (g_Ball.PossessionTimer < 255) g_Ball.PossessionTimer++;
	ld	bc, #_g_Ball + 28
	ld	a, (bc)
	cp	a, #0xff
	jr	NC, 00106$
	inc	a
	ld	(bc), a
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1301: if (g_Ball.PossessionPlayerId == NO_VALUE) { // Ball in air
	ld	hl, #(_g_Ball + 6)
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1304: if (g_Ball.ShotActive == 1) {
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1305: i16 diffStart = (i16)g_Ball.X - (i16)g_Ball.PassStartX; 
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1301: if (g_Ball.PossessionPlayerId == NO_VALUE) { // Ball in air
	inc	c
	jr	Z, 00318$
00318$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1311: for(u8 i=0; i<14; i++){
	ld	-17 (ix), #0x00
	ld	-5 (ix), #0x00
00167$:
	ld	a, -5 (ix)
	sub	a, #0x0e
	jp	NC, 00168$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1312: if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -5 (ix)
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
	ld	-16 (ix), l
	ld	-15 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1386: g_Players[i].Status = PLAYER_STATUS_POSITIONED; // Lock it
	ld	a, -16 (ix)
	add	a, #0x12
	ld	-14 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-13 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1312: if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00164$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1313: if(g_Ball.PossessionPlayerId == i) continue; // Skip self
	ld	hl, #(_g_Ball + 6)
	ld	a,-5 (ix)
	sub	a,(hl)
	jp	Z,00164$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1318: u8 hitDist = 14;
	ld	-3 (ix), #0x0e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1358: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -16 (ix)
	add	a, #0x0d
	ld	-12 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1319: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	or	a, a
	jr	NZ, 00125$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1320: const TeamStats* stats = GetTeamStats(g_Players[i].TeamId);
	ld	a, -16 (ix)
	ld	-2 (ix), a
	ld	a, -15 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	ld	-1 (ix), a
	call	_GetTeamStats
	ld	-2 (ix), e
	ld	-1 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1321: if (g_Ball.ShotActive) hitDist = stats->GkSkill; 
	ld	a, (#(_g_Ball + 27) + 0)
	or	a, a
	jr	Z, 00122$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	hl, #4
	add	hl, bc
	ld	a, (hl)
	ld	-3 (ix), a
	jp	00125$
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1322: else hitDist = 14; 
	ld	-3 (ix), #0x0e
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1326: u16 diffX = (g_Ball.X > g_Players[i].X) ? (g_Ball.X - g_Players[i].X) : (g_Players[i].X - g_Ball.X);
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-10 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
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
	jr	NC, 00170$
	ld	a, -10 (ix)
	sub	a, -8 (ix)
	ld	-2 (ix), a
	ld	a, -9 (ix)
	sbc	a, -7 (ix)
	ld	-1 (ix), a
	jp	00171$
00170$:
	ld	a, -8 (ix)
	sub	a, -10 (ix)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	sbc	a, -9 (ix)
	ld	-1 (ix), a
00171$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1327: u16 diffY = (g_Ball.Y > g_Players[i].Y) ? (g_Ball.Y - g_Players[i].Y) : (g_Players[i].Y - g_Ball.Y);
	ld	bc, (#_g_Ball + 0)
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00172$
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	jp	00173$
00172$:
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
00173$:
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1329: if(diffX < hitDist && diffY < hitDist){ 
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
	jp	NC, 00164$
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jp	NC, 00164$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1330: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	a, (#(_g_Ball + 6) + 0)
	ld	-1 (ix), a
	inc	a
	jp	NZ,00159$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1349: if (g_Ball.ShotActive == 1 || g_Ball.PassTargetPlayerId != NO_VALUE) {
	ld	a, (#(_g_Ball + 27) + 0)
	ld	-6 (ix), a
	dec	a
	jr	Z, 00132$
	ld	a, (#(_g_Ball + 16) + 0)
	inc	a
	jp	Z,00133$
00132$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1350: i16 dxStart = (i16)g_Ball.X - (i16)g_Ball.PassStartX;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1351: i16 dyStart = (i16)g_Ball.Y - (i16)g_Ball.PassStartY;
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
	ld	-19 (ix), a
	ld	a, -1 (ix)
	ld	-18 (ix), a
	ld	a, -21 (ix)
	sub	a, -19 (ix)
	ld	-2 (ix), a
	ld	a, -20 (ix)
	sbc	a, -18 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1352: if (dxStart < 0) dxStart = -dxStart;
	ld	a, -4 (ix)
	ld	-19 (ix), a
	ld	a, -3 (ix)
	ld	-18 (ix), a
	bit	7, -18 (ix)
	jr	Z, 00127$
	xor	a, a
	sub	a, -4 (ix)
	ld	-4 (ix), a
	sbc	a, a
	sub	a, -3 (ix)
	ld	-3 (ix), a
00127$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1353: if (dyStart < 0) dyStart = -dyStart;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1354: if ((dxStart + dyStart) < 24) continue; 
	ld	a, -2 (ix)
	add	a, -4 (ix)
	ld	-19 (ix), a
	ld	a, -1 (ix)
	adc	a, -3 (ix)
	ld	-18 (ix), a
	ld	a, -19 (ix)
	ld	-2 (ix), a
	ld	a, -18 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	sub	a, #0x18
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00164$
00133$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1358: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	l, -12 (ix)
	ld	h, -11 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1397: g_Ball.Size = 2;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1358: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, (hl)
	or	a, a
	jp	NZ, 00153$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1360: bool wasShot = (g_Ball.ShotActive != 0);
	ld	a, -6 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1374: u8 team = g_Players[i].TeamId;
	ld	a, -16 (ix)
	add	a, #0x09
	ld	-2 (ix), a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1363: if (g_Ball.ShotActive) {
	ld	a, -6 (ix)
	or	a, a
	jp	Z, 00149$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1364: i16 signedDiffX = (i16)g_Ball.X - (i16)g_Players[i].X;
	ld	a, -10 (ix)
	ld	-5 (ix), a
	ld	a, -9 (ix)
	ld	-4 (ix), a
	ld	a, -8 (ix)
	ld	-11 (ix), a
	ld	a, -7 (ix)
	ld	-10 (ix), a
	ld	a, -5 (ix)
	sub	a, -11 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	sbc	a, -10 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1367: if (signedDiffX >= -5 && signedDiffX <= 5) {
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, #0x05
	cp	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	jp	PO, 00324$
	xor	a, #0x80
00324$:
	rlca
	and	a,#0x01
	ld	b, a
	ld	a, -5 (ix)
	sub	a, #0xfb
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00145$
	bit	0, b
	jr	Z, 00149$
00145$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1374: u8 team = g_Players[i].TeamId;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1378: if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_RIGHT;
	dec	a
	ld	a, #0x01
	jr	Z, 00326$
	xor	a, a
00326$:
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1377: if (signedDiffX > 5) { // Ball to Right
	ld	a, b
	or	a, a
	jr	Z, 00142$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1378: if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_RIGHT;
	ld	a, c
	or	a, a
	jr	Z, 00136$
	ld	c, #0x3f
	jp	00143$
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1379: else divePose = PLAYER_POSE_TEAM2_GK_DOWN_RIGHT;
	ld	c, #0x2f
	jp	00143$
00142$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1381: if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_LEFT;
	ld	a, c
	or	a, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1382: else divePose = PLAYER_POSE_TEAM2_GK_DOWN_LEFT;
	ld	c, #0xa0
	jr	NZ, 00143$
	ld	c, #0xa0
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1385: g_Players[i].PatternId = divePose;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	de, #0x0008
	add	hl, de
	ld	(hl), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1386: g_Players[i].Status = PLAYER_STATUS_POSITIONED; // Lock it
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00149$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1390: PutBallOnPlayerFeet(i);
	ld	a, -17 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1391: GoalkeeperWithBall(g_Players[i].TeamId, !wasShot); 
	ld	a, -3 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	c, a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	b, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_GoalkeeperWithBall
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1392: if (!wasShot) g_GkIsGroundKick = false; // Force Slow/Hand mode for Steals
	ld	a, -3 (ix)
	or	a, a
	jr	NZ, 00151$
	ld	hl, #_g_GkIsGroundKick
	ld	(hl), #0x00
00151$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1395: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1396: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1397: g_Ball.Size = 2;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1399: return; // Stop checking
	jp	00168$
00153$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1403: g_Ball.PassTargetPlayerId = NO_VALUE; 
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1404: g_Ball.ShotActive = 0; 
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1405: g_Ball.KickMoveState = 3; // Force ball to snap to feet immediately (No visual lag)
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1406: g_Ball.Size = 1; // On feet = small
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1407: PutBallOnPlayerFeet(i);
	ld	a, -17 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1408: g_Players[i].Status = PLAYER_STATUS_HAS_BALL;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1409: return; // Stop checking
	jp	00168$
00159$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1413: u8 currentOwner = g_Ball.PossessionPlayerId;
	ld	c, -1 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1416: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1374: u8 team = g_Players[i].TeamId;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	de, #0x0009
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1416: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, b
	or	a, a
	jr	NZ, 00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1417: PutBallOnPlayerFeet(i);
	push	hl
	ld	a, -17 (ix)
	call	_PutBallOnPlayerFeet
	pop	hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1418: GoalkeeperWithBall(g_Players[i].TeamId, 1); // Treat as steal (no recoil)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (hl)
	ld	l, #0x01
	call	_GoalkeeperWithBall
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1419: g_GkIsGroundKick = false; // Force Slow/Hand mode for Steals
	ld	hl, #_g_GkIsGroundKick
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1422: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1423: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1424: g_Ball.Size = 2;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1425: return;
	jp	00168$
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1428: if (g_Players[i].TeamId != g_Players[currentOwner].TeamId) {
	ld	e, (hl)
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
	ld	c, (hl)
	ld	a, e
	sub	a, c
	jr	Z, 00164$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1430: PutBallOnPlayerFeet(i);
	ld	a, -17 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1432: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1433: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1434: return;
	jp	00168$
00164$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1311: for(u8 i=0; i<14; i++){
	inc	-5 (ix)
	ld	a, -5 (ix)
	ld	-17 (ix), a
	jp	00167$
00168$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1439: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1441: void HandleOffside(u8 offsidePlayerId) {
;	---------------------------------
; Function HandleOffside
; ---------------------------------
_HandleOffside::
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1442: V9_PrintLayerAStringAtPos(10,18,"OFFSIDE");
	push	de
	ld	hl, #___str_4
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
	pop	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1443: g_MatchStatus=MATCH_BEFORE_OFFSIDE;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1444: u8 teamId = g_Players[offsidePlayerId].TeamId;
	ld	bc, #_g_Players+0
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1445: g_RestartKickTeamId = (teamId == TEAM_1) ? TEAM_2 : TEAM_1;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1446: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1447: }
	ret
___str_4:
	.ascii "OFFSIDE"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1453: void EnforcePenaltyBoxRestriction() {
;	---------------------------------
; Function EnforcePenaltyBoxRestriction
; ---------------------------------
_EnforcePenaltyBoxRestriction::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1454: if (g_MatchStatus != MATCH_BALL_ON_GOALKEEPER) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1455: return;
	jp	NZ,00119$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1458: u8 gkOwnerId = g_Ball.PossessionPlayerId;
	ld	hl, #_g_Ball+6
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1460: if (gkOwnerId == NO_VALUE || g_Players[gkOwnerId].Role != PLAYER_ROLE_GOALKEEPER) {
	ld	a, c
	inc	a
	jp	Z,00119$
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
	push	de
	pop	iy
	ld	a, 13 (iy)
	or	a, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1461: return;
	jr	NZ, 00119$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1464: u8 gkTeamId = g_Players[gkOwnerId].TeamId;
	ld	hl, #9
	add	hl, de
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1467: for (u8 i = 0; i < 14; i++) { 
	dec	a
	ld	a, #0x01
	jr	Z, 00165$
	xor	a, a
00165$:
	ld	-3 (ix), a
	ld	b, #0x00
00118$:
	ld	a, b
	sub	a, #0x0e
	jr	NC, 00119$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1468: if (i == gkOwnerId) continue; // Skip the GK himself
	ld	a, c
	sub	a, b
	jr	Z, 00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1471: if (g_Players[i].TargetY > PENALTY_BOX_Y_BOTTOM) {
	ld	e, b
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
	ld	de, #0x000e
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1470: if (gkTeamId == TEAM_1) { // Bottom GK has ball, players can't be in y > PENALTY_BOX_Y_BOTTOM
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1471: if (g_Players[i].TargetY > PENALTY_BOX_Y_BOTTOM) {
	ld	a, #0x5e
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1472: g_Players[i].TargetY = PENALTY_BOX_Y_BOTTOM;
	ld	(hl), #0x5e
	inc	hl
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1473: g_Players[i].Status = PLAYER_STATUS_NONE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0012
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00115$
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1476: if (g_Players[i].TargetY < PENALTY_BOX_Y_TOP) {
	ld	a, e
	sub	a, #0x82
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1477: g_Players[i].TargetY = PENALTY_BOX_Y_TOP;
	ld	(hl), #0x82
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1478: g_Players[i].Status = PLAYER_STATUS_NONE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0012
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1467: for (u8 i = 0; i < 14; i++) { 
	inc	b
	jp	00118$
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1482: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1659: void InitPalette()
;	---------------------------------
; Function InitPalette
; ---------------------------------
_InitPalette::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1661: V9_SetPalette(0, 16, g_GameFieldLayerATilesPalette);
	ld	hl, #_g_GameFieldLayerATilesPalette+0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: if (plY < (FIELD_BOUND_Y_TOP + 20)) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1661: V9_SetPalette(0, 16, g_GameFieldLayerATilesPalette);
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1662: V9_SetPalette(16, 16, g_GameFieldLayerBTilesPalette);
	ld	hl, #_g_GameFieldLayerBTilesPalette+0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: if (plY < (FIELD_BOUND_Y_TOP + 20)) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1662: V9_SetPalette(16, 16, g_GameFieldLayerBTilesPalette);
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1663: V9_SelectPaletteP1(0,1);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1664: }
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1667: void TickTeamSelection(){
;	---------------------------------
; Function TickTeamSelection
; ---------------------------------
_TickTeamSelection::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1668: u8 direction= GetJoystick1Direction(); 
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1669: if(direction!=DIRECTION_NONE){
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1672: }
	jp	_GetJoystick1Direction
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1674: void SetTeam1Palette(){
;	---------------------------------
; Function SetTeam1Palette
; ---------------------------------
_SetTeam1Palette::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1675: V9_SetPalette(32, 16, GetTeamPaletteById(g_Team1PaletteId));
	ld	a, (_g_Team1PaletteId+0)
	call	_GetTeamPaletteById
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: if (plY < (FIELD_BOUND_Y_TOP + 20)) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1675: V9_SetPalette(32, 16, GetTeamPaletteById(g_Team1PaletteId));
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1676: }
	jp	00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1677: void SetTeam2Palette(){
;	---------------------------------
; Function SetTeam2Palette
; ---------------------------------
_SetTeam2Palette::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1678: V9_SetPalette(48, 16, GetTeamPaletteById(g_Team2PaletteId));
	ld	a, (_g_Team2PaletteId+0)
	call	_GetTeamPaletteById
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1028: if (plY < (FIELD_BOUND_Y_TOP + 20)) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1678: V9_SetPalette(48, 16, GetTeamPaletteById(g_Team2PaletteId));
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1679: }
	jp	00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1680: const u16* GetTeamPaletteById(u8 id){
;	---------------------------------
; Function GetTeamPaletteById
; ---------------------------------
_GetTeamPaletteById::
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1681: const u16* palette=g_Sprites1_palette_ita;
	ld	de, #_g_Sprites1_palette_ita
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1682: switch (id){
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
	jp	00108$
	jp	00106$
	jp	00105$
	jp	00109$
	jp	00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1683: case TEAM_AUS:
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1684: if(g_FioBre){
	ld	a, (_g_FioBre+0)
	or	a, a
	jr	Z, 00103$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1685: palette=g_Sprites1_palette_fio;
	ld	de, #_g_Sprites1_palette_fio
	ret
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1688: palette=g_Sprites1_palette_aus;
	ld	de, #_g_Sprites1_palette_aus
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1690: break; 
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1691: case TEAM_BRA:
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1692: palette=g_Sprites1_palette_bra;
	ld	de, #_g_Sprites1_palette_bra
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1693: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1694: case TEAM_ITA:
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1695: palette=g_Sprites1_palette_ita;
	ld	de, #_g_Sprites1_palette_ita
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1696: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1697: case TEAM_GBR:
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1698: palette=g_Sprites1_palette_gbr;
	ld	de, #_g_Sprites1_palette_gbr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1699: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1700: case TEAM_GER:
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1701: palette=g_Sprites1_palette_ger;
	ld	de, #_g_Sprites1_palette_ger
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1702: break;
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1703: case TEAM_FRA:
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1704: palette=g_Sprites1_palette_fra;
	ld	de, #_g_Sprites1_palette_fra
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1706: }
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1707: return palette;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1708: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1713: void TickShowKickOff(){
;	---------------------------------
; Function TickShowKickOff
; ---------------------------------
_TickShowKickOff::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1714: if(g_MatchStatus==MATCH_KICK_OFF){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x07
	jr	NZ, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1715: if(g_Timer==1){
	ld	a, (_g_Timer+0)
	dec	a
	jr	NZ, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1716: V9_PrintLayerAStringAtPos(12,18,"KICK OFF");
	ld	hl, #___str_5
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1717: g_Timer=2;
	ld	hl, #_g_Timer
	ld	(hl), #0x02
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1719: if(g_Timer==3){
	ld	a, (_g_Timer+0)
	sub	a, #0x03
	jr	NZ, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1720: ClearTextFromLayerA(12,18,9);
	ld	a, #0x09
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1721: g_Timer=NO_VALUE;
	ld	hl, #_g_Timer
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1723: if(g_RestartKickTeamId==TEAM_1){
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1724: playerId=GetPlayerIdByRole(TEAM_1,PLAYER_ROLE_RIGHT_HALFFIELDER);
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_GetPlayerIdByRole
	ld	c, a
	jp	00105$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1727: playerId=GetPlayerIdByRole(TEAM_2,PLAYER_ROLE_LEFT_HALFFIELDER);
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_GetPlayerIdByRole
	ld	c, a
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1729: PutBallOnPlayerFeet(playerId);
	ld	a, c
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1730: g_MatchStatus=MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1733: if(g_MatchStatus==MATCH_BEFORE_OFFSIDE){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0e
	ret	NZ
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1734: if(g_Timer >= 2) { 
	ld	a, (_g_Timer+0)
	sub	a, #0x02
	ret	C
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1735: ClearTextFromLayerA(10,18,7);
	ld	a, #0x07
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1736: g_Timer = NO_VALUE;
	ld	hl, #_g_Timer
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1738: u8 team = g_RestartKickTeamId; 
	ld	a, (_g_RestartKickTeamId+0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1739: u8 newOwner = GetClosestPlayerToBall(team, NO_VALUE);
;	spillPairReg hl
;	spillPairReg hl
	ld	l, #0xff
	call	_GetClosestPlayerToBall
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1740: if (newOwner != NO_VALUE) {
	ld	c, a
	inc	a
	jr	Z, 00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1741: PutBallOnPlayerFeet(newOwner);
	ld	a, c
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1742: g_Ball.KickMoveState = NO_VALUE;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0xff
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1745: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1748: }
	ret
___str_5:
	.ascii "KICK OFF"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1750: void ResetBallInfo(bool resetPossessionPlayer){
;	---------------------------------
; Function ResetBallInfo
; ---------------------------------
_ResetBallInfo::
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1751: g_Ball.PreviousY=g_Ball.Y;
	ld	de, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1752: g_Ball.KickMoveState=NO_VALUE;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1753: g_Ball.Size=1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1754: g_Ball.Direction=DIRECTION_NONE;
	ld	hl, #(_g_Ball + 5)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1755: if(resetPossessionPlayer){
	ld	a, c
	or	a, a
	ret	Z
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1756: g_Ball.PossessionPlayerId=NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s1_b2.c:1758: }
	ret
	.area _SEG1
	.area _INITIALIZER
	.area _CABS (ABS)
