;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module exsoccer_s2_b0
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _SelectTeam
	.globl _Math_Abs32
	.globl _PrintTeamName
	.globl _SpriteBlinking
	.globl _PenaltyShots
	.globl _TeamVictory
	.globl _ShowField
	.globl _PeopleMoving
	.globl _GetTeamStats
	.globl _PerformPass
	.globl _CornerKick
	.globl _GoalKick
	.globl _BallThrowIn
	.globl _BallInGoal
	.globl _GetNoMovingPlayerPatternId
	.globl _SetPlayerBallPossession
	.globl _PutBallOnPlayerFeet
	.globl _UpdatePlayerPatternByDirection
	.globl _GameStart
	.globl _LoadSprites
	.globl _V9_PrintLayerAStringAtPos
	.globl _LoadP1LayerB
	.globl _LoadP1LayerA
	.globl _InitPalette
	.globl _UpdateV9990
	.globl _V9_SetPaletteEntry
	.globl _V9_SetScrollingBY
	.globl _V9_SetColorMode
	.globl _V9_SetScreenMode
	.globl _V9_Poke16_CurrentAddr
	.globl _V9_WriteVRAM_CurrentAddr
	.globl _V9_FillVRAM16_CurrentAddr
	.globl _V9_FillVRAM_CurrentAddr
	.globl _V9_SetWriteAddress
	.globl _V9_GetRegister
	.globl _V9_SetRegister
	.globl _Keyboard_IsKeyPressed
	.globl _Joystick_Read
	.globl _g_ShowButtonsInfo
	.globl _g_ponPonGirlsInitailized
	.globl _g_peopleState
	.globl _g_PonPonGrilsPoseCounter
	.globl _g_ponPonPatternIndex
	.globl _g_FioBreText
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
	.globl _GetPlayerIdByRole
	.globl _UpdateSpritesPositions
	.globl _PutBallSprite
	.globl _ShowHeaderInfo
	.globl _V9_PutLayerATileAtPos
	.globl _V9_PutLayerBTileAtPos
	.globl _InitPonPonGirls
	.globl _TickPonPonGirlsAnimation
	.globl _PutPonPonGirlSprite
	.globl _PutPlayerSprite
	.globl _ResetPlayersInfo
	.globl _ClearTextFromLayerA
	.globl _TickPlayerToOwnTarget
	.globl _GetNumberString
	.globl _IsTeamJoystickTriggerPressed
	.globl _GetJoystick1Direction
	.globl _GetJoystick2Direction
	.globl _ShowFieldZone
	.globl _TickCheckBallBoundaries
	.globl _TimeUp
	.globl _GetClosestPlayerToBall
	.globl _GetBestPassTarget
	.globl _GoalkeeperWithBall
	.globl _ShowMenu
	.globl _LoadPresentation
	.globl _TickGoalkeeperAnimation
	.globl _PerformShot
	.globl _TickBallFlying
	.globl _TickThrowIn
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
_g_FioBreText::
	.ds 6
_PutBallSprite_s_StopCooldown_65538_1165:
	.ds 1
_TickPlayerToOwnTarget_s_GkMoveTick_131072_1259:
	.ds 1
_GetNumberString_str_65536_1308:
	.ds 5
_TickThrowIn_s_ThrowTargetId_65537_1848:
	.ds 1
_TickThrowIn_s_JoyMoved_65537_1848:
	.ds 1
_TickThrowIn_s_ForceThrowTimer_65537_1848:
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_ponPonPatternIndex::
	.ds 1
_g_PonPonGrilsPoseCounter::
	.ds 1
_g_peopleState::
	.ds 1
_g_ponPonGirlsInitailized::
	.ds 1
_g_ShowButtonsInfo::
	.ds 1
_s_GkAnimTimer:
	.ds 1
_s_GkAnimPlayerId:
	.ds 1
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:115: static u8 s_StopCooldown = 0;
	ld	iy, #_PutBallSprite_s_StopCooldown_65538_1165
	ld	0 (iy), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:392: static u8 s_GkMoveTick = 0;
	ld	iy, #_TickPlayerToOwnTarget_s_GkMoveTick_131072_1259
	ld	0 (iy), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1673: static u8 s_ThrowTargetId = NO_VALUE;
	ld	hl, #_TickThrowIn_s_ThrowTargetId_65537_1848
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1674: static bool s_JoyMoved = false;
	ld	iy, #_TickThrowIn_s_JoyMoved_65537_1848
	ld	0 (iy), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1675: static u16 s_ForceThrowTimer = 0;
	ld	hl, #0x0000
	ld	(_TickThrowIn_s_ForceThrowTimer_65537_1848), hl
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _SEG2
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:81: u8 GetPlayerIdByRole(u8 teamId, u8 role){
;	---------------------------------
; Function GetPlayerIdByRole
; ---------------------------------
_GetPlayerIdByRole::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
	ld	c, a
	ld	-1 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:82: u8 playerId=NO_VALUE;
	ld	-3 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:83: for(u8 i=0;i<14;i++){
	ld	-2 (ix), #0x00
	ld	b, #0x00
00106$:
	ld	a, b
	sub	a, #0x0e
	jr	NC, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:84: if(g_Players[i].Role==role && g_Players[i].TeamId==teamId){
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
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000d
	add	hl, bc
	pop	bc
;	spillPairReg hl
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	NZ, 00107$
	ld	hl, #9
	add	hl, de
	ld	e, (hl)
	ld	a, c
	sub	a, e
	jr	NZ, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:85: playerId=i;
	ld	a, -2 (ix)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:86: break;
	jp	00104$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:83: for(u8 i=0;i<14;i++){
	inc	b
	ld	-2 (ix), b
	jp	00106$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:89: return playerId;
	ld	a, -3 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:90: }
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
_g_TeamPos:
	.dw #0x0021
	.dw #0x006d
	.dw #0x0072
	.dw #0x006d
	.dw #0x00c5
	.dw #0x006d
	.dw #0x0021
	.dw #0x00c0
	.dw #0x0072
	.dw #0x00c0
	.dw #0x00c5
	.dw #0x00c0
_g_TeamGrayPos:
	.dw #0x0001
	.dw #0x0005
	.dw #0x000b
	.dw #0x0005
	.dw #0x0015
	.dw #0x0005
	.dw #0x0001
	.dw #0x000f
	.dw #0x000b
	.dw #0x000f
	.dw #0x0015
	.dw #0x000f
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:93: void UpdateSpritesPositions(){
;	---------------------------------
; Function UpdateSpritesPositions
; ---------------------------------
_UpdateSpritesPositions::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:94: for (u8 i=0;i<15;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0f
	jp	NC,_PutBallSprite
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:95: PutPlayerSprite(i);
	push	bc
	ld	a, c
	call	_PutPlayerSprite
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:94: for (u8 i=0;i<15;i++){
	inc	c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:97: PutBallSprite();
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:98: }
	jp	00103$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:99: void PutBallSprite(){
;	---------------------------------
; Function PutBallSprite
; ---------------------------------
_PutBallSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:101: attr.D=0;
	ld	hl, #0
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #3
	add	hl, sp
	res	4, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:102: attr.SC=0;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:103: attr.Y = g_Ball.Y-g_FieldCurrentYPosition;
	ld	hl, #_g_Ball+0
	ld	d, (hl)
	ld	a, (_g_FieldCurrentYPosition+0)
	ld	e, a
	ld	a, d
	sub	a, e
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:106: u8 logicalSize = g_Ball.Size;
	ld	hl, #_g_Ball + 4
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:108: if (g_Ball.PossessionPlayerId != NO_VALUE) logicalSize = 1;
	ld	a, (#_g_Ball + 6)
	inc	a
	jr	Z, 00102$
	ld	e, #0x01
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:110: if (logicalSize == 0) logicalSize = 1;
	ld	a, e
	or	a, a
	jr	NZ, 00104$
	ld	e, #0x01
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:111: if (logicalSize > 4) logicalSize = 4;
	ld	a, #0x04
	sub	a, e
	jr	NC, 00106$
	ld	e, #0x04
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:116: bool rawMovement = (g_Ball.OldX != g_Ball.X || g_Ball.OldY != g_Ball.Y);
	ld	hl, #(_g_Ball + 9)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -2 (ix)
	sub	a, -4 (ix)
	jr	NZ, 00117$
	ld	a, -1 (ix)
	sub	a, -3 (ix)
	jr	NZ, 00117$
	ld	hl, #(_g_Ball + 11)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	hl, (#_g_Ball + 0)
	ld	a, l
	sub	a, -2 (ix)
	jr	NZ, 00117$
	ld	a, h
	sub	a, -1 (ix)
	jr	NZ, 00117$
	ld	d, #0x00
	jp	00118$
00117$:
	ld	d, #0x01
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:119: g_Ball.OldX = g_Ball.X;
	ld	hl, #(_g_Ball + 9)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:120: g_Ball.OldY = g_Ball.Y;
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	hl, #(_g_Ball + 11)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:122: if (rawMovement) {
	ld	a, d
	or	a, a
	jr	Z, 00110$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:123: s_StopCooldown = 15; // Keep animation active for ~1/4 sec after last move
	ld	a, #0x0f
	ld	(#_PutBallSprite_s_StopCooldown_65538_1165), a
	jp	00111$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:125: if (s_StopCooldown > 0) s_StopCooldown--;
	ld	a, (_PutBallSprite_s_StopCooldown_65538_1165+0)
	or	a, a
	jr	Z, 00111$
	ld	iy, #_PutBallSprite_s_StopCooldown_65538_1165
	dec	0 (iy)
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:128: bool isAnimating = (s_StopCooldown > 0);
	ld	a, (_PutBallSprite_s_StopCooldown_65538_1165+0)
	or	a, a
	ld	a, #0x01
	jr	NZ, 00120$
	xor	a, a
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:132: bool useAlt = isAnimating && ((g_FrameCounter & 8) != 0);
	or	a, a
	jr	Z, 00121$
	ld	hl, (_g_FrameCounter)
	bit	3, l
	jr	NZ, 00122$
00121$:
	xor	a, a
	jp	00123$
00122$:
	ld	a, #0x01
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:139: u8 idx = (logicalSize - 1) * 2 + (useAlt ? 1 : 0);
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	dec	l
	sla	l
	or	a, a
	jr	Z, 00124$
	ld	de, #0x0001
	jp	00125$
00124$:
	ld	de, #0x0000
00125$:
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:140: attr.Pattern = k_BallPatterns[idx & 7];
	ld	de, #_PutBallSprite_k_BallPatterns_65539_1168+0
	ld	a, l
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0x07
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, de
	ld	a, (hl)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:142: attr.X = g_Ball.X;
	ld	de, (#(_g_Ball + 2) + 0)
	ld	hl, #2
	add	hl, sp
	ld	(hl), e
	inc	hl
	ld	a, d
	and	a, #0x03
	push	bc
	ld	c,a
	ld	a, (hl)
	and	a, #0xfc
	or	a, c
	pop	bc
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:143: attr.P = attr.D;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	rlca
	rlca
	rlca
	rlca
	and	a, #0x01
	ld	hl, #3
	add	hl, sp
	rrca
	rrca
	rrca
	and	a, #0x20
	ld	e, a
	ld	a, (hl)
	and	a, #0xdf
	or	a, e
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:144: V9_SetSpriteP1(15, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xfe3c
	ld	hl, #0x0003
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:144: V9_SetSpriteP1(15, &attr);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:145: }
	ld	sp, ix
	pop	ix
	ret
_PutBallSprite_k_BallPatterns_65539_1168:
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x74	; 116	't'
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:147: void PrintTeamName(u8 x, u8 teamPaletteId) {
;	---------------------------------
; Function PrintTeamName
; ---------------------------------
_PrintTeamName::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	-1 (ix), a
	ld	c, l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:149: const char* pName = 0;
	ld	de, #0x0000
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:150: if (g_FioBre) {
	ld	a, (_g_FioBre+0)
	or	a, a
	jr	Z, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:151: if (teamPaletteId == TEAM_AUS) pName = "FIO";
	ld	a, c
	or	a, a
	jr	NZ, 00104$
	ld	de, #___str_0
	jp	00107$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:152: else if (teamPaletteId == TEAM_ITA) pName = "BRE";
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00107$
	ld	de, #___str_1
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:155: if (!pName) {
	ld	a, d
	or	a, e
	jr	NZ, 00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:156: switch (teamPaletteId) {
	ld	a, #0x05
	sub	a, c
	jr	C, 00114$
	ld	b, #0x00
	ld	hl, #00155$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00155$:
	jp	00108$
	jp	00113$
	jp	00110$
	jp	00109$
	jp	00111$
	jp	00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:157: case TEAM_AUS: pName = "AUS"; break;
00108$:
	ld	de, #___str_2
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:158: case TEAM_BRA: pName = "BRA"; break;
00109$:
	ld	de, #___str_3
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:159: case TEAM_ITA: pName = "ITA"; break;
00110$:
	ld	de, #___str_4
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:160: case TEAM_FRA: pName = "FRA"; break;
00111$:
	ld	de, #___str_5
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:161: case TEAM_GBR: pName = "GBR"; break;
00112$:
	ld	de, #___str_6
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:162: case TEAM_GER: pName = "GER"; break;
00113$:
	ld	de, #___str_7
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:163: default:       pName = "   "; break;
00114$:
	ld	de, #___str_8
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:164: }
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:166: V9_PrintLayerAStringAtPos(x, 0, pName);
	push	de
	push	de
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_V9_PrintLayerAStringAtPos
	pop	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:168: g_History1[0] = pName[0];
	ld	a, (de)
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:169: g_History1[1] = pName[1];
	ld	c, e
	ld	b, d
	inc	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:170: g_History1[2] = pName[2];
	inc	de
	inc	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:167: if(x==0){
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00119$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:168: g_History1[0] = pName[0];
	ld	hl, #_g_History1
	ld	a, -2 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:169: g_History1[1] = pName[1];
	inc	hl
	ld	a, (bc)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:170: g_History1[2] = pName[2];
	ld	bc, #_g_History1 + 2
	ld	a, (de)
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:171: g_History1[3] = ':';
	ld	hl, #(_g_History1 + 3)
	ld	(hl), #0x3a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:172: g_History1[4] = ' ';
	ld	hl, #(_g_History1 + 4)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:173: g_History1[5] = ' ';
	ld	hl, #(_g_History1 + 5)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:174: g_History1[6] = ' ';
	ld	hl, #(_g_History1 + 6)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:175: g_History1[7] = ' ';
	ld	hl, #(_g_History1 + 7)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:176: g_History1[8] = ' ';
	ld	hl, #(_g_History1 + 8)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:177: g_History1[9] = ' ';
	ld	hl, #(_g_History1 + 9)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:178: g_History1[10] = '\0';
	ld	hl, #(_g_History1 + 10)
	ld	(hl), #0x00
	jp	00121$
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:181: g_History2[0] = pName[0];
	ld	hl, #_g_History2
	ld	a, -2 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:182: g_History2[1] = pName[1];
	ld	a, (bc)
	ld	(#(_g_History2 + 1)),a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:183: g_History2[2] = pName[2];
	ld	a, (de)
	ld	(#(_g_History2 + 2)),a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:184: g_History2[3] = ':';
	ld	hl, #(_g_History2 + 3)
	ld	(hl), #0x3a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:185: g_History2[4] = ' ';
	ld	hl, #(_g_History2 + 4)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:186: g_History2[5] = ' ';
	ld	hl, #(_g_History2 + 5)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:187: g_History2[6] = ' ';
	ld	hl, #(_g_History2 + 6)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:188: g_History2[7] = ' ';
	ld	hl, #(_g_History2 + 7)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:189: g_History2[8] = ' ';
	ld	hl, #(_g_History2 + 8)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:190: g_History2[9] = ' ';
	ld	hl, #(_g_History2 + 9)
	ld	(hl), #0x20
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:191: g_History2[10] = '\0';
	ld	hl, #(_g_History2 + 10)
	ld	(hl), #0x00
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:193: }
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "FIO"
	.db 0x00
___str_1:
	.ascii "BRE"
	.db 0x00
___str_2:
	.ascii "AUS"
	.db 0x00
___str_3:
	.ascii "BRA"
	.db 0x00
___str_4:
	.ascii "ITA"
	.db 0x00
___str_5:
	.ascii "FRA"
	.db 0x00
___str_6:
	.ascii "GBR"
	.db 0x00
___str_7:
	.ascii "GER"
	.db 0x00
___str_8:
	.ascii "   "
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:195: void ShowHeaderInfo(){
;	---------------------------------
; Function ShowHeaderInfo
; ---------------------------------
_ShowHeaderInfo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:196: u8 pos1 = (g_Team1Score >= 10) ? 4 : 5;
	ld	a, (_g_Team1Score+0)
	sub	a, #0x0a
	jr	C, 00106$
	ld	bc, #0x0004
	jp	00107$
00106$:
	ld	bc, #0x0005
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:197: u8 pos2 = (g_Team2Score >= 10) ? 9 : 10;
	ld	a, (_g_Team2Score+0)
	sub	a, #0x0a
	jr	C, 00108$
	ld	de, #0x0009
	jp	00109$
00108$:
	ld	de, #0x000a
00109$:
	ld	-1 (ix), e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:199: PrintTeamName(0, g_Team1PaletteId);
	push	bc
	ld	a, (_g_Team1PaletteId+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	call	_PrintTeamName
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:201: V9_PrintLayerAStringAtPos(pos1, 0, GetNumberString(g_Team1Score));
	ld	a, (_g_Team1Score+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_GetNumberString
	pop	bc
	push	de
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:202: V9_PrintLayerAStringAtPos(7, 0, "-");
	ld	hl, #___str_9
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:203: V9_PrintLayerAStringAtPos(pos2, 0, GetNumberString(g_Team2Score));
	ld	a, (_g_Team2Score+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	call	_GetNumberString
	push	de
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:205: PrintTeamName(12, g_Team2PaletteId);
	ld	a, (_g_Team2PaletteId+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_PrintTeamName
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:206: u8 minutes=g_SecondsToEndOfMatch / 60;
	ld	a, (_g_SecondsToEndOfMatch+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x003c
	call	__divsint
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:207: u8 seconds=g_SecondsToEndOfMatch - minutes*60;
	ld	a, e
	ld	c, a
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	sub	a, c
	add	a, a
	add	a, a
	ld	c, a
	ld	a, (_g_SecondsToEndOfMatch+0)
	sub	a, c
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:208: V9_PrintLayerAStringAtPos(28,0,GetNumberString(minutes));
	ld	d, #0x00
	push	bc
	ex	de, hl
	call	_GetNumberString
	push	de
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x1c
	call	_V9_PrintLayerAStringAtPos
	ld	hl, #___str_10
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x1d
	call	_V9_PrintLayerAStringAtPos
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:211: V9_PrintLayerAStringAtPos(30,0,GetNumberString(seconds));
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:210: if(seconds>=10){
	ld	a, c
	sub	a, #0x0a
	jr	C, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:211: V9_PrintLayerAStringAtPos(30,0,GetNumberString(seconds));
	call	_GetNumberString
	push	de
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x1e
	call	_V9_PrintLayerAStringAtPos
	jp	00104$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:214: V9_PrintLayerAStringAtPos(30,0,"0");
	ld	bc, #___str_11+0
	push	hl
	push	bc
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x1e
	call	_V9_PrintLayerAStringAtPos
	pop	hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:215: V9_PrintLayerAStringAtPos(31,0,GetNumberString(seconds));
	call	_GetNumberString
	push	de
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x1f
	call	_V9_PrintLayerAStringAtPos
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:217: }
	inc	sp
	pop	ix
	ret
___str_9:
	.ascii "-"
	.db 0x00
___str_10:
	.ascii ":"
	.db 0x00
___str_11:
	.ascii "0"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:220: void V9_PutLayerATileAtPos(u8 x, u8 y, u16 tileId) {
;	---------------------------------
; Function V9_PutLayerATileAtPos
; ---------------------------------
_V9_PutLayerATileAtPos::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:221: V9_Poke16(V9_CellAddrP1A(x,y), tileId);
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:1426: inline u32 V9_CellAddrP1A(u8 x, u8 y) { return V9_P1_PNT_A + (((64 * y) + x) * 2); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	d, #0x00
	add	hl, de
	add	hl, hl
	ld	a, h
	rlca
	sbc	a, a
	ld	e, a
	ld	d, a
	ld	a, h
	add	a, #0xc0
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	adc	a, #0x07
	ld	e, a
	jr	NC, 00105$
	inc	d
00105$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:396: inline void V9_Poke16(u32 addr, u16 val) { V9_SetWriteAddress(addr); V9_Poke16_CurrentAddr(val); }
	push	bc
	ex	de, hl
	call	_V9_SetWriteAddress
	pop	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_V9_Poke16_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:221: V9_Poke16(V9_CellAddrP1A(x,y), tileId);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:222: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:223: void V9_PutLayerBTileAtPos(u8 x, u8 y, u16 tileId) {
;	---------------------------------
; Function V9_PutLayerBTileAtPos
; ---------------------------------
_V9_PutLayerBTileAtPos::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:224: V9_Poke16(V9_CellAddrP1B(x,y), tileId);
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:1437: inline u32 V9_CellAddrP1B(u8 x, u8 y) { return V9_P1_PNT_B + (((64 * y) + x) * 2); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	d, #0x00
	add	hl, de
	add	hl, hl
	ld	a, h
	rlca
	sbc	a, a
	ld	e, a
	ld	d, a
	ld	a, h
	add	a, #0xe0
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	adc	a, #0x07
	ld	e, a
	jr	NC, 00105$
	inc	d
00105$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:396: inline void V9_Poke16(u32 addr, u16 val) { V9_SetWriteAddress(addr); V9_Poke16_CurrentAddr(val); }
	push	bc
	ex	de, hl
	call	_V9_SetWriteAddress
	pop	bc
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_V9_Poke16_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:224: V9_Poke16(V9_CellAddrP1B(x,y), tileId);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:225: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:227: void InitPonPonGirls(){
;	---------------------------------
; Function InitPonPonGirls
; ---------------------------------
_InitPonPonGirls::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-10
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:228: g_ponPonPatternIndex=0;
	ld	hl, #_g_ponPonPatternIndex
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:229: u8 pos[6]={30,50,70,175,195,215};
	ld	-10 (ix), #0x1e
	ld	-9 (ix), #0x32
	ld	-8 (ix), #0x46
	ld	-7 (ix), #0xaf
	ld	-6 (ix), #0xc3
	ld	-5 (ix), #0xd7
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:230: for(u8 i=0;i<6;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x06
	jr	NC, 00105$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:231: g_PonPonGirls[i].X=pos[i];
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_g_PonPonGirls
	add	hl, de
	ex	de, hl
	ld	hl, #0x0002
	add	hl, de
	ld	-4 (ix), l
	ld	-3 (ix), h
	push	de
	ld	e, c
	ld	d, #0x00
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:232: g_PonPonGirls[i].Y=42;
	ld	l, e
	ld	h, d
	ld	(hl), #0x2a
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:233: g_PonPonGirls[i].PatternId=SPRITE_GIRL_1;
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x7a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:234: PutPonPonGirlSprite(i);
	push	bc
	ld	a, c
	call	_PutPonPonGirlSprite
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:230: for(u8 i=0;i<6;i++){
	inc	c
	jp	00103$
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:236: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:237: void TickPonPonGirlsAnimation(){
;	---------------------------------
; Function TickPonPonGirlsAnimation
; ---------------------------------
_TickPonPonGirlsAnimation::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:238: if(g_MatchStatus!=MATCH_AFTER_IN_GOAL){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x06
	jr	Z, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:239: if(!g_ponPonGirlsInitailized){
	ld	a, (_g_ponPonGirlsInitailized+0)
	or	a, a
	ret	NZ
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:240: InitPonPonGirls();
	call	_InitPonPonGirls
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:241: g_ponPonGirlsInitailized=true;
	ld	hl, #_g_ponPonGirlsInitailized
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:244: return;
	ret
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:246: g_ponPonGirlsInitailized=false;
	ld	hl, #_g_ponPonGirlsInitailized
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:247: if(g_PonPonGrilsPoseCounter==PON_PON_GIRLS_POSE_SPEED){
	ld	a, (_g_PonPonGrilsPoseCounter+0)
	sub	a, #0x03
	jr	NZ, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:248: g_PonPonGrilsPoseCounter=0;
	ld	hl, #_g_PonPonGrilsPoseCounter
	ld	(hl), #0x00
	jp	00107$
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:251: g_PonPonGrilsPoseCounter++;
	ld	hl, #_g_PonPonGrilsPoseCounter
	inc	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:252: return;
	ret
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:261: g_ponPonPatternIndex++;
	ld	iy, #_g_ponPonPatternIndex
	inc	0 (iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:262: if(g_ponPonPatternIndex >= 9) g_ponPonPatternIndex = 0;
	ld	a, (_g_ponPonPatternIndex+0)
	sub	a, #0x09
	jr	C, 00109$
	ld	0 (iy), #0x00
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:264: u8 pat = k_GirlPatterns[g_ponPonPatternIndex];
	ld	bc, #_TickPonPonGirlsAnimation_k_GirlPatterns_65537_1211+0
	ld	hl, (_g_ponPonPatternIndex)
	ld	h, #0x00
	add	hl, bc
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:266: for(u8 i=0; i<6; i++){
	ld	b, #0x00
00112$:
	ld	a, b
	sub	a, #0x06
	jr	NC, 00110$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:267: g_PonPonGirls[i].PatternId = pat;
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_g_PonPonGirls
	add	hl, de
	ld	de, #0x0004
	add	hl, de
	ld	(hl), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:268: PutPonPonGirlSprite(i);
	push	bc
	ld	a, b
	call	_PutPonPonGirlSprite
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:266: for(u8 i=0; i<6; i++){
	inc	b
	jp	00112$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:270: g_peopleState=!g_peopleState;
	ld	a, (_g_peopleState+0)
	sub	a,#0x01
	ld	a, #0x00
	rla
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:271: PeopleMoving(g_peopleState);
	ld	(_g_peopleState+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:272: }
	jp	_PeopleMoving
_TickPonPonGirlsAnimation_k_GirlPatterns_65537_1211:
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x7f	; 127
	.db #0xf0	; 240
	.db #0xf1	; 241
	.db #0xf2	; 242
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:273: void PutPonPonGirlSprite(u8 ponPonGirlId){
;	---------------------------------
; Function PutPonPonGirlSprite
; ---------------------------------
_PutPonPonGirlSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:275: attr.D=0;
	ld	hl, #3
	add	hl, sp
	res	4, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:277: attr.SC=0;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:278: attr.Y=g_PonPonGirls[ponPonGirlId].Y-g_FieldCurrentYPosition;
	ld	bc, #_g_PonPonGirls+0
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ex	de, hl
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_FieldCurrentYPosition+0)
	ld	c, a
	ld	a, l
	sub	a, c
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:279: attr.X=g_PonPonGirls[ponPonGirlId].X;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #2
	add	hl, sp
	ld	(hl), c
	inc	hl
	ld	a, b
	and	a, #0x03
	ld	c,a
	ld	a, (hl)
	and	a, #0xfc
	or	a, c
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:280: if(g_ActiveFieldZone!=FIELD_NORTH_ZONE||attr.Y>100){
	ld	a, (_g_ActiveFieldZone+0)
	or	a, a
	jr	NZ, 00101$
	ld	c, -5 (ix)
	ld	a, #0x64
	sub	a, c
	jr	NC, 00102$
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:281: attr.D=1;
	ld	hl, #3
	add	hl, sp
	set	4, (hl)
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:283: attr.Pattern = g_PonPonGirls[ponPonGirlId].PatternId;
	ld	hl, #4
	add	hl, de
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:284: attr.P = 1;
	ld	hl, #3
	add	hl, sp
	set	5, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:285: V9_SetSpriteP1(ponPonGirlId+20, &attr);
	ld	a, -1 (ix)
	add	a, #0x14
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	a, h
	rlca
	sbc	a, a
	ld	e, a
	ld	d, a
	ld	a, h
	add	a, #0xfe
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	adc	a, #0x03
	ld	e, a
	jr	NC, 00113$
	inc	d
00113$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ex	de, hl
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:285: V9_SetSpriteP1(ponPonGirlId+20, &attr);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:286: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:287: void PutPlayerSprite(u8 playerId){
;	---------------------------------
; Function PutPlayerSprite
; ---------------------------------
_PutPlayerSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-23
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:289: attr.D=0;
	ld	hl, #3
	add	hl, sp
	res	4, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:290: attr.SC=2;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	or	a, #0x80
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:291: u16 minY=g_FieldCurrentYPosition+16;
	ld	hl, (_g_FieldCurrentYPosition)
	ld	de, #0x0010
	add	hl, de
	ld	c, l
	ld	b, h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:292: u16 maxY=g_FieldCurrentYPosition+235;
	ld	hl, (_g_FieldCurrentYPosition)
	ld	de, #0x00eb
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:294: attr.Y = g_Players[playerId].Y-g_FieldCurrentYPosition;
	push	hl
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	ld	a, #<(_g_Players)
	add	a, l
	ld	-19 (ix), a
	ld	a, #>(_g_Players)
	adc	a, h
	ld	-18 (ix), a
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	h, (hl)
;	spillPairReg hl
	ld	a, (_g_FieldCurrentYPosition+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	sub	a, l
	ld	-23 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:295: if(g_Players[playerId].TeamId==TEAM_2){
	ld	a, -19 (ix)
	add	a, #0x09
	ld	-17 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-16 (ix), a
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:296: attr.SC=3;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	or	a, #0xc0
	ld	(hl), a
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:299: if(g_Players[playerId].TeamId==REFEREE){
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	a, (hl)
	sub	a, #0x0e
	jr	NZ, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:300: attr.SC=1;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	or	a, #0x40
	ld	(hl), a
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:303: if(g_Players[playerId].Y>maxY){
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	sub	a, l
	ld	a, d
	sbc	a, h
	jr	NC, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:304: attr.D=1;
	ld	hl, #3
	add	hl, sp
	set	4, (hl)
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:306: if(g_Players[playerId].Y<minY){
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:307: attr.D=1;
	ld	hl, #3
	add	hl, sp
	set	4, (hl)
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:310: if(g_Players[playerId].Role!=PLAYER_ROLE_GOALKEEPER){
	ld	a, -19 (ix)
	add	a, #0x0d
	ld	-15 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-14 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:309: if(g_MatchStatus!=MATCH_NOT_STARTED && g_MatchStatus!=MATCH_KICK_OFF){
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jr	Z, 00112$
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x07
	jr	Z, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:310: if(g_Players[playerId].Role!=PLAYER_ROLE_GOALKEEPER){
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	or	a, a
	jr	Z, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:311: UpdatePlayerPatternByDirection(playerId);
	ld	a, -1 (ix)
	call	_UpdatePlayerPatternByDirection
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:314: if(g_Players[playerId].Role==PLAYER_ROLE_GOALKEEPER){
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:322: if(g_Players[playerId].OldX!=g_Players[playerId].X || g_Players[playerId].OldY!=g_Players[playerId].Y){
	ld	a, -19 (ix)
	add	a, #0x02
	ld	-13 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-12 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:324: g_Players[playerId].PatternId = (team == TEAM_1) ? PLAYER_POSE_GK_H_MOVE_BACK_1 : PLAYER_POSE_GK_H_MOVE_FRONT_1;
	ld	a, -19 (ix)
	add	a, #0x08
	ld	-11 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:314: if(g_Players[playerId].Role==PLAYER_ROLE_GOALKEEPER){
	ld	a, c
	or	a, a
	jp	NZ, 00125$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:315: attr.SC=0;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:318: if (g_MatchStatus == MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jr	Z, 00120$
	sub	a, #0x0d
	jp	NZ,00121$
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:319: g_Players[playerId].Status=PLAYER_STATUS_POSITIONED;
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:320: u8 team = g_Players[playerId].TeamId;
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:322: if(g_Players[playerId].OldX!=g_Players[playerId].X || g_Players[playerId].OldY!=g_Players[playerId].Y){
	ld	a, -19 (ix)
	add	a, #0x04
	ld	-9 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	a, -19 (ix)
	add	a, #0x06
	ld	-7 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, c
	cp	a, a
	sbc	hl, de
	jr	NZ, 00117$
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, c
	cp	a, a
	sbc	hl, de
	jp	Z,00125$
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:323: if(g_Players[playerId].LastPose==0){
	ld	a, -19 (ix)
	add	a, #0x0c
	ld	-5 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:324: g_Players[playerId].PatternId = (team == TEAM_1) ? PLAYER_POSE_GK_H_MOVE_BACK_1 : PLAYER_POSE_GK_H_MOVE_FRONT_1;
	dec	b
	ld	a, #0x01
	jr	Z, 00287$
	xor	a, a
00287$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:323: if(g_Players[playerId].LastPose==0){
	inc	c
	dec	c
	jr	NZ, 00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:324: g_Players[playerId].PatternId = (team == TEAM_1) ? PLAYER_POSE_GK_H_MOVE_BACK_1 : PLAYER_POSE_GK_H_MOVE_FRONT_1;
	or	a, a
	jr	Z, 00145$
	ld	-3 (ix), #0xa4
	ld	-2 (ix), #0
	jp	00146$
00145$:
	ld	-3 (ix), #0x2b
	ld	-2 (ix), #0
00146$:
	ld	a, -3 (ix)
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:325: g_Players[playerId].LastPose=1;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x01
	jp	00116$
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:328: g_Players[playerId].PatternId = (team == TEAM_1) ? PLAYER_POSE_GK_H_MOVE_BACK_2 : PLAYER_POSE_GK_H_MOVE_FRONT_2;
	or	a, a
	jr	Z, 00147$
	ld	bc, #0x00a3
	jp	00148$
00147$:
	ld	bc, #0x002c
00148$:
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:329: g_Players[playerId].LastPose=0;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), #0x00
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:331: g_Players[playerId].OldX=g_Players[playerId].X;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:332: g_Players[playerId].OldY=g_Players[playerId].Y;	
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00125$
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:337: UpdatePlayerPatternByDirection(playerId);
	ld	a, -1 (ix)
	call	_UpdatePlayerPatternByDirection
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:340: attr.Pattern = g_Players[playerId].PatternId;
	ld	hl,#0x1
	add	hl,sp
	ld	c, l
	ld	b, h
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:343: if(g_Players[playerId].TeamId != REFEREE && g_MatchStatus != MATCH_PENALTY_SHOOTOUT && g_MatchStatus != MATCH_PENALTY_SETUP && g_MatchStatus != MATCH_VICTORY_LAP)
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	e, (hl)
	ld	a, e
	sub	a, #0x0e
	jr	Z, 00137$
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x11
	jr	Z, 00137$
	cp	a,#0x12
	jr	Z, 00137$
	sub	a, #0x10
	jr	Z, 00137$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:345: bool isHumanTeam = (g_Players[playerId].TeamId == TEAM_1) || (g_GameWith2Players && g_Players[playerId].TeamId == TEAM_2);
	ld	a, e
	dec	a
	jr	Z, 00150$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00149$
	ld	a, e
	sub	a, #0x02
	jr	Z, 00150$
00149$:
	xor	a, a
	jp	00151$
00150$:
	ld	a, #0x01
00151$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:347: if (isHumanTeam) {
	or	a, a
	jr	Z, 00137$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:349: if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) {
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	or	a, a
	jr	Z, 00131$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:350: if (playerId==g_Team1ActivePlayer || (g_GameWith2Players && playerId==g_Team2ActivePlayer)) {
	ld	a, (_g_Team1ActivePlayer+0)
	sub	a, -1 (ix)
	jr	Z, 00126$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00131$
	ld	a, (_g_Team2ActivePlayer+0)
	sub	a, -1 (ix)
	jr	NZ, 00131$
00126$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:352: attr.Pattern=(u8)(attr.Pattern+64);
	ld	a, (bc)
	add	a, #0x40
	ld	(bc), a
00131$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:357: if (playerId == g_PassTargetPlayer) {
	ld	a, -1 (ix)
	ld	hl, #_g_PassTargetPlayer
	sub	a, (hl)
	jr	NZ, 00137$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:358: attr.Pattern=(u8)(attr.Pattern+64);
	ld	a, (bc)
	add	a, #0x40
	ld	(bc), a
00137$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:364: attr.X = g_Players[playerId].X;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #2
	add	hl, sp
	ld	(hl), c
	inc	hl
	ld	a, b
	and	a, #0x03
	ld	e,a
	ld	a, (hl)
	and	a, #0xfc
	or	a, e
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:365: attr.P = 1;
	ld	hl, #3
	add	hl, sp
	set	5, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:366: V9_SetSpriteP1(playerId, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	a, h
	rlca
	sbc	a, a
	ld	e, a
	ld	d, a
	ld	a, h
	add	a, #0xfe
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	adc	a, #0x03
	ld	e, a
	jr	NC, 00299$
	inc	d
00299$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ex	de, hl
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:366: V9_SetSpriteP1(playerId, &attr);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:368: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:371: void ResetPlayersInfo(){
;	---------------------------------
; Function ResetPlayersInfo
; ---------------------------------
_ResetPlayersInfo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:372: SetPlayerBallPossession(NO_VALUE);
	ld	a, #0xff
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:373: for(u8 i=0;i<14;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0e
	jr	NC, 00105$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:374: g_Players[i].Direction=DIRECTION_NONE;
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
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:375: g_Players[i].PreviousDirection=g_Players[i].Direction;
	ld	a, e
	add	a, #0x0b
	ld	b, a
	ld	a, d
	adc	a, #0x00
	push	af
	ld	a, (hl)
	ld	-1 (ix), a
	pop	af
	ld	l, b
	ld	h, a
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:376: g_Players[i].LastPose=0;
	ld	hl, #0x000c
	add	hl, de
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:377: g_Players[i].Status=PLAYER_STATUS_NONE;
	ld	hl, #0x0012
	add	hl, de
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	dec	hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:378: g_Players[i].Status=PLAYER_STATUS_NONE;
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:373: for(u8 i=0;i<14;i++){
	inc	c
	jp	00103$
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:380: }
	inc	sp
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:381: void ClearTextFromLayerA(u8 x, u8 y, u8 length){
;	---------------------------------
; Function ClearTextFromLayerA
; ---------------------------------
_ClearTextFromLayerA::
	ld	c, a
	ld	b, l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:382: for(u8 i=0;i<length;i++){
	ld	e, #0x00
00103$:
	ld	hl, #2
	add	hl, sp
	ld	a, e
	sub	a, (hl)
	jr	NC, 00105$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:383: V9_PutLayerATileAtPos(x,y,0);
	push	bc
	push	de
	ld	hl, #0x0000
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_V9_PutLayerATileAtPos
	pop	de
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:384: x++;
	inc	c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:382: for(u8 i=0;i<length;i++){
	inc	e
	jp	00103$
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:386: }
	pop	hl
	inc	sp
	jp	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:387: void TickPlayerToOwnTarget(){
;	---------------------------------
; Function TickPlayerToOwnTarget
; ---------------------------------
_TickPlayerToOwnTarget::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:389: if(g_MatchStatus!=MATCH_NOT_STARTED){
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jp	Z, 00272$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:390: bool allPlayersInPosition = true;
	ld	-16 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:393: s_GkMoveTick++;
	ld	hl, #_TickPlayerToOwnTarget_s_GkMoveTick_131072_1259
	inc	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:394: for(u8 i=0;i<15;i++){
	ld	-1 (ix), #0x00
00271$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	NC, 00263$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:396: if (g_MatchStatus == MATCH_IN_ACTION && g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jp	NZ,00115$
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
	ld	c, l
	ld	b, h
	push	bc
	pop	iy
	ld	a, 13 (iy)
	or	a, a
	jp	NZ, 00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:398: if (g_Ball.ShotActive) continue; 
	ld	a, (#_g_Ball + 27)
	or	a, a
	jp	NZ, 00262$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:401: if ((s_GkMoveTick & 1) == 0) { 
	ld	a, (_TickPlayerToOwnTarget_s_GkMoveTick_131072_1259+0)
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:409: i16 diff = (i16)desiredX - (i16)g_Players[i].X;
	ld	hl, #0x0002
	add	hl, bc
	ld	-5 (ix), l
	ld	-4 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:401: if ((s_GkMoveTick & 1) == 0) { 
	bit	0, e
	jr	NZ, 00113$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:404: u16 desiredX = g_Ball.X;
	ld	hl, (#_g_Ball + 2)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:406: if (desiredX < minX) desiredX = minX;
	ld	a, l
	sub	a, #0x60
	ld	a, h
	sbc	a, #0x00
	jr	NC, 00104$
	ld	hl, #0x0060
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:407: if (desiredX > maxX) desiredX = maxX;
	ld	a, #0x90
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00106$
	ld	hl, #0x0090
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:409: i16 diff = (i16)desiredX - (i16)g_Players[i].X;
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:412: if (diff > 2) g_Players[i].X++;
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	a, #0x02
	cp	a, -3 (ix)
	ld	a, #0x00
	sbc	a, -2 (ix)
	jp	PO, 00731$
	xor	a, #0x80
00731$:
	jp	P, 00110$
	inc	de
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00113$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:413: else if (diff < -2) g_Players[i].X--;
	ld	a, l
	sub	a, #0xfe
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00113$
	dec	de
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:416: g_Players[i].TargetX = g_Players[i].X;
	ld	hl, #0x0010
	add	hl, bc
	ex	de, hl
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:420: if(i != REFEREE) continue;
	ld	a, -1 (ix)
	sub	a, #0x0e
	ld	a, #0x01
	jr	Z, 00733$
	xor	a, a
00733$:
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:419: if(g_MatchStatus == MATCH_AFTER_IN_GOAL) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x06
	jr	NZ, 00120$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:420: if(i != REFEREE) continue;
	bit	0, c
	jp	Z, 00262$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:422: g_Players[i].TargetX=FIELD_POS_X_CENTER - 30; 
	ld	e, -1 (ix)
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
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:423: g_Players[i].TargetY=FIELD_POS_Y_CENTER - 40; 
	ld	hl, #0x000e
	add	hl, de
	ld	(hl), #0xcb
	inc	hl
	ld	(hl), #0x00
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:426: if (i == REFEREE && (g_MatchStatus == MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER)) continue;
	ld	a, c
	or	a, a
	jr	Z, 00122$
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jp	Z,00262$
	sub	a, #0x0d
	jp	Z,00262$
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:429: bool isSetPieceSetup = (g_MatchStatus == MATCH_BEFORE_CORNER_KICK || g_MatchStatus == MATCH_BEFORE_GOAL_KICK || g_MatchStatus == MATCH_BEFORE_OFFSIDE || g_MatchStatus == MATCH_BEFORE_THROW_IN);
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x02
	jr	Z, 00275$
	cp	a,#0x05
	jr	Z, 00275$
	cp	a,#0x0e
	jr	Z, 00275$
	sub	a, #0x03
	jr	Z, 00275$
	xor	a, a
	jp	00276$
00275$:
	ld	a, #0x01
00276$:
	ld	-15 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:430: bool isGkRestart = (g_MatchStatus == MATCH_BALL_ON_GOALKEEPER);
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0d
	ld	a, #0x01
	jr	Z, 00743$
	xor	a, a
00743$:
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:432: if (!isSetPieceSetup && !isGkRestart) {
	ld	a, -15 (ix)
	or	a,a
	jr	NZ, 00133$
	or	a,c
	jr	NZ, 00133$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:433: if (g_Team1ActivePlayer != NO_VALUE && i == g_Team1ActivePlayer) continue;
	ld	a, (_g_Team1ActivePlayer+0)
	inc	a
	jr	Z, 00126$
	ld	a, -1 (ix)
	ld	hl, #_g_Team1ActivePlayer
	sub	a, (hl)
	jp	Z,00262$
00126$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:434: if (g_GameWith2Players && g_Team2ActivePlayer != NO_VALUE && i == g_Team2ActivePlayer) continue;
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00133$
	ld	a, (_g_Team2ActivePlayer+0)
	inc	a
	jr	Z, 00133$
	ld	a, -1 (ix)
	ld	hl, #_g_Team2ActivePlayer
	sub	a, (hl)
	jp	Z,00262$
00133$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:438: bool playerInPosition = (g_Players[i].X == g_Players[i].TargetX && g_Players[i].Y == g_Players[i].TargetY);
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
	ld	-14 (ix), l
	ld	-13 (ix), h
	ld	a, -14 (ix)
	add	a, #0x02
	ld	-12 (ix), a
	ld	a, -13 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -14 (ix)
	add	a, #0x10
	ld	-3 (ix), a
	ld	a, -13 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, e
	cp	a, a
	sbc	hl, bc
	jr	NZ, 00283$
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
	ld	a, -14 (ix)
	ld	-5 (ix), a
	ld	a, -13 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	sub	a, -5 (ix)
	jr	NZ, 00750$
	ld	a, -6 (ix)
	sub	a, -4 (ix)
	jr	Z, 00284$
00750$:
00283$:
	xor	a, a
	jp	00285$
00284$:
	ld	a, #0x01
00285$:
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:441: if (g_MatchStatus == MATCH_BEFORE_KICK_OFF && !playerInPosition) {
	ld	a, (_g_MatchStatus+0)
	dec	a
	jr	NZ, 00136$
	ld	a, -10 (ix)
	or	a, a
	jr	NZ, 00136$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:442: allPlayersInPosition = false;
	ld	-16 (ix), #0x00
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:445: if(g_MatchStatus==MATCH_IN_ACTION){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jp	NZ,00166$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:446: const TeamStats* stats = GetTeamStats(g_Players[i].TeamId);
	ld	c, -14 (ix)
	ld	b, -13 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	call	_GetTeamStats
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:447: u8 speed = stats->Speed;
	ld	a, (de)
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:458: u8 tick = g_FrameCounter % 12; // Common multiple
	ld	hl, (_g_FrameCounter)
	ld	de, #0x000c
	call	__moduint
	ld	-4 (ix), e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:459: bool move = false;
	ld	c, #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:460: if (speed == 0) { if ((tick % 4) == 0) move = true; }
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00161$
	ld	a, -4 (ix)
	and	a, #0x03
	jr	NZ, 00162$
	ld	c, #0x01
	jp	00162$
00161$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:461: else if (speed == 1) { if ((tick % 3) == 0) move = true; }
	ld	a, -5 (ix)
	dec	a
	jr	NZ, 00158$
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0003
	call	__modsint
	pop	bc
	ld	a, d
	or	a, e
	jr	NZ, 00162$
	ld	c, #0x01
	jp	00162$
00158$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:462: else if (speed == 2) { if ((tick % 2) == 0) move = true; }
	ld	a, -5 (ix)
	sub	a, #0x02
	jr	NZ, 00155$
	bit	0, -4 (ix)
	jr	NZ, 00162$
	ld	c, #0x01
	jp	00162$
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:463: else if (speed == 3) { if ((tick % 3) != 2) move = true; } // 0, 1, 3, 4...
	ld	a, -5 (ix)
	sub	a, #0x03
	jr	NZ, 00152$
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0003
	call	__modsint
	pop	bc
	ld	a, e
	sub	a, #0x02
	or	a, d
	jr	Z, 00162$
	ld	c, #0x01
	jp	00162$
00152$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:464: else if (speed == 4) { if ((tick % 4) != 3) move = true; }
	ld	a, -5 (ix)
	sub	a, #0x04
	jr	NZ, 00149$
	ld	a, -4 (ix)
	and	a, #0x03
	ld	b, a
	ld	e, #0x00
	ld	a, b
	sub	a, #0x03
	or	a, e
	jr	Z, 00162$
	ld	c, #0x01
	jp	00162$
00149$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:465: else move = true;
	ld	c, #0x01
00162$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:467: if (!move) continue;
	ld	a, c
	or	a, a
	jr	NZ, 00167$
	jp	00262$
00166$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:469: g_Players[i].AiTickCounter=0;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x0014
	add	hl, de
	ld	(hl), #0x00
00167$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:472: if(!playerInPosition){
	ld	a, -10 (ix)
	or	a, a
	jp	NZ, 00208$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:473: g_Players[i].Status=PLAYER_STATUS_NONE;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x0012
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:438: bool playerInPosition = (g_Players[i].X == g_Players[i].TargetX && g_Players[i].Y == g_Players[i].TargetY);
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:474: if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
	ld	a, -9 (ix)
	sub	a, -7 (ix)
	ld	a, -8 (ix)
	sbc	a, -6 (ix)
	ld	a, #0x00
	rla
	ld	-3 (ix), a
	or	a, a
	jr	Z, 00196$
	ld	c, -14 (ix)
	ld	b, -13 (ix)
	ld	hl, #14
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, -5 (ix)
	ld	a, b
	sbc	a, -4 (ix)
	jr	NC, 00196$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:475: g_Players[i].Direction=DIRECTION_UP_RIGHT;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:476: g_Players[i].X++;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:477: g_Players[i].Y--;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00197$
00196$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:479: else if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
	ld	a, -7 (ix)
	sub	a, -9 (ix)
	ld	a, -6 (ix)
	sbc	a, -8 (ix)
	ld	a, #0x00
	rla
	ld	-2 (ix), a
	or	a, a
	jr	Z, 00192$
	ld	c, -14 (ix)
	ld	b, -13 (ix)
	ld	hl, #14
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, -5 (ix)
	ld	a, b
	sbc	a, -4 (ix)
	jr	NC, 00192$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:480: g_Players[i].Direction=DIRECTION_UP_LEFT;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x08
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:481: g_Players[i].X--;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:482: g_Players[i].Y--;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00197$
00192$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:484: else if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00188$
	ld	c, -14 (ix)
	ld	b, -13 (ix)
	ld	hl, #14
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -5 (ix)
	sub	a, c
	ld	a, -4 (ix)
	sbc	a, b
	jr	NC, 00188$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:485: g_Players[i].Direction=DIRECTION_DOWN_LEFT;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x06
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:486: g_Players[i].X--;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:487: g_Players[i].Y++;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00197$
00188$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:489: else if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00184$
	ld	c, -14 (ix)
	ld	b, -13 (ix)
	ld	hl, #14
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -5 (ix)
	sub	a, c
	ld	a, -4 (ix)
	sbc	a, b
	jr	NC, 00184$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:490: g_Players[i].Direction=DIRECTION_DOWN_RIGHT;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:491: g_Players[i].X++;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:492: g_Players[i].Y++;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00197$
00184$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:494: else if(g_Players[i].X==g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
	ld	a, -9 (ix)
	sub	a, -7 (ix)
	jr	NZ, 00769$
	ld	a, -8 (ix)
	sub	a, -6 (ix)
	ld	a, #0x01
	jr	Z, 00770$
00769$:
	xor	a, a
00770$:
	ld	c, a
	or	a, a
	jr	Z, 00180$
	ld	e, -14 (ix)
	ld	d, -13 (ix)
	ld	hl, #14
	add	hl, de
	ld	b, (hl)
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, -5 (ix)
	ld	a, l
	sbc	a, -4 (ix)
	jr	NC, 00180$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:495: g_Players[i].Direction=DIRECTION_UP;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:496: g_Players[i].Y--;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jp	00197$
00180$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:498: else if(g_Players[i].X==g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
	ld	a, c
	or	a, a
	jr	Z, 00176$
	ld	c, -14 (ix)
	ld	b, -13 (ix)
	ld	hl, #14
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, -5 (ix)
	sub	a, c
	ld	a, -4 (ix)
	sbc	a, b
	jr	NC, 00176$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:499: g_Players[i].Direction=DIRECTION_DOWN;
	ld	a, -14 (ix)
	add	a, #0x0a
	ld	-3 (ix), a
	ld	a, -13 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:500: g_Players[i].Y++;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	add	a, #0x01
	ld	-3 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00197$
00176$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:502: else if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y==g_Players[i].TargetY){
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00172$
	ld	a, -14 (ix)
	ld	-7 (ix), a
	ld	a, -13 (ix)
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
	ld	a, -5 (ix)
	sub	a, -7 (ix)
	jr	NZ, 00172$
	ld	a, -4 (ix)
	sub	a, -6 (ix)
	jr	NZ, 00172$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:503: g_Players[i].Direction=DIRECTION_RIGHT;
	ld	a, -14 (ix)
	add	a, #0x0a
	ld	-3 (ix), a
	ld	a, -13 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:504: g_Players[i].X++;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	add	a, #0x01
	ld	-3 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00197$
00172$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:506: else if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y==g_Players[i].TargetY){
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00197$
	ld	a, -14 (ix)
	ld	-3 (ix), a
	ld	a, -13 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	sub	a, -3 (ix)
	jr	NZ, 00197$
	ld	a, -4 (ix)
	sub	a, -2 (ix)
	jr	NZ, 00197$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:507: g_Players[i].Direction=DIRECTION_LEFT;
	ld	a, -14 (ix)
	add	a, #0x0a
	ld	-3 (ix), a
	ld	a, -13 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x07
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:508: g_Players[i].X--;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	add	a, #0xff
	ld	-3 (ix), a
	ld	a, -4 (ix)
	adc	a, #0xff
	ld	-2 (ix), a
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
00197$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:512: if(g_Players[i].Y < FIELD_BOUND_Y_TOP) g_Players[i].Y = FIELD_BOUND_Y_TOP;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x32
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00200$
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(hl), #0x32
	inc	hl
	ld	(hl), #0x00
00200$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:513: if(g_Players[i].Y > FIELD_BOUND_Y_BOTTOM) g_Players[i].Y = FIELD_BOUND_Y_BOTTOM;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xae
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	jr	NC, 00202$
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(hl), #0xae
	inc	hl
	ld	(hl), #0x01
00202$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:514: if(g_Players[i].X < FIELD_BOUND_X_LEFT) g_Players[i].X = FIELD_BOUND_X_LEFT;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x0a
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00204$
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), #0x0a
	inc	hl
	ld	(hl), #0x00
00204$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:515: if(g_Players[i].X > FIELD_BOUND_X_RIGHT) g_Players[i].X = FIELD_BOUND_X_RIGHT;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xf6
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00208$
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), #0xf6
	inc	hl
	ld	(hl), #0x00
00208$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:396: if (g_MatchStatus == MATCH_IN_ACTION && g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	ld	a, #0x01
	jr	Z, 00776$
	xor	a, a
00776$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:519: if (g_MatchStatus == MATCH_IN_ACTION || (isSetPieceSetup && g_Ball.PossessionPlayerId == i)) {
	ld	b, a
	or	a, a
	jr	NZ, 00219$
	ld	a, -15 (ix)
	or	a, a
	jr	Z, 00220$
	ld	hl, #(_g_Ball + 6)
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	NZ, 00220$
00219$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:520: if (g_Ball.PossessionPlayerId == i) {
	ld	hl, #(_g_Ball + 6)
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	NZ, 00220$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:523: if (g_Ball.KickMoveState == NO_VALUE) g_Ball.KickMoveState = 0;
	ld	de, #_g_Ball + 13
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:522: if (!playerInPosition && g_MatchStatus == MATCH_IN_ACTION) {
	ld	a, -10 (ix)
	or	a,a
	jr	NZ, 00214$
	or	a,b
	jr	Z, 00214$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:523: if (g_Ball.KickMoveState == NO_VALUE) g_Ball.KickMoveState = 0;
	ld	a, (de)
	inc	a
	jr	NZ, 00210$
	ld	(de), a
00210$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:524: g_Ball.KickMoveState++;
	ld	a, (de)
	inc	a
	ld	c, a
	ld	(de), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:525: if (g_Ball.KickMoveState > 3) g_Ball.KickMoveState = 0;
	ld	a, #0x03
	sub	a, c
	jr	NC, 00215$
	xor	a, a
	ld	(de), a
	jp	00215$
00214$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:527: g_Ball.KickMoveState = 0;
	xor	a, a
	ld	(de), a
00215$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:529: PutBallOnPlayerFeet(i);
	ld	a, -1 (ix)
	call	_PutBallOnPlayerFeet
00220$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:533: if (playerInPosition) {
	ld	a, -10 (ix)
	or	a, a
	jp	Z, 00262$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:535: if (g_MatchStatus == MATCH_BEFORE_CORNER_KICK || g_MatchStatus == MATCH_BEFORE_GOAL_KICK || 
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x02
	jr	Z, 00233$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:536: g_MatchStatus == MATCH_BEFORE_OFFSIDE || g_MatchStatus == MATCH_BEFORE_THROW_IN) {
	cp	a,#0x05
	jr	Z, 00233$
	cp	a,#0x0e
	jr	Z, 00233$
	sub	a, #0x03
	jr	NZ, 00234$
00233$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:537: if (g_Players[i].Status != PLAYER_STATUS_POSITIONED) {
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	sub	a, #0x04
	or	a, b
	jr	Z, 00234$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:538: g_Players[i].Status = PLAYER_STATUS_POSITIONED;
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:539: g_Players[i].Direction = DIRECTION_NONE;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:540: u8 useDir = g_Players[i].PreviousDirection;
	ld	c, -14 (ix)
	ld	b, -13 (ix)
	ld	hl, #11
	add	hl, bc
	ld	a, (hl)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:541: if (useDir == DIRECTION_NONE) {
	or	a, a
	jr	NZ, 00230$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:543: if(g_MatchStatus == MATCH_BEFORE_THROW_IN) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x03
	jr	NZ, 00227$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:545: if(g_Ball.X < 128) useDir = DIRECTION_RIGHT; else useDir = DIRECTION_LEFT;
	ld	hl, (#_g_Ball + 2)
	ld	de, #0x0080
	cp	a, a
	sbc	hl, de
	jr	NC, 00224$
	ld	c, #0x03
	jp	00230$
00224$:
	ld	c, #0x07
	jp	00230$
00227$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:547: useDir = DIRECTION_DOWN; 
	ld	c, #0x05
00230$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:550: g_Players[i].PatternId = GetNoMovingPlayerPatternId(useDir);
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x0008
	add	hl, de
	push	hl
	ld	a, c
	call	_GetNoMovingPlayerPatternId
	pop	hl
	ld	(hl), a
00234$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:554: if(g_MatchStatus==MATCH_IN_ACTION){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jr	NZ, 00239$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:555: g_Players[i].Status=PLAYER_STATUS_POSITIONED;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00239$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:558: if (g_Players[i].TeamId == REFEREE) {
	ld	a, -14 (ix)
	add	a, #0x09
	ld	-3 (ix), a
	ld	a, -13 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	sub	a, #0x0e
	jr	NZ, 00244$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:559: if(g_MatchStatus == MATCH_BEFORE_KICK_OFF || g_MatchStatus == MATCH_AFTER_IN_GOAL) {
	ld	a, (_g_MatchStatus+0)
	dec	a
	jr	Z, 00240$
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x06
	jr	NZ, 00244$
00240$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:560: g_Players[i].Direction = DIRECTION_DOWN;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:561: g_Players[i].PatternId = PLAYER_POSE_FRONT;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0x10
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:562: g_Players[i].Status = PLAYER_STATUS_POSITIONED;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:563: PutPlayerSprite(i);
	ld	a, -1 (ix)
	call	_PutPlayerSprite
00244$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:569: if(g_MatchStatus==MATCH_BEFORE_KICK_OFF){
	ld	a, (_g_MatchStatus+0)
	dec	a
	jp	NZ,00262$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:571: if(g_Players[i].TeamId!=REFEREE && g_Players[i].PatternId!=PLAYER_POSE_BACK && g_Players[i].PatternId!=PLAYER_POSE_FRONT){
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	sub	a, #0x0e
	jr	Z, 00262$
	ld	a, -14 (ix)
	add	a, #0x08
	ld	c, a
	ld	a, -13 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	cp	a, #0x11
	jr	Z, 00262$
	sub	a, #0x10
	jr	Z, 00262$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:572: g_Players[i].Status=PLAYER_STATUS_POSITIONED;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:475: g_Players[i].Direction=DIRECTION_UP_RIGHT;
	ld	a, -14 (ix)
	add	a, #0x0a
	ld	e, a
	ld	a, -13 (ix)
	adc	a, #0x00
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:558: if (g_Players[i].TeamId == REFEREE) {
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:575: if(g_Players[i].TeamId==TEAM_1){
	dec	a
	ld	a, #0x01
	jr	Z, 00804$
	xor	a, a
00804$:
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:574: if (i != g_GoalScorerId) {
	ld	a, -1 (ix)
	ld	hl, #_g_GoalScorerId
	sub	a, (hl)
	jr	Z, 00252$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:575: if(g_Players[i].TeamId==TEAM_1){
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00246$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:576: g_Players[i].PatternId=PLAYER_POSE_BACK;
	ld	a, #0x11
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:577: g_Players[i].Direction=DIRECTION_UP;
	ld	a, #0x01
	ld	(de), a
	jp	00253$
00246$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:580: g_Players[i].PatternId=PLAYER_POSE_FRONT;
	ld	a, #0x10
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:581: g_Players[i].Direction=DIRECTION_DOWN;
	ld	a, #0x05
	ld	(de), a
	jp	00253$
00252$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:587: if(g_Players[i].TeamId==TEAM_1) g_Players[i].Direction=DIRECTION_UP;
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00249$
	ld	a, #0x01
	ld	(de), a
	jp	00253$
00249$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:588: else g_Players[i].Direction=DIRECTION_DOWN;
	ld	a, #0x05
	ld	(de), a
00253$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:590: PutPlayerSprite(i);
	ld	a, -1 (ix)
	call	_PutPlayerSprite
00262$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:394: for(u8 i=0;i<15;i++){
	inc	-1 (ix)
	jp	00271$
00263$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:597: if(g_MatchStatus==MATCH_BEFORE_KICK_OFF && allPlayersInPosition && g_FieldScrollingActionInProgress==NO_VALUE){
	ld	a, (_g_MatchStatus+0)
	dec	a
	jr	NZ, 00272$
	ld	a, -16 (ix)
	or	a, a
	jr	Z, 00272$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00272$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:598: g_FieldScrollSpeed=FIELD_SCROLL_GAME_SPEED;
	ld	hl, #_g_FieldScrollSpeed
	ld	(hl), #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:599: g_MatchStatus=MATCH_KICK_OFF;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x07
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:600: g_Timer=0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:601: g_GoalScorerId = NO_VALUE; // Reset scorer
	ld	hl, #_g_GoalScorerId
	ld	(hl), #0xff
00272$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:605: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:608: char *GetNumberString(u16 value)
;	---------------------------------
; Function GetNumberString
; ---------------------------------
_GetNumberString::
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:612: if (value < 10) {
	ld	c, e
	ld	b, d
	ld	a, c
	sub	a, #0x0a
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:613: str[0] = '0' + value;
	ld	bc, #_GetNumberString_str_65536_1308+0
	ld	a, e
	add	a, #0x30
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:614: str[1] = '\0';
	inc	bc
	xor	a, a
	ld	(bc), a
	jp	00103$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:616: str[0] = '0' + (value / 10);
	push	bc
	ld	de, #0x000a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__divuint
	pop	bc
	ld	a, e
	add	a, #0x30
	ld	(#_GetNumberString_str_65536_1308),a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:617: str[1] = '0' + (value % 10);
	ld	de, #0x000a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__moduint
	ld	a, e
	add	a, #0x30
	ld	(#(_GetNumberString_str_65536_1308 + 1)),a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:618: str[2] = '\0';
	ld	hl, #(_GetNumberString_str_65536_1308 + 2)
	ld	(hl), #0x00
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:621: return str;
	ld	de, #_GetNumberString_str_65536_1308
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:622: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:624: bool IsTeamJoystickTriggerPressed(u8 teamId){
;	---------------------------------
; Function IsTeamJoystickTriggerPressed
; ---------------------------------
_IsTeamJoystickTriggerPressed::
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:625: if(teamId==TEAM_1){
	dec	c
	jr	NZ, 00118$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:627: u8 joyStat = Joystick_Read(JOY_PORT_1);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:628: if (IS_JOY_PRESSED(joyStat, JOY_INPUT_TRIGGER_A))
	bit	4, l
	jr	NZ, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:630: return true;
	ld	a, #0x01
	ret
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:633: if(Keyboard_IsKeyPressed(KEY_SPACE))
	ld	a, #0x08
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:635: return true;
	ld	a, #0x01
	ret
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:637: if(Keyboard_IsKeyPressed(KEY_R)){
	ld	a, #0x74
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:638: g_FioBreText[0]='R';
	ld	hl, #_g_FioBreText
	ld	(hl), #0x52
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:640: if(Keyboard_IsKeyPressed(KEY_E)){
	ld	a, #0x23
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:641: g_FioBreText[1]='E';
	ld	hl, #(_g_FioBreText + 1)
	ld	(hl), #0x45
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:643: if(Keyboard_IsKeyPressed(KEY_N)){
	ld	a, #0x34
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00110$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:644: g_FioBreText[2]='N';
	ld	hl, #(_g_FioBreText + 2)
	ld	(hl), #0x4e
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:646: if(Keyboard_IsKeyPressed(KEY_Z)){
	ld	a, #0x75
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:647: g_FioBreText[3]='Z';
	ld	hl, #(_g_FioBreText + 3)
	ld	(hl), #0x5a
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:649: if(Keyboard_IsKeyPressed(KEY_O)){
	ld	a, #0x44
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00114$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:650: g_FioBreText[4]='O';
	ld	hl, #(_g_FioBreText + 4)
	ld	(hl), #0x4f
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:652: g_FioBreText[5]='\0';
	ld	hl, #(_g_FioBreText + 5)
	ld	(hl), #0x00
	jp	00119$
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:656: u8 joyStat = Joystick_Read(JOY_PORT_2);
	ld	l, #0x4f
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:657: if (IS_JOY_PRESSED(joyStat, JOY_INPUT_TRIGGER_A))
	bit	4, l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:659: return true;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:662: return FALSE;
	ld	a, #0x01
	ret	Z
00119$:
	xor	a, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:663: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:664: u8 GetJoystick1Direction(){
;	---------------------------------
; Function GetJoystick1Direction
; ---------------------------------
_GetJoystick1Direction::
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/input.h:182: u8 in = ~Joystick_Read(port);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
	ld	a, l
	cpl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:665: u8 dir = Joystick_GetDirection(JOY_PORT_1);
	and	a, #0x0f
	ld	b, a
	ld	e, b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:666: u8 retValue=DIRECTION_NONE;
	ld	c, #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:667: switch (dir){
	ld	a, #0x0a
	sub	a, b
	jr	C, 00109$
	ld	d, #0x00
	ld	hl, #00229$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00229$:
	jp	00109$
	jp	00101$
	jp	00102$
	jp	00109$
	jp	00103$
	jp	00106$
	jp	00108$
	jp	00109$
	jp	00104$
	jp	00105$
	jp	00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:668: case JOY_INPUT_DIR_UP:
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:669: retValue=DIRECTION_UP;
	ld	c, #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:670: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:671: case JOY_INPUT_DIR_DOWN:
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:672: retValue=DIRECTION_DOWN;
	ld	c, #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:673: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:674: case JOY_INPUT_DIR_LEFT:
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:675: retValue=DIRECTION_LEFT;
	ld	c, #0x07
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:676: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:677: case JOY_INPUT_DIR_RIGHT:
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:678: retValue=DIRECTION_RIGHT;
	ld	c, #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:679: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:680: case JOY_INPUT_DIR_UP_RIGHT:
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:681: retValue=DIRECTION_UP_RIGHT;
	ld	c, #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:682: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:683: case JOY_INPUT_DIR_UP_LEFT:
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:684: retValue=DIRECTION_UP_LEFT;
	ld	c, #0x08
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:685: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:686: case JOY_INPUT_DIR_DOWN_RIGHT:
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:687: retValue=DIRECTION_DOWN_RIGHT;
	ld	c, #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:688: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:689: case JOY_INPUT_DIR_DOWN_LEFT:
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:690: retValue=DIRECTION_DOWN_LEFT;
	ld	c, #0x06
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:692: }
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:693: if(retValue==DIRECTION_NONE){
	ld	a, c
	or	a, a
	jp	NZ, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:694: if(Keyboard_IsKeyPressed(KEY_LEFT) && Keyboard_IsKeyPressed(KEY_UP))
	push	bc
	ld	a, #0x48
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00111$
	push	bc
	ld	a, #0x58
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:696: retValue=DIRECTION_UP_LEFT;
	ld	c, #0x08
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:698: if(Keyboard_IsKeyPressed(KEY_LEFT) && Keyboard_IsKeyPressed(KEY_DOWN))
	push	bc
	ld	a, #0x48
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00114$
	push	bc
	ld	a, #0x68
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00114$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:700: retValue=DIRECTION_DOWN_LEFT;
	ld	c, #0x06
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:702: if(Keyboard_IsKeyPressed(KEY_RIGHT) && Keyboard_IsKeyPressed(KEY_DOWN))
	push	bc
	ld	a, #0x78
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00117$
	push	bc
	ld	a, #0x68
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:704: retValue=DIRECTION_DOWN_RIGHT;
	ld	c, #0x04
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:706: if(Keyboard_IsKeyPressed(KEY_RIGHT) && Keyboard_IsKeyPressed(KEY_UP))
	push	bc
	ld	a, #0x78
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00120$
	push	bc
	ld	a, #0x58
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00120$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:708: retValue=DIRECTION_UP_RIGHT;
	ld	c, #0x02
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:710: if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_LEFT))
	ld	a, c
	or	a, a
	jr	NZ, 00123$
	push	bc
	ld	a, #0x48
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00123$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:712: retValue=DIRECTION_LEFT;
	ld	c, #0x07
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:714: if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_RIGHT))
	ld	a, c
	or	a, a
	jr	NZ, 00126$
	push	bc
	ld	a, #0x78
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00126$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:716: retValue=DIRECTION_RIGHT;
	ld	c, #0x03
00126$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:718: if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_UP))
	ld	a, c
	or	a, a
	jr	NZ, 00129$
	push	bc
	ld	a, #0x58
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00129$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:720: retValue=DIRECTION_UP;
	ld	c, #0x01
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:722: if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_DOWN))
	ld	a, c
	or	a, a
	jr	NZ, 00135$
	push	bc
	ld	a, #0x68
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:724: retValue=DIRECTION_DOWN;
	ld	c, #0x05
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:727: return retValue;
	ld	a, c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:728: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:729: u8 GetJoystick2Direction(){
;	---------------------------------
; Function GetJoystick2Direction
; ---------------------------------
_GetJoystick2Direction::
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/bios.h:382: inline u8 Bios_GetJoystickDirection(u8 port) { return ((u8(*)(u8))R_GTSTCK)(port); }
	ld	a, #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:730: return Bios_GetJoystickDirection(2);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:731: }
	jp  0x00d5
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:733: void ShowFieldZone(u8 zone){
;	---------------------------------
; Function ShowFieldZone
; ---------------------------------
_ShowFieldZone::
	ld	(_g_FieldScrollingActionInProgress+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:734: g_FieldScrollingActionInProgress=zone;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:735: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:736: void TickCheckBallBoundaries(){
;	---------------------------------
; Function TickCheckBallBoundaries
; ---------------------------------
_TickCheckBallBoundaries::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:737: if(g_MatchStatus!=MATCH_IN_ACTION){
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:738: return;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:742: if(g_MatchStatus == MATCH_BALL_ON_GOALKEEPER || g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jp	NZ,00160$
	sub	a, #0x0d
	jr	Z, 00107$
	ld	a, (#(_g_Ball + 6) + 0)
	inc	a
	jr	Z, 00108$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:743: if(g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	hl, #_g_Ball+6
	ld	e, (hl)
	ld	a, e
	inc	a
	jr	Z, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:744: if(g_Players[g_Ball.PossessionPlayerId].Role == PLAYER_ROLE_GOALKEEPER) return;
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
	ld	de, #0x000d
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	Z,00160$
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:749: if (g_Ball.ShotActive != 0 || g_Ball.PassTargetPlayerId != NO_VALUE) {
	ld	a, (#_g_Ball + 27)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:757: if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
	ld	bc, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:749: if (g_Ball.ShotActive != 0 || g_Ball.PassTargetPlayerId != NO_VALUE) {
	ld	a, (#_g_Ball + 16)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:757: if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
	ld	e, c
	ld	d, b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:749: if (g_Ball.ShotActive != 0 || g_Ball.PassTargetPlayerId != NO_VALUE) {
	ld	a, -3 (ix)
	inc	a
	ld	a, #0x01
	jr	Z, 00314$
	xor	a, a
00314$:
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:757: if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
	ld	a, e
	sub	a, #0x32
	ld	a, d
	sbc	a, #0x00
	ld	a, #0x00
	rla
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:749: if (g_Ball.ShotActive != 0 || g_Ball.PassTargetPlayerId != NO_VALUE) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00120$
	bit	0, -2 (ix)
	jr	NZ, 00121$
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:751: u16 destY = g_Ball.TargetY;
	ld	hl, (#_g_Ball + 25)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:752: if (g_Ball.PassTargetPlayerId != NO_VALUE) {
	bit	0, -2 (ix)
	jr	NZ, 00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:753: destY = g_Players[g_Ball.PassTargetPlayerId].Y;
	push	de
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
	ld	de, #_g_Players
	add	hl, de
	pop	de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:757: if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:759: if(destY > g_Ball.Y) return;
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	C,00160$
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:763: if (g_Ball.Y > FIELD_BOUND_Y_BOTTOM) {
	ld	a, #0xae
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:765: if(destY < g_Ball.Y) return;
	xor	a, a
	sbc	hl, bc
	jp	C,00160$
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:781: if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00129$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:783: if (g_Ball.ShotActive && (g_Ball.Direction == DIRECTION_DOWN || g_Ball.Direction == DIRECTION_DOWN_LEFT || g_Ball.Direction == DIRECTION_DOWN_RIGHT)) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00129$
	ld	a, (#_g_Ball + 5)
	cp	a, #0x05
	jp	Z,00160$
	cp	a, #0x06
	jp	Z,00160$
	sub	a, #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:784: return; 
	jp	Z,00160$
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:789: if (g_Ball.Y > FIELD_BOUND_Y_BOTTOM) {
	ld	a, #0xae
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	ld	a, #0x00
	rla
	ld	-5 (ix), a
	or	a, a
	jr	Z, 00136$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:791: if (g_Ball.ShotActive && (g_Ball.Direction == DIRECTION_UP || g_Ball.Direction == DIRECTION_UP_LEFT || g_Ball.Direction == DIRECTION_UP_RIGHT)) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00136$
	ld	a, (#_g_Ball + 5)
	cp	a, #0x01
	jp	Z,00160$
	cp	a, #0x08
	jp	Z,00160$
	sub	a, #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:792: return;
	jp	Z,00160$
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:796: u8 teamId = g_Ball.LastTouchTeamId;
	ld	a, (#_g_Ball + 14)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:797: if(teamId==NO_VALUE){
	ld	-4 (ix), a
	inc	a
	jr	NZ, 00138$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:798: teamId=TEAM_1; // Default
	ld	-4 (ix), #0x01
00138$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:800: u8 opponentTeamId = (teamId == TEAM_1) ? TEAM_2 : TEAM_1;
	ld	a, -4 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00326$
	xor	a, a
00326$:
	ld	-3 (ix), a
	or	a, a
	jr	Z, 00162$
	ld	-2 (ix), #0x02
	ld	-1 (ix), #0
	jp	00163$
00162$:
	ld	-2 (ix), #0x01
	ld	-1 (ix), #0
00163$:
	ld	c, -2 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:808: if(g_Ball.X < FIELD_BOUND_X_LEFT || g_Ball.X > FIELD_BOUND_X_RIGHT){
	ld	hl, (#_g_Ball + 2)
	ld	e, l
	ld	d, h
	ld	a, e
	sub	a, #0x0a
	ld	a, d
	sbc	a, #0x00
	jr	C, 00139$
	ld	a, #0xf6
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00140$
00139$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:809: BallThrowIn(opponentTeamId); //GP_USER
	ld	a, c
	call	_BallThrowIn
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:811: return;
	jp	00160$
00140$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:815: if(g_Ball.Y < FIELD_BOUND_Y_TOP){
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:818: if(g_Ball.X > (GOAL_X_MIN - 8) && g_Ball.X < (GOAL_X_MAX + 8)){
	ld	a, #0x58
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00146$
	ld	de, #0x0098
	cp	a, a
	sbc	hl, de
	jr	NC, 00146$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:819: BallInGoal(TEAM_1); // Team 1 attacked up and scored
	ld	a, #0x01
	call	_BallInGoal
	jp	00160$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:822: if(teamId == TEAM_1){ // Attacker touched last
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00143$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:823: GoalKick(TEAM_2);
	ld	a, #0x02
	call	_GoalKick
	jp	00160$
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:826: CornerKick(TEAM_1);
	ld	a, #0x01
	call	_CornerKick
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:829: return;
	jp	00160$
00150$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:833: if(g_Ball.Y > FIELD_BOUND_Y_BOTTOM){
	ld	a, -5 (ix)
	or	a, a
	jr	Z, 00160$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:835: if(g_Ball.X > (GOAL_X_MIN - 8) && g_Ball.X < (GOAL_X_MAX + 8)){
	ld	a, #0x58
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00155$
	ld	de, #0x0098
	cp	a, a
	sbc	hl, de
	jr	NC, 00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:836: BallInGoal(TEAM_2); // Team 2 attacked down and scored
	ld	a, #0x02
	call	_BallInGoal
	jp	00156$
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:839: if(teamId == TEAM_2){ // Attacker touched last (Team 2 attacking down)
	ld	a, -4 (ix)
	sub	a, #0x02
	jr	NZ, 00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:840: GoalKick(TEAM_1);
	ld	a, #0x01
	call	_GoalKick
	jp	00156$
00152$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:843: CornerKick(TEAM_2);
	ld	a, #0x02
	call	_CornerKick
00156$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:846: return;
00160$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:848: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:850: void TimeUp(){
;	---------------------------------
; Function TimeUp
; ---------------------------------
_TimeUp::
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:480: inline void V9_SetBackgroundColor(u8 color) { V9_SetRegister(15, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_V9_SetRegister
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0016
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:853: if (g_Team1Score == g_Team2Score) {
	ld	a, (_g_Team1Score+0)
	ld	hl, #_g_Team2Score
	sub	a, (hl)
	jr	NZ, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:854: PenaltyShots();
	call	_PenaltyShots
	jp	00103$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:856: u8 winner = (g_Team1Score > g_Team2Score) ? TEAM_1 : TEAM_2;
	ld	a, (#_g_Team2Score)
	ld	hl, #_g_Team1Score
	sub	a, (hl)
	jr	NC, 00131$
	ld	bc, #0x0001
	jp	00132$
00131$:
	ld	bc, #0x0002
00132$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:857: TeamVictory(winner);
	ld	a, c
	call	_TeamVictory
00103$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:859: SET_BANK_SEGMENT(2, 1); // Restore Segment 1
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:860: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:862: u8 GetClosestPlayerToBall(u8 teamId, u8 excludePlayerId){
;	---------------------------------
; Function GetClosestPlayerToBall
; ---------------------------------
_GetClosestPlayerToBall::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-14
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), a
	ld	-3 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:863: u8 closestId = NO_VALUE;
	ld	-12 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:864: u16 minDist = 0xFFFF;
	ld	-11 (ix), #0xff
	ld	-10 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:866: for(u8 i=0;i<14;i++){
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
	ld	-1 (ix), #0x00
00110$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:867: if(g_Players[i].TeamId != teamId) continue;
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
	ld	a, -5 (ix)
	add	a, #<(_g_Players)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	adc	a, #>(_g_Players)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a,-2 (ix)
	sub	a,(hl)
	jp	NZ,00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:868: if(i == excludePlayerId) continue;
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jp	Z,00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:870: u16 distX = (g_Players[i].X > g_Ball.X) ? (g_Players[i].X - g_Ball.X) : (g_Ball.X - g_Players[i].X);
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-14 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-13 (ix), a
	ld	a, -9 (ix)
	sub	a, -14 (ix)
	ld	a, -8 (ix)
	sbc	a, -13 (ix)
	jr	NC, 00113$
	ld	a, -14 (ix)
	sub	a, -9 (ix)
	ld	-5 (ix), a
	ld	a, -13 (ix)
	sbc	a, -8 (ix)
	ld	-4 (ix), a
	jp	00114$
00113$:
	ld	a, -9 (ix)
	sub	a, -14 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	sbc	a, -13 (ix)
	ld	-4 (ix), a
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:871: u16 distY = (g_Players[i].Y > g_Ball.Y) ? (g_Players[i].Y - g_Ball.Y) : (g_Ball.Y - g_Players[i].Y);
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, (#_g_Ball + 0)
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jr	NC, 00115$
	ld	a, c
	sub	a, l
	ld	-7 (ix), a
	ld	a, b
	sbc	a, h
	ld	-6 (ix), a
	jp	00116$
00115$:
	ld	a, l
	sub	a, c
	ld	-7 (ix), a
	ld	a, h
	sbc	a, b
	ld	-6 (ix), a
00116$:
	ld	c, -7 (ix)
	ld	b, -6 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:874: u16 totalDist = distX + distY;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	add	hl, bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:876: if(totalDist < minDist){
	ld	a, l
	sub	a, -11 (ix)
	ld	a, h
	sbc	a, -10 (ix)
	jr	NC, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:877: minDist = totalDist;
	ld	-11 (ix), l
	ld	-10 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:878: closestId = i;
	ld	a, -1 (ix)
	ld	-12 (ix), a
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:866: for(u8 i=0;i<14;i++){
	inc	-1 (ix)
	jp	00110$
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:881: return closestId;
	ld	a, -12 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:882: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:888: i32 Math_Abs32(i32 v) { return (v < 0) ? -v : v; }
;	---------------------------------
; Function Math_Abs32
; ---------------------------------
_Math_Abs32::
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:890: u8 GetBestPassTarget(u8 passerId) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:891: u8 bestTarget = NO_VALUE;
	ld	-32 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:892: i32 bestScore = -2100000000;
	ld	-31 (ix), #0x00
	ld	-30 (ix), #0x8b
	ld	-29 (ix), #0xd4
	ld	-28 (ix), #0x82
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:893: u8 teamId = g_Players[passerId].TeamId;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:894: u8 dir = g_Players[passerId].Direction;
	push	bc
	pop	iy
	ld	e, 10 (iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:895: i16 px = (i16)g_Players[passerId].X;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:896: i16 py = (i16)g_Players[passerId].Y;
	ld	l, c
	ld	h, b
	ld	d, (hl)
	inc	hl
	ld	a, (hl)
	ld	-24 (ix), d
	ld	-23 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:899: i16 dirX = 0, dirY = 0;
	xor	a, a
	ld	-22 (ix), a
	ld	-21 (ix), a
	xor	a, a
	ld	-20 (ix), a
	ld	-19 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:902: if (dir == DIRECTION_NONE) dir = g_Players[passerId].PreviousDirection;
	ld	a, e
	or	a, a
	jr	NZ, 00102$
	ld	e, c
	ld	d, b
	ld	hl, #11
	add	hl, de
	ld	e, (hl)
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:904: if (dir == DIRECTION_UP) dirY = -100;
	ld	a, e
	dec	a
	jr	NZ, 00128$
	ld	-20 (ix), #0x9c
	ld	-19 (ix), #0xff
	jp	00180$
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:905: else if (dir == DIRECTION_DOWN) dirY = 100;
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00125$
	ld	-20 (ix), #0x64
	ld	-19 (ix), #0
	jp	00180$
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:906: else if (dir == DIRECTION_LEFT) dirX = -100;
	ld	a, e
	sub	a, #0x07
	jr	NZ, 00122$
	ld	-22 (ix), #0x9c
	ld	-21 (ix), #0xff
	jp	00180$
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:907: else if (dir == DIRECTION_RIGHT) dirX = 100;
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00119$
	ld	-22 (ix), #0x64
	ld	-21 (ix), #0
	jp	00180$
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:908: else if (dir == DIRECTION_UP_RIGHT) { dirX = 70; dirY = -70; }
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:909: else if (dir == DIRECTION_UP_LEFT) { dirX = -70; dirY = -70; }
	ld	a, e
	sub	a, #0x08
	jr	NZ, 00113$
	ld	-22 (ix), #0xba
	ld	-21 (ix), #0xff
	ld	-20 (ix), #0xba
	ld	-19 (ix), #0xff
	jp	00180$
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:910: else if (dir == DIRECTION_DOWN_RIGHT) { dirX = 70; dirY = 70; }
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00110$
	ld	-22 (ix), #0x46
	ld	-21 (ix), #0
	ld	-20 (ix), #0x46
	ld	-19 (ix), #0
	jp	00180$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:911: else if (dir == DIRECTION_DOWN_LEFT) { dirX = -70; dirY = 70; }
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00107$
	ld	-22 (ix), #0xba
	ld	-21 (ix), #0xff
	ld	-20 (ix), #0x46
	ld	-19 (ix), #0
	jp	00180$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:913: if (teamId == TEAM_1) dirY = -100; 
	ld	a, -27 (ix)
	dec	a
	jr	NZ, 00104$
	ld	-20 (ix), #0x9c
	ld	-19 (ix), #0xff
	jp	00180$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:914: else dirY = 100; 
	ld	-20 (ix), #0x64
	ld	-19 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:917: for(i=0; i<14; i++) {
00180$:
	ld	-18 (ix), c
	ld	-17 (ix), b
	ld	-1 (ix), #0x00
00152$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:922: if(g_Players[i].TeamId != teamId) continue;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:923: if(i == passerId) continue;
	ld	a, -2 (ix)
	sub	a, -1 (ix)
	jp	Z,00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:925: if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue; 
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:928: if (g_Players[i].Y < g_FieldCurrentYPosition || g_Players[i].Y > (g_FieldCurrentYPosition + 220)) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:932: dx = (i16)g_Players[i].X - px;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:933: dy = (i16)g_Players[i].Y - py;
	ld	a, c
	sub	a, -24 (ix)
	ld	c, a
	ld	a, b
	sbc	a, -23 (ix)
	ld	-4 (ix), c
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:937: adx = (dx < 0) ? -dx : dx;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:938: ady = (dy < 0) ? -dy : dy;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:939: if (adx < 32 && ady < 32) continue;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:942: if (g_Players[passerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	de, #0x000d
	add	hl, de
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:944: if (((i32)dx*(i32)dx + (i32)dy*(i32)dy) > 40000) continue;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:942: if (g_Players[passerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, e
	or	a, a
	jr	NZ, 00145$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:944: if (((i32)dx*(i32)dx + (i32)dy*(i32)dy) > 40000) continue;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:947: dot = ((i32)dx * dirX) + ((i32)dy * dirY);
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:950: if (dot <= 0) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:961: score = dot - ((i32)(adx + ady) * 40); 
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:963: if (score > bestScore) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:964: bestScore = score;
	ld	hl, #1
	add	hl, sp
	ex	de, hl
	ld	hl, #26
	add	hl, sp
	ld	bc, #4
	ldir
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:965: bestTarget = i;
	ld	a, -1 (ix)
	ld	-32 (ix), a
00150$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:917: for(i=0; i<14; i++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	C, 00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1001: return bestTarget;
	ld	a, -32 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1002: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1013: void GoalkeeperWithBall(u8 teamId, bool isSteal) {
;	---------------------------------
; Function GoalkeeperWithBall
; ---------------------------------
_GoalkeeperWithBall::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-8
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), a
	ld	-3 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1014: u8 gkId = GetPlayerIdByRole(teamId, PLAYER_ROLE_GOALKEEPER);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	call	_GetPlayerIdByRole
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1015: if(gkId == NO_VALUE) return;
	ld	-8 (ix), a
	inc	a
	jp	Z,00159$
	jp	00102$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1017: s_GkAnimPlayerId = gkId;
	ld	a, -8 (ix)
	ld	(_s_GkAnimPlayerId+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1018: s_GkAnimTimer = 0;
	ld	hl, #_s_GkAnimTimer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1021: if (teamId == TEAM_1) {
	ld	a, -2 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00275$
	xor	a, a
00275$:
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1022: g_Players[gkId].PatternId = PLAYER_POSE_TEAM1_GK_BALL_FRONT;
	ld	c, -8 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1021: if (teamId == TEAM_1) {
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1022: g_Players[gkId].PatternId = PLAYER_POSE_TEAM1_GK_BALL_FRONT;
	ld	hl, #_g_Players+0
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x9e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1023: g_Players[gkId].Direction = DIRECTION_UP; // Face Up (Attack Direction)
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0x01
	jp	00105$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1026: g_Players[gkId].PatternId = PLAYER_POSE_FRONT; // Team 2 GK plays like a player (feet)
	ld	hl, #_g_Players+0
	add	hl, bc
	ex	de, hl
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x10
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1027: g_Players[gkId].Direction = DIRECTION_DOWN; // Face Down (Attack Direction)
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0x05
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1031: g_Players[gkId].Status = PLAYER_STATUS_POSITIONED;
	ld	hl, #_g_Players
	add	hl, bc
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1035: bool closeToLine = false;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1036: if (teamId == TEAM_2) { // GK 2 (Top)
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	NZ, 00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1037: g_GkRecoilY = -1;
	ld	hl, #_g_GkRecoilY
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1038: if (g_Players[gkId].Y <= FIELD_BOUND_Y_TOP + 4) closeToLine = true;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0x36
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	C, 00112$
	ld	-1 (ix), #0x01
	jp	00112$
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1040: g_GkRecoilY = 1;
	ld	hl, #_g_GkRecoilY
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1041: if (g_Players[gkId].Y >= FIELD_BOUND_Y_BOTTOM - 4) closeToLine = true;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	c, -5 (ix)
	ld	b, -4 (ix)
	ld	a, c
	sub	a, #0xaa
	ld	a, b
	sbc	a, #0x01
	jr	C, 00112$
	ld	-1 (ix), #0x01
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1044: if (closeToLine || isSteal) g_GkRecoilY = 0; // No recoil for Steals
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00113$
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00114$
00113$:
	ld	hl, #_g_GkRecoilY
	ld	(hl), #0x00
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1045: g_GkIsGroundKick = isSteal; // Track if this is a ground kick (no offset needed)
	ld	a, -3 (ix)
	ld	(_g_GkIsGroundKick+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1048: SetPlayerBallPossession(gkId);
	ld	a, -8 (ix)
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1049: g_Ball.PossessionPlayerId = gkId; // Fix: Ensure AI knows GK has ball immediately to prevent chasing
	ld	hl, #(_g_Ball + 6)
	ld	a, -8 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1050: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1052: g_MatchStatus = MATCH_BALL_ON_GOALKEEPER;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1055: for(u8 i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00158$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00159$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1056: if(i == gkId) continue;
	ld	a, -8 (ix)
	sub	a, -1 (ix)
	jp	Z,00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1057: if(g_Players[i].TeamId == REFEREE) continue;
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
	push	de
	pop	iy
	ld	b, 9 (iy)
	ld	a, b
	sub	a, #0x0e
	jp	Z,00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1058: if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	push	de
	pop	iy
	ld	a, 13 (iy)
	ld	-6 (ix), a
	or	a, a
	jp	Z, 00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1062: tx = g_Players[i].X;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1069: if (g_Players[i].Role >= PLAYER_ROLE_LEFT_STRIKER) ty = 160;
	ld	a, -6 (ix)
	sub	a, #0x05
	ld	a, #0x00
	rla
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1065: if(g_Players[i].TeamId == teamId) {
	ld	a, -2 (ix)
	sub	a, b
	jr	NZ, 00153$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1068: if(teamId == TEAM_1) { // Moving UP
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1069: if (g_Players[i].Role >= PLAYER_ROLE_LEFT_STRIKER) ty = 160;
	bit	0, c
	jr	NZ, 00126$
	ld	bc, #0x00a0
	jp	00154$
00126$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1070: else if (g_Players[i].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) ty = 240;
	ld	a, -6 (ix)
	sub	a, #0x03
	jr	C, 00123$
	ld	bc, #0x00f0
	jp	00154$
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1071: else ty = 350;
	ld	bc, #0x015e
	jp	00154$
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1073: if (g_Players[i].Role >= PLAYER_ROLE_LEFT_STRIKER) ty = 320;
	bit	0, c
	jr	NZ, 00132$
	ld	bc, #0x0140
	jp	00154$
00132$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1074: else if (g_Players[i].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) ty = 240;
	ld	a, -6 (ix)
	sub	a, #0x03
	jr	C, 00129$
	ld	bc, #0x00f0
	jp	00154$
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1075: else ty = 130;
	ld	bc, #0x0082
	jp	00154$
00153$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1080: if(teamId == TEAM_1) { // Opponent is Team 2 (Top) -> Retreat UP? No, Team 2 Defends Top.
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1082: if (g_Players[i].Role >= PLAYER_ROLE_LEFT_STRIKER) ty = 243; // Midfield
	bit	0, c
	jr	NZ, 00141$
	ld	bc, #0x00f3
	jp	00154$
00141$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1083: else if (g_Players[i].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) ty = 106;
	ld	a, -6 (ix)
	sub	a, #0x03
	jr	C, 00138$
	ld	bc, #0x006a
	jp	00154$
00138$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1084: else ty = 130;
	ld	bc, #0x0082
	jp	00154$
00150$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1087: if (g_Players[i].Role >= PLAYER_ROLE_LEFT_STRIKER) ty = 243;
	bit	0, c
	jr	NZ, 00147$
	ld	bc, #0x00f3
	jp	00154$
00147$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1088: else if (g_Players[i].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) ty = 318;
	ld	a, -6 (ix)
	sub	a, #0x03
	jr	C, 00144$
	ld	bc, #0x013e
	jp	00154$
00144$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1089: else ty = 350;
	ld	bc, #0x015e
00154$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1094: g_Players[i].TargetX = tx;
	ld	hl, #0x0010
	add	hl, de
	ld	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -4 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1095: g_Players[i].TargetY = ty;
	ld	hl, #0x000e
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1096: g_Players[i].Status = PLAYER_STATUS_NONE; // Unlock movement
	ld	hl, #0x0012
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1055: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00158$
00159$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1098: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1101: u8 SelectTeam(u8 cursorPatternId, u8 excludeIndex) {
;	---------------------------------
; Function SelectTeam
; ---------------------------------
_SelectTeam::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-10
	add	iy, sp
	ld	sp, iy
	ld	-1 (ix), a
	ld	-2 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1103: u8 currentIdx = 0;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1104: if (currentIdx == excludeIndex) currentIdx++;
	ld	a, -2 (ix)
	or	a, a
	jr	NZ, 00102$
	ld	-6 (ix), #0x01
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1107: u8 oldDir = DIRECTION_NONE;
	ld	-3 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1109: bool oldTrigger = true; // Force release first
	ld	-5 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1111: while (true) {
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1112: UpdateV9990();
	call	_UpdateV9990
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1114: dir = GetJoystick1Direction();
	call	_GetJoystick1Direction
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1115: trigger = IsTeamJoystickTriggerPressed(TEAM_1);
	push	bc
	ld	a, #0x01
	call	_IsTeamJoystickTriggerPressed
	pop	bc
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1117: if (dir != DIRECTION_NONE && dir != oldDir) {
	ld	a, c
	or	a, a
	jp	Z, 00137$
	ld	a, c
	sub	a, -3 (ix)
	jp	Z,00137$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1118: u8 nextIdx = currentIdx;
	ld	b, -6 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1120: if (dir == DIRECTION_RIGHT) {
	ld	a, c
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00248$
	xor	a, a
00248$:
	ld	-3 (ix), a
	or	a, a
	jr	Z, 00120$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1121: if ((currentIdx % 3) < 2) nextIdx++;
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0003
	call	__modsint
	pop	bc
	ld	a, e
	sub	a, #0x02
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00121$
	ld	b, -6 (ix)
	inc	b
	jp	00121$
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1122: } else if (dir == DIRECTION_LEFT) {
	ld	a, c
	sub	a, #0x07
	jr	NZ, 00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1123: if ((currentIdx % 3) > 0) nextIdx--;
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0003
	call	__modsint
	pop	bc
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00251$
	xor	a, #0x80
00251$:
	jp	P, 00121$
	ld	b, -6 (ix)
	dec	b
	jp	00121$
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1124: } else if (dir == DIRECTION_UP) {
	ld	a, c
	dec	a
	jr	NZ, 00114$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1125: if (currentIdx >= 3) nextIdx -= 3;
	ld	a, -6 (ix)
	sub	a, #0x03
	jr	C, 00121$
	ld	a, -6 (ix)
	add	a, #0xfd
	ld	b, a
	jp	00121$
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1126: } else if (dir == DIRECTION_DOWN) {
	ld	a, c
	sub	a, #0x05
	jr	NZ, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1127: if (currentIdx < 3) nextIdx += 3;
	ld	a, -6 (ix)
	sub	a, #0x03
	jr	NC, 00121$
	ld	a, -6 (ix)
	add	a, #0x03
	ld	b, a
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1130: if (nextIdx == excludeIndex) {
	ld	a, -2 (ix)
	sub	a, b
	jr	NZ, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1132: if (dir == DIRECTION_RIGHT) {
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00132$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1133: if ((nextIdx % 3) < 2) nextIdx++; else nextIdx = currentIdx;
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0003
	call	__modsint
	pop	bc
	ld	a, e
	sub	a, #0x02
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00123$
	inc	b
	jp	00135$
00123$:
	ld	b, -6 (ix)
	jp	00135$
00132$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1134: } else if (dir == DIRECTION_LEFT) {
	ld	a, c
	sub	a, #0x07
	jr	NZ, 00129$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1135: if ((nextIdx % 3) > 0) nextIdx--; else nextIdx = currentIdx;
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0003
	call	__modsint
	pop	bc
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00260$
	xor	a, #0x80
00260$:
	jp	P, 00126$
	dec	b
	jp	00135$
00126$:
	ld	b, -6 (ix)
	jp	00135$
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1137: nextIdx = currentIdx; // Vertical skip blocked
	ld	b, -6 (ix)
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1140: currentIdx = nextIdx;
	ld	-6 (ix), b
00137$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1142: oldDir = dir;
	ld	-3 (ix), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1144: if (trigger && !oldTrigger) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00140$
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00140$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1146: return currentIdx;
	ld	a, -6 (ix)
	jp	00147$
00140$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1148: oldTrigger = trigger;
	ld	a, -4 (ix)
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1151: attr.Y = g_TeamPos[currentIdx].y;
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_g_TeamPos
	add	hl,bc
	ex	de, hl
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1152: attr.X = g_TeamPos[currentIdx].x;
	ex	de,hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #2
	add	hl, sp
	ld	(hl), c
	inc	hl
	ld	a, b
	and	a, #0x03
	ld	e,a
	ld	a, (hl)
	and	a, #0xfc
	or	a, e
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1153: attr.Pattern = cursorPatternId;
	ld	a, -1 (ix)
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1154: attr.P = 0; 
	ld	hl, #3
	add	hl, sp
	res	5, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1155: attr.SC = 0;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1156: attr.D = 0;
	ld	hl, #3
	add	hl, sp
	res	4, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1157: V9_SetSpriteP1(0, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xfe00
	ld	hl, #0x0003
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1157: V9_SetSpriteP1(0, &attr);
	jp	00143$
00147$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1159: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1160: void ShowMenu(){
;	---------------------------------
; Function ShowMenu
; ---------------------------------
_ShowMenu::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-7
	add	hl, sp
	ld	sp, hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1164: for(u8 i=0;i<32;i++){
	ld	c, #0x00
00268$:
	ld	a, c
	sub	a, #0x20
	jr	NC, 00101$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1166: attr.D = 1;
	ld	hl, #3
	add	hl, sp
	set	4, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1167: V9_SetSpriteP1(i, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	a, h
	rlca
	sbc	a, a
	ld	e, a
	ld	d, a
	ld	a, h
	add	a, #0xfe
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	adc	a, #0x03
	ld	e, a
	jr	NC, 00589$
	inc	d
00589$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	push	bc
	ex	de, hl
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #2
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1164: for(u8 i=0;i<32;i++){
	inc	c
	jp	00268$
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1169: V9_SetScrollingBY(1);
	ld	hl, #0x0001
	call	_V9_SetScrollingBY
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:353: inline void V9_FillVRAM(u32 addr, u8 value, u16 count) { V9_SetWriteAddress(addr); V9_FillVRAM_CurrentAddr(value, count); }
	ld	de, #0x0000
	ld	hl, #0x0004
	call	_V9_SetWriteAddress
	ld	de, #0x6a00
	xor	a, a
	call	_V9_FillVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0012
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1174: V9_WriteVRAM(V9_P1_PGT_B + 8192L, g_Teams_Gray_part1, sizeof(g_Teams_Gray_part1));
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x2000
	ld	l, #0x04
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_Teams_Gray_part1
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0013
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1176: V9_WriteVRAM(V9_P1_PGT_B + 8192L + 16384L, g_Teams_Gray_part2, sizeof(g_Teams_Gray_part2));
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x6000
	ld	l, #0x04
	call	_V9_SetWriteAddress
	ld	de, #0x1000
	ld	hl, #_g_Teams_Gray_part2
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:362: inline void V9_FillVRAM16(u32 addr, u16 value, u16 count) { V9_SetWriteAddress(addr); V9_FillVRAM16_CurrentAddr(value, count); }
	ld	de, #0xe000
	ld	hl, #0x0007
	call	_V9_SetWriteAddress
	ld	de, #0x1000
	ld	hl, #0x0000
	call	_V9_FillVRAM16_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1179: V9_SetPalette(16, 16, g_Teams_Gray_palette);
	ld	bc, #_g_Teams_Gray_palette+0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1028: }
;	spillPairReg hl
;	spillPairReg hl
	ld	hl, #0x10
;	spillPairReg hl
;	spillPairReg hl
00271$:
	ld	a, h
	sub	a, #0x10
	jr	NC, 00168$
	ld	-1 (ix), l
	inc	l
	push	hl
	push	bc
	ld	e, c
	ld	d, b
	ld	a, -1 (ix)
	call	_V9_SetPaletteEntry
	pop	bc
	pop	hl
	inc	bc
	inc	bc
	inc	bc
	inc	h
	jp	00271$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1179: V9_SetPalette(16, 16, g_Teams_Gray_palette);
00168$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0011
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1184: V9_SetPalette(0, 16, g_Teams_palette);
	ld	bc, #_g_Teams_palette+0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1028: }
;	spillPairReg hl
;	spillPairReg hl
	ld	hl, #0x0
;	spillPairReg hl
;	spillPairReg hl
00274$:
	ld	a, h
	sub	a, #0x10
	jr	NC, 00182$
	ld	-1 (ix), l
	inc	l
	push	hl
	push	bc
	ld	e, c
	ld	d, b
	ld	a, -1 (ix)
	call	_V9_SetPaletteEntry
	pop	bc
	pop	hl
	inc	bc
	inc	bc
	inc	bc
	inc	h
	jp	00274$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1184: V9_SetPalette(0, 16, g_Teams_palette);
00182$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
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
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1187: for (u8 y=0;y<64;y++){
	ld	c, #0x00
00280$:
	ld	a, c
	sub	a, #0x40
	jr	NC, 00103$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1188: for (u8 x=0;x<64;x++){
	ld	b, #0x00
00277$:
	ld	a, b
	sub	a, #0x40
	jr	NC, 00281$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1189: V9_PutLayerATileAtPos(x,y,32);
	push	bc
	ld	hl, #0x0020
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_V9_PutLayerATileAtPos
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1188: for (u8 x=0;x<64;x++){
	inc	b
	jp	00277$
00281$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1187: for (u8 y=0;y<64;y++){
	inc	c
	jp	00280$
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1192: for (u8 y=5;y<25;y++){
	ld	c, #0x05
00286$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1193: u16 tileId=256+32*(y-5);
	ld	a,c
	cp	a,#0x19
	jr	NC, 00105$
	ld	b, #0x00
	add	a, #0xfb
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	a, h
	inc	a
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1194: for (u8 x=1;x<31;x++){
	ld	b, #0x01
00283$:
	ld	a, b
	sub	a, #0x1f
	jr	NC, 00287$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1195: V9_PutLayerATileAtPos(x,y,tileId);
	push	bc
	push	de
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_V9_PutLayerATileAtPos
	pop	de
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1196: V9_PutLayerBTileAtPos(x,y,tileId);
	push	bc
	push	de
	push	de
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_V9_PutLayerBTileAtPos
	pop	de
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1197: tileId++;
	inc	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1194: for (u8 x=1;x<31;x++){
	inc	b
	jp	00283$
00287$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1192: for (u8 y=5;y<25;y++){
	inc	c
	jp	00286$
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1200: LoadSprites();
	call	_LoadSprites
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:574: inline void V9_SetInterrupt(u8 flags) { V9_SetRegister(9, flags); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_V9_SetRegister
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	res	7, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1210: V9_PrintLayerAStringAtPos(4,0,"    PLAYER TEAM SELECT");
	ld	hl, #___str_12
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x04
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1211: g_Team1PaletteId = SelectTeam(SPRITE_PLAYER, NO_VALUE);
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0xf5
	call	_SelectTeam
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1214: for(u8 y=g_TeamGrayPos[g_Team1PaletteId].y;y<g_TeamGrayPos[g_Team1PaletteId].y+9;y++){
	ld	(_g_Team1PaletteId+0), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_g_TeamGrayPos)
	ld	-2 (ix), a
	ld	a, h
	adc	a, #>(_g_TeamGrayPos)
	ld	-1 (ix), a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
00292$:
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	ex	de, hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	h, a
	sbc	hl, de
	jr	NC, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1215: for(u8 x=g_TeamGrayPos[g_Team1PaletteId].x;x<g_TeamGrayPos[g_Team1PaletteId].x+10;x++){
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	b, (hl)
00289$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1214: for(u8 y=g_TeamGrayPos[g_Team1PaletteId].y;y<g_TeamGrayPos[g_Team1PaletteId].y+9;y++){
	ld	a, (_g_Team1PaletteId+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	a, l
	add	a, #<(_g_TeamGrayPos)
	ld	-2 (ix), a
	ld	a, h
	adc	a, #>(_g_TeamGrayPos)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1215: for(u8 x=g_TeamGrayPos[g_Team1PaletteId].x;x<g_TeamGrayPos[g_Team1PaletteId].x+10;x++){
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ex	de, hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	h, a
	sbc	hl, de
	jr	NC, 00293$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1216: V9_PutLayerATileAtPos(x,y,0);
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_V9_PutLayerATileAtPos
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1215: for(u8 x=g_TeamGrayPos[g_Team1PaletteId].x;x<g_TeamGrayPos[g_Team1PaletteId].x+10;x++){
	inc	b
	jp	00289$
00293$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1214: for(u8 y=g_TeamGrayPos[g_Team1PaletteId].y;y<g_TeamGrayPos[g_Team1PaletteId].y+9;y++){
	inc	c
	jp	00292$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1220: SpriteBlinking();
	call	_SpriteBlinking
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1224: V9_PrintLayerAStringAtPos(4,0,"     CPU TEAM SELECT   ");
	ld	hl, #___str_13
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x04
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1226: g_Team2PaletteId = SelectTeam(SPRITE_CPU, g_Team1PaletteId);
	ld	a, (_g_Team1PaletteId+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0xf5
	call	_SelectTeam
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1229: for(u8 y=g_TeamGrayPos[g_Team2PaletteId].y;y<g_TeamGrayPos[g_Team2PaletteId].y+9;y++){
	ld	(_g_Team2PaletteId+0), a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc,#_g_TeamGrayPos
	add	hl,bc
	ex	de, hl
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	-2 (ix), a
00298$:
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x0009
	add	hl, bc
	ld	a, -2 (ix)
	ld	b, #0x00
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1230: for(u8 x=g_TeamGrayPos[g_Team2PaletteId].x;x<g_TeamGrayPos[g_Team2PaletteId].x+10;x++){
	ld	a, (de)
	ld	-1 (ix), a
00295$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1229: for(u8 y=g_TeamGrayPos[g_Team2PaletteId].y;y<g_TeamGrayPos[g_Team2PaletteId].y+9;y++){
	ld	a, (_g_Team2PaletteId+0)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_g_TeamGrayPos
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1230: for(u8 x=g_TeamGrayPos[g_Team2PaletteId].x;x<g_TeamGrayPos[g_Team2PaletteId].x+10;x++){
	ld	e, l
	ld	d, h
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x000a
	add	hl, bc
	ld	a, -1 (ix)
	ld	b, #0x00
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC, 00299$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1231: V9_PutLayerATileAtPos(x,y,0);
	ld	hl, #0x0000
	push	hl
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_V9_PutLayerATileAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1230: for(u8 x=g_TeamGrayPos[g_Team2PaletteId].x;x<g_TeamGrayPos[g_Team2PaletteId].x+10;x++){
	inc	-1 (ix)
	jp	00295$
00299$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1229: for(u8 y=g_TeamGrayPos[g_Team2PaletteId].y;y<g_TeamGrayPos[g_Team2PaletteId].y+9;y++){
	inc	-2 (ix)
	jp	00298$
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1236: SpriteBlinking();
	call	_SpriteBlinking
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1238: attr.D = 1; 
	ld	hl, #3
	add	hl, sp
	set	4, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1239: V9_SetSpriteP1(0, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xfe00
	ld	hl, #0x0003
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	6, l
	ld	a, #0x08
	call	_V9_SetRegister
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1246: if(g_ShowButtonsInfo){
	ld	a, (_g_ShowButtonsInfo+0)
	or	a, a
	jp	Z, 00116$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1247: g_ShowButtonsInfo=false;
	ld	hl, #_g_ShowButtonsInfo
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:353: inline void V9_FillVRAM(u32 addr, u8 value, u16 count) { V9_SetWriteAddress(addr); V9_FillVRAM_CurrentAddr(value, count); }
	ld	de, #0x0000
	ld	(hl), e
	ld	hl, #0x0000
	call	_V9_SetWriteAddress
	ld	de, #0x6a00
	xor	a, a
	call	_V9_FillVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0014
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1250: V9_WriteVRAM(V9_P1_PGT_A, g_Buttons_part1, sizeof(g_Buttons_part1)); // Load tiles (part 1)
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x0000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_Buttons_part1
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0015
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1252: V9_WriteVRAM(V9_P1_PGT_A + 16384, g_Buttons_part2, sizeof(g_Buttons_part2)); // Load tiles (part 2)
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x4000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_Buttons_part2
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	l, #0x13
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1257: V9_SetPalette(0, 16, g_Buttons_palette);
	ld	bc, #_g_Buttons_palette
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1028: }
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
00301$:
	ld	a, -1 (ix)
	sub	a, #0x10
	jr	NC, 00257$
	ld	a, -2 (ix)
	ld	-3 (ix), a
	inc	-2 (ix)
	push	bc
	ld	e, c
	ld	d, b
	ld	a, -3 (ix)
	call	_V9_SetPaletteEntry
	pop	bc
	inc	bc
	inc	bc
	inc	bc
	inc	-1 (ix)
	jp	00301$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1257: V9_SetPalette(0, 16, g_Buttons_palette);
00257$:
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
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1259: u16 tileId=0;
	ld	bc, #0x0000
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1261: for (u8 y=0;y<64;y++){
	ld	-1 (ix), #0x00
00307$:
	ld	a, -1 (ix)
	sub	a, #0x40
	jr	NC, 00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1262: for (u8 x=0;x<32;x++){
	ld	e, #0x00
00304$:
	ld	a, e
	sub	a, #0x20
	jr	NC, 00403$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1263: V9_PutLayerATileAtPos(x,y,tileId++);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	bc
	push	bc
	push	de
	push	hl
	ld	l, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_V9_PutLayerATileAtPos
	pop	de
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1262: for (u8 x=0;x<32;x++){
	inc	e
	jp	00304$
00403$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1261: for (u8 y=0;y<64;y++){
	inc	-1 (ix)
	jp	00307$
00111$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:574: inline void V9_SetInterrupt(u8 flags) { V9_SetRegister(9, flags); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_V9_SetRegister
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	res	7, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1268: while(!IsTeamJoystickTriggerPressed(TEAM_1)){
00112$:
	ld	a, #0x01
	call	_IsTeamJoystickTriggerPressed
	or	a, a
	jr	NZ, 00321$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1269: UpdateV9990();
	call	_UpdateV9990
	jp	00112$
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:473: inline void V9_SetDisplayEnable(bool enable) { V9_SetFlag(8, V9_R08_DISP_ON, enable ? V9_R08_DISP_ON : 0); }
00321$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1272: V9_SetDisplayEnable(FALSE);
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1274: g_MatchStatus=MATCH_NOT_STARTED;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1275: LoadP1LayerA();
	call	_LoadP1LayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1276: LoadP1LayerB();
	call	_LoadP1LayerB
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1278: InitPalette();
	call	_InitPalette
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1280: if(g_FioBreText[0]=='R' && g_FioBreText[1]=='E' && g_FioBreText[2]=='N' && g_FioBreText[3]=='Z' && g_FioBreText[4]=='O'){
	ld	a, (#_g_FioBreText + 0)
	sub	a, #0x52
	jr	NZ, 00118$
	ld	a, (#_g_FioBreText + 1)
	sub	a, #0x45
	jr	NZ, 00118$
	ld	a, (#_g_FioBreText + 2)
	sub	a, #0x4e
	jr	NZ, 00118$
	ld	a, (#_g_FioBreText + 3)
	sub	a, #0x5a
	jr	NZ, 00118$
	ld	a, (#_g_FioBreText + 4)
	sub	a, #0x4f
	jr	NZ, 00118$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1281: g_FioBre=true;
	ld	hl, #_g_FioBre
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1282: g_Team2PaletteId=TEAM_AUS;
	ld	hl, #_g_Team2PaletteId
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1283: g_Team1PaletteId=TEAM_ITA;
	ld	hl, #_g_Team1PaletteId
	ld	(hl), #0x02
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1285: ShowField();
	call	_ShowField
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	res	7, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:574: inline void V9_SetInterrupt(u8 flags) { V9_SetRegister(9, flags); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1290: GameStart();
	call	_GameStart
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1291: }
	ld	sp, ix
	pop	ix
	ret
___str_12:
	.ascii "    PLAYER TEAM SELECT"
	.db 0x00
___str_13:
	.ascii "     CPU TEAM SELECT   "
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1292: void LoadPresentation(){
;	---------------------------------
; Function LoadPresentation
; ---------------------------------
_LoadPresentation::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1293: V9_SetScreenMode(V9_MODE_B1);
	ld	a, #0x03
	call	_V9_SetScreenMode
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1295: V9_SetColorMode(V9_COLOR_BD8);
	ld	a, #0x03
	call	_V9_SetColorMode
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1296: const u8 colorBlack[3] = { 0, 0, 0 };
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	xor	a, a
	ld	(de), a
	ld	-2 (ix), #0x00
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1297: V9_SetPaletteEntry(0, colorBlack);    
	xor	a, a
	call	_V9_SetPaletteEntry
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:480: inline void V9_SetBackgroundColor(u8 color) { V9_SetRegister(15, color); }
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_V9_SetRegister
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x000c
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1300: V9_WriteVRAM(V9_BMP_PGT, g_Presentation_part1, sizeof(g_Presentation_part1)); 
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x0000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_Presentation_part1
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x000d
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1302: V9_WriteVRAM(V9_BMP_PGT + 16384L, g_Presentation_part2, sizeof(g_Presentation_part2)); 
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x4000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_Presentation_part2
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x000e
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1304: V9_WriteVRAM(V9_BMP_PGT + 16384L+16384L, g_Presentation_part3, sizeof(g_Presentation_part3)); 
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x8000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_Presentation_part3
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x000f
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1306: V9_WriteVRAM(V9_BMP_PGT + 16384L+16384L+16384L, g_Presentation_part4, sizeof(g_Presentation_part4)); 
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xc000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x1400
	ld	hl, #_g_Presentation_part4
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1309: g_MatchStatus=MATCH_PRESENTATION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0f
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1310: g_Timer=0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	res	7, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:574: inline void V9_SetInterrupt(u8 flags) { V9_SetRegister(9, flags); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1314: while (g_Timer!=200)
00101$:
	ld	a, (_g_Timer+0)
	sub	a, #0xc8
	jr	NZ, 00101$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1319: g_MatchStatus=MATCH_NOT_STARTED;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x00
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1321: V9_SetDisplayEnable(FALSE);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1323: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1324: void TickGoalkeeperAnimation() {
;	---------------------------------
; Function TickGoalkeeperAnimation
; ---------------------------------
_TickGoalkeeperAnimation::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1325: if (g_MatchStatus != MATCH_BALL_ON_GOALKEEPER) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0d
	jp	NZ,00148$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1326: if (s_GkAnimPlayerId == NO_VALUE) return;
	ld	a, (_s_GkAnimPlayerId+0)
	inc	a
	jp	Z,00148$
	jp	00104$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1329: g_Players[s_GkAnimPlayerId].Status = PLAYER_STATUS_POSITIONED;
	ld	bc, #_g_Players+0
	ld	de, (_s_GkAnimPlayerId)
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
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1331: s_GkAnimTimer++;
	ld	hl, #_s_GkAnimTimer
	inc	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1333: u8 kickTime = 60; // 1 Second delay for all (was 30)
	ld	e, #0x3c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1334: if (g_GkIsGroundKick) kickTime = 6; // Immediate kick for ground kicks
	ld	a, (_g_GkIsGroundKick+0)
	or	a, a
	jr	Z, 00106$
	ld	e, #0x06
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1337: if (s_GkAnimTimer < kickTime) {
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1338: if (s_GkAnimTimer < 30 && (s_GkAnimTimer % 2) == 0 && g_GkRecoilY != 0) { // Faster movement (every 2 frames)
	ld	a,(_s_GkAnimTimer+0)
	cp	a,e
	jp	NC,00146$
	sub	a, #0x1e
	jp	NC, 00112$
	ld	iy, #_s_GkAnimTimer
	bit	0, 0 (iy)
	jp	NZ,00112$
	ld	a, (_g_GkRecoilY+0)
	or	a, a
	jp	Z, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1339: g_Players[s_GkAnimPlayerId].Y += g_GkRecoilY;
	ld	de, (_s_GkAnimPlayerId)
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
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, (_g_GkRecoilY+0)
	push	iy
	ld	-4 (ix), a
	pop	iy
	rlca
	sbc	a, a
	push	iy
	ld	-3 (ix), a
	pop	iy
	add	iy, de
	push	iy
	pop	de
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1342: if(g_Players[s_GkAnimPlayerId].Y < FIELD_BOUND_Y_TOP) g_Players[s_GkAnimPlayerId].Y = FIELD_BOUND_Y_TOP;
	ld	de, (_s_GkAnimPlayerId)
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
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, e
	sub	a, #0x32
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00108$
	ld	(hl), #0x32
	inc	hl
	ld	(hl), #0x00
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1343: if(g_Players[s_GkAnimPlayerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[s_GkAnimPlayerId].Y = FIELD_BOUND_Y_BOTTOM;
	ld	de, (_s_GkAnimPlayerId)
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
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, #0xae
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00110$
	ld	(hl), #0xae
	inc	hl
	ld	(hl), #0x01
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1345: g_Players[s_GkAnimPlayerId].TargetY = g_Players[s_GkAnimPlayerId].Y; // Sync target
	ld	de, (_s_GkAnimPlayerId)
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
	ld	a, l
	add	a, #0x0e
	ld	-2 (ix), a
	ld	a, h
	adc	a, #0x00
	ld	-1 (ix), a
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1348: if (g_Players[s_GkAnimPlayerId].TeamId == TEAM_1) g_Players[s_GkAnimPlayerId].PatternId = PLAYER_POSE_TEAM1_GK_BALL_FRONT;
	ld	de, (_s_GkAnimPlayerId)
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
	ex	de, hl
	push	de
	pop	iy
	ld	c, 9 (iy)
	ld	hl, #0x0008
	add	hl, de
	dec	c
	jr	NZ, 00116$
	ld	(hl), #0x9e
	jp	00117$
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1349: else g_Players[s_GkAnimPlayerId].PatternId = PLAYER_POSE_FRONT; // Team 2 GK plays like a player (feet)
	ld	(hl), #0x10
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1351: PutBallOnPlayerFeet(s_GkAnimPlayerId);
	ld	a, (_s_GkAnimPlayerId+0)
	call	_PutBallOnPlayerFeet
	jp	00148$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1353: } else if (s_GkAnimTimer == kickTime) {
	ld	a, (_s_GkAnimTimer+0)
	sub	a, e
	jp	NZ,00143$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1356: u8 targetId = GetBestPassTarget(s_GkAnimPlayerId); 
	push	bc
	ld	a, (_s_GkAnimPlayerId+0)
	call	_GetBestPassTarget
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1358: if (targetId != NO_VALUE) {
	ld	e, a
	inc	a
	jr	Z, 00138$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1359: PerformPass(targetId);
	push	bc
	ld	a, e
	call	_PerformPass
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1362: u8 dir = g_Players[s_GkAnimPlayerId].Direction;
	ld	de, (_s_GkAnimPlayerId)
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
	ex	de, hl
	push	de
	pop	iy
	ld	a, 10 (iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1366: if (dir == DIRECTION_RIGHT || dir == DIRECTION_UP_RIGHT || dir == DIRECTION_DOWN_RIGHT) 
	cp	a, #0x03
	jr	Z, 00123$
	cp	a, #0x02
	jr	Z, 00123$
	cp	a, #0x04
	jr	NZ, 00124$
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1367: pose = (team == TEAM_1) ? PLAYER_POSE_TEAM1_RESTART_RIGHT : PLAYER_POSE_TEAM2_RESTART_RIGHT;
	ld	-1 (ix), #0xcb
	jp	00125$
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1368: else if (dir == DIRECTION_LEFT || dir == DIRECTION_UP_LEFT || dir == DIRECTION_DOWN_LEFT)
	cp	a, #0x07
	jr	Z, 00118$
	cp	a, #0x08
	jr	Z, 00118$
	sub	a, #0x06
	jr	NZ, 00119$
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1369: pose = (team == TEAM_1) ? PLAYER_POSE_TEAM1_RESTART_LEFT : PLAYER_POSE_TEAM2_RESTART_LEFT;
	ld	-1 (ix), #0x44
	jp	00125$
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1371: pose = (team == TEAM_1) ? PLAYER_POSE_TEAM1_RESTART_FRONT : PLAYER_POSE_TEAM2_RESTART_FRONT;
	ld	-1 (ix), #0x45
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1373: g_Players[s_GkAnimPlayerId].PatternId = pose;
	ld	hl, #0x0008
	add	hl, de
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1375: g_Players[s_GkAnimPlayerId].Status = PLAYER_STATUS_POSITIONED;
	ld	de, (_s_GkAnimPlayerId)
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
	ld	bc, #0x0012
	add	hl, bc
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1378: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
	jp	00148$
00138$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1382: u8 team = g_Players[s_GkAnimPlayerId].TeamId;
	ld	de, (_s_GkAnimPlayerId)
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
	ex	de, hl
	push	de
	pop	iy
	ld	a, 9 (iy)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1384: g_Players[s_GkAnimPlayerId].PatternId = pose;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x45
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1387: u16 tx = g_Players[s_GkAnimPlayerId].X;
	ld	de, (_s_GkAnimPlayerId)
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
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1390: if (g_Players[s_GkAnimPlayerId].Y > (FIELD_BOUND_Y_TOP + 100)) ty = g_Players[s_GkAnimPlayerId].Y - 100;
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1389: if (team == TEAM_1) { // Shooting UP
	ld	a, -1 (ix)
	dec	a
	jr	NZ, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1390: if (g_Players[s_GkAnimPlayerId].Y > (FIELD_BOUND_Y_TOP + 100)) ty = g_Players[s_GkAnimPlayerId].Y - 100;
	ld	a, #0x96
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00129$
	ld	a, e
	add	a, #0x9c
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	d, a
	jp	00136$
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1391: else ty = FIELD_BOUND_Y_TOP;
	ld	de, #0x0032
	jp	00136$
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1393: if (g_Players[s_GkAnimPlayerId].Y < (FIELD_BOUND_Y_BOTTOM - 100)) ty = g_Players[s_GkAnimPlayerId].Y + 100;
	ld	a, e
	sub	a, #0x4a
	ld	a, d
	sbc	a, #0x01
	jr	NC, 00132$
	ld	hl, #0x0064
	add	hl, de
	ex	de, hl
	jp	00136$
00132$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1394: else ty = FIELD_BOUND_Y_BOTTOM;
	ld	de, #0x01ae
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1397: PerformShot(tx, ty);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_PerformShot
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1400: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
	jp	00148$
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1403: } else if (s_GkAnimTimer > (kickTime + 15)) {
	ld	d, #0x00
	ld	hl, #0x000f
	add	hl, de
	ld	a, (_s_GkAnimTimer+0)
	ld	e, a
	ld	d, #0x00
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00270$
	xor	a, #0x80
00270$:
	jp	P, 00148$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1406: g_Players[s_GkAnimPlayerId].Status = PLAYER_STATUS_NONE;
	ld	de, (_s_GkAnimPlayerId)
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
	ld	bc, #0x0012
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00148$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1408: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1410: void PerformShot(u16 targetX, u16 targetY) {
;	---------------------------------
; Function PerformShot
; ---------------------------------
_PerformShot::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-20
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	-4 (ix), e
	ld	-3 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1411: u8 fromId = g_Ball.PossessionPlayerId;
	ld	a, (#(_g_Ball + 6) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1412: if (fromId == NO_VALUE) return;
	ld	-5 (ix), a
	inc	a
	jp	Z,00132$
	jp	00102$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1418: dx = (i16)targetX - (i16)g_Players[fromId].X;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	e, -5 (ix)
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
	ex	(sp), hl
	ld	a, -20 (ix)
	add	a, #0x02
	ld	-18 (ix), a
	ld	a, -19 (ix)
	adc	a, #0x00
	ld	-17 (ix), a
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	-16 (ix), c
	ld	-15 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1419: dy = (i16)targetY - (i16)g_Players[fromId].Y;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	-14 (ix), c
	ld	-13 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1420: adx = (dx < 0) ? -dx : dx;
	ld	a, -16 (ix)
	ld	-12 (ix), a
	ld	a, -15 (ix)
	ld	-11 (ix), a
	bit	7, -11 (ix)
	jr	Z, 00134$
	xor	a, a
	sub	a, -16 (ix)
	ld	c, a
	sbc	a, a
	sub	a, -15 (ix)
	jp	00135$
00134$:
	ld	c, -16 (ix)
	ld	a, -15 (ix)
00135$:
	ld	-10 (ix), c
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1421: ady = (dy < 0) ? -dy : dy;
	ld	a, -14 (ix)
	ld	-8 (ix), a
	ld	a, -13 (ix)
	ld	-7 (ix), a
	bit	7, -7 (ix)
	jr	Z, 00136$
	xor	a, a
	sub	a, -14 (ix)
	ld	-6 (ix), a
	sbc	a, a
	sub	a, -13 (ix)
	ld	-5 (ix), a
	jp	00137$
00136$:
	ld	a, -14 (ix)
	ld	-6 (ix), a
	ld	a, -13 (ix)
	ld	-5 (ix), a
00137$:
	ld	c, -6 (ix)
	ld	b, -5 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1423: if (adx > ady * 2) {
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00238$
	xor	a, #0x80
00238$:
	jp	P, 00110$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1424: newDir = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
	xor	a, a
	cp	a, -12 (ix)
	sbc	a, -11 (ix)
	jp	PO, 00239$
	xor	a, #0x80
00239$:
	jp	P, 00138$
	ld	bc, #0x0003
	jp	00139$
00138$:
	ld	bc, #0x0007
00139$:
	ld	-5 (ix), c
	jp	00111$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1425: } else if (ady > adx * 2) {
	ex	de, hl
	add	hl, hl
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1426: newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
	xor	a, a
	cp	a, -8 (ix)
	sbc	a, -7 (ix)
	jp	PO, 00240$
	xor	a, #0x80
00240$:
	rlca
	and	a,#0x01
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1425: } else if (ady > adx * 2) {
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00241$
	xor	a, #0x80
00241$:
	jp	P, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1426: newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
	ld	a, l
	or	a, a
	jr	Z, 00140$
	ld	bc, #0x0005
	jp	00141$
00140$:
	ld	bc, #0x0001
00141$:
	ld	-5 (ix), c
	jp	00111$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1428: if (dx > 0) newDir = (dy > 0) ? DIRECTION_DOWN_RIGHT : DIRECTION_UP_RIGHT;
	xor	a, a
	cp	a, -12 (ix)
	sbc	a, -11 (ix)
	jp	PO, 00242$
	xor	a, #0x80
00242$:
	jp	P, 00104$
	ld	a, l
	or	a, a
	jr	Z, 00142$
	ld	bc, #0x0004
	jp	00143$
00142$:
	ld	bc, #0x0002
00143$:
	ld	-5 (ix), c
	jp	00111$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1429: else newDir = (dy > 0) ? DIRECTION_DOWN_LEFT : DIRECTION_UP_LEFT;
	ld	a, l
	or	a, a
	jr	Z, 00144$
	ld	bc, #0x0006
	jp	00145$
00144$:
	ld	bc, #0x0008
00145$:
	ld	-5 (ix), c
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1431: g_Players[fromId].Direction = newDir;
	pop	hl
	push	hl
	ld	de, #0x000a
	add	hl, de
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1434: if (newDir == DIRECTION_UP || newDir == DIRECTION_UP_LEFT || newDir == DIRECTION_UP_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_FRONT;
	ld	a, -5 (ix)
	dec	a
	jr	Z, 00122$
	ld	a, -5 (ix)
	sub	a, #0x08
	jr	Z, 00122$
	ld	a, -5 (ix)
	sub	a, #0x02
	jr	NZ, 00123$
00122$:
	ld	a, -20 (ix)
	add	a, #0x08
	ld	-6 (ix), a
	ld	a, -19 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), #0x18
	jp	00124$
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1435: else if (newDir == DIRECTION_DOWN || newDir == DIRECTION_DOWN_LEFT || newDir == DIRECTION_DOWN_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_BACK;
	ld	a, -5 (ix)
	sub	a, #0x05
	jr	Z, 00117$
	ld	a, -5 (ix)
	sub	a, #0x06
	jr	Z, 00117$
	ld	a, -5 (ix)
	sub	a, #0x04
	jr	NZ, 00118$
00117$:
	pop	hl
	push	hl
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0x15
	jp	00124$
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1436: else if (newDir == DIRECTION_LEFT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_LEFT;
	ld	a, -5 (ix)
	sub	a, #0x07
	jr	NZ, 00115$
	pop	hl
	push	hl
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0xa4
	jp	00124$
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1437: else if (newDir == DIRECTION_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_RIGHT;
	ld	a, -5 (ix)
	sub	a, #0x03
	jr	NZ, 00124$
	pop	hl
	push	hl
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0x1b
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1439: g_Players[fromId].Status = PLAYER_STATUS_POSITIONED; // Lock pose
	pop	hl
	push	hl
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1442: g_Players[fromId].TargetX = g_Players[fromId].X;
	ld	a, -20 (ix)
	add	a, #0x10
	ld	c, a
	ld	a, -19 (ix)
	adc	a, #0x00
	ld	b, a
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1443: g_Players[fromId].TargetY = g_Players[fromId].Y;
	ld	a, -20 (ix)
	add	a, #0x0e
	ld	c, a
	ld	a, -19 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1445: SetPlayerBallPossession(NO_VALUE);
	ld	a, #0xff
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1446: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1447: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1448: g_Ball.ShotActive = 1;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1449: g_Ball.TargetX = targetX;
	ld	hl, #(_g_Ball + 23)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1450: g_Ball.TargetY = targetY;
	ld	hl, #(_g_Ball + 25)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1451: g_Ball.PassStartX = g_Ball.X;
	ld	bc, (#_g_Ball + 2)
	ld	((_g_Ball + 17)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1452: g_Ball.PassStartY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 19)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1455: i16 arcDy = dy;
	ld	c, -14 (ix)
	ld	b, -13 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1456: if (targetY < FIELD_BOUND_Y_TOP) { // Shooting UP
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	a, e
	sub	a, #0x32
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00130$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1457: arcDy = (i16)FIELD_BOUND_Y_TOP - (i16)g_Players[fromId].Y;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0x32
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	jp	00131$
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1458: } else if (targetY > FIELD_BOUND_Y_BOTTOM) { // Shooting DOWN
	ld	a, #0xae
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00131$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1459: arcDy = (i16)FIELD_BOUND_Y_BOTTOM - (i16)g_Players[fromId].Y;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xae
	sub	a, c
	ld	c, a
	ld	a, #0x01
	sbc	a, b
	ld	b, a
00131$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1461: g_Ball.PassTotalDist = (u16)(Math_Abs32(dx) + Math_Abs32(arcDy));
	ld	e, -16 (ix)
	ld	a, -15 (ix)
	ld	d, a
	rlca
	sbc	hl, hl
	push	bc
	call	_Math_Abs32
	ld	-8 (ix), e
	ld	-7 (ix), d
	ld	-6 (ix), l
	ld	-5 (ix), h
	pop	bc
	ld	a, b
	rlca
	sbc	hl, hl
	ld	e, c
	ld	d, b
	call	_Math_Abs32
	ld	c, -8 (ix)
	ld	b, -7 (ix)
	ex	de, hl
	add	hl, bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	hl, #(_g_Ball + 21)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
00132$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1462: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1464: void TickBallFlying() {
;	---------------------------------
; Function TickBallFlying
; ---------------------------------
_TickBallFlying::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-24
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1466: if(g_MatchStatus == MATCH_BEFORE_THROW_IN || g_MatchStatus == MATCH_THROW_IN || 
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x03
	jp	Z,00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1467: g_MatchStatus == MATCH_BEFORE_GOAL_KICK || g_MatchStatus == MATCH_GOAL_KICK ||
	cp	a,#0x08
	jp	Z,00198$
	cp	a,#0x05
	jp	Z,00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1468: g_MatchStatus == MATCH_BEFORE_CORNER_KICK || g_MatchStatus == MATCH_CORNER_KICK ||
	cp	a,#0x0a
	jp	Z,00198$
	cp	a,#0x02
	jp	Z,00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1469: g_MatchStatus == MATCH_BEFORE_KICK_OFF) {
	cp	a,#0x09
	jp	Z,00198$
	dec	a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1470: return;
	jp	Z,00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1474: if (g_Ball.PossessionPlayerId != NO_VALUE) return;
	ld	a, (#(_g_Ball + 6) + 0)
	inc	a
	jp	NZ,00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1477: bool isMovingToPlayer = (g_Ball.PassTargetPlayerId != NO_VALUE);
	ld	hl, #(_g_Ball + 16)
	ld	c, (hl)
	ld	a, c
	inc	a
	ld	a, #0x01
	jr	Z, 00483$
	xor	a, a
00483$:
	xor	a, #0x01
	ld	-22 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1478: bool isFreeMoving = (g_Ball.ShotActive != 0);
	ld	a, (#(_g_Ball + 27) + 0)
	ld	-21 (ix), a
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1480: if (!isMovingToPlayer && !isFreeMoving) return;
	ld	a, -22 (ix)
	or	a,a
	jr	NZ, 00112$
	or	a,b
	jp	Z,00198$
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1484: if (isMovingToPlayer) {
	ld	a, -22 (ix)
	or	a, a
	jr	Z, 00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1485: tx = g_Players[g_Ball.PassTargetPlayerId].X;
	ld	de, #_g_Players+0
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
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1486: ty = g_Players[g_Ball.PassTargetPlayerId].Y;
	ld	a, (de)
	ld	-20 (ix), a
	inc	de
	ld	a, (de)
	ld	-19 (ix), a
	jp	00116$
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1488: tx = g_Ball.TargetX;
	ld	bc, (#_g_Ball + 23)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1489: ty = g_Ball.TargetY;
	ld	hl, #_g_Ball + 25
	ld	a, (hl)
	ld	-20 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-19 (ix), a
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1493: i16 dx = tx - (i16)g_Ball.X;
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-18 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-17 (ix), a
	ld	e, -18 (ix)
	ld	d, -17 (ix)
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	-16 (ix), c
	ld	-15 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1494: i16 dy = ty - (i16)g_Ball.Y;
	ld	hl, (#_g_Ball + 0)
	ld	a, -20 (ix)
	sub	a, l
	ld	c, a
	ld	a, -19 (ix)
	sbc	a, h
	ld	-14 (ix), c
	ld	-13 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1497: u8 speed = 3; 
	ld	-12 (ix), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1498: if (g_Ball.ShotActive == 1) speed = 5; // Fast High Shot/Kick
	ld	a, -21 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00485$
	xor	a, a
00485$:
	ld	-11 (ix), a
	or	a, a
	jr	Z, 00123$
	ld	-12 (ix), #0x05
	jp	00124$
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1499: else if (g_Ball.ShotActive == 2) speed = 3; // Slower Bounce
	ld	a, -21 (ix)
	sub	a, #0x02
	jr	NZ, 00120$
	ld	-12 (ix), #0x03
	jp	00124$
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1500: else if (g_Ball.ShotActive == 3) speed = 2; // Rolling
	ld	a, -21 (ix)
	sub	a, #0x03
	jr	NZ, 00124$
	ld	-12 (ix), #0x02
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1503: if (dx > -speed && dx < speed && dy > -speed && dy < speed) {
	ld	a, -12 (ix)
	ld	-10 (ix), a
	ld	-9 (ix), #0x00
	xor	a, a
	sub	a, -10 (ix)
	ld	-8 (ix), a
	sbc	a, a
	sub	a, -9 (ix)
	ld	-7 (ix), a
	ld	a, -16 (ix)
	ld	-6 (ix), a
	ld	a, -15 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	sub	a, -6 (ix)
	ld	a, -7 (ix)
	sbc	a, -5 (ix)
	jp	PO, 00490$
	xor	a, #0x80
00490$:
	jp	P, 00160$
	ld	a, -12 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	a, -16 (ix)
	sub	a, -4 (ix)
	ld	a, -15 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00491$
	xor	a, #0x80
00491$:
	jp	P, 00160$
	ld	a, -14 (ix)
	ld	-2 (ix), a
	ld	a, -13 (ix)
	ld	-1 (ix), a
	ld	a, -8 (ix)
	sub	a, -2 (ix)
	ld	a, -7 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00492$
	xor	a, #0x80
00492$:
	jp	P, 00160$
	ld	a, -14 (ix)
	sub	a, -4 (ix)
	ld	a, -13 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00493$
	xor	a, #0x80
00493$:
	jp	P, 00160$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1507: if (isMovingToPlayer) {
	ld	a, -22 (ix)
	or	a, a
	jr	Z, 00157$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1509: g_Ball.KickMoveState = 3; // Force ball to snap to feet immediately (No visual lag)
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1510: PutBallOnPlayerFeet(g_Ball.PassTargetPlayerId);
	ld	a, (#(_g_Ball + 16) + 0)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1511: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1512: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1513: return;
	jp	00198$
00157$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1519: if (g_Ball.ShotActive == 1) {
	ld	a, -11 (ix)
	or	a, a
	jp	Z, 00154$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1523: bool isInsideField = (ty >= FIELD_BOUND_Y_TOP && ty <= FIELD_BOUND_Y_BOTTOM);
	ld	a, -20 (ix)
	ld	-2 (ix), a
	ld	a, -19 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	sub	a, #0x32
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00200$
	ld	a, #0xae
	cp	a, -2 (ix)
	ld	a, #0x01
	sbc	a, -1 (ix)
	jp	PO, 00494$
	xor	a, #0x80
00494$:
	jp	P, 00201$
00200$:
	ld	-1 (ix), #0x00
	jp	00202$
00201$:
	ld	-1 (ix), #0x01
00202$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1525: if (isInsideField) {
	ld	a, -1 (ix)
	or	a, a
	jp	Z, 00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1529: i16 totalVectorX = (i16)g_Ball.TargetX - (i16)g_Ball.PassStartX;
	ld	hl, #(_g_Ball + 23)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
	ld	hl, #(_g_Ball + 17)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	sub	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	sbc	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1530: i16 totalVectorY = (i16)g_Ball.TargetY - (i16)g_Ball.PassStartY;
	ld	hl, #(_g_Ball + 25)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
	ld	hl, #(_g_Ball + 19)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	sub	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	sbc	a, -5 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1533: g_Ball.PassStartX = g_Ball.X;
	ld	hl, #(_g_Ball + 17)
	ld	a, -18 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -17 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1534: g_Ball.PassStartY = g_Ball.Y;
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	hl, #(_g_Ball + 19)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1537: i16 bounceDx = totalVectorX / 4; 
	ld	a, -4 (ix)
	ld	-7 (ix), a
	ld	a, -3 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-4 (ix), a
	ld	a, -6 (ix)
	ld	-3 (ix), a
	bit	7, -6 (ix)
	jr	Z, 00203$
	ld	a, -7 (ix)
	add	a, #0x03
	ld	-4 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
00203$:
	sra	-3 (ix)
	rr	-4 (ix)
	sra	-3 (ix)
	rr	-4 (ix)
	ld	a, -4 (ix)
	ld	-10 (ix), a
	ld	a, -3 (ix)
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1538: i16 bounceDy = totalVectorY / 4; 
	ld	a, -2 (ix)
	ld	-5 (ix), a
	ld	a, -1 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, -4 (ix)
	ld	-1 (ix), a
	bit	7, -4 (ix)
	jr	Z, 00204$
	ld	a, -5 (ix)
	add	a, #0x03
	ld	-2 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
00204$:
	sra	-1 (ix)
	rr	-2 (ix)
	sra	-1 (ix)
	rr	-2 (ix)
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1541: i16 newTx = (i16)g_Ball.X + bounceDx;
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -10 (ix)
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -9 (ix)
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1542: i16 newTy = (i16)g_Ball.Y + bounceDy;
	ld	hl, #_g_Ball
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
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1545: if (newTx < FIELD_BOUND_X_LEFT) newTx = FIELD_BOUND_X_LEFT;
	ld	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	sub	a, #0x0a
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00128$
	ld	-6 (ix), #0x0a
	ld	-5 (ix), #0
	jp	00129$
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1546: else if (newTx > FIELD_BOUND_X_RIGHT) newTx = FIELD_BOUND_X_RIGHT;
	ld	a, #0xf6
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00495$
	xor	a, #0x80
00495$:
	jp	P, 00129$
	ld	-6 (ix), #0xf6
	ld	-5 (ix), #0
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1548: if (newTy < FIELD_BOUND_Y_TOP) newTy = FIELD_BOUND_Y_TOP;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	a, c
	sub	a, #0x32
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00133$
	ld	-4 (ix), #0x32
	ld	-3 (ix), #0
	jp	00134$
00133$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1549: else if (newTy > FIELD_BOUND_Y_BOTTOM) newTy = FIELD_BOUND_Y_BOTTOM;
	ld	a, #0xae
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	jp	PO, 00496$
	xor	a, #0x80
00496$:
	jp	P, 00134$
	ld	-4 (ix), #0xae
	ld	-3 (ix), #0x01
00134$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1551: g_Ball.TargetX = newTx;
	ld	hl, #(_g_Ball + 23)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1552: g_Ball.TargetY = newTy;
	ld	hl, #(_g_Ball + 25)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1555: g_Ball.PassTotalDist = (u16)(Math_Abs32(bounceDx) + Math_Abs32(bounceDy));
	ld	e, -10 (ix)
	ld	a, -9 (ix)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_Math_Abs32
	push	hl
	pop	iy
	ld	c, e
	ld	b, d
	ld	e, -8 (ix)
	ld	a, -7 (ix)
	ld	d, a
	rlca
	sbc	hl, hl
	push	bc
	push	iy
	call	_Math_Abs32
	pop	iy
	pop	bc
	ex	de, hl
	add	hl, bc
	ex	de, hl
	ld	((_g_Ball + 21)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1557: if (g_Ball.PassTotalDist > 5) {
	ld	a, #0x05
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	NC, 00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1558: g_Ball.ShotActive = 2; // Enter Bounce State
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1559: return; 
	jp	00198$
00154$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1562: } else if (g_Ball.ShotActive == 2) {
	ld	a, -21 (ix)
	sub	a, #0x02
	jp	NZ,00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1566: i16 vecX = (i16)g_Ball.TargetX - (i16)g_Ball.PassStartX;
	ld	bc, (#(_g_Ball + 23) + 0)
	ld	hl, (#(_g_Ball + 17) + 0)
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1567: i16 vecY = (i16)g_Ball.TargetY - (i16)g_Ball.PassStartY;
	ld	de, (#(_g_Ball + 25) + 0)
	ld	hl, (#(_g_Ball + 19) + 0)
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
	ld	-2 (ix), e
	ld	-1 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1569: g_Ball.PassStartX = g_Ball.X;
	ld	hl, #(_g_Ball + 17)
	ld	a, -18 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -17 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1570: g_Ball.PassStartY = g_Ball.Y;
	ld	de, (#_g_Ball + 0)
	ld	((_g_Ball + 19)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1573: i16 rollDx = vecX / 4; 
	ld	e, c
	ld	d, b
	bit	7, b
	jr	Z, 00205$
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
00205$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	-10 (ix), e
	ld	-9 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1574: i16 rollDy = vecY / 4; 
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
	bit	7, -3 (ix)
	jr	Z, 00206$
	ld	a, -4 (ix)
	add	a, #0x03
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
00206$:
	sra	-1 (ix)
	rr	-2 (ix)
	sra	-1 (ix)
	rr	-2 (ix)
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1579: i16 rollTx = (i16)g_Ball.X + rollDx;
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -10 (ix)
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -9 (ix)
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1580: i16 rollTy = (i16)g_Ball.Y + rollDy;
	ld	hl, #_g_Ball
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
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -7 (ix)
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1583: if (rollTx < FIELD_BOUND_X_LEFT) rollTx = FIELD_BOUND_X_LEFT;
	ld	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	sub	a, #0x0a
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00142$
	ld	-6 (ix), #0x0a
	ld	-5 (ix), #0
	jp	00143$
00142$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1584: else if (rollTx > FIELD_BOUND_X_RIGHT) rollTx = FIELD_BOUND_X_RIGHT;
	ld	a, #0xf6
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00499$
	xor	a, #0x80
00499$:
	jp	P, 00143$
	ld	-6 (ix), #0xf6
	ld	-5 (ix), #0
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1585: if (rollTy < FIELD_BOUND_Y_TOP) rollTy = FIELD_BOUND_Y_TOP;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	a, c
	sub	a, #0x32
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00147$
	ld	-4 (ix), #0x32
	ld	-3 (ix), #0
	jp	00148$
00147$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1586: else if (rollTy > FIELD_BOUND_Y_BOTTOM) rollTy = FIELD_BOUND_Y_BOTTOM;
	ld	a, #0xae
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	jp	PO, 00500$
	xor	a, #0x80
00500$:
	jp	P, 00148$
	ld	-4 (ix), #0xae
	ld	-3 (ix), #0x01
00148$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1588: g_Ball.TargetX = rollTx;
	ld	hl, #(_g_Ball + 23)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1589: g_Ball.TargetY = rollTy;
	ld	hl, #(_g_Ball + 25)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1590: g_Ball.PassTotalDist = (u16)(Math_Abs32(rollDx) + Math_Abs32(rollDy));
	ld	e, -10 (ix)
	ld	a, -9 (ix)
	ld	d, a
	rlca
	sbc	hl, hl
	call	_Math_Abs32
	push	hl
	pop	iy
	ld	c, e
	ld	b, d
	ld	e, -8 (ix)
	ld	a, -7 (ix)
	ld	d, a
	rlca
	sbc	hl, hl
	push	bc
	push	iy
	call	_Math_Abs32
	pop	iy
	pop	bc
	ex	de, hl
	add	hl, bc
	ex	de, hl
	ld	((_g_Ball + 21)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1592: if (g_Ball.PassTotalDist > 2) {
	ld	a, #0x02
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1593: g_Ball.ShotActive = 3; // ROLLING
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1594: return;
	jp	00198$
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1599: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1600: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1601: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1602: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1604: return;
	jp	00198$
00160$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1609: if (Math_Abs32(dx) > Math_Abs32(dy)) {
	ld	a, -16 (ix)
	ld	-24 (ix), a
	ld	a, -15 (ix)
	ld	-23 (ix), a
	rlca
	sbc	a, a
	ld	-22 (ix), a
	ld	-21 (ix), a
	pop	de
	push	de
	ld	l, -22 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -21 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32
	ld	c, e
	ld	b, d
	ld	a, -14 (ix)
	ld	-20 (ix), a
	ld	a, -13 (ix)
	ld	-19 (ix), a
	rlca
	sbc	a, a
	ld	-18 (ix), a
	ld	-17 (ix), a
	push	hl
	push	bc
	ld	e, -20 (ix)
	ld	d, -19 (ix)
	ld	l, -18 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	bc
	pop	hl
	ld	a, -4 (ix)
	sub	a, c
	ld	a, -3 (ix)
	sbc	a, b
	ld	a, -2 (ix)
	sbc	a, l
	ld	a, -1 (ix)
	sbc	a, h
	jp	PO, 00501$
	xor	a, #0x80
00501$:
	jp	P, 00169$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1610: g_Ball.X += (dx > 0 ? speed : -speed);
	ld	bc, (#(_g_Ball + 2) + 0)
	xor	a, a
	cp	a, -6 (ix)
	sbc	a, -5 (ix)
	jp	PO, 00502$
	xor	a, #0x80
00502$:
	jp	P, 00207$
	ld	e, -10 (ix)
	ld	d, -9 (ix)
	jp	00208$
00207$:
	ld	e, -8 (ix)
	ld	d, -7 (ix)
00208$:
	ex	de, hl
	add	hl, bc
	ex	de, hl
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1611: if (dx != 0) g_Ball.Y += (dy * speed) / Math_Abs32(dx);
	ld	a, -15 (ix)
	or	a, -16 (ix)
	jp	Z, 00170$
	ld	bc, (#_g_Ball + 0)
	ld	e, -12 (ix)
	ld	d, #0x00
	push	bc
	ld	l, -14 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mulint
	push	de
	ld	e, -24 (ix)
	ld	d, -23 (ix)
	ld	l, -22 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -21 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32
	push	de
	pop	iy
	pop	de
	pop	bc
	ld	-4 (ix), e
	ld	a, d
	ld	-3 (ix), a
	rlca
	sbc	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
	push	bc
	push	hl
	push	iy
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divslong
	pop	af
	pop	af
	pop	bc
	ex	de, hl
	add	hl, bc
	ex	de, hl
	ld	(_g_Ball), de
	jp	00170$
00169$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1613: g_Ball.Y += (dy > 0 ? speed : -speed);
	ld	de, #_g_Ball
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	c, -14 (ix)
	ld	b, -13 (ix)
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00503$
	xor	a, #0x80
00503$:
	jp	P, 00209$
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	jp	00210$
00209$:
	ld	l, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
00210$:
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1614: if (dy != 0) g_Ball.X += (dx * speed) / Math_Abs32(dy);
	ld	a, -13 (ix)
	or	a, -14 (ix)
	jr	Z, 00170$
	ld	bc, (#(_g_Ball + 2) + 0)
	ld	e, -12 (ix)
	ld	d, #0x00
	push	bc
	ld	l, -16 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -15 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__mulint
	push	de
	ld	e, -20 (ix)
	ld	d, -19 (ix)
	ld	l, -18 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -17 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_Math_Abs32
	push	de
	pop	iy
	pop	de
	pop	bc
	ld	-4 (ix), e
	ld	a, d
	ld	-3 (ix), a
	rlca
	sbc	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
	push	bc
	push	hl
	push	iy
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divslong
	pop	af
	pop	af
	pop	bc
	ex	de, hl
	add	hl, bc
	ex	de, hl
	ld	((_g_Ball + 2)), de
00170$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1618: i16 diffStartX = (i16)g_Ball.X - (i16)g_Ball.PassStartX;
	ld	bc, (#(_g_Ball + 2) + 0)
	ld	hl, (#_g_Ball + 17)
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1619: i16 diffStartY = (i16)g_Ball.Y - (i16)g_Ball.PassStartY;
	ld	de, (#_g_Ball + 0)
	ld	hl, (#_g_Ball + 19)
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1620: u16 distCovered = (u16)(Math_Abs32(diffStartX) + Math_Abs32(diffStartY));
	ld	a, b
	rlca
	sbc	hl, hl
	push	de
	ld	e, c
	ld	d, b
	call	_Math_Abs32
	push	hl
	pop	iy
	ld	c, e
	ld	b, d
	pop	de
	ld	a, d
	rlca
	sbc	hl, hl
	push	bc
	push	iy
	call	_Math_Abs32
	pop	iy
	pop	bc
	ex	de, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1622: u16 totalDist = g_Ball.PassTotalDist;
	ld	hl, #_g_Ball + 21
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1623: if (totalDist == 0) totalDist = 1; // Safety
	ld	-5 (ix), a
	or	a, -6 (ix)
	jr	NZ, 00172$
	ld	-6 (ix), #0x01
	ld	-5 (ix), #0
00172$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1493: i16 dx = tx - (i16)g_Ball.X;
	ld	de, (#(_g_Ball + 2) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1494: i16 dy = ty - (i16)g_Ball.Y;
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1626: if (g_Ball.X == 0 || g_Ball.X > 255 || g_Ball.Y == 0 || g_Ball.Y > 211) {
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, d
	or	a, e
	jr	Z, 00174$
	ld	a, #0xff
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	C, 00174$
	ld	a, -3 (ix)
	or	a, -4 (ix)
	jr	Z, 00174$
	ld	a, #0xd3
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	ld	a, #0x00
	rla
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1629: if(g_Ball.Y > 230 || g_Ball.Y < 20) {
00174$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1635: if (g_Ball.ShotActive == 2) {
	ld	hl, #(_g_Ball + 27)
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1512: g_Ball.Size = 1;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1635: if (g_Ball.ShotActive == 2) {
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00196$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1637: u16 ratio = (distCovered * 100) / totalDist;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	call	__divuint
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1638: if (ratio < 20 || ratio > 80) g_Ball.Size = 2;
	ld	a, e
	sub	a, #0x14
	ld	a, d
	sbc	a, #0x00
	jr	C, 00178$
	ld	a, #0x50
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00179$
00178$:
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
	jp	00197$
00179$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1639: else g_Ball.Size = 3;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x03
	jp	00197$
00196$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1641: else if (g_Ball.ShotActive == 3) {
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00193$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1643: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
	jp	00197$
00193$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1645: else if (g_Ball.ShotActive == 1) {
	dec	e
	jr	NZ, 00190$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1648: g_Ball.Size = 2;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
	jp	00197$
00190$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1658: if (totalDist > 40) {
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	a, #0x28
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00187$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1659: u16 ratio = (distCovered * 100) / totalDist;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	call	__divuint
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1660: if (ratio < 15 || ratio > 85) g_Ball.Size = 2;
	ld	a, e
	sub	a, #0x0f
	ld	a, d
	sbc	a, #0x00
	jr	C, 00182$
	ld	a, #0x55
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00183$
00182$:
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
	jp	00197$
00183$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1661: else g_Ball.Size = 3;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x03
	jp	00197$
00187$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1663: g_Ball.Size = 2;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
00197$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1667: g_Ball.PreviousY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
00198$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1668: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1669: void TickThrowIn() {
;	---------------------------------
; Function TickThrowIn
; ---------------------------------
_TickThrowIn::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-42
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1670: if (g_MatchStatus != MATCH_BEFORE_THROW_IN) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x03
	jp	NZ,00269$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1677: if (g_Timer == 0) {
	ld	a, (_g_Timer+0)
	or	a, a
	jp	NZ, 00171$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1678: s_ThrowTargetId = NO_VALUE;
	ld	hl, #_TickThrowIn_s_ThrowTargetId_65537_1848
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1679: s_JoyMoved = false;
	ld	hl, #_TickThrowIn_s_JoyMoved_65537_1848
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1680: s_ForceThrowTimer = 0;
	ld	hl, #0x0000
	ld	(_TickThrowIn_s_ForceThrowTimer_65537_1848), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1683: if (g_Ball.X < FIELD_POS_X_CENTER) {
	ld	hl, (#(_g_Ball + 2) + 0)
	ld	de, #0x0078
	cp	a, a
	sbc	hl, de
	jr	NC, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1684: g_Ball.X = FIELD_BOUND_X_LEFT;
	ld	hl, #0x000a
	ld	((_g_Ball + 2)), hl
	jp	00105$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1686: g_Ball.X = FIELD_BOUND_X_RIGHT;
	ld	hl, #0x00f6
	ld	((_g_Ball + 2)), hl
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1690: if (g_Ball.Y < FIELD_BOUND_Y_TOP) g_Ball.Y = FIELD_BOUND_Y_TOP;
	ld	hl, (#_g_Ball + 0)
	ld	de, #0x0032
	cp	a, a
	sbc	hl, de
	jr	NC, 00107$
	ld	hl, #0x0032
	ld	(_g_Ball), hl
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1691: if (g_Ball.Y > FIELD_BOUND_Y_BOTTOM) g_Ball.Y = FIELD_BOUND_Y_BOTTOM;
	ld	hl, (#_g_Ball + 0)
	ld	a, #0xae
	cp	a, l
	ld	a, #0x01
	sbc	a, h
	jr	NC, 00109$
	ld	hl, #0x01ae
	ld	(_g_Ball), hl
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1693: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1696: u8 bestId = NO_VALUE;
	ld	-8 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1697: u16 minDist = 65535;
	ld	bc, #0xffff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1700: u8 t1=NO_VALUE, t2=NO_VALUE; u16 dt1=65535, dt2=65535;
	ld	-22 (ix), #0xff
	ld	-21 (ix), #0xff
	ld	-20 (ix), #0xff
	ld	-19 (ix), #0xff
	ld	-18 (ix), #0xff
	ld	-17 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1701: u8 o1=NO_VALUE, o2=NO_VALUE; u16 do1=65535, do2=65535;
	ld	-16 (ix), #0xff
	ld	-15 (ix), #0xff
	ld	-14 (ix), #0xff
	ld	-13 (ix), #0xff
	ld	-12 (ix), #0xff
	ld	-11 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1703: for(u8 i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00259$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1706: if(g_Players[i].X > g_Ball.X) dist += (g_Players[i].X - g_Ball.X); else dist += (g_Ball.X - g_Players[i].X);
	ld	e, -1 (ix)
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
;	spillPairReg hl
;	spillPairReg hl
	ld	-7 (ix), l
	ld	-6 (ix), h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1683: if (g_Ball.X < FIELD_POS_X_CENTER) {
	ld	hl, (#(_g_Ball + 2) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1706: if(g_Players[i].X > g_Ball.X) dist += (g_Players[i].X - g_Ball.X); else dist += (g_Ball.X - g_Players[i].X);
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jr	NC, 00111$
	ld	a, e
	sub	a, l
	ld	-5 (ix), a
	ld	a, d
	sbc	a, h
	ld	-4 (ix), a
	jp	00112$
00111$:
	ld	a, l
	sub	a, e
	ld	-5 (ix), a
	ld	a, h
	sbc	a, d
	ld	-4 (ix), a
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1707: if(g_Players[i].Y > g_Ball.Y) dist += (g_Players[i].Y - g_Ball.Y); else dist += (g_Ball.Y - g_Players[i].Y);
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1690: if (g_Ball.Y < FIELD_BOUND_Y_TOP) g_Ball.Y = FIELD_BOUND_Y_TOP;
	ld	de, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1707: if(g_Players[i].Y > g_Ball.Y) dist += (g_Players[i].Y - g_Ball.Y); else dist += (g_Ball.Y - g_Players[i].Y);
	ld	a, e
	sub	a, -3 (ix)
	ld	a, d
	sbc	a, -2 (ix)
	jr	NC, 00114$
	ld	a, -3 (ix)
	sub	a, e
	ld	e, a
	ld	a, -2 (ix)
	sbc	a, d
	ld	d, a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	add	hl, de
	ld	-3 (ix), l
	ld	-2 (ix), h
	jp	00115$
00114$:
	ld	a, e
	sub	a, -3 (ix)
	ld	e, a
	ld	a, d
	sbc	a, -2 (ix)
	ld	d, a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	add	hl, de
	ld	-3 (ix), l
	ld	-2 (ix), h
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1710: if(g_Players[i].TeamId == g_RestartKickTeamId && g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) {
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	hl, #9
	add	hl, de
	ld	e, (hl)
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, e
	jr	NZ, 00260$
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	hl, #13
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00260$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1711: if(dist < minDist) { minDist = dist; bestId = i; }
	ld	a, -3 (ix)
	sub	a, c
	ld	a, -2 (ix)
	sbc	a, b
	jr	NC, 00260$
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	a, -1 (ix)
	ld	-8 (ix), a
00260$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1703: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00259$
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1714: g_ThrowInPlayerId = bestId;
	ld	a, -8 (ix)
	ld	(_g_ThrowInPlayerId+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1717: for(u8 i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00262$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00146$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1718: if(i == g_ThrowInPlayerId || g_Players[i].Role == PLAYER_ROLE_GOALKEEPER || g_Players[i].TeamId == REFEREE) continue;
	ld	a, (_g_ThrowInPlayerId+0)
	sub	a, -1 (ix)
	jp	Z,00145$
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
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	bc,#13
	add	hl,bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00145$
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	ld	-10 (ix), a
	sub	a, #0x0e
	jp	Z,00145$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1721: if(g_Players[i].X > g_Ball.X) dist += (g_Players[i].X - g_Ball.X); else dist += (g_Ball.X - g_Players[i].X);
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1683: if (g_Ball.X < FIELD_POS_X_CENTER) {
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1721: if(g_Players[i].X > g_Ball.X) dist += (g_Players[i].X - g_Ball.X); else dist += (g_Ball.X - g_Players[i].X);
	ld	a, -5 (ix)
	sub	a, -7 (ix)
	ld	a, -4 (ix)
	sbc	a, -6 (ix)
	jr	NC, 00127$
	ld	a, -7 (ix)
	sub	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	sbc	a, -4 (ix)
	ld	-8 (ix), a
	jp	00128$
00127$:
	ld	a, -5 (ix)
	sub	a, -7 (ix)
	ld	-9 (ix), a
	ld	a, -4 (ix)
	sbc	a, -6 (ix)
	ld	-8 (ix), a
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1722: if(g_Players[i].Y > g_Ball.Y) dist += (g_Players[i].Y - g_Ball.Y); else dist += (g_Ball.Y - g_Players[i].Y);
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1690: if (g_Ball.Y < FIELD_BOUND_Y_TOP) g_Ball.Y = FIELD_BOUND_Y_TOP;
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1722: if(g_Players[i].Y > g_Ball.Y) dist += (g_Players[i].Y - g_Ball.Y); else dist += (g_Ball.Y - g_Players[i].Y);
	ld	a, -5 (ix)
	sub	a, -7 (ix)
	ld	a, -4 (ix)
	sbc	a, -6 (ix)
	jr	NC, 00130$
	ld	a, -7 (ix)
	sub	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	sbc	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	add	a, -9 (ix)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	adc	a, -8 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
	jp	00131$
00130$:
	ld	a, -5 (ix)
	sub	a, -7 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	sbc	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, -9 (ix)
	add	a, -3 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	adc	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
00131$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1724: if (g_Players[i].TeamId == g_RestartKickTeamId) {
	ld	a, -10 (ix)
	ld	hl, #_g_RestartKickTeamId
	sub	a, (hl)
	jr	NZ, 00143$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1726: if (dist < dt1) { dt2=dt1; t2=t1; dt1=dist; t1=i; }
	ld	a, -3 (ix)
	sub	a, -20 (ix)
	ld	a, -2 (ix)
	sbc	a, -19 (ix)
	jr	NC, 00135$
	ld	a, -20 (ix)
	ld	-18 (ix), a
	ld	a, -19 (ix)
	ld	-17 (ix), a
	ld	a, -22 (ix)
	ld	-21 (ix), a
	ld	a, -3 (ix)
	ld	-20 (ix), a
	ld	a, -2 (ix)
	ld	-19 (ix), a
	ld	a, -1 (ix)
	ld	-22 (ix), a
	jp	00145$
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1727: else if (dist < dt2) { dt2=dist; t2=i; }
	ld	a, -3 (ix)
	sub	a, -18 (ix)
	ld	a, -2 (ix)
	sbc	a, -17 (ix)
	jr	NC, 00145$
	ld	a, -3 (ix)
	ld	-18 (ix), a
	ld	a, -2 (ix)
	ld	-17 (ix), a
	ld	a, -1 (ix)
	ld	-21 (ix), a
	jp	00145$
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1730: if (dist < do1) { do2=do1; o2=o1; do1=dist; o1=i; }
	ld	a, -3 (ix)
	sub	a, -14 (ix)
	ld	a, -2 (ix)
	sbc	a, -13 (ix)
	jr	NC, 00140$
	ld	a, -14 (ix)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	ld	-11 (ix), a
	ld	a, -16 (ix)
	ld	-15 (ix), a
	ld	a, -3 (ix)
	ld	-14 (ix), a
	ld	a, -2 (ix)
	ld	-13 (ix), a
	ld	a, -1 (ix)
	ld	-16 (ix), a
	jp	00145$
00140$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1731: else if (dist < do2) { do2=dist; o2=i; }
	ld	a, -3 (ix)
	sub	a, -12 (ix)
	ld	a, -2 (ix)
	sbc	a, -11 (ix)
	jr	NC, 00145$
	ld	a, -3 (ix)
	ld	-12 (ix), a
	ld	a, -2 (ix)
	ld	-11 (ix), a
	ld	a, -1 (ix)
	ld	-15 (ix), a
00145$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1717: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00262$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1736: if (g_ThrowInPlayerId != NO_VALUE) {
	ld	a, (_g_ThrowInPlayerId+0)
	inc	a
	jp	Z,00151$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1737: g_Players[g_ThrowInPlayerId].TargetX = g_Ball.X;
	ld	bc, (_g_ThrowInPlayerId)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, -4 (ix)
	add	a, #<(_g_Players)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #>(_g_Players)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	add	a, #0x10
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	hl, #(_g_Ball + 2)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1738: g_Players[g_ThrowInPlayerId].TargetY = g_Ball.Y;
	ld	bc, (_g_ThrowInPlayerId)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, #<(_g_Players)
	add	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -3 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	add	a, #0x0e
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	hl, #_g_Ball
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1739: g_Players[g_ThrowInPlayerId].Status = PLAYER_STATUS_NONE;
	ld	bc, (_g_ThrowInPlayerId)
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
	ld	-4 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	add	a, #0x12
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1740: if (g_Ball.X < FIELD_POS_X_CENTER) g_Players[g_ThrowInPlayerId].Direction = DIRECTION_RIGHT;
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1737: g_Players[g_ThrowInPlayerId].TargetX = g_Ball.X;
	ld	bc, (_g_ThrowInPlayerId)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1740: if (g_Ball.X < FIELD_POS_X_CENTER) g_Players[g_ThrowInPlayerId].Direction = DIRECTION_RIGHT;
	ld	a, #<(_g_Players)
	add	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	add	a, #0x0a
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	a, -6 (ix)
	sub	a, #0x78
	ld	a, -5 (ix)
	sbc	a, #0x00
	jr	NC, 00148$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x03
	jp	00151$
00148$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1741: else g_Players[g_ThrowInPlayerId].Direction = DIRECTION_LEFT;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x07
00151$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1746: bool isLeft = (g_Ball.X < FIELD_POS_X_CENTER);
	ld	hl, (#(_g_Ball + 2) + 0)
	ld	de, #0x0078
	cp	a, a
	sbc	hl, de
	ld	a, #0x00
	rla
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1747: u8 crowdIds[4] = {t1, t2, o1, o2};
	ld	a, -22 (ix)
	ld	-42 (ix), a
	ld	a, -21 (ix)
	ld	-41 (ix), a
	ld	a, -16 (ix)
	ld	-40 (ix), a
	ld	a, -15 (ix)
	ld	-39 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1750: i16 yOffsets[4] = {-30, 20, -15, 35}; 
	ld	-38 (ix), #0xe2
	ld	-37 (ix), #0xff
	ld	-36 (ix), #0x14
	ld	-35 (ix), #0
	ld	-34 (ix), #0xf1
	ld	-33 (ix), #0xff
	ld	-32 (ix), #0x23
	ld	-31 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1751: u16 xOffsets[4] = {15, 35, 25, 45}; 
	ld	-30 (ix), #0x0f
	ld	-29 (ix), #0
	ld	-28 (ix), #0x23
	ld	-27 (ix), #0
	ld	-26 (ix), #0x19
	ld	-25 (ix), #0
	ld	-24 (ix), #0x2d
	ld	-23 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1753: for(u8 k=0; k<4; k++) {
	ld	-2 (ix), #0x00
00264$:
	ld	a, -2 (ix)
	sub	a, #0x04
	jp	NC, 00161$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1754: u8 pid = crowdIds[k];
	ld	e, -2 (ix)
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1755: if(pid != NO_VALUE) {
	ld	-3 (ix), a
	inc	a
	jp	Z,00265$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1756: g_Players[pid].Status = PLAYER_STATUS_NONE;
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
	ld	de, #_g_Players
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #0x0012
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1759: i16 ty = (i16)g_Ball.Y + yOffsets[k];
	ld	de, (#_g_Ball + 0)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	-6 (ix), l
	ld	-5 (ix), h
	push	de
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	hl, #6
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1761: if(ty < FIELD_BOUND_Y_TOP) ty = FIELD_BOUND_Y_TOP;
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, #0x32
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00153$
	ld	de, #0x0032
00153$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1762: if(ty > FIELD_BOUND_Y_BOTTOM) ty = FIELD_BOUND_Y_BOTTOM;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0xae
	cp	a, l
	ld	a, #0x01
	sbc	a, h
	jp	PO, 00724$
	xor	a, #0x80
00724$:
	jp	P, 00155$
	ld	de, #0x01ae
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1763: g_Players[pid].TargetY = (u16)ty;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1683: if (g_Ball.X < FIELD_POS_X_CENTER) {
	ld	de, (#(_g_Ball + 2) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1767: g_Players[pid].TargetX = g_Ball.X + xOffsets[k];
	ld	hl, #0x0010
	add	hl, bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	push	de
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	hl, #14
	add	hl, sp
	add	hl, de
	pop	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1768: g_Players[pid].Direction = DIRECTION_LEFT; // Look at thrower
	ld	a, c
	add	a, #0x0a
	ld	c, a
	jr	NC, 00725$
	inc	b
00725$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1767: g_Players[pid].TargetX = g_Ball.X + xOffsets[k];
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1766: if (isLeft) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00157$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1767: g_Players[pid].TargetX = g_Ball.X + xOffsets[k];
	add	hl, de
	ex	de, hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1768: g_Players[pid].Direction = DIRECTION_LEFT; // Look at thrower
	ld	a, #0x07
	ld	(bc), a
	jp	00265$
00157$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1770: g_Players[pid].TargetX = g_Ball.X - xOffsets[k];
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1771: g_Players[pid].Direction = DIRECTION_RIGHT; // Look at thrower
	ld	a, #0x03
	ld	(bc), a
00265$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1753: for(u8 k=0; k<4; k++) {
	inc	-2 (ix)
	jp	00264$
00161$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1787: if (g_ThrowInPlayerId != NO_VALUE) {
	ld	a, (_g_ThrowInPlayerId+0)
	inc	a
	jr	Z, 00163$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1788: g_Players[g_ThrowInPlayerId].TargetX = g_Ball.X;
	ld	bc, (_g_ThrowInPlayerId)
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
	ld	hl, #0x0010
	add	hl, de
	ex	de, hl
	ld	bc, (#(_g_Ball + 2) + 0)
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1789: g_Players[g_ThrowInPlayerId].TargetY = g_Ball.Y;
	ld	bc, (_g_ThrowInPlayerId)
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
	ld	hl, #0x000e
	add	hl, de
	ex	de, hl
	ld	bc, (#_g_Ball + 0)
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
00163$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1690: if (g_Ball.Y < FIELD_BOUND_Y_TOP) g_Ball.Y = FIELD_BOUND_Y_TOP;
	ld	hl, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1793: if (g_Ball.Y < 140) ShowFieldZone(FIELD_NORTH_ZONE);
	ld	a, l
	sub	a, #0x8c
	ld	a, h
	sbc	a, #0x00
	jr	NC, 00168$
	xor	a, a
	call	_ShowFieldZone
	jp	00171$
00168$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1794: else if (g_Ball.Y > 280) ShowFieldZone(FIELD_SOUTH_ZONE);
	ld	a, #0x18
	cp	a, l
	ld	a, #0x01
	sbc	a, h
	jr	NC, 00165$
	ld	a, #0x02
	call	_ShowFieldZone
	jp	00171$
00165$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1795: else ShowFieldZone(FIELD_CENTRAL_ZONE);
	ld	a, #0x01
	call	_ShowFieldZone
00171$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1799: if (g_ThrowInPlayerId != NO_VALUE) {
	ld	a, (_g_ThrowInPlayerId+0)
	inc	a
	jp	Z,00269$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1800: i16 dx = (i16)g_Players[g_ThrowInPlayerId].X - (i16)g_Players[g_ThrowInPlayerId].TargetX;
	ld	bc, (_g_ThrowInPlayerId)
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
	ld	hl, #0x0002
	add	hl, de
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x0010
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1801: i16 dy = (i16)g_Players[g_ThrowInPlayerId].Y - (i16)g_Players[g_ThrowInPlayerId].TargetY;
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	-2 (ix), l
	ld	-1 (ix), a
	ld	hl, #14
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, -2 (ix)
	sub	a, e
	ld	e, a
	ld	a, -1 (ix)
	sbc	a, d
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1803: if (dx >= -4 && dx <= 4 && dy >= -4 && dy <= 4) {
	ld	a, c
	sub	a, #0xfc
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jp	C, 00251$
	ld	a, #0x04
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00728$
	xor	a, #0x80
00728$:
	jp	M, 00251$
	ld	a, e
	sub	a, #0xfc
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x7f
	jp	C, 00251$
	ld	a, #0x04
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00729$
	xor	a, #0x80
00729$:
	jp	M, 00251$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1804: g_Players[g_ThrowInPlayerId].X = g_Players[g_ThrowInPlayerId].TargetX;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1805: g_Players[g_ThrowInPlayerId].Y = g_Players[g_ThrowInPlayerId].TargetY;
	ld	bc, (_g_ThrowInPlayerId)
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
	ld	hl, #14
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1806: g_Players[g_ThrowInPlayerId].Status = PLAYER_STATUS_POSITIONED;
	ld	bc, (_g_ThrowInPlayerId)
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
	ld	bc, #0x0012
	add	hl, bc
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1809: if(g_Ball.X < FIELD_POS_X_CENTER) {
	ld	bc, (#(_g_Ball + 2) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1737: g_Players[g_ThrowInPlayerId].TargetX = g_Ball.X;
	ld	de, (_g_ThrowInPlayerId)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1810: g_Players[g_ThrowInPlayerId].PatternId = PLAYER_POSE_THROWIN_LEFT_1;
	ld	de, #_g_Players
	add	hl, de
	ld	de, #0x0008
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1809: if(g_Ball.X < FIELD_POS_X_CENTER) {
	ld	a, c
	sub	a, #0x78
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00173$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1810: g_Players[g_ThrowInPlayerId].PatternId = PLAYER_POSE_THROWIN_LEFT_1;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x93
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1811: g_Players[g_ThrowInPlayerId].Direction = DIRECTION_RIGHT;
	ld	bc, (_g_ThrowInPlayerId)
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
	ld	bc, #0x000a
	add	hl, bc
	ld	(hl), #0x03
	jp	00174$
00173$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1813: g_Players[g_ThrowInPlayerId].PatternId = PLAYER_POSE_THROWIN_RIGHT_1;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x1c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1814: g_Players[g_ThrowInPlayerId].Direction = DIRECTION_LEFT;
	ld	bc, (_g_ThrowInPlayerId)
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
	ld	bc, #0x000a
	add	hl, bc
	ld	(hl), #0x07
00174$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1818: g_Ball.X = g_Players[g_ThrowInPlayerId].X;
	ld	bc, (_g_ThrowInPlayerId)
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
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	((_g_Ball + 2)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1820: if(g_Ball.X < FIELD_POS_X_CENTER) g_Ball.Y = g_Players[g_ThrowInPlayerId].Y - 14; 
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1737: g_Players[g_ThrowInPlayerId].TargetX = g_Ball.X;
	ld	de, (_g_ThrowInPlayerId)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1810: g_Players[g_ThrowInPlayerId].PatternId = PLAYER_POSE_THROWIN_LEFT_1;
	ld	de, #_g_Players
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1820: if(g_Ball.X < FIELD_POS_X_CENTER) g_Ball.Y = g_Players[g_ThrowInPlayerId].Y - 14; 
	ld	a, (hl)
	inc	hl
	ld	e, (hl)
	ld	-2 (ix), a
	ld	-1 (ix), e
	ld	a, c
	sub	a, #0x78
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00176$
	ld	a, -2 (ix)
	add	a, #0xf2
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0xff
	ld	b, a
	ld	(_g_Ball), bc
	jp	00177$
00176$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1821: else g_Ball.Y = g_Players[g_ThrowInPlayerId].Y - 12;
	ld	a, -2 (ix)
	add	a, #0xf4
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0xff
	ld	b, a
	ld	(_g_Ball), bc
00177$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1823: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1827: u8 crowdReady = 1;
	ld	(hl), #0x01
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1829: for(i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00266$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1831: u16 tdx = (g_Players[i].TargetX > g_Ball.X) ? (g_Players[i].TargetX - g_Ball.X) : (g_Ball.X - g_Players[i].TargetX);
	ld	e, -1 (ix)
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
	ld	-13 (ix), l
	ld	-12 (ix), h
	ld	de, #16
	add	hl, de
	ld	a, (hl)
	ld	-11 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1809: if(g_Ball.X < FIELD_POS_X_CENTER) {
	ld	hl, (#(_g_Ball + 2) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1831: u16 tdx = (g_Players[i].TargetX > g_Ball.X) ? (g_Players[i].TargetX - g_Ball.X) : (g_Ball.X - g_Players[i].TargetX);
	ld	a, l
	sub	a, -11 (ix)
	ld	a, h
	sbc	a, -10 (ix)
	jr	NC, 00271$
	ld	a, -11 (ix)
	sub	a, l
	ld	b, a
	ld	a, -10 (ix)
	sbc	a, h
	jp	00272$
00271$:
	ld	a, l
	sub	a, -11 (ix)
	ld	b, a
	ld	a, h
	sbc	a, -10 (ix)
00272$:
	ld	-5 (ix), b
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1832: u16 tdy = (g_Players[i].TargetY > g_Ball.Y) ? (g_Players[i].TargetY - g_Ball.Y) : (g_Ball.Y - g_Players[i].TargetY);
	ld	a, -13 (ix)
	add	a, #0x0e
	ld	-9 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1839: i16 pdy = (i16)g_Players[i].Y - (i16)g_Players[i].TargetY;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1832: u16 tdy = (g_Players[i].TargetY > g_Ball.Y) ? (g_Players[i].TargetY - g_Ball.Y) : (g_Ball.Y - g_Players[i].TargetY);
	ld	hl, (#_g_Ball + 0)
	ld	a, l
	sub	a, -3 (ix)
	ld	a, h
	sbc	a, -2 (ix)
	jr	NC, 00273$
	ld	a, -3 (ix)
	sub	a, l
	ld	e, a
	ld	a, -2 (ix)
	sbc	a, h
	jp	00274$
00273$:
	ld	a, l
	sub	a, -3 (ix)
	ld	e, a
	ld	a, h
	sbc	a, -2 (ix)
00274$:
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1834: if (tdx < 100 && tdy < 100) {
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -5 (ix)
	ld	l, -4 (ix)
	sub	a, #0x64
	ld	a, l
	sbc	a, #0x00
	jp	NC, 00267$
	ld	a, e
	sub	a, #0x64
	ld	a, d
	sbc	a, #0x00
	jp	NC, 00267$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1836: if (g_Players[i].Status != PLAYER_STATUS_POSITIONED) {
	ld	a, -13 (ix)
	add	a, #0x12
	ld	-7 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, #0x04
	or	a, d
	jp	Z,00267$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1838: i16 pdx = (i16)g_Players[i].X - (i16)g_Players[i].TargetX;
	ld	a, -13 (ix)
	add	a, #0x02
	ld	-5 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ex	de, hl
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	cp	a, a
	sbc	hl, de
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1839: i16 pdy = (i16)g_Players[i].Y - (i16)g_Players[i].TargetY;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, -3 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	sbc	a, -2 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1840: if (pdx >= -4 && pdx <= 4 && pdy >= -4 && pdy <= 4) {
	ld	a, e
	sub	a, #0xfc
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00179$
	ld	a, #0x04
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00731$
	xor	a, #0x80
00731$:
	jp	M, 00179$
	ld	a, l
	sub	a, #0xfc
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00179$
	ld	a, #0x04
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00732$
	xor	a, #0x80
00732$:
	jp	M, 00179$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1841: g_Players[i].X = g_Players[i].TargetX;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1842: g_Players[i].Y = g_Players[i].TargetY;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), b
	inc	hl
	ld	(hl), e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1843: g_Players[i].Status = PLAYER_STATUS_POSITIONED;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
	jp	00267$
00179$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1845: crowdReady = 0;
	ld	c, #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1846: break;
	jp	00189$
00267$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1829: for(i=0; i<14; i++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	C, 00266$
00189$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1852: if (crowdReady) {
	ld	a, c
	or	a, a
	jr	Z, 00191$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1853: g_Timer++;
	ld	iy, #_g_Timer
	inc	0 (iy)
	jp	00192$
00191$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1855: g_Timer = 1; // Wait
	ld	a, #0x01
	ld	(#_g_Timer), a
00192$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1859: if (g_Timer > 60) {
	ld	a, #0x3c
	ld	iy, #_g_Timer
	sub	a, 0 (iy)
	jp	NC, 00269$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1865: u8 t1=NO_VALUE, t2=NO_VALUE; u16 dt1=65535, dt2=65535;
	ld	-15 (ix), #0xff
	ld	-14 (ix), #0xff
	ld	-13 (ix), #0xff
	ld	-12 (ix), #0xff
	ld	-11 (ix), #0xff
	ld	-10 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1867: for(i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00268$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1868: if(i == g_ThrowInPlayerId || g_Players[i].Role == PLAYER_ROLE_GOALKEEPER || g_Players[i].TeamId == REFEREE) continue;
	ld	a, (_g_ThrowInPlayerId+0)
	sub	a, -1 (ix)
	jp	Z,00206$
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
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	c, l
	ld	b, h
	ld	hl, #13
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00206$
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	ld	hl, #9
	add	hl, bc
	ld	c, (hl)
	ld	a, c
	sub	a, #0x0e
	jp	Z,00206$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1870: if (g_Players[i].TeamId == g_RestartKickTeamId) {
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, c
	jp	NZ,00206$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1871: u16 dx = (g_Players[i].X > g_Ball.X) ? (g_Players[i].X - g_Ball.X) : (g_Ball.X - g_Players[i].X);
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1809: if(g_Ball.X < FIELD_POS_X_CENTER) {
	ld	de, (#(_g_Ball + 2) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1871: u16 dx = (g_Players[i].X > g_Ball.X) ? (g_Players[i].X - g_Ball.X) : (g_Ball.X - g_Players[i].X);
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jr	NC, 00275$
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	jp	00276$
00275$:
	ld	a, e
	sub	a, c
	ld	c, a
	ld	a, d
	sbc	a, b
00276$:
	ld	-9 (ix), c
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1872: u16 dy = (g_Players[i].Y > g_Ball.Y) ? (g_Players[i].Y - g_Ball.Y) : (g_Ball.Y - g_Players[i].Y);
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1832: u16 tdy = (g_Players[i].TargetY > g_Ball.Y) ? (g_Players[i].TargetY - g_Ball.Y) : (g_Ball.Y - g_Players[i].TargetY);
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1872: u16 dy = (g_Players[i].Y > g_Ball.Y) ? (g_Players[i].Y - g_Ball.Y) : (g_Ball.Y - g_Players[i].Y);
	ld	a, -5 (ix)
	sub	a, -7 (ix)
	ld	a, -4 (ix)
	sbc	a, -6 (ix)
	jr	NC, 00277$
	ld	a, -7 (ix)
	sub	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	sbc	a, -4 (ix)
	ld	-2 (ix), a
	jp	00278$
00277$:
	ld	a, -5 (ix)
	sub	a, -7 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	sbc	a, -6 (ix)
	ld	-2 (ix), a
00278$:
	ld	c, -3 (ix)
	ld	b, -2 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1873: u16 d = dx+dy;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	add	hl, bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1875: if (d < 200) { // Safety check
	ld	c, l
	ld	b, h
	ld	a, c
	sub	a, #0xc8
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00206$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1876: if (d < dt1) { dt2=dt1; t2=t1; dt1=d; t1=i; }
	ld	a, l
	sub	a, -13 (ix)
	ld	a, h
	sbc	a, -12 (ix)
	jr	NC, 00200$
	ld	a, -13 (ix)
	ld	-11 (ix), a
	ld	a, -12 (ix)
	ld	-10 (ix), a
	ld	a, -15 (ix)
	ld	-14 (ix), a
	ld	-13 (ix), l
	ld	-12 (ix), h
	ld	a, -1 (ix)
	ld	-15 (ix), a
	jp	00206$
00200$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1877: else if (d < dt2) { dt2=d; t2=i; }
	ld	a, l
	sub	a, -11 (ix)
	ld	a, h
	sbc	a, -10 (ix)
	jr	NC, 00206$
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, -1 (ix)
	ld	-14 (ix), a
00206$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1867: for(i=0; i<14; i++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	C, 00268$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1881: c1 = t1; c2 = t2;
	ld	a, -15 (ix)
	ld	-2 (ix), a
	ld	a, -14 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1885: if (s_ThrowTargetId == NO_VALUE && c1 != NO_VALUE) s_ThrowTargetId = c1;
	ld	a, (_TickThrowIn_s_ThrowTargetId_65537_1848+0)
	inc	a
	jr	NZ, 00209$
	ld	a, -15 (ix)
	inc	a
	jr	Z, 00209$
	ld	a, -15 (ix)
	ld	(_TickThrowIn_s_ThrowTargetId_65537_1848+0), a
00209$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1887: if (s_ThrowTargetId == NO_VALUE) {
	ld	a, (_TickThrowIn_s_ThrowTargetId_65537_1848+0)
	inc	a
	jr	NZ, 00212$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1888: s_ThrowTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, g_ThrowInPlayerId);
	ld	a, (_g_ThrowInPlayerId+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	(_TickThrowIn_s_ThrowTargetId_65537_1848+0), a
00212$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1892: bool isHuman = (g_RestartKickTeamId == TEAM_1);
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	ld	a, #0x01
	jr	Z, 00743$
	xor	a, a
00743$:
	ld	e, a
	ld	c, e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1893: if (g_GameWith2Players) isHuman = true; 
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00214$
	ld	c, #0x01
00214$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1894: if (g_RestartKickTeamId == TEAM_2 && !g_GameWith2Players) isHuman = false;
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, #0x02
	jr	NZ, 00216$
	ld	a, (_g_GameWith2Players+0)
	or	a,a
	jr	NZ, 00216$
	ld	c,a
00216$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1896: if (isHuman) {
	ld	a, c
	or	a, a
	jp	Z, 00246$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1898: u8 joy = (g_RestartKickTeamId == TEAM_1) ? GetJoystick1Direction() : GetJoystick2Direction();
	ld	a, e
	or	a, a
	jr	Z, 00279$
	call	_GetJoystick1Direction
	jp	00280$
00279$:
	call	_GetJoystick2Direction
00280$:
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1899: bool trig = IsTeamJoystickTriggerPressed(g_RestartKickTeamId);
	push	de
	ld	a, (_g_RestartKickTeamId+0)
	call	_IsTeamJoystickTriggerPressed
	pop	de
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1902: if (joy != DIRECTION_NONE && !s_JoyMoved) {
	ld	a, d
	or	a, a
	jr	Z, 00227$
	ld	a, (_TickThrowIn_s_JoyMoved_65537_1848+0)
	or	a, a
	jr	NZ, 00227$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1904: if (c1 != NO_VALUE && c2 != NO_VALUE) {
	ld	a, -2 (ix)
	inc	a
	jr	Z, 00222$
	ld	a, -1 (ix)
	inc	a
	jr	Z, 00222$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1905: if (s_ThrowTargetId == c1) s_ThrowTargetId = c2;
	ld	a, (_TickThrowIn_s_ThrowTargetId_65537_1848+0)
	sub	a, -2 (ix)
	jr	NZ, 00219$
	ld	a, -1 (ix)
	ld	(_TickThrowIn_s_ThrowTargetId_65537_1848+0), a
	jp	00222$
00219$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1906: else s_ThrowTargetId = c1;
	ld	a, -2 (ix)
	ld	(_TickThrowIn_s_ThrowTargetId_65537_1848+0), a
00222$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1908: s_JoyMoved = true;
	ld	a, #0x01
	ld	(#_TickThrowIn_s_JoyMoved_65537_1848), a
	jp	00228$
00227$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1909: } else if (joy == DIRECTION_NONE) {
	ld	a, d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1910: s_JoyMoved = false;
	or	a,a
	jr	NZ, 00228$
	ld	(#_TickThrowIn_s_JoyMoved_65537_1848), a
00228$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1914: g_PassTargetPlayer = s_ThrowTargetId; 
	ld	a, (_TickThrowIn_s_ThrowTargetId_65537_1848+0)
	ld	(_g_PassTargetPlayer+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1917: s_ForceThrowTimer++;
	ld	hl, (_TickThrowIn_s_ForceThrowTimer_65537_1848)
	inc	hl
	ld	(_TickThrowIn_s_ForceThrowTimer_65537_1848), hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1920: if ((trig || s_ForceThrowTimer > 240) && s_ThrowTargetId != NO_VALUE) {
	ld	a, -3 (ix)
	or	a, a
	jr	NZ, 00233$
	ld	hl, (_TickThrowIn_s_ForceThrowTimer_65537_1848)
	ld	a, #0xf0
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jp	NC, 00269$
00233$:
	ld	a, (_TickThrowIn_s_ThrowTargetId_65537_1848+0)
	inc	a
	jp	Z,00269$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1921: g_Ball.PossessionPlayerId = g_ThrowInPlayerId;
	ld	hl, #(_g_Ball + 6)
	ld	a, (_g_ThrowInPlayerId+0)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1922: SetPlayerBallPossession(g_ThrowInPlayerId);
	ld	a, (_g_ThrowInPlayerId+0)
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1923: g_Ball.Y = g_Players[g_ThrowInPlayerId].Y; // Reset to feet
	ld	bc, (_g_ThrowInPlayerId)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, -4 (ix)
	add	a, #<(_g_Players)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #>(_g_Players)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	hl, #_g_Ball
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1924: PerformPass(s_ThrowTargetId);
	ld	a, (_TickThrowIn_s_ThrowTargetId_65537_1848+0)
	call	_PerformPass
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1925: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1926: ClearTextFromLayerA(10, 18, 9); // Correct coords: 10, 18 (len 9 is enough for "THROW IN")
	ld	a, #0x09
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1927: g_Ball.ShotActive = 1; // High Arc for throw
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1928: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
	jp	00269$
00246$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1932: if (g_Timer > 100) {
	ld	a, #0x64
	ld	iy, #_g_Timer
	sub	a, 0 (iy)
	jp	NC, 00243$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1933: if (s_ThrowTargetId == NO_VALUE && c1 != NO_VALUE) s_ThrowTargetId = c1; 
	ld	a, (_TickThrowIn_s_ThrowTargetId_65537_1848+0)
	inc	a
	jr	NZ, 00235$
	ld	a, -2 (ix)
	inc	a
	jr	Z, 00235$
	ld	a, -2 (ix)
	ld	(_TickThrowIn_s_ThrowTargetId_65537_1848+0), a
00235$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1934: if (s_ThrowTargetId == NO_VALUE) s_ThrowTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, g_ThrowInPlayerId);
	ld	a, (_TickThrowIn_s_ThrowTargetId_65537_1848+0)
	inc	a
	jr	NZ, 00238$
	ld	a, (_g_ThrowInPlayerId+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	(_TickThrowIn_s_ThrowTargetId_65537_1848+0), a
00238$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1937: if (g_Timer > 120) {
	ld	a, #0x78
	ld	hl, #_g_Timer
	sub	a, (hl)
	jr	NC, 00240$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1938: g_Ball.PossessionPlayerId = g_ThrowInPlayerId;
	ld	hl, #(_g_Ball + 6)
	ld	a, (_g_ThrowInPlayerId+0)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1939: SetPlayerBallPossession(g_ThrowInPlayerId);
	ld	a, (_g_ThrowInPlayerId+0)
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1940: g_Ball.Y = g_Players[g_ThrowInPlayerId].Y; // Reset to feet
	ld	bc, (_g_ThrowInPlayerId)
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
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	(_g_Ball), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1941: PerformPass(s_ThrowTargetId);
	ld	a, (_TickThrowIn_s_ThrowTargetId_65537_1848+0)
	call	_PerformPass
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1942: g_MatchStatus = MATCH_IN_ACTION; 
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1943: ClearTextFromLayerA(10, 18, 9); // Correct coords
	ld	a, #0x09
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_ClearTextFromLayerA
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1944: g_Ball.ShotActive = 1; 
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1945: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
	jp	00269$
00240$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1947: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
	jp	00269$
00243$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1950: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
	jp	00269$
00251$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1955: g_Timer = 1; 
	ld	hl, #_g_Timer
	ld	(hl), #0x01
00269$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1958: }
	ld	sp, ix
	pop	ix
	ret
	.area _SEG2
	.area _INITIALIZER
__xinit__g_ponPonPatternIndex:
	.db #0x00	; 0
__xinit__g_PonPonGrilsPoseCounter:
	.db #0x00	; 0
__xinit__g_peopleState:
	.db #0x00	; 0
__xinit__g_ponPonGirlsInitailized:
	.db #0x00	; 0
__xinit__g_ShowButtonsInfo:
	.db #0x01	; 1
__xinit__s_GkAnimTimer:
	.db #0x00	; 0
__xinit__s_GkAnimPlayerId:
	.db #0xff	; 255
	.area _CABS (ABS)
