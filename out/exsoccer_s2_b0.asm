;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module exsoccer_s2_b0
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Math_Abs32
	.globl _PerformPass
	.globl _GetOffsideLineY
	.globl _CornerKick
	.globl _GoalKick
	.globl _BallThrowIn
	.globl _BallInGoal
	.globl _SetPlayerBallPossession
	.globl _PutBallOnPlayerFeet
	.globl _UpdatePlayerPatternByDirection
	.globl _TickFieldScrollingAction
	.globl _V9_Poke16_CurrentAddr
	.globl _V9_WriteVRAM_CurrentAddr
	.globl _V9_SetWriteAddress
	.globl _Keyboard_IsKeyPressed
	.globl _Joystick_Read
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
	.globl _V9_PrintLayerAStringAtPos
	.globl _TickAI
	.globl _TickP1
	.globl _GetPlayerIdByRole
	.globl _UpdateSpritesPositions
	.globl _PutBallSprite
	.globl _ShowHeaderInfo
	.globl _V9_PutLayerATileAtPos
	.globl _V9_PutLayerBTileAtPos
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
	.globl _UpdatePassTarget
	.globl _GoalkeeperWithBall
	.globl _TickGoalkeeperAnimation
	.globl _PerformShot
	.globl _TickBallFlying
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
_PutBallSprite_s_StopCooldown_65538_1264:
	.ds 1
_GetNumberString_str_65536_1366:
	.ds 5
_UpdatePassTarget_passUpdateTimer_65536_1445:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_s_GkAnimTimer:
	.ds 1
_s_GkAnimPlayerId:
	.ds 1
_s_GkRecoilY:
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:758: static u8 s_StopCooldown = 0;
	ld	iy, #_PutBallSprite_s_StopCooldown_65538_1264
	ld	0 (iy), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1442: static u8 passUpdateTimer = 0;
	ld	iy, #_UpdatePassTarget_passUpdateTimer_65536_1445
	ld	0 (iy), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _SEG2
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:41: void V9_PrintLayerAStringAtPos(u8 x, u8 y, const c8* str)
;	---------------------------------
; Function V9_PrintLayerAStringAtPos
; ---------------------------------
_V9_PrintLayerAStringAtPos::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	c, a
	ld	b, l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:44: while (*str != 0){
	ld	e, 4 (ix)
	ld	d, 5 (ix)
00101$:
	ld	a, (de)
	or	a, a
	jr	Z, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:45: V9_PutLayerATileAtPos(x,y,*(str++));
	inc	de
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	de
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_V9_PutLayerATileAtPos
	pop	de
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:46: x++;
	inc	c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:47: pos++;
	jp	00101$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:50: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:55: void TickAI(u8 playerId){
;	---------------------------------
; Function TickAI
; ---------------------------------
_TickAI::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-33
	add	hl, sp
	ld	sp, hl
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:56: if(g_MatchStatus==MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER){
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jr	Z, 00539$
	sub	a, #0x0d
	jp	NZ,00548$
00539$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:62: u16 refX = g_Players[playerId].X;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:59: if (playerId == REFEREE) {
	ld	a, -3 (ix)
	sub	a, #0x0e
	jp	NZ,00163$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:60: u16 ballX = g_Ball.X;
	ld	de, #_g_Ball+0
	ld	bc, (#_g_Ball + 2)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:61: u16 ballY = g_Ball.Y;
	ld	a, (de)
	ld	-5 (ix), a
	inc	de
	ld	a, (de)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:62: u16 refX = g_Players[playerId].X;
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
	ld	-12 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:63: u16 refY = g_Players[playerId].Y;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:75: if (ballX < 128) targetX = ballX + 60; // Ball Left -> Ref Right
	ld	-9 (ix), c
	ld	-8 (ix), b
	ld	a, -9 (ix)
	sub	a, #0x80
	ld	a, -8 (ix)
	sbc	a, #0x00
	jr	NC, 00102$
	ld	a, -9 (ix)
	add	a, #0x3c
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-10 (ix), a
	ld	a, -6 (ix)
	ld	-9 (ix), a
	jp	00103$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:76: else targetX = ballX - 60;             // Ball Right -> Ref Left
	ld	a, -9 (ix)
	add	a, #0xc4
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0xff
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-10 (ix), a
	ld	a, -6 (ix)
	ld	-9 (ix), a
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:79: if (targetX < FIELD_BOUND_X_LEFT + 10) targetX = FIELD_BOUND_X_LEFT + 10;
	ld	a, -10 (ix)
	sub	a, #0x14
	ld	a, -9 (ix)
	sbc	a, #0x00
	jr	NC, 00105$
	ld	-10 (ix), #0x14
	ld	-9 (ix), #0
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:80: if (targetX > FIELD_BOUND_X_RIGHT - 10) targetX = FIELD_BOUND_X_RIGHT - 10;
	ld	a, #0xec
	cp	a, -10 (ix)
	ld	a, #0x00
	sbc	a, -9 (ix)
	jr	NC, 00107$
	ld	-10 (ix), #0xec
	ld	-9 (ix), #0
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:85: u8 moveDir = DIRECTION_NONE;
	ld	-8 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:86: i16 diffY = (i16)targetY - (i16)refY;
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	ld	a, -2 (ix)
	ld	-5 (ix), a
	ld	a, -1 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	sub	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, -6 (ix)
	sbc	a, -4 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:87: i16 diffX = (i16)targetX - (i16)refX;
	ld	a, -10 (ix)
	ld	-5 (ix), a
	ld	a, -9 (ix)
	ld	-4 (ix), a
	ld	a, -12 (ix)
	ld	-7 (ix), a
	ld	a, -11 (ix)
	ld	-6 (ix), a
	ld	a, -5 (ix)
	sub	a, -7 (ix)
	ld	-10 (ix), a
	ld	a, -4 (ix)
	sbc	a, -6 (ix)
	ld	-9 (ix), a
	ld	a, -10 (ix)
	ld	-5 (ix), a
	ld	a, -9 (ix)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:90: if (diffY < -8) moveDir = DIRECTION_UP;
	ld	a, -2 (ix)
	sub	a, #0xf8
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00111$
	ld	-8 (ix), #0x01
	jp	00112$
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:91: else if (diffY > 8) moveDir = DIRECTION_DOWN;
	ld	a, #0x08
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 01684$
	xor	a, #0x80
01684$:
	jp	P, 00112$
	ld	-8 (ix), #0x05
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:94: bool moveX = false;
	ld	c, #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:95: if (diffX < -16) moveX = true; // Need to go Left
	ld	a, -5 (ix)
	sub	a, #0xf0
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00116$
	ld	c, #0x01
	jp	00117$
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:96: else if (diffX > 16) moveX = true; // Need to go Right
	ld	b, -5 (ix)
	ld	e, -4 (ix)
	ld	a, #0x10
	cp	a, b
	ld	a, #0x00
	sbc	a, e
	jp	PO, 01685$
	xor	a, #0x80
01685$:
	jp	P, 00117$
	ld	c, #0x01
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:98: if (moveX) {
	ld	a, c
	or	a, a
	jr	Z, 00134$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:96: else if (diffX > 16) moveX = true; // Need to go Right
	ld	c, -5 (ix)
	ld	b, -4 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:100: if (diffX > 0) moveDir = DIRECTION_UP_RIGHT;
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 01686$
	xor	a, #0x80
01686$:
	rlca
	and	a,#0x01
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:99: if (moveDir == DIRECTION_UP) {
	ld	a, -8 (ix)
	dec	a
	jr	NZ, 00131$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:100: if (diffX > 0) moveDir = DIRECTION_UP_RIGHT;
	ld	a, c
	or	a, a
	jr	Z, 00119$
	ld	-8 (ix), #0x02
	jp	00134$
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:101: else moveDir = DIRECTION_UP_LEFT;
	ld	-8 (ix), #0x08
	jp	00134$
00131$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:102: } else if (moveDir == DIRECTION_DOWN) {
	ld	a, -8 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:103: if (diffX > 0) moveDir = DIRECTION_DOWN_RIGHT;
	sub	a,#0x05
	jr	NZ, 00128$
	or	a,c
	jr	Z, 00122$
	ld	-8 (ix), #0x04
	jp	00134$
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:104: else moveDir = DIRECTION_DOWN_LEFT;
	ld	-8 (ix), #0x06
	jp	00134$
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:106: if (diffX > 0) moveDir = DIRECTION_RIGHT;
	ld	a, c
	or	a, a
	jr	Z, 00125$
	ld	-8 (ix), #0x03
	jp	00134$
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:107: else moveDir = DIRECTION_LEFT;
	ld	-8 (ix), #0x07
00134$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:111: g_Players[playerId].Direction = moveDir;
	ld	a, -16 (ix)
	add	a, #0x06
	ld	c, a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, -8 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:114: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	(bc), a
	ld	e, a
	ld	a, -8 (ix)
	dec	a
	jr	Z, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:115: g_Players[playerId].Direction == DIRECTION_UP_RIGHT ||
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:116: g_Players[playerId].Direction == DIRECTION_UP_LEFT) {
	ld	a,e
	cp	a,#0x02
	jr	Z, 00135$
	sub	a, #0x08
	jr	NZ, 00136$
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:117: g_Players[playerId].Y--;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:114: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	a, (bc)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:119: if (g_Players[playerId].Direction == DIRECTION_DOWN ||
	cp	a, #0x05
	jr	Z, 00139$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:120: g_Players[playerId].Direction == DIRECTION_DOWN_RIGHT ||
	cp	a, #0x04
	jr	Z, 00139$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:121: g_Players[playerId].Direction == DIRECTION_DOWN_LEFT) {
	sub	a, #0x06
	jr	NZ, 00140$
00139$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:122: g_Players[playerId].Y++;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00140$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:114: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	a, (bc)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:124: if (g_Players[playerId].Direction == DIRECTION_LEFT ||
	cp	a, #0x07
	jr	Z, 00143$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:125: g_Players[playerId].Direction == DIRECTION_UP_LEFT ||
	cp	a, #0x08
	jr	Z, 00143$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:126: g_Players[playerId].Direction == DIRECTION_DOWN_LEFT) {
	sub	a, #0x06
	jr	NZ, 00144$
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:127: g_Players[playerId].X--;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00144$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:114: if (g_Players[playerId].Direction == DIRECTION_UP ||
	ld	a, (bc)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:129: if (g_Players[playerId].Direction == DIRECTION_RIGHT ||
	cp	a, #0x03
	jr	Z, 00147$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:130: g_Players[playerId].Direction == DIRECTION_UP_RIGHT ||
	cp	a, #0x02
	jr	Z, 00147$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:131: g_Players[playerId].Direction == DIRECTION_DOWN_RIGHT) {
	sub	a, #0x04
	jr	NZ, 00148$
00147$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:132: g_Players[playerId].X++;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
00148$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:136: if(g_Players[playerId].Y < FIELD_BOUND_Y_TOP) g_Players[playerId].Y = FIELD_BOUND_Y_TOP;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x32
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00152$
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	(hl), #0x32
	inc	hl
	ld	(hl), #0x00
00152$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:137: if(g_Players[playerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[playerId].Y = FIELD_BOUND_Y_BOTTOM;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xae
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	jr	NC, 00154$
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	(hl), #0xae
	inc	hl
	ld	(hl), #0x01
00154$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:138: if(g_Players[playerId].X < FIELD_BOUND_X_LEFT) g_Players[playerId].X = FIELD_BOUND_X_LEFT;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x0a
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00156$
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	(hl), #0x0a
	inc	hl
	ld	(hl), #0x00
00156$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:139: if(g_Players[playerId].X > FIELD_BOUND_X_RIGHT) g_Players[playerId].X = FIELD_BOUND_X_RIGHT;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xf6
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00158$
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	(hl), #0xf6
	inc	hl
	ld	(hl), #0x00
00158$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:145: g_Players[playerId].Status = PLAYER_STATUS_NONE; // Force not positioned
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	de, #0x000e
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:144: if (moveDir != DIRECTION_NONE) {
	ld	a, -8 (ix)
	or	a, a
	jr	Z, 00160$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:145: g_Players[playerId].Status = PLAYER_STATUS_NONE; // Force not positioned
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00548$
00160$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:147: g_Players[playerId].Status = PLAYER_STATUS_POSITIONED; // Allow rest
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:150: return;
	jp	00548$
00163$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:153: u8 playerTeamId = g_Players[playerId].TeamId;
	ld	a, #<(_g_Players)
	add	a, -2 (ix)
	ld	-33 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -1 (ix)
	ld	-32 (ix), a
	pop	bc
	push	bc
	ld	hl, #5
	add	hl, bc
	ld	a, (hl)
	ld	-31 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:154: bool ballPossessionByPlayerTeam = false;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:156: if (g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0d
	jr	NZ, 00176$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:159: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#(_g_Ball + 6) + 0)
	ld	-1 (ix), a
	inc	a
	jp	Z,00177$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:160: if (g_Players[g_Ball.PossessionPlayerId].TeamId == playerTeamId) ballPossessionByPlayerTeam = true;
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
	ld	a,-31 (ix)
	sub	a,(hl)
	jr	NZ, 00177$
	ld	-6 (ix), #0x01
	jp	00177$
00176$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:164: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#_g_Ball + 6)
	ld	-1 (ix), a
	inc	a
	jr	Z, 00173$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:165: if (g_Players[g_Ball.PossessionPlayerId].TeamId == playerTeamId) {
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
	ld	a,-31 (ix)
	sub	a,(hl)
	jr	NZ, 00177$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:166: ballPossessionByPlayerTeam = true;
	ld	-6 (ix), #0x01
	jp	00177$
00173$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:170: if (g_Ball.LastTouchTeamId == playerTeamId) {
	ld	hl, #_g_Ball + 14
	ld	a,-31 (ix)
	sub	a,(hl)
	jr	NZ, 00177$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:171: ballPossessionByPlayerTeam = true;
	ld	-6 (ix), #0x01
00177$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:179: if (ballPossessionByPlayerTeam) {
	ld	a, -6 (ix)
	or	a, a
	jp	Z, 00401$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:182: if (g_Ball.PossessionPlayerId == playerId) {
	ld	a, (#_g_Ball + 6)
	ld	-1 (ix), a
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jp	NZ,00328$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:188: if (playerTeamId == TEAM_1) { 
	ld	a, -31 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 01720$
	xor	a, a
01720$:
	ld	-30 (ix), a
	or	a, a
	jr	Z, 00179$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:189: targetY_Goal = goalTopY - 20; 
	ld	-29 (ix), #0x37
	ld	-28 (ix), #0
	jp	00180$
00179$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:191: targetY_Goal = goalBottomY + 20;
	ld	-29 (ix), #0xa9
	ld	-28 (ix), #0x01
00180$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:195: targetX_Goal = g_Players[playerId].X;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:196: if (targetX_Goal > 100 && targetX_Goal < 156) {
	ld	b, -25 (ix)
	ld	e, -24 (ix)
	ld	a, #0x64
	cp	a, b
	ld	a, #0x00
	sbc	a, e
	jr	NC, 00185$
	ld	a, b
	sub	a, #0x9c
	ld	a, e
	sbc	a, #0x00
	jr	NC, 00185$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:197: if ((g_Players[playerId].Role % 2) != 0) targetX_Goal = 60; // Go Left
	pop	bc
	push	bc
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	rrca
	jr	NC, 00182$
	ld	-25 (ix), #0x3c
	ld	-24 (ix), #0
	jp	00185$
00182$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:198: else targetX_Goal = 190; // Go Right
	ld	-25 (ix), #0xbe
	ld	-24 (ix), #0
00185$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:201: if (targetX_Goal < FIELD_BOUND_X_LEFT + 20) targetX_Goal = FIELD_BOUND_X_LEFT + 20;
	ld	a, -25 (ix)
	sub	a, #0x1e
	ld	a, -24 (ix)
	sbc	a, #0x00
	jr	NC, 00188$
	ld	-25 (ix), #0x1e
	ld	-24 (ix), #0
00188$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:202: if (targetX_Goal > FIELD_BOUND_X_RIGHT - 20) targetX_Goal = FIELD_BOUND_X_RIGHT - 20;
	ld	a, #0xe2
	cp	a, -25 (ix)
	ld	a, #0x00
	sbc	a, -24 (ix)
	jr	NC, 00190$
	ld	-25 (ix), #0xe2
	ld	-24 (ix), #0
00190$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:206: bool obstacleRight = false;
	ld	-23 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:207: bool obstacleLeft = false;
	ld	-22 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:208: bool obstacleFront = false;
	ld	-21 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:209: bool obstacleFrontNonGK = false;
	ld	-20 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:210: bool dangerousOpponent = false;
	ld	-19 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:213: for(i=0; i<14; i++) { 
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
00542$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:214: if (g_Players[i].TeamId == playerTeamId) continue;
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
	ld	a,-31 (ix)
	sub	a,(hl)
	jp	Z,00231$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:215: if (g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -16 (ix)
	ld	b, -15 (ix)
	ld	hl, #14
	add	hl, bc
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00231$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:216: if (i == playerId) continue;
	ld	c, -3 (ix)
	ld	b, #0x00
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	cp	a, a
	sbc	hl, bc
	jp	Z,00231$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:218: i16 relX = (i16)g_Players[i].X - (i16)g_Players[playerId].X;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:219: i16 relY = (i16)g_Players[i].Y - (i16)g_Players[playerId].Y;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:225: bool isFront = false;
	ld	-10 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:226: bool isBehind = false;
	ld	-4 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:229: if (relY < 0 && relY > -obstacleDetDist) isFront = true;
	ld	a, -12 (ix)
	ld	-9 (ix), a
	ld	a, -11 (ix)
	ld	-8 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:228: if (playerTeamId == TEAM_1) { // Moving UP (Y decreases)
	ld	a, -30 (ix)
	or	a, a
	jr	Z, 00208$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:229: if (relY < 0 && relY > -obstacleDetDist) isFront = true;
	ld	a, -8 (ix)
	rlca
	and	a,#0x01
	ld	c, a
	or	a, a
	jr	Z, 00198$
	ld	a, #0xe0
	cp	a, -9 (ix)
	ld	a, #0xff
	sbc	a, -8 (ix)
	jp	PO, 01724$
	xor	a, #0x80
01724$:
	jp	P, 00198$
	ld	-10 (ix), #0x01
00198$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:230: if (relY >= 0) isBehind = true;
	bit	0, c
	jr	NZ, 00209$
	ld	-4 (ix), #0x01
	jp	00209$
00208$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:232: if (relY > 0 && relY < obstacleDetDist) isFront = true;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 01725$
	xor	a, #0x80
01725$:
	rlca
	and	a,#0x01
	ld	c, a
	or	a, a
	jr	Z, 00203$
	ld	a, -12 (ix)
	sub	a, #0x20
	ld	a, -11 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00203$
	ld	-10 (ix), #0x01
00203$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:233: if (relY <= 0) isBehind = true;
	bit	0, c
	jr	NZ, 00209$
	ld	-4 (ix), #0x01
00209$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:238: u8 safeDist = isBehind ? 12 : 16; 
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00550$
	ld	bc, #0x000c
	jp	00551$
00550$:
	ld	bc, #0x0010
00551$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:239: if (relX > -safeDist && relX < safeDist && relY > -safeDist && relY < safeDist) {
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
	jp	PO, 01726$
	xor	a, #0x80
01726$:
	jp	P, 00211$
	ld	b, #0x00
	ld	a, -14 (ix)
	sub	a, c
	ld	a, -13 (ix)
	sbc	a, b
	jp	PO, 01727$
	xor	a, #0x80
01727$:
	jp	P, 00211$
	ld	a, -7 (ix)
	sub	a, -9 (ix)
	ld	a, -6 (ix)
	sbc	a, -8 (ix)
	jp	PO, 01728$
	xor	a, #0x80
01728$:
	jp	P, 00211$
	ld	a, -12 (ix)
	sub	a, c
	ld	a, -11 (ix)
	sbc	a, b
	jp	PO, 01729$
	xor	a, #0x80
01729$:
	jp	P, 00211$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:240: dangerousOpponent = true;
	ld	-19 (ix), #0x01
00211$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:244: if (isFront && relX > -10 && relX < 10) {
	ld	a, -10 (ix)
	or	a, a
	jr	Z, 00218$
	ld	a, #0xf6
	cp	a, -14 (ix)
	ld	a, #0xff
	sbc	a, -13 (ix)
	jp	PO, 01730$
	xor	a, #0x80
01730$:
	jp	P, 00218$
	ld	a, -5 (ix)
	sub	a, #0x0a
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00218$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:245: obstacleFront = true;
	ld	-21 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:246: if (g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) obstacleFrontNonGK = true;
	ld	c, -16 (ix)
	ld	b, -15 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z, 00218$
	ld	-20 (ix), #0x01
00218$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:249: if (isFront || (relY < 18 && relY > -18)) { 
	ld	a, -10 (ix)
	or	a, a
	jr	NZ, 00227$
	ld	a, -9 (ix)
	sub	a, #0x12
	ld	a, -8 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00231$
	ld	a, #0xee
	cp	a, -12 (ix)
	ld	a, #0xff
	sbc	a, -11 (ix)
	jp	PO, 01731$
	xor	a, #0x80
01731$:
	jp	P, 00231$
00227$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:250: if (relX >= 0 && relX < 24) obstacleRight = true; // Obstacle is to my right
	ld	a, -4 (ix)
	rlca
	and	a,#0x01
	ld	e, a
	bit	0, e
	jr	NZ, 00222$
	ld	a, -5 (ix)
	sub	a, #0x18
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00222$
	ld	-23 (ix), #0x01
00222$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:251: if (relX < 0 && relX > -24) obstacleLeft = true; // Obstacle is to my left
	ld	a, e
	or	a, a
	jr	Z, 00231$
	ld	a, #0xe8
	cp	a, -14 (ix)
	ld	a, #0xff
	sbc	a, -13 (ix)
	jp	PO, 01732$
	xor	a, #0x80
01732$:
	jp	P, 00231$
	ld	-22 (ix), #0x01
00231$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:213: for(i=0; i<14; i++) { 
	inc	-2 (ix)
	jr	NZ, 01733$
	inc	-1 (ix)
01733$:
	ld	a, -2 (ix)
	sub	a, #0x0e
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00542$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:260: bool isHumanControlled = false;
	ld	-2 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:261: if ((playerTeamId == TEAM_1 && g_Team1ActivePlayer == playerId) || 
	ld	a, -30 (ix)
	or	a, a
	jr	Z, 00245$
	ld	a, (_g_Team1ActivePlayer+0)
	sub	a, -3 (ix)
	jr	Z, 00240$
00245$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:262: (playerTeamId == TEAM_2 && g_GameWith2Players && g_Team2ActivePlayer == playerId)) {
	ld	a, -31 (ix)
	sub	a, #0x02
	jr	NZ, 00241$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00241$
	ld	a, (_g_Team2ActivePlayer+0)
	sub	a, -3 (ix)
	jr	NZ, 00241$
00240$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:263: isHumanControlled = true;
	ld	-2 (ix), #0x01
00241$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:266: if (!isHumanControlled) {
	ld	a, -2 (ix)
	or	a, a
	jp	NZ, 00268$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:268: bool inRealShootingRange = false;
	ld	-7 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:269: bool inDangerousZone = false;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:272: if (playerTeamId == TEAM_1) {
	ld	a, -30 (ix)
	or	a, a
	jr	Z, 00255$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:276: if (g_Players[playerId].Y < (FIELD_BOUND_Y_TOP + 90)) inRealShootingRange = true;
	ld	a, -18 (ix)
	ld	-5 (ix), a
	ld	a, -17 (ix)
	ld	-4 (ix), a
	ld	a, -18 (ix)
	sub	a, #0x8c
	ld	a, -17 (ix)
	sbc	a, #0x00
	jr	NC, 00247$
	ld	-7 (ix), #0x01
00247$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:279: if (g_Players[playerId].Y < (FIELD_BOUND_Y_TOP + 60)) inDangerousZone = true; 
	ld	a, -5 (ix)
	sub	a, #0x6e
	ld	a, -4 (ix)
	sbc	a, #0x00
	jr	NC, 00249$
	ld	-6 (ix), #0x01
00249$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:280: goalTargetY = FIELD_BOUND_Y_TOP - 10; 
	ld	-5 (ix), #0x28
	ld	-4 (ix), #0
	jp	00256$
00255$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:284: if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 90)) inRealShootingRange = true;
	ld	a, -18 (ix)
	ld	-5 (ix), a
	ld	a, -17 (ix)
	ld	-4 (ix), a
	ld	a, #0x54
	cp	a, -5 (ix)
	ld	a, #0x01
	sbc	a, -4 (ix)
	jr	NC, 00251$
	ld	-7 (ix), #0x01
00251$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:287: if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 60)) inDangerousZone = true;
	ld	a, #0x72
	cp	a, -5 (ix)
	ld	a, #0x01
	sbc	a, -4 (ix)
	jr	NC, 00253$
	ld	-6 (ix), #0x01
00253$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:288: goalTargetY = FIELD_BOUND_Y_BOTTOM + 10; 
	ld	-5 (ix), #0xb8
	ld	-4 (ix), #0x01
00256$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:292: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	pop	bc
	push	bc
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	ld	-1 (ix), a
	or	a, a
	jr	NZ, 00258$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:293: inRealShootingRange = false;
	ld	-7 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:294: inDangerousZone = false;
	ld	-6 (ix), #0x00
00258$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:297: if (inRealShootingRange) {
	ld	a, -7 (ix)
	or	a, a
	jp	Z, 00268$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:306: bool clearShot = !obstacleFrontNonGK;
	ld	a, -20 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:309: if (inDangerousZone) clearShot = true;
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00260$
	ld	-1 (ix), #0x01
00260$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:313: if (clearShot) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00268$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:314: u16 shotX = 86 + ((g_FrameCounter + playerId * 13) % 68);
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:315: PerformShot(shotX, goalTargetY);
	ld	e, -5 (ix)
	ld	d, -4 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	_PerformShot
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:316: return;
	jp	00548$
00268$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:322: bool shouldPass = false;
	ld	-5 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:323: bool isPanicPass = false;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:329: bool checkPassing = false;
	ld	-4 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:331: if (dangerousOpponent) {
	ld	a, -19 (ix)
	or	a, a
	jr	Z, 00279$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:333: shouldPass = true;
	ld	-5 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:334: isPanicPass = true;
	ld	-1 (ix), #0x01
	jp	00280$
00279$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:336: else if (obstacleFront) {
	ld	a, -21 (ix)
	or	a, a
	jr	Z, 00276$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:339: bool canGoRight = (g_Players[playerId].X < FIELD_BOUND_X_RIGHT - 20) && !obstacleRight;
	ld	a, -27 (ix)
	sub	a, #0xe2
	ld	a, -26 (ix)
	sbc	a, #0x00
	jr	NC, 00552$
	ld	a, -23 (ix)
	or	a, a
	jr	Z, 00553$
00552$:
	ld	-5 (ix), #0x00
	jp	00554$
00553$:
	ld	-5 (ix), #0x01
00554$:
	ld	a, -5 (ix)
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:340: bool canGoLeft = (g_Players[playerId].X > FIELD_BOUND_X_LEFT + 20) && !obstacleLeft;
	ld	a, #0x1e
	cp	a, -27 (ix)
	ld	a, #0x00
	sbc	a, -26 (ix)
	jr	NC, 00555$
	ld	a, -22 (ix)
	or	a, a
	jr	Z, 00556$
00555$:
	ld	-5 (ix), #0x00
	jp	00557$
00556$:
	ld	-5 (ix), #0x01
00557$:
	ld	c, -5 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:342: if (canGoRight || canGoLeft) {
	ld	a, -6 (ix)
	or	a,a
	jr	NZ, 00269$
	or	a,c
	jr	Z, 00270$
00269$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:344: shouldPass = false;
	ld	-5 (ix), #0x00
	jp	00280$
00270$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:347: shouldPass = true;
	ld	-5 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:348: isPanicPass = true;
	ld	-1 (ix), #0x01
	jp	00280$
00276$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:354: if ((g_FrameCounter & 1) == 0) checkPassing = true;
	ld	hl, (_g_FrameCounter)
	bit	0, l
	jr	NZ, 00280$
	ld	-4 (ix), #0x01
00280$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:357: if (checkPassing) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00282$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:360: shouldPass = true; 
	ld	-5 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:361: isPanicPass = false;
	ld	-1 (ix), #0x00
00282$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:364: if (shouldPass) {
	ld	a, -5 (ix)
	or	a, a
	jp	Z, 00315$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:365: if (!isHumanControlled) {
	ld	a, -2 (ix)
	or	a, a
	jp	NZ, 00315$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:366: u8 bestT = NO_VALUE;
	ld	-2 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:367: i32 bestScore = -2100000000;
	ld	-11 (ix), #0x00
	ld	-10 (ix), #0x8b
	ld	-9 (ix), #0xd4
	ld	-8 (ix), #0x82
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:369: for(t=0; t<14; t++) {
	ld	a, -18 (ix)
	ld	-7 (ix), a
	ld	a, -17 (ix)
	ld	-6 (ix), a
	xor	a, a
	ld	-5 (ix), a
	ld	-4 (ix), a
00543$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:370: if(g_Players[t].TeamId != playerTeamId) continue;
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
	ld	c, l
	ld	b, h
	ld	hl, #5
	add	hl, bc
	ld	a,-31 (ix)
	sub	a,(hl)
	jp	NZ,00306$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:371: if(t == playerId) continue;
	ld	c, -3 (ix)
	ld	b, #0x00
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	cp	a, a
	sbc	hl, bc
	jp	Z,00306$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:372: if(g_Players[t].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -13 (ix)
	ld	b, -12 (ix)
	ld	hl, #14
	add	hl, bc
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00306$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:373: if(g_Players[t].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	c, -13 (ix)
	ld	b, -12 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00306$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:375: i16 dx = (i16)g_Players[t].X - (i16)g_Players[playerId].X;
	ld	l, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	ld	e, -27 (ix)
	ld	d, -26 (ix)
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:376: i16 dy = (i16)g_Players[t].Y - (i16)g_Players[playerId].Y;
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
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	cp	a, a
	sbc	hl, de
	ld	-15 (ix), l
	ld	-14 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:377: u16 adx = (dx < 0) ? -dx : dx;
	ld	e, c
	ld	d, b
	bit	7, d
	jr	Z, 00558$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	jp	00559$
00558$:
	ld	a, b
00559$:
	ld	-13 (ix), c
	ld	-12 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:378: u16 ady = (dy < 0) ? -dy : dy;
	ld	b, -14 (ix)
	bit	7, b
	jr	Z, 00560$
	xor	a, a
	sub	a, -15 (ix)
	ld	-19 (ix), a
	sbc	a, a
	sub	a, -14 (ix)
	ld	-18 (ix), a
	jp	00561$
00560$:
	ld	a, -15 (ix)
	ld	-19 (ix), a
	ld	a, -14 (ix)
	ld	-18 (ix), a
00561$:
	ld	c, -19 (ix)
	ld	b, -18 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:379: if (adx < 40 && ady < 40) continue; // Minimum pass distance
	ld	a, -13 (ix)
	sub	a, #0x28
	ld	a, -12 (ix)
	sbc	a, #0x00
	jr	NC, 00292$
	ld	a, c
	sub	a, #0x28
	ld	a, b
	sbc	a, #0x00
	jp	C, 00306$
00292$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:382: if (g_Players[t].Y < g_FieldCurrentYPosition - 40 || 
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
	jp	C, 00306$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:383: g_Players[t].Y > (g_FieldCurrentYPosition + 252)) continue;
	ld	hl, (_g_FieldCurrentYPosition)
	ld	de, #0x00fc
	add	hl, de
	xor	a, a
	sbc	hl, bc
	jp	C, 00306$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:385: i32 advanceScore = (playerTeamId == TEAM_1) ? -dy : dy;
	ld	a, -30 (ix)
	or	a, a
	jr	Z, 00562$
	xor	a, a
	sub	a, -15 (ix)
	ld	c, a
	sbc	a, a
	sub	a, -14 (ix)
	jp	00563$
00562$:
	ld	c, -15 (ix)
	ld	a, -14 (ix)
00563$:
	ld	b, a
	rlca
	sbc	a, a
	ld	e, a
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:388: if (!isPanicPass) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00302$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:389: if (advanceScore < 40) continue; // Must gain at least 40px ground
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
	jr	NC, 00303$
	jp	00306$
00302$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:392: if (advanceScore < -150) continue;
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
	jr	C, 00306$
00303$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:395: i32 score = advanceScore - (adx/4); // Minimal lateral penalty
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:397: if (score > bestScore) {
	ld	a, -11 (ix)
	sub	a, c
	ld	a, -10 (ix)
	sbc	a, b
	ld	a, -9 (ix)
	sbc	a, e
	ld	a, -8 (ix)
	sbc	a, d
	jp	PO, 01744$
	xor	a, #0x80
01744$:
	jp	P, 00306$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:398: bestScore = score;
	ld	-11 (ix), c
	ld	-10 (ix), b
	ld	-9 (ix), e
	ld	-8 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:399: bestT = t;
	ld	a, -5 (ix)
	ld	-2 (ix), a
00306$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:369: for(t=0; t<14; t++) {
	inc	-5 (ix)
	jr	NZ, 01745$
	inc	-4 (ix)
01745$:
	ld	a, -5 (ix)
	sub	a, #0x0e
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00543$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:404: if (bestT != NO_VALUE) {
	ld	a, -2 (ix)
	inc	a
	jr	Z, 00315$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:407: i32 threshold = isPanicPass ? -80 : 10;
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00564$
	ld	-5 (ix), #0xb0
	ld	-4 (ix), #0xff
	jp	00565$
00564$:
	ld	-5 (ix), #0x0a
	ld	-4 (ix), #0
00565$:
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	rlca
	sbc	a, a
	ld	-5 (ix), a
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:409: if (bestScore > threshold) {
	ld	a, -7 (ix)
	sub	a, -11 (ix)
	ld	a, -6 (ix)
	sbc	a, -10 (ix)
	ld	a, -5 (ix)
	sbc	a, -9 (ix)
	ld	a, -4 (ix)
	sbc	a, -8 (ix)
	jp	PO, 01747$
	xor	a, #0x80
01747$:
	jp	P, 00315$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:410: PerformPass(bestT);
	ld	a, -2 (ix)
	call	_PerformPass
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:411: return; // End tick
	jp	00548$
00315$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:417: u16 finalTargetX = targetX_Goal;
	ld	a, -25 (ix)
	ld	-2 (ix), a
	ld	a, -24 (ix)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:418: u16 finalTargetY = targetY_Goal;
	ld	a, -29 (ix)
	ld	-5 (ix), a
	ld	a, -28 (ix)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:420: if (obstacleFront) {
	ld	a, -21 (ix)
	or	a, a
	jp	Z, 00326$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:421: if (!obstacleRight) {
	ld	a, -23 (ix)
	or	a, a
	jr	NZ, 00323$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:422: finalTargetX = g_Players[playerId].X + 24;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:423: if (finalTargetX > FIELD_BOUND_X_RIGHT) finalTargetX = FIELD_BOUND_X_RIGHT;
	ld	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -1 (ix)
	ld	-6 (ix), a
	ld	a, #0xf6
	cp	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	jr	NC, 00326$
	ld	-2 (ix), #0xf6
	ld	-1 (ix), #0
	jp	00326$
00323$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:424: } else if (!obstacleLeft) {
	ld	a, -22 (ix)
	or	a, a
	jr	NZ, 00326$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:425: finalTargetX = g_Players[playerId].X - 24; 
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:426: if (finalTargetX < FIELD_BOUND_X_LEFT) finalTargetX = FIELD_BOUND_X_LEFT;
	ld	a, -2 (ix)
	ld	-7 (ix), a
	ld	a, -1 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	sub	a, #0x0a
	ld	a, -6 (ix)
	sbc	a, #0x00
	jr	NC, 00326$
	ld	-2 (ix), #0x0a
	ld	-1 (ix), #0
00326$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:429: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -33 (ix)
	add	a, #0x0a
	ld	-7 (ix), a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -4 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:430: g_Players[playerId].TargetX = finalTargetX;
	ld	a, -33 (ix)
	add	a, #0x0c
	ld	-5 (ix), a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:431: return; // IMPORTANT: Ball Carrier handled. Stop.
	jp	00548$
00328$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:437: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	a, -1 (ix)
	inc	a
	jr	NZ, 00332$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:439: if (GetClosestPlayerToBall(playerTeamId, NO_VALUE) == playerId) {
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -31 (ix)
	call	_GetClosestPlayerToBall
	ld	c, a
	ld	a, -3 (ix)
	sub	a, c
	jr	NZ, 00332$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:440: g_Players[playerId].TargetX = g_Ball.X;
	ld	a, -33 (ix)
	add	a, #0x0c
	ld	c, a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	b, a
	ld	de, (#_g_Ball + 2)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:441: g_Players[playerId].TargetY = g_Ball.Y;
	ld	a, -33 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	b, a
	ld	de, (#_g_Ball + 0)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:442: return;
	jp	00548$
00332$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:451: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER || 
	ld	a, -33 (ix)
	add	a, #0x09
	ld	c, a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	cp	a, #0x05
	jr	Z, 00368$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:452: g_Players[playerId].Role == PLAYER_ROLE_RIGHT_STRIKER) {
	cp	a, #0x06
	jr	NZ, 00369$
00368$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:429: g_Players[playerId].TargetY = finalTargetY;
	pop	hl
	push	hl
	ld	de, #0x000a
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:455: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = GK_BOX_Y_TOP_MAX - 10;
	ld	a, -31 (ix)
	dec	a
	jr	NZ, 00334$
	ld	(hl), #0x41
	inc	hl
	ld	(hl), #0x00
	jp	00335$
00334$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:456: else g_Players[playerId].TargetY = GK_BOX_Y_BOTTOM_MIN + 10;
	ld	(hl), #0x9f
	inc	hl
	ld	(hl), #0x01
00335$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:458: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetX = 64;
	ld	a, (bc)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:430: g_Players[playerId].TargetX = finalTargetX;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:458: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetX = 64;
	ld	a, c
	sub	a, #0x05
	jr	NZ, 00337$
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x00
	jp	00730$
00337$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:459: else g_Players[playerId].TargetX = 192;
	ld	(hl), #0xc0
	inc	hl
	ld	(hl), #0x00
	jp	00730$
00369$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:461: } else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER || 
	cp	a, #0x03
	jr	Z, 00364$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:462: g_Players[playerId].Role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
	cp	a, #0x04
	jr	NZ, 00365$
00364$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:429: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -33 (ix)
	add	a, #0x0a
	ld	-5 (ix), a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:441: g_Players[playerId].TargetY = g_Ball.Y;
	ld	hl, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:465: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = g_Ball.Y - 60;
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, -31 (ix)
	dec	a
	jr	NZ, 00340$
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
	jp	00341$
00340$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:466: else g_Players[playerId].TargetY = g_Ball.Y + 60;
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
00341$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:468: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetX = 48;
	ld	a, (bc)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:430: g_Players[playerId].TargetX = finalTargetX;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:468: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetX = 48;
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00343$
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x00
	jp	00730$
00343$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:469: else g_Players[playerId].TargetX = 208;
	ld	(hl), #0xd0
	inc	hl
	ld	(hl), #0x00
	jp	00730$
00365$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:471: } else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER || 
	cp	a, #0x01
	jr	Z, 00360$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:472: g_Players[playerId].Role == PLAYER_ROLE_RIGHT_DEFENDER) {
	cp	a, #0x02
	jp	NZ,00361$
00360$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:429: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -33 (ix)
	add	a, #0x0a
	ld	-2 (ix), a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:441: g_Players[playerId].TargetY = g_Ball.Y;
	ld	de, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:465: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = g_Ball.Y - 60;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:475: if (playerTeamId == TEAM_1) {
	ld	a, -31 (ix)
	dec	a
	jr	NZ, 00350$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:476: g_Players[playerId].TargetY = g_Ball.Y + 30;
	ld	hl, #0x001e
	add	hl, de
	ex	de, hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:478: if (g_Players[playerId].TargetY < (midFieldY - 30)) g_Players[playerId].TargetY = (midFieldY - 30);
	ld	a, e
	sub	a, #0xd2
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00351$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0xd2
	inc	hl
	ld	(hl), #0x00
	jp	00351$
00350$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:480: g_Players[playerId].TargetY = g_Ball.Y - 30;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:481: if (g_Players[playerId].TargetY > (midFieldY + 30)) g_Players[playerId].TargetY = (midFieldY + 30);
	ld	a, #0x0e
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00351$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x0e
	inc	hl
	ld	(hl), #0x01
00351$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:484: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) g_Players[playerId].TargetX = 80;
	ld	a, (bc)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:430: g_Players[playerId].TargetX = finalTargetX;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:484: if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) g_Players[playerId].TargetX = 80;
	dec	c
	jr	NZ, 00353$
	ld	(hl), #0x50
	inc	hl
	ld	(hl), #0x00
	jp	00730$
00353$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:485: else g_Players[playerId].TargetX = 176;
	ld	(hl), #0xb0
	inc	hl
	ld	(hl), #0x00
	jp	00730$
00361$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:487: } else if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	or	a, a
	jr	NZ, 00730$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:488: g_Players[playerId].TargetX = FIELD_POS_X_CENTER;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:429: g_Players[playerId].TargetY = finalTargetY;
	pop	hl
	push	hl
	ld	de, #0x000a
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:489: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = GK_BOX_Y_BOTTOM_MIN + 20;
	ld	a, -31 (ix)
	dec	a
	jr	NZ, 00356$
	ld	(hl), #0xa9
	inc	hl
	ld	(hl), #0x01
	jp	00548$
00356$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:490: else g_Players[playerId].TargetY = GK_BOX_Y_TOP_MAX - 20;
	ld	(hl), #0x37
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:491: return; // GK Done
	jp	00548$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:495: for(u8 i=0; i<14; i++) {
00730$:
	ld	-1 (ix), #0x00
00545$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00392$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:496: if (i == playerId) continue;
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jp	Z,00391$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:497: if (g_Players[i].Status == PLAYER_STATUS_NONE) continue;
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
	jp	Z, 00391$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:498: if (g_Players[i].TeamId != playerTeamId) continue;
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	ld	hl, #5
	add	hl, bc
	ld	a,-31 (ix)
	sub	a,(hl)
	jp	NZ,00391$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:499: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00391$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:501: i16 dx = (i16)g_Players[playerId].TargetX - (i16)g_Players[i].X;
	ld	a, -33 (ix)
	add	a, #0x0c
	ld	c, a
	ld	a, -32 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:502: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	a, -33 (ix)
	add	a, #0x0a
	ld	-9 (ix), a
	ld	a, -32 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:503: if (dx > -75 && dx < 75 && dy > -75 && dy < 75) {
	ld	a, #0xb5
	cp	a, -5 (ix)
	ld	a, #0xff
	sbc	a, -4 (ix)
	jp	PO, 01778$
	xor	a, #0x80
01778$:
	jp	P, 00391$
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
	jr	NC, 00391$
	ld	a, #0xb5
	cp	a, e
	ld	a, #0xff
	sbc	a, d
	jp	PO, 01779$
	xor	a, #0x80
01779$:
	jp	P, 00391$
	ld	-5 (ix), e
	ld	-4 (ix), d
	ld	a, -5 (ix)
	sub	a, #0x4b
	ld	a, -4 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00391$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:504: if (dx >= 0) g_Players[playerId].TargetX += 12; else g_Players[playerId].TargetX -= 12;
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	bit	7, -6 (ix)
	jr	NZ, 00381$
	ld	hl, #0x000c
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jp	00382$
00381$:
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
00382$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:502: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:505: if (dy >= 0) g_Players[playerId].TargetY += 12; else g_Players[playerId].TargetY -= 12;
	bit	7, -4 (ix)
	jr	NZ, 00384$
	ld	hl, #0x000c
	add	hl, bc
	ex	de, hl
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00391$
00384$:
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
00391$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:495: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00545$
00392$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:510: u16 offsideY = GetOffsideLineY(playerTeamId);
	ld	a, -31 (ix)
	call	_GetOffsideLineY
	ld	c, e
	ld	b, d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:429: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -33 (ix)
	add	a, #0x0a
	ld	e, a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:441: g_Players[playerId].TargetY = g_Ball.Y;
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:519: if (g_Players[playerId].TargetY < (effectiveLimit + 10)) { 
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl)
	dec	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	-2 (ix), l
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:513: if (playerTeamId == TEAM_1) { // Attacking UP (TargetY decreases)
	ld	a, -31 (ix)
	dec	a
	jr	NZ, 00398$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:517: effectiveLimit = (g_Ball.Y < offsideY) ? g_Ball.Y : offsideY;
	ld	a, -5 (ix)
	sub	a, c
	ld	a, -4 (ix)
	sbc	a, b
	jr	NC, 00566$
	ld	c, -5 (ix)
	ld	b, -4 (ix)
00566$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:519: if (g_Players[playerId].TargetY < (effectiveLimit + 10)) { 
	ld	hl, #0x000a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, -2 (ix)
	sub	a, c
	ld	a, -1 (ix)
	sbc	a, b
	jp	NC,00548$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:520: g_Players[playerId].TargetY = effectiveLimit + 10;
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	jp	00548$
00398$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:524: effectiveLimit = (g_Ball.Y > offsideY) ? g_Ball.Y : offsideY;
	ld	a, c
	sub	a, -5 (ix)
	ld	a, b
	sbc	a, -4 (ix)
	jr	NC, 00568$
	ld	c, -5 (ix)
	ld	b, -4 (ix)
00568$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:526: if (g_Players[playerId].TargetY > (effectiveLimit - 10)) {
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
	jp	NC,00548$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:527: g_Players[playerId].TargetY = effectiveLimit - 10;
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:532: return; 
	jp	00548$
00401$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:541: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -33 (ix)
	add	a, #0x09
	ld	-11 (ix), a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	or	a, a
	jp	NZ, 00424$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:547: if (playerTeamId == TEAM_1) { 
	ld	a, -31 (ix)
	dec	a
	jr	NZ, 00403$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:548: gkTargetY = FIELD_POS_Y_TEAM1_GOALKEEPER;
	ld	bc, #0x01a8
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:549: boxYMin = GK_BOX_Y_BOTTOM_MIN; boxYMax = GK_BOX_Y_BOTTOM_MAX;
	ld	-5 (ix), #0x95
	ld	-4 (ix), #0x01
	ld	-2 (ix), #0xb3
	ld	-1 (ix), #0x01
	jp	00404$
00403$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:551: gkTargetY = FIELD_POS_Y_TEAM2_GOALKEEPER;
	ld	bc, #0x0032
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:552: boxYMin = GK_BOX_Y_TOP_MIN; boxYMax = GK_BOX_Y_TOP_MAX;
	ld	-5 (ix), #0x23
	ld	-4 (ix), #0
	ld	-2 (ix), #0x4b
	ld	-1 (ix), #0
00404$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:555: u8 closestId = GetClosestPlayerToBall(playerTeamId, NO_VALUE);
	push	bc
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -31 (ix)
	call	_GetClosestPlayerToBall
	pop	bc
	ld	-11 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:556: bool ballInBox = (g_Ball.X > (boxXMin-5) && g_Ball.X < (boxXMax+5) && 
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
	jr	NC, 00570$
	ld	a, -8 (ix)
	sub	a, #0xa5
	ld	a, -7 (ix)
	sbc	a, #0x00
	jr	NC, 00570$
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
	jr	NC, 00570$
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	inc	de
	inc	de
	inc	de
	inc	de
	inc	de
	xor	a, a
	sbc	hl, de
	jr	C, 00571$
00570$:
	ld	-6 (ix), #0x00
	jp	00572$
00571$:
	ld	-6 (ix), #0x01
00572$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:559: if (ballInBox && closestId == playerId) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00412$
	ld	a, -3 (ix)
	sub	a, -11 (ix)
	jr	NZ, 00412$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:560: gkTargetX = g_Ball.X;
	ld	a, -10 (ix)
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	-7 (ix), a
	ld	-6 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:561: gkTargetY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	jp	00413$
00412$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:563: if (g_Ball.X > gkTargetX + 24) gkTargetX += 16;
	ld	a, #0x90
	cp	a, -8 (ix)
	ld	a, #0x00
	sbc	a, -7 (ix)
	jr	NC, 00409$
	ld	-7 (ix), #0x88
	ld	-6 (ix), #0
	jp	00413$
00409$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:564: else if (g_Ball.X < gkTargetX - 24) gkTargetX -= 16;
	ld	a, -8 (ix)
	sub	a, #0x60
	ld	a, -7 (ix)
	sbc	a, #0x00
	jr	NC, 00406$
	ld	-7 (ix), #0x68
	ld	-6 (ix), #0
	jp	00413$
00406$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:565: else gkTargetX = g_Ball.X; 
	ld	a, -10 (ix)
	ld	e, -9 (ix)
	ld	-7 (ix), a
	ld	-6 (ix), e
00413$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:568: if (gkTargetX < boxXMin) gkTargetX = boxXMin;
	ld	a, -7 (ix)
	sub	a, #0x50
	ld	a, -6 (ix)
	sbc	a, #0x00
	jr	NC, 00416$
	ld	-7 (ix), #0x50
	ld	-6 (ix), #0
00416$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:569: if (gkTargetX > boxXMax) gkTargetX = boxXMax;
	ld	a, #0xa0
	cp	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	jr	NC, 00418$
	ld	-7 (ix), #0xa0
	ld	-6 (ix), #0
00418$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:570: if (gkTargetY < boxYMin) gkTargetY = boxYMin;
	ld	a, c
	sub	a, -5 (ix)
	ld	a, b
	sbc	a, -4 (ix)
	jr	NC, 00420$
	ld	c, -5 (ix)
	ld	b, -4 (ix)
00420$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:571: if (gkTargetY > boxYMax) gkTargetY = boxYMax;
	ld	a, -2 (ix)
	sub	a, c
	ld	a, -1 (ix)
	sbc	a, b
	jr	NC, 00422$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
00422$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:573: g_Players[playerId].TargetX = gkTargetX;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
	ld	a, -7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -6 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:574: g_Players[playerId].TargetY = gkTargetY;
	pop	hl
	push	hl
	ld	de, #0x000a
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:575: return; 
	jp	00548$
00424$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:579: u8 playerClosesestToBallId = GetClosestPlayerToBall(playerTeamId, NO_VALUE);
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -31 (ix)
	call	_GetClosestPlayerToBall
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:581: bool amIEffectiveChaser = (playerClosesestToBallId == playerId);
	ld	a, -3 (ix)
	sub	a, b
	ld	a, #0x01
	jr	Z, 01787$
	xor	a, a
01787$:
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:583: if (g_Players[playerClosesestToBallId].Role == PLAYER_ROLE_GOALKEEPER) {
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
	jp	NZ, 00436$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:584: u16 limitY = (playerTeamId == TEAM_1) ? GK_BOX_Y_BOTTOM_MIN : GK_BOX_Y_TOP_MAX;
	ld	a, -31 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 01789$
	xor	a, a
01789$:
	ld	c, a
	or	a, a
	jr	Z, 00579$
	ld	de, #0x0195
	jp	00580$
00579$:
	ld	de, #0x004b
00580$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:585: bool ballFar = false;
	ld	-6 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:586: if (playerTeamId == TEAM_1 && g_Ball.Y < limitY - 10) ballFar = true;
	ld	a, c
	or	a, a
	jr	Z, 00426$
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
	jr	NC, 00426$
	ld	-6 (ix), #0x01
00426$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:587: if (playerTeamId == TEAM_2 && g_Ball.Y > limitY + 10) ballFar = true;
	ld	a, -31 (ix)
	sub	a, #0x02
	jr	NZ, 00429$
	ld	hl, (#_g_Ball + 0)
	ld	a, e
	add	a, #0x0a
	ld	c, a
	jr	NC, 01792$
	inc	d
01792$:
	ld	a, c
	sub	a, l
	ld	a, d
	sbc	a, h
	jr	NC, 00429$
	ld	-6 (ix), #0x01
00429$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:589: if (ballFar) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00436$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:590: u8 nextClosest = GetClosestPlayerToBall(playerTeamId, playerClosesestToBallId);
	push	bc
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -31 (ix)
	call	_GetClosestPlayerToBall
	pop	bc
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:591: if (nextClosest == playerId) amIEffectiveChaser = true;
	ld	a, -3 (ix)
	sub	a, c
	jr	NZ, 00436$
	ld	-9 (ix), #0x01
00436$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:595: if (amIEffectiveChaser) {
	ld	a, -9 (ix)
	or	a, a
	jp	Z, 00537$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:597: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	hl, #_g_Ball + 6
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:598: g_Players[playerId].TargetX = g_Ball.X;
	ld	hl, #_g_Ball + 2
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:597: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	inc	c
	jr	NZ, 00464$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:598: g_Players[playerId].TargetX = g_Ball.X;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
	ld	a, -5 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -4 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:599: g_Players[playerId].TargetY = g_Ball.Y;
	ld	a, -33 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	b, a
	ld	de, (#_g_Ball + 0)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jp	00548$
00464$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:605: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:606: i16 dy = (i16)g_Players[playerId].Y - (i16)g_Ball.Y;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:607: if (dx > -12 && dx < 12 && dy > -12 && dy < 12) {
	ld	a, #0xf4
	cp	a, -2 (ix)
	ld	a, #0xff
	sbc	a, -1 (ix)
	jp	PO, 01797$
	xor	a, #0x80
01797$:
	jp	P, 00448$
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
	jr	NC, 00448$
	ld	a, #0xf4
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	jp	PO, 01798$
	xor	a, #0x80
01798$:
	jp	P, 00448$
	ld	a, c
	sub	a, #0x0c
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00448$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:612: bool isHumanControlled = false;
	ld	-1 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:613: if ((playerTeamId == TEAM_1 && g_Team1ActivePlayer == playerId) || 
	ld	a, -31 (ix)
	dec	a
	jr	NZ, 00442$
	ld	a, (_g_Team1ActivePlayer+0)
	sub	a, -3 (ix)
	jr	Z, 00437$
00442$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:614: (playerTeamId == TEAM_2 && g_GameWith2Players && g_Team2ActivePlayer == playerId)) {
	ld	a, -31 (ix)
	sub	a, #0x02
	jr	NZ, 00438$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00438$
	ld	a, (_g_Team2ActivePlayer+0)
	sub	a, -3 (ix)
	jr	NZ, 00438$
00437$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:615: isHumanControlled = true;
	ld	-1 (ix), #0x01
00438$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:618: if (!isHumanControlled) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00448$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:621: if ((g_FrameCounter % 4) == 0) {
	ld	hl, (_g_FrameCounter)
	ld	a, l
	and	a, #0x03
	jr	NZ, 00448$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:622: PutBallOnPlayerFeet(playerId);
	ld	a, -3 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:623: return;
	jp	00548$
00448$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:630: i16 targetX = g_Ball.X;
	ld	c, -5 (ix)
	ld	b, -4 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:631: i16 targetY = g_Ball.Y;
	ld	-2 (ix), e
	ld	-1 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:633: if (g_Ball.KickMoveState != 0) {
	ld	a, (#_g_Ball + 13)
	or	a, a
	jp	Z, 00462$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:635: switch(g_Ball.Direction) {
	ld	hl, #_g_Ball + 5
	ld	e, (hl)
	ld	a, #0x08
	sub	a, e
	jp	C, 00462$
	ld	d, #0x00
	ld	hl, #01808$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
01808$:
	jp	00462$
	jp	00452$
	jp	00456$
	jp	00455$
	jp	00458$
	jp	00453$
	jp	00459$
	jp	00454$
	jp	00457$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:636: case DIRECTION_UP: targetY -= 16; break;
00452$:
	ld	a, -2 (ix)
	ld	d, -1 (ix)
	add	a, #0xf0
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	-2 (ix), e
	ld	-1 (ix), a
	jp	00462$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:637: case DIRECTION_DOWN: targetY += 16; break;
00453$:
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #0x0010
	add	hl, de
	ld	-2 (ix), l
	ld	-1 (ix), h
	jp	00462$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:638: case DIRECTION_LEFT: targetX -= 16; break;
00454$:
	ld	a, c
	add	a, #0xf0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	jp	00462$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:639: case DIRECTION_RIGHT: targetX += 16; break;
00455$:
	ld	hl, #0x0010
	add	hl, bc
	ld	c, l
	ld	b, h
	jp	00462$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:640: case DIRECTION_UP_RIGHT: targetY -= 12; targetX += 12; break;
00456$:
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
	jp	00462$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:641: case DIRECTION_UP_LEFT: targetY -= 12; targetX -= 12; break;
00457$:
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
	jp	00462$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:642: case DIRECTION_DOWN_RIGHT: targetY += 12; targetX += 12; break;
00458$:
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
	jp	00462$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:643: case DIRECTION_DOWN_LEFT: targetY += 12; targetX -= 12; break;
00459$:
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:644: }
00462$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:646: g_Players[playerId].TargetX = targetX;
	pop	hl
	push	hl
	ld	de, #0x000c
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:647: g_Players[playerId].TargetY = targetY;
	pop	hl
	push	hl
	ld	de, #0x000a
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
	jp	00548$
00537$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:652: u16 defGoalY = (playerTeamId == TEAM_1) ? FIELD_BOUND_Y_BOTTOM : FIELD_BOUND_Y_TOP;
	ld	a, -31 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 01810$
	xor	a, a
01810$:
	ld	-4 (ix), a
	or	a, a
	jr	Z, 00581$
	ld	de, #0x01ae
	jp	00582$
00581$:
	ld	de, #0x0032
00582$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:653: bool chaserBeaten = false;
	ld	-2 (ix), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:654: bool opponentHasBall = (g_Ball.PossessionPlayerId != NO_VALUE && g_Players[g_Ball.PossessionPlayerId].TeamId != playerTeamId);
	ld	a, (#_g_Ball + 6)
	cp	a, #0xff
	jr	Z, 00583$
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
	ld	a,-31 (ix)
	sub	a,(hl)
	jr	NZ, 00584$
00583$:
	ld	c, #0x00
	jp	00585$
00584$:
	ld	c, #0x01
00585$:
	ld	-1 (ix), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:656: if (opponentHasBall && playerClosesestToBallId != NO_VALUE) {
	ld	a, c
	or	a, a
	jr	Z, 00474$
	inc	b
	jr	Z, 00474$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:657: u16 chaserY = g_Players[playerClosesestToBallId].Y;
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:658: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, (#_g_Ball + 0)
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00471$
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC, 00474$
	ld	-2 (ix), #0x01
	jp	00474$
00471$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:659: else { if (g_Ball.Y < chaserY) chaserBeaten = true; }
	xor	a, a
	sbc	hl, bc
	jr	NC, 00474$
	ld	-2 (ix), #0x01
00474$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:429: g_Players[playerId].TargetY = finalTargetY;
	ld	a, -33 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:430: g_Players[playerId].TargetX = finalTargetX;
	ld	a, -33 (ix)
	add	a, #0x0c
	ld	-6 (ix), a
	ld	a, -32 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:663: g_Players[playerId].TargetX = g_Ball.X;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:662: if (opponentHasBall && chaserBeaten) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00514$
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00514$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:663: g_Players[playerId].TargetX = g_Ball.X;
	ld	de, (#(_g_Ball + 2) + 0)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:658: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:664: if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = g_Ball.Y + 15;
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00477$
	ld	de, #0x000f
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jp	00804$
00477$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:665: else g_Players[playerId].TargetY = g_Ball.Y - 15;
	ld	de, #0xfff1
	add	hl, de
	ex	de,hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jp	00804$
00514$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:541: if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:669: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = FIELD_POS_Y_CENTER - 40;
	ld	-2 (ix), a
	sub	a, #0x05
	ld	a, #0x00
	rla
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:668: if (playerTeamId == TEAM_1) { // Defend Bottom (High Y)
	ld	a, -4 (ix)
	or	a, a
	jp	Z, 00504$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:669: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = FIELD_POS_Y_CENTER - 40;
	bit	0, -1 (ix)
	jr	NZ, 00483$
	ld	l, c
	ld	h, b
	ld	(hl), #0xcb
	inc	hl
	ld	(hl), #0x00
	jp	00484$
00483$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:658: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:670: else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetY = (g_Ball.Y + defGoalY) / 2 - 50; 
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	C, 00480$
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
	jp	00484$
00480$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:671: else g_Players[playerId].TargetY = g_Ball.Y + 40; 
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
00484$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:673: if (g_Players[playerId].Role <= PLAYER_ROLE_RIGHT_DEFENDER && g_Players[playerId].TargetY < 300) 
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	e, (hl)
	ld	a, #0x02
	sub	a, e
	jr	C, 00486$
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, #0x2c
	ld	a, d
	sbc	a, #0x01
	jr	NC, 00486$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:674: g_Players[playerId].TargetY = 300;
	ld	l, c
	ld	h, b
	ld	(hl), #0x2c
	inc	hl
	ld	(hl), #0x01
00486$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:677: if (g_Players[playerId].TargetY > 380 && g_Ball.Y < 380) {
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0x7c
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jp	NC, 00505$
	ld	hl, (#_g_Ball + 0)
	ld	de, #0x017c
	cp	a, a
	sbc	hl, de
	jp	NC, 00505$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:678: g_Players[playerId].TargetY = 380;
	ld	a, #0x7c
	ld	(bc), a
	inc	bc
	ld	a, #0x01
	ld	(bc), a
	jp	00505$
00504$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:682: if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = FIELD_POS_Y_CENTER + 40;
	bit	0, -1 (ix)
	jr	NZ, 00495$
	ld	l, c
	ld	h, b
	ld	(hl), #0x1b
	inc	hl
	ld	(hl), #0x01
	jp	00496$
00495$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:658: if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:683: else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetY = (g_Ball.Y + defGoalY) / 2 + 50;
	ld	a, -2 (ix)
	sub	a, #0x03
	jr	C, 00492$
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
	jp	00496$
00492$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:684: else g_Players[playerId].TargetY = g_Ball.Y - 40;
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
00496$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:686: if (g_Players[playerId].Role <= PLAYER_ROLE_RIGHT_DEFENDER && g_Players[playerId].TargetY > 180) 
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	e, (hl)
	ld	a, #0x02
	sub	a, e
	jr	C, 00498$
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0xb4
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00498$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:687: g_Players[playerId].TargetY = 180;
	ld	l, c
	ld	h, b
	ld	(hl), #0xb4
	inc	hl
	ld	(hl), #0x00
00498$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:690: if (g_Players[playerId].TargetY < 100 && g_Ball.Y > 100) {
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, #0x64
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00505$
	ld	hl, (#_g_Ball + 0)
	ld	a, #0x64
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00505$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:691: g_Players[playerId].TargetY = 100;
	ld	a, #0x64
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
00505$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:695: if (g_Players[playerId].Role % 2 != 0) g_Players[playerId].TargetX = g_Ball.X - 40; 
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	a, (hl)
	and	a, #0x01
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:663: g_Players[playerId].TargetX = g_Ball.X;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:695: if (g_Players[playerId].Role % 2 != 0) g_Players[playerId].TargetX = g_Ball.X - 40; 
	xor	a, a
	ld	de, (#(_g_Ball + 2) + 0)
	or	a, c
	jr	Z, 00507$
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
	jp	00508$
00507$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:696: else g_Players[playerId].TargetX = g_Ball.X + 40; 
	ld	hl, #0x0028
	add	hl, de
	ex	de, hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00508$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:698: if (g_Players[playerId].TargetX < FIELD_BOUND_X_LEFT + 20) g_Players[playerId].TargetX = FIELD_BOUND_X_LEFT + 20;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x1e
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00510$
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), #0x1e
	inc	hl
	ld	(hl), #0x00
00510$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:699: if (g_Players[playerId].TargetX > FIELD_BOUND_X_RIGHT - 20) g_Players[playerId].TargetX = FIELD_BOUND_X_RIGHT - 20;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0xe2
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00804$
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), #0xe2
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:703: for(u8 i=0; i<14; i++) {
00804$:
	ld	-1 (ix), #0x00
00547$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00548$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:704: if (i == playerId) continue;
	ld	a, -1 (ix)
	sub	a, -3 (ix)
	jp	Z,00534$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:705: if (g_Players[i].TeamId != playerTeamId) continue;
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
	ld	a,-31 (ix)
	sub	a,(hl)
	jp	NZ,00534$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:706: if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	c, e
	ld	b, d
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00534$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:707: i16 dx = (i16)g_Players[playerId].TargetX - (i16)g_Players[i].X;
	ld	a, -33 (ix)
	add	a, #0x0c
	ld	-13 (ix), a
	ld	a, -32 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:708: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	a, -33 (ix)
	add	a, #0x0a
	ld	-11 (ix), a
	ld	a, -32 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:709: if (dx > -60 && dx < 60 && dy > -60 && dy < 60) {
	ld	a, #0xc4
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	jp	PO, 01818$
	xor	a, #0x80
01818$:
	jp	P, 00534$
	ld	a, c
	sub	a, #0x3c
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00534$
	ld	a, #0xc4
	cp	a, e
	ld	a, #0xff
	sbc	a, d
	jp	PO, 01819$
	xor	a, #0x80
01819$:
	jp	P, 00534$
	ld	-9 (ix), e
	ld	-8 (ix), d
	ld	a, -9 (ix)
	sub	a, #0x3c
	ld	a, -8 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00534$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:710: if (dx >= 0) g_Players[playerId].TargetX += 12; else g_Players[playerId].TargetX -= 12;
	ld	a, -5 (ix)
	ld	-7 (ix), a
	ld	a, -4 (ix)
	ld	-6 (ix), a
	bit	7, b
	jr	NZ, 00524$
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
	jp	00525$
00524$:
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
00525$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:708: i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:711: if (dy >= 0) g_Players[playerId].TargetY += 12; else g_Players[playerId].TargetY -= 12;
	bit	7, -8 (ix)
	jr	NZ, 00527$
	ld	hl, #0x000c
	add	hl, bc
	ex	de, hl
	ld	l, -11 (ix)
	ld	h, -10 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00534$
00527$:
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
00534$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:703: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00547$
00548$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:716: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:717: void TickP1(){
;	---------------------------------
; Function TickP1
; ---------------------------------
_TickP1::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:718: TickFieldScrollingAction();
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:719: }
	jp	_TickFieldScrollingAction
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:724: u8 GetPlayerIdByRole(u8 teamId, u8 role){
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:725: u8 playerId=NO_VALUE;
	ld	-3 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:726: for(u8 i=0;i<14;i++){
	ld	-2 (ix), #0x00
	ld	b, #0x00
00106$:
	ld	a, b
	sub	a, #0x0e
	jr	NC, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:727: if(g_Players[i].Role==role && g_Players[i].TeamId==teamId){
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
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x0009
	add	hl, bc
	pop	bc
;	spillPairReg hl
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	NZ, 00107$
	ld	hl, #5
	add	hl, de
	ld	e, (hl)
	ld	a, c
	sub	a, e
	jr	NZ, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:728: playerId=i;
	ld	a, -2 (ix)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:729: break;
	jp	00104$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:726: for(u8 i=0;i<14;i++){
	inc	b
	ld	-2 (ix), b
	jp	00106$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:732: return playerId;
	ld	a, -3 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:733: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:736: void UpdateSpritesPositions(){
;	---------------------------------
; Function UpdateSpritesPositions
; ---------------------------------
_UpdateSpritesPositions::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:737: for (u8 i=0;i<15;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0f
	jp	NC,_PutBallSprite
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:738: PutPlayerSprite(i);
	push	bc
	ld	a, c
	call	_PutPlayerSprite
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:737: for (u8 i=0;i<15;i++){
	inc	c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:740: PutBallSprite();
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:741: }
	jp	00103$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:742: void PutBallSprite(){
;	---------------------------------
; Function PutBallSprite
; ---------------------------------
_PutBallSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-11
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:744: attr.D=0;
	ld	hl, #3
	add	hl, sp
	res	4, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:745: attr.SC=0;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:746: attr.Y = g_Ball.Y-g_FieldCurrentYPosition;
	ld	a, (#_g_Ball + 0)
	ld	-1 (ix), a
	ld	a, (_g_FieldCurrentYPosition+0)
	ld	-2 (ix), a
	ld	a, -1 (ix)
	sub	a, -2 (ix)
	ld	-11 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:749: u8 logicalSize = g_Ball.Size;
	ld	a, (#_g_Ball + 4)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:751: if (g_Ball.PossessionPlayerId != NO_VALUE) logicalSize = 1;
	ld	a, (#_g_Ball + 6)
	inc	a
	jr	Z, 00102$
	ld	-7 (ix), #0x01
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:753: if (logicalSize == 0) logicalSize = 1;
	ld	a, -7 (ix)
	or	a, a
	jr	NZ, 00104$
	ld	-7 (ix), #0x01
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:754: if (logicalSize > 4) logicalSize = 4;
	ld	a, #0x04
	sub	a, -7 (ix)
	jr	NC, 00106$
	ld	-7 (ix), #0x04
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:759: bool rawMovement = (g_Ball.OldX != g_Ball.X || g_Ball.OldY != g_Ball.Y);
	ld	hl, #(_g_Ball + 9)
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	a, -2 (ix)
	sub	a, -6 (ix)
	jr	NZ, 00123$
	ld	a, -1 (ix)
	sub	a, -5 (ix)
	jr	NZ, 00123$
	ld	hl, #(_g_Ball + 11)
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -4 (ix)
	sub	a, -2 (ix)
	jr	NZ, 00123$
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	ld	c, #0x00
	jr	Z, 00124$
00123$:
	ld	c, #0x01
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:762: g_Ball.OldX = g_Ball.X;
	ld	hl, #(_g_Ball + 9)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:763: g_Ball.OldY = g_Ball.Y;
	ld	de, (#_g_Ball + 0)
	ld	((_g_Ball + 11)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:765: if (rawMovement) {
	ld	a, c
	or	a, a
	jr	Z, 00110$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:766: s_StopCooldown = 15; // Keep animation active for ~1/4 sec after last move
	ld	hl, #_PutBallSprite_s_StopCooldown_65538_1264
	ld	(hl), #0x0f
	jp	00111$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:768: if (s_StopCooldown > 0) s_StopCooldown--;
	ld	a, (_PutBallSprite_s_StopCooldown_65538_1264+0)
	or	a, a
	jr	Z, 00111$
	ld	hl, #_PutBallSprite_s_StopCooldown_65538_1264
	dec	(hl)
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:771: bool isAnimating = (s_StopCooldown > 0);
	ld	a, (_PutBallSprite_s_StopCooldown_65538_1264+0)
	or	a, a
	jr	Z, 00125$
	ld	de, #0x0001
	jp	00126$
00125$:
	ld	de, #0x0000
00126$:
	ld	a, e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:775: bool useAlt = isAnimating && ((g_FrameCounter & 8) != 0);
	or	a, a
	jr	Z, 00127$
	ld	hl, (_g_FrameCounter)
	bit	3, l
	jr	NZ, 00128$
00127$:
	ld	c, #0x00
	jp	00129$
00128$:
	ld	c, #0x01
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:779: attr.Pattern = useAlt ? BALL_SIZE_2 : BALL_SIZE_1;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:777: switch (logicalSize){
	ld	a, -7 (ix)
	dec	a
	jr	Z, 00112$
	ld	a, -7 (ix)
	sub	a, #0x02
	jr	Z, 00113$
	ld	a, -7 (ix)
	sub	a, #0x03
	jr	Z, 00114$
	ld	a, -7 (ix)
	sub	a, #0x04
	jr	Z, 00115$
	jp	00116$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:778: case 1:
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:779: attr.Pattern = useAlt ? BALL_SIZE_2 : BALL_SIZE_1;
	ld	a, c
	or	a, a
	jr	Z, 00130$
	ld	bc, #0x003a
	jp	00131$
00130$:
	ld	bc, #0x0039
00131$:
	ld	-10 (ix), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:780: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:781: case 2:
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:782: attr.Pattern = useAlt ? BALL_SIZE_4 : BALL_SIZE_3;
	ld	a, c
	or	a, a
	jr	Z, 00132$
	ld	-2 (ix), #0x3c
	ld	-1 (ix), #0
	jp	00133$
00132$:
	ld	-2 (ix), #0x3b
	ld	-1 (ix), #0
00133$:
	ld	a, -2 (ix)
	ld	-10 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:783: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:784: case 3:
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:785: attr.Pattern = useAlt ? BALL_SIZE_6 : BALL_SIZE_5;
	ld	a, c
	or	a, a
	jr	Z, 00134$
	ld	bc, #0x003e
	jp	00135$
00134$:
	ld	bc, #0x003d
00135$:
	ld	-10 (ix), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:786: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:787: case 4:
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:788: attr.Pattern = useAlt ? BALL_SIZE_8 : BALL_SIZE_7;
	ld	a, c
	or	a, a
	jr	Z, 00136$
	ld	bc, #0x0074
	jp	00137$
00136$:
	ld	bc, #0x003f
00137$:
	ld	-10 (ix), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:789: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:790: default:
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:791: attr.Pattern = BALL_SIZE_1;
	ld	-10 (ix), #0x39
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:792: }
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:794: attr.X = g_Ball.X;
	ld	bc, (#(_g_Ball + 2) + 0)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:795: attr.P = attr.D;
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
	ld	c, a
	ld	a, (hl)
	and	a, #0xdf
	or	a, c
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:796: V9_SetSpriteP1(15, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xfe3c
	ld	hl, #0x0003
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:796: V9_SetSpriteP1(15, &attr);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:797: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:798: void ShowHeaderInfo(){
;	---------------------------------
; Function ShowHeaderInfo
; ---------------------------------
_ShowHeaderInfo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:799: u8 pos1=5;
	ld	-2 (ix), #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:800: u8 pos2=10;
	ld	-1 (ix), #0x0a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:801: if(g_Team1Score>=10){
	ld	a, (_g_Team1Score+0)
	sub	a, #0x0a
	jr	C, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:802: pos1--;
	ld	-2 (ix), #0x04
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:804: if(g_Team2Score>=10){
	ld	a, (_g_Team2Score+0)
	sub	a, #0x0a
	jr	C, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:805: pos2--;
	ld	-1 (ix), #0x09
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:807: switch (g_Team1PaletteId){
	ld	a, #0x05
	ld	iy, #_g_Team1PaletteId
	sub	a, 0 (iy)
	jp	C, 00117$
	ld	c, 0 (iy)
	ld	b, #0x00
	ld	hl, #00181$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00181$:
	jp	00105$
	jp	00109$
	jp	00110$
	jp	00116$
	jp	00114$
	jp	00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:808: case TEAM_AUS:
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:809: if(g_FioBre){
	ld	a, (_g_FioBre+0)
	or	a, a
	jr	Z, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:810: V9_PrintLayerAStringAtPos(0,0,"FIO");
	ld	hl, #___str_0
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_V9_PrintLayerAStringAtPos
	jp	00117$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:813: V9_PrintLayerAStringAtPos(0,0,"AUS");
	ld	hl, #___str_1
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:815: break; 
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:816: case TEAM_BRA:
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:817: V9_PrintLayerAStringAtPos(0,0,"BRA");
	ld	hl, #___str_2
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:818: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:819: case TEAM_ITA:
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:820: if(g_FioBre){
	ld	a, (_g_FioBre+0)
	or	a, a
	jr	Z, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:821: V9_PrintLayerAStringAtPos(0,0,"BRE");
	ld	hl, #___str_3
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_V9_PrintLayerAStringAtPos
	jp	00117$
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:824: V9_PrintLayerAStringAtPos(0,0,"AUS");
	ld	hl, #___str_1
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:826: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:827: case TEAM_GBR:
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:828: V9_PrintLayerAStringAtPos(0,0,"GBR");
	ld	hl, #___str_4
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:829: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:830: case TEAM_GER:
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:831: V9_PrintLayerAStringAtPos(0,0,"GER");
	ld	hl, #___str_5
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:832: break;
	jp	00117$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:833: case TEAM_FRA:
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:834: V9_PrintLayerAStringAtPos(0,0,"FRA");
	ld	hl, #___str_6
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	ld	l, a
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:836: }
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:837: V9_PrintLayerAStringAtPos(pos1,0,GetNumberString(g_Team1Score));
	ld	a, (_g_Team1Score+0)
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
	ld	a, -2 (ix)
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:838: V9_PrintLayerAStringAtPos(7,0,"-");
	ld	hl, #___str_7
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x07
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:839: V9_PrintLayerAStringAtPos(pos2,0,GetNumberString(g_Team2Score));
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:840: switch (g_Team2PaletteId){
	ld	a, #0x05
	ld	iy, #_g_Team2PaletteId
	sub	a, 0 (iy)
	jp	C, 00130$
	ld	c, 0 (iy)
	ld	b, #0x00
	ld	hl, #00182$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00182$:
	jp	00118$
	jp	00122$
	jp	00123$
	jp	00129$
	jp	00127$
	jp	00128$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:841: case TEAM_AUS:
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:842: if(g_FioBre){
	ld	a, (_g_FioBre+0)
	or	a, a
	jr	Z, 00120$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:843: V9_PrintLayerAStringAtPos(12,0,"FIO");
	ld	hl, #___str_0
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
	jp	00130$
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:846: V9_PrintLayerAStringAtPos(12,0,"AUS");
	ld	hl, #___str_1
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:848: break; 
	jp	00130$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:849: case TEAM_BRA:
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:850: V9_PrintLayerAStringAtPos(12,0,"BRA");
	ld	hl, #___str_2
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:851: break;
	jp	00130$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:852: case TEAM_ITA:
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:853: if(g_FioBre){
	ld	a, (_g_FioBre+0)
	or	a, a
	jr	Z, 00125$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:854: V9_PrintLayerAStringAtPos(12,0,"BRE");
	ld	hl, #___str_3
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
	jp	00130$
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:857: V9_PrintLayerAStringAtPos(12,0,"AUS");
	ld	hl, #___str_1
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:859: break;
	jp	00130$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:860: case TEAM_GBR:
00127$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:861: V9_PrintLayerAStringAtPos(12,0,"GBR");
	ld	hl, #___str_4
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:862: break;
	jp	00130$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:863: case TEAM_GER:
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:864: V9_PrintLayerAStringAtPos(12,0,"GER");
	ld	hl, #___str_5
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:865: break;
	jp	00130$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:866: case TEAM_FRA:
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:867: V9_PrintLayerAStringAtPos(12,0,"FRA");
	ld	hl, #___str_6
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:869: }
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:870: u8 minutes=g_SecondsToEndOfMatch / 60;
	ld	a, (_g_SecondsToEndOfMatch+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x003c
	call	__divsint
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:871: u8 seconds=g_SecondsToEndOfMatch - minutes*60;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:872: V9_PrintLayerAStringAtPos(28,0,GetNumberString(minutes));
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
	ld	hl, #___str_8
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x1d
	call	_V9_PrintLayerAStringAtPos
	pop	bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:875: V9_PrintLayerAStringAtPos(30,0,GetNumberString(seconds));
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:874: if(seconds>=10){
	ld	a, c
	sub	a, #0x0a
	jr	C, 00132$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:875: V9_PrintLayerAStringAtPos(30,0,GetNumberString(seconds));
	call	_GetNumberString
	push	de
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x1e
	call	_V9_PrintLayerAStringAtPos
	jp	00134$
00132$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:878: V9_PrintLayerAStringAtPos(30,0,"0");
	ld	bc, #___str_9+0
	push	hl
	push	bc
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x1e
	call	_V9_PrintLayerAStringAtPos
	pop	hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:879: V9_PrintLayerAStringAtPos(31,0,GetNumberString(seconds));
	call	_GetNumberString
	push	de
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x1f
	call	_V9_PrintLayerAStringAtPos
00134$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:881: }
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "FIO"
	.db 0x00
___str_1:
	.ascii "AUS"
	.db 0x00
___str_2:
	.ascii "BRA"
	.db 0x00
___str_3:
	.ascii "BRE"
	.db 0x00
___str_4:
	.ascii "GBR"
	.db 0x00
___str_5:
	.ascii "GER"
	.db 0x00
___str_6:
	.ascii "FRA"
	.db 0x00
___str_7:
	.ascii "-"
	.db 0x00
___str_8:
	.ascii ":"
	.db 0x00
___str_9:
	.ascii "0"
	.db 0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:884: void V9_PutLayerATileAtPos(u8 x, u8 y, u16 tileId) {
;	---------------------------------
; Function V9_PutLayerATileAtPos
; ---------------------------------
_V9_PutLayerATileAtPos::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:885: V9_Poke16(V9_CellAddrP1A(x,y), tileId);
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:885: V9_Poke16(V9_CellAddrP1A(x,y), tileId);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:886: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:887: void V9_PutLayerBTileAtPos(u8 x, u8 y, u16 tileId) {
;	---------------------------------
; Function V9_PutLayerBTileAtPos
; ---------------------------------
_V9_PutLayerBTileAtPos::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:888: V9_Poke16(V9_CellAddrP1B(x,y), tileId);
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:888: V9_Poke16(V9_CellAddrP1B(x,y), tileId);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:889: }
	pop	ix
	pop	hl
	pop	af
	jp	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:890: void PutPlayerSprite(u8 playerId){
;	---------------------------------
; Function PutPlayerSprite
; ---------------------------------
_PutPlayerSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:892: attr.D=0;
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #3
	add	hl, sp
	res	4, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:893: attr.SC=2;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	or	a, #0x80
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:894: u16 minY=g_FieldCurrentYPosition+16;
	ld	a, (_g_FieldCurrentYPosition+0)
	add	a, #0x10
	ld	-2 (ix), a
	ld	a, (_g_FieldCurrentYPosition+1)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:895: u16 maxY=g_FieldCurrentYPosition+235;
	ld	a, (_g_FieldCurrentYPosition+0)
	add	a, #0xeb
	ld	-2 (ix), a
	ld	a, (_g_FieldCurrentYPosition+1)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -1 (ix)
	ld	-5 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:897: attr.Y = g_Players[playerId].Y-g_FieldCurrentYPosition;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a, #<(_g_Players)
	add	a, l
	ld	-4 (ix), a
	ld	a, #>(_g_Players)
	adc	a, h
	ld	-3 (ix), a
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	l, (hl)
;	spillPairReg hl
	ld	a, (_g_FieldCurrentYPosition+0)
	ld	b, a
	ld	a, l
	sub	a, b
	ld	(de), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:898: if(g_Players[playerId].TeamId==TEAM_2){
	ld	a, -4 (ix)
	add	a, #0x05
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:899: attr.SC=3;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	or	a, #0xc0
	ld	(hl), a
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:901: if(g_Players[playerId].Role==PLAYER_ROLE_GOALKEEPER){
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x0009
	add	hl, bc
	pop	bc
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:902: attr.SC=0;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	ld	(hl), a
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:904: if(g_Players[playerId].TeamId==REFEREE){
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	sub	a, #0x0e
	jr	NZ, 00106$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:905: attr.SC=1;
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	and	a, #0x3f
	or	a, #0x40
	ld	(hl), a
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:908: if(g_Players[playerId].Y>maxY){
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	b, (hl)
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	a, -6 (ix)
	sub	a, b
	ld	a, -5 (ix)
	sbc	a, l
	jr	NC, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:909: attr.D=1;
	ld	hl, #3
	add	hl, sp
	set	4, (hl)
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:911: if(g_Players[playerId].Y<minY){
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	b, (hl)
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	a, b
	sub	a, -8 (ix)
	ld	a, l
	sbc	a, -7 (ix)
	jr	NC, 00110$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:912: attr.D=1;
	ld	hl, #3
	add	hl, sp
	set	4, (hl)
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:914: if(g_MatchStatus!=MATCH_NOT_STARTED && g_MatchStatus!=MATCH_KICK_OFF){
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jr	Z, 00112$
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x07
	jr	Z, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:915: UpdatePlayerPatternByDirection(playerId);
	push	bc
	push	de
	ld	a, c
	call	_UpdatePlayerPatternByDirection
	pop	de
	pop	bc
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:917: attr.Pattern = g_Players[playerId].PatternId;
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:920: if(g_Players[playerId].TeamId != REFEREE)
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	b, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:922: bool isHumanTeam = (g_Players[playerId].TeamId == TEAM_1) || (g_GameWith2Players && g_Players[playerId].TeamId == TEAM_2);
	ld	a,b
	cp	a,#0x0e
	jr	Z, 00123$
	dec	a
	jr	Z, 00129$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00128$
	ld	a, b
	sub	a, #0x02
	jr	Z, 00129$
00128$:
	xor	a, a
	jp	00130$
00129$:
	ld	a, #0x01
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:924: if (isHumanTeam) {
	or	a, a
	jr	Z, 00123$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:925: if (playerId==g_Team1ActivePlayer || (g_GameWith2Players && playerId==g_Team2ActivePlayer)) {
	ld	a, (_g_Team1ActivePlayer+0)
	sub	a, c
	jr	Z, 00114$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00115$
	ld	a, (_g_Team2ActivePlayer+0)
	sub	a, c
	jr	NZ, 00115$
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:927: attr.Pattern=attr.Pattern+64;
	ld	a, -11 (ix)
	add	a, #0x40
	ld	-11 (ix), a
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:931: if (playerId == g_PassTargetPlayer) {
	ld	a, (_g_PassTargetPlayer+0)
	sub	a, c
	jr	NZ, 00123$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:932: attr.Pattern=attr.Pattern+64;
	ld	a, -11 (ix)
	add	a, #0x40
	ld	-11 (ix), a
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:938: attr.X = g_Players[playerId].X;
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	hl, #2
	add	hl, sp
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	and	a, #0x03
	push	bc
	ld	c,a
	ld	a, (hl)
	and	a, #0xfc
	or	a, c
	pop	bc
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:939: attr.P = 1;
	ld	hl, #3
	add	hl, sp
	set	5, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:941: V9_SetSpriteP1(playerId, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
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
	jr	NC, 00217$
	inc	d
00217$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ex	de, hl
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:941: V9_SetSpriteP1(playerId, &attr);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:943: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:946: void ResetPlayersInfo(){
;	---------------------------------
; Function ResetPlayersInfo
; ---------------------------------
_ResetPlayersInfo::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:947: SetPlayerBallPossession(NO_VALUE);
	ld	a, #0xff
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:948: for(u8 i=0;i<14;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x0e
	jr	NC, 00105$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:949: g_Players[i].Direction=DIRECTION_NONE;
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
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:950: g_Players[i].PreviousDirection=g_Players[i].Direction;
	ld	a, e
	add	a, #0x07
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:951: g_Players[i].LastPose=0;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:952: g_Players[i].Status=PLAYER_STATUS_NONE;
	ld	hl, #0x000e
	add	hl, de
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	dec	hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:953: g_Players[i].Status=PLAYER_STATUS_NONE;
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:948: for(u8 i=0;i<14;i++){
	inc	c
	jp	00103$
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:955: }
	inc	sp
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:956: void ClearTextFromLayerA(u8 x, u8 y, u8 length){
;	---------------------------------
; Function ClearTextFromLayerA
; ---------------------------------
_ClearTextFromLayerA::
	ld	c, a
	ld	b, l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:957: for(u8 i=0;i<length;i++){
	ld	e, #0x00
00103$:
	ld	hl, #2
	add	hl, sp
	ld	a, e
	sub	a, (hl)
	jr	NC, 00105$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:958: V9_PutLayerATileAtPos(x,y,0);
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:959: x++;
	inc	c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:957: for(u8 i=0;i<length;i++){
	inc	e
	jp	00103$
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:961: }
	pop	hl
	inc	sp
	jp	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:962: void TickPlayerToOwnTarget(){
;	---------------------------------
; Function TickPlayerToOwnTarget
; ---------------------------------
_TickPlayerToOwnTarget::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-11
	add	hl, sp
	ld	sp, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:964: if(g_MatchStatus!=MATCH_NOT_STARTED){
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jp	Z, 00208$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:965: bool allPlayersInPosition = true;
	ld	-11 (ix), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:967: for(u8 i=0;i<15;i++){
	ld	-1 (ix), #0x00
00207$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	NC, 00199$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:970: if(i != REFEREE) continue;
	ld	a, -1 (ix)
	sub	a, #0x0e
	ld	a, #0x01
	jr	Z, 00485$
	xor	a, a
00485$:
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:969: if(g_MatchStatus == MATCH_AFTER_IN_GOAL) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x06
	jr	NZ, 00104$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:970: if(i != REFEREE) continue;
	bit	0, -2 (ix)
	jp	Z, 00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:972: g_Players[i].TargetX=FIELD_POS_X_CENTER - 30; 
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
	ld	hl, #0x000c
	add	hl, de
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:973: g_Players[i].TargetY=FIELD_POS_Y_CENTER - 40; 
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0xcb
	inc	hl
	ld	(hl), #0x00
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:976: if (i == REFEREE && (g_MatchStatus == MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER)) continue;
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00106$
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jp	Z,00198$
	sub	a, #0x0d
	jp	Z,00198$
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:979: if (g_Team1ActivePlayer != NO_VALUE && i == g_Team1ActivePlayer) continue;
	ld	a, (_g_Team1ActivePlayer+0)
	inc	a
	jr	Z, 00110$
	ld	a, -1 (ix)
	ld	hl, #_g_Team1ActivePlayer
	sub	a, (hl)
	jp	Z,00198$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:980: if (g_GameWith2Players && g_Team2ActivePlayer != NO_VALUE && i == g_Team2ActivePlayer) continue;
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00113$
	ld	a, (_g_Team2ActivePlayer+0)
	inc	a
	jr	Z, 00113$
	ld	a, -1 (ix)
	ld	hl, #_g_Team2ActivePlayer
	sub	a, (hl)
	jp	Z,00198$
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:981: if (g_GameWith2Players && i == g_Team2ActivePlayer) {
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00117$
	ld	a, -1 (ix)
	ld	hl, #_g_Team2ActivePlayer
	sub	a, (hl)
	jp	Z,00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:982: continue;
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:986: bool playerInPosition = (g_Players[i].X == g_Players[i].TargetX && g_Players[i].Y == g_Players[i].TargetY);
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
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	-5 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-4 (ix), a
	dec	bc
	ld	hl, #0x000c
	add	hl, de
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, -5 (ix)
	jr	NZ, 00210$
	ld	a, h
	sub	a, -4 (ix)
	jr	NZ, 00210$
	ld	a, (de)
	ld	-5 (ix), a
	inc	de
	ld	a, (de)
	ld	-4 (ix), a
	dec	de
	push	de
	pop	iy
;	spillPairReg hl
;	spillPairReg hl
	ld	a, 10 (iy)
	ld	h, 11 (iy)
	sub	a, -5 (ix)
	jr	NZ, 00497$
	ld	a, h
	sub	a, -4 (ix)
	jr	Z, 00211$
00497$:
00210$:
	xor	a, a
	jp	00212$
00211$:
	ld	a, #0x01
00212$:
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:989: if (g_MatchStatus == MATCH_BEFORE_KICK_OFF && !playerInPosition) {
	ld	a, (_g_MatchStatus+0)
	dec	a
	jr	NZ, 00120$
	ld	a, -4 (ix)
	or	a, a
	jr	NZ, 00120$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:990: allPlayersInPosition = false;
	ld	-11 (ix), #0x00
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:995: if(g_Players[i].AiTickCounter<AI_TICK_SPEED){
	ld	hl, #0x0010
	add	hl, de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:993: if(g_MatchStatus==MATCH_IN_ACTION){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jr	NZ, 00125$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:995: if(g_Players[i].AiTickCounter<AI_TICK_SPEED){
	ld	a, (hl)
	cp	a, #0x01
	jr	NC, 00125$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:996: g_Players[i].AiTickCounter++;
	inc	a
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:997: continue;
	jp	00198$
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1001: g_Players[i].AiTickCounter=0;
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1003: if(!playerInPosition){
	ld	a, -4 (ix)
	or	a, a
	jp	NZ, 00196$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1004: g_Players[i].Status=PLAYER_STATUS_NONE;
	ld	hl, #0x000e
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:986: bool playerInPosition = (g_Players[i].X == g_Players[i].TargetX && g_Players[i].Y == g_Players[i].TargetY);
	ld	a, (bc)
	ld	-10 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-9 (ix), a
	dec	bc
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	ld	a, (de)
	ld	-6 (ix), a
	inc	de
	ld	a, (de)
	ld	-5 (ix), a
	dec	de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1005: if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
	ld	a, -10 (ix)
	sub	a, -8 (ix)
	ld	a, -9 (ix)
	sbc	a, -7 (ix)
	ld	a, #0x00
	rla
	ld	-4 (ix), a
	or	a, a
	jr	Z, 00154$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, -6 (ix)
	ld	a, h
	sbc	a, -5 (ix)
	jr	NC, 00154$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1006: g_Players[i].Direction=DIRECTION_UP_RIGHT;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1007: g_Players[i].X++;
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	l, c
	ld	h, b
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1008: g_Players[i].Y--;
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	add	a, #0xff
	ld	-3 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-2 (ix), a
	ld	l, e
	ld	h, d
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00155$
00154$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1010: else if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
	ld	a, -8 (ix)
	sub	a, -10 (ix)
	ld	a, -7 (ix)
	sbc	a, -9 (ix)
	ld	a, #0x00
	rla
	ld	-3 (ix), a
	or	a, a
	jr	Z, 00150$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, -6 (ix)
	ld	a, h
	sbc	a, -5 (ix)
	jr	NC, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1011: g_Players[i].Direction=DIRECTION_UP_LEFT;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x08
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1012: g_Players[i].X--;
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	add	a, #0xff
	ld	-3 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-2 (ix), a
	ld	l, c
	ld	h, b
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1013: g_Players[i].Y--;
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	add	a, #0xff
	ld	-3 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-2 (ix), a
	ld	l, e
	ld	h, d
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00155$
00150$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1015: else if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00146$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -6 (ix)
	sub	a, l
	ld	a, -5 (ix)
	sbc	a, h
	jr	NC, 00146$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1016: g_Players[i].Direction=DIRECTION_DOWN_LEFT;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x06
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1017: g_Players[i].X--;
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	add	a, #0xff
	ld	-3 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-2 (ix), a
	ld	l, c
	ld	h, b
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1018: g_Players[i].Y++;
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	l, e
	ld	h, d
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00155$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1020: else if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00142$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -6 (ix)
	sub	a, l
	ld	a, -5 (ix)
	sbc	a, h
	jr	NC, 00142$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1021: g_Players[i].Direction=DIRECTION_DOWN_RIGHT;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1022: g_Players[i].X++;
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	l, c
	ld	h, b
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1023: g_Players[i].Y++;
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	l, e
	ld	h, d
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00155$
00142$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1025: else if(g_Players[i].X==g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
	ld	a, -10 (ix)
	sub	a, -8 (ix)
	jr	NZ, 00502$
	ld	a, -9 (ix)
	sub	a, -7 (ix)
	ld	a, #0x01
	jr	Z, 00503$
00502$:
	xor	a, a
00503$:
	ld	-2 (ix), a
	or	a, a
	jr	Z, 00138$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, -6 (ix)
	ld	a, h
	sbc	a, -5 (ix)
	jr	NC, 00138$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1026: g_Players[i].Direction=DIRECTION_UP;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1027: g_Players[i].Y--;
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	add	a, #0xff
	ld	-3 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-2 (ix), a
	ld	l, e
	ld	h, d
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00155$
00138$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1029: else if(g_Players[i].X==g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00134$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -6 (ix)
	sub	a, l
	ld	a, -5 (ix)
	sbc	a, h
	jr	NC, 00134$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1030: g_Players[i].Direction=DIRECTION_DOWN;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1031: g_Players[i].Y++;
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	l, e
	ld	h, d
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00155$
00134$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1033: else if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y==g_Players[i].TargetY){
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00130$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, -6 (ix)
	jr	NZ, 00130$
	ld	a, h
	sub	a, -5 (ix)
	jr	NZ, 00130$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1034: g_Players[i].Direction=DIRECTION_RIGHT;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1035: g_Players[i].X++;
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	l, c
	ld	h, b
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00155$
00130$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1037: else if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y==g_Players[i].TargetY){
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00155$
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, -6 (ix)
	jr	NZ, 00155$
	ld	a, h
	sub	a, -5 (ix)
	jr	NZ, 00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1038: g_Players[i].Direction=DIRECTION_LEFT;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x07
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1039: g_Players[i].X--;
	ld	l, c
	ld	h, b
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	add	a, #0xff
	ld	-3 (ix), a
	ld	a, h
	adc	a, #0xff
	ld	-2 (ix), a
	ld	l, c
	ld	h, b
	ld	a, -3 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -2 (ix)
	ld	(hl), a
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1043: if(g_Players[i].Y < FIELD_BOUND_Y_TOP) g_Players[i].Y = FIELD_BOUND_Y_TOP;
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	sub	a, #0x32
	ld	a, h
	sbc	a, #0x00
	jr	NC, 00158$
	ld	l, e
	ld	h, d
	ld	(hl), #0x32
	inc	hl
	ld	(hl), #0x00
00158$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1044: if(g_Players[i].Y > FIELD_BOUND_Y_BOTTOM) g_Players[i].Y = FIELD_BOUND_Y_BOTTOM;
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0xae
	cp	a, l
	ld	a, #0x01
	sbc	a, h
	jr	NC, 00160$
	ld	a, #0xae
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
00160$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1045: if(g_Players[i].X < FIELD_BOUND_X_LEFT) g_Players[i].X = FIELD_BOUND_X_LEFT;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, #0x0a
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00162$
	ld	l, c
	ld	h, b
	ld	(hl), #0x0a
	inc	hl
	ld	(hl), #0x00
00162$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1046: if(g_Players[i].X > FIELD_BOUND_X_RIGHT) g_Players[i].X = FIELD_BOUND_X_RIGHT;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, #0xf6
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00164$
	ld	a, #0xf6
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
00164$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1048: if (g_MatchStatus == MATCH_IN_ACTION) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jp	NZ,00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1049: if (g_Ball.PossessionPlayerId == i) {
	ld	hl, #_g_Ball + 6
	ld	a,-1 (ix)
	sub	a,(hl)
	jp	NZ,00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1050: if (g_Ball.KickMoveState == NO_VALUE) g_Ball.KickMoveState = 0;
	ld	hl, #_g_Ball + 13
	ld	a, (hl)
	inc	a
	jr	NZ, 00166$
	ld	(hl),a
00166$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1051: g_Ball.KickMoveState++;
	inc	(hl)
	ld	c, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1052: if (g_Ball.KickMoveState > 3) g_Ball.KickMoveState = 0;
	ld	a, #0x03
	sub	a, c
	jr	NC, 00168$
	ld	(hl), #0x00
00168$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1053: PutBallOnPlayerFeet(i);
	ld	a, -1 (ix)
	call	_PutBallOnPlayerFeet
	jp	00198$
00196$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1059: if(g_MatchStatus==MATCH_IN_ACTION){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jr	NZ, 00174$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1060: g_Players[i].Status=PLAYER_STATUS_POSITIONED;
	ld	hl, #0x000e
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00174$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1063: if (g_Players[i].TeamId == REFEREE) {
	ld	hl, #0x0005
	add	hl, de
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	a, (hl)
	sub	a, #0x0e
	jr	NZ, 00179$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1064: if(g_MatchStatus == MATCH_BEFORE_KICK_OFF || g_MatchStatus == MATCH_AFTER_IN_GOAL) {
	ld	a, (_g_MatchStatus+0)
	dec	a
	jr	Z, 00175$
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x06
	jr	NZ, 00179$
00175$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1065: g_Players[i].Direction = DIRECTION_DOWN;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1066: g_Players[i].PatternId = PLAYER_POSE_FRONT;
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x10
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1067: g_Players[i].Status = PLAYER_STATUS_POSITIONED;
	ld	hl, #0x000e
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1068: PutPlayerSprite(i);
	push	de
	ld	a, -1 (ix)
	call	_PutPlayerSprite
	pop	de
00179$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1075: if(g_MatchStatus==MATCH_BEFORE_KICK_OFF){
	ld	a, (_g_MatchStatus+0)
	dec	a
	jp	NZ,00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1077: if(g_Players[i].TeamId!=REFEREE && g_Players[i].PatternId!=PLAYER_POSE_BACK && g_Players[i].PatternId!=PLAYER_POSE_FRONT){
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
	sub	a, #0x0e
	jr	Z, 00198$
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	cp	a, #0x11
	jr	Z, 00198$
	sub	a, #0x10
	jr	Z, 00198$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1078: g_Players[i].Status=PLAYER_STATUS_POSITIONED;
	ld	hl, #0x000e
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1006: g_Players[i].Direction=DIRECTION_UP_RIGHT;
	ld	hl, #0x0006
	add	hl, de
	ld	-3 (ix), l
	ld	-2 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1063: if (g_Players[i].TeamId == REFEREE) {
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1081: if(g_Players[i].TeamId==TEAM_1){
	dec	a
	ld	a, #0x01
	jr	Z, 00527$
	xor	a, a
00527$:
	ld	e, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1080: if (i != g_GoalScorerId) {
	ld	a, -1 (ix)
	ld	hl, #_g_GoalScorerId
	sub	a, (hl)
	jr	Z, 00187$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1081: if(g_Players[i].TeamId==TEAM_1){
	ld	a, e
	or	a, a
	jr	Z, 00181$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1082: g_Players[i].PatternId=PLAYER_POSE_BACK;
	ld	a, #0x11
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1083: g_Players[i].Direction=DIRECTION_UP;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x01
	jp	00188$
00181$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1086: g_Players[i].PatternId=PLAYER_POSE_FRONT;
	ld	a, #0x10
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1087: g_Players[i].Direction=DIRECTION_DOWN;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x05
	jp	00188$
00187$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1093: if(g_Players[i].TeamId==TEAM_1) g_Players[i].Direction=DIRECTION_UP;
	ld	a, e
	or	a, a
	jr	Z, 00184$
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x01
	jp	00188$
00184$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1094: else g_Players[i].Direction=DIRECTION_DOWN;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x05
00188$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1096: PutPlayerSprite(i);
	ld	a, -1 (ix)
	call	_PutPlayerSprite
00198$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:967: for(u8 i=0;i<15;i++){
	inc	-1 (ix)
	jp	00207$
00199$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1103: if(g_MatchStatus==MATCH_BEFORE_KICK_OFF && allPlayersInPosition && g_FieldScrollingActionInProgress==NO_VALUE){
	ld	a, (_g_MatchStatus+0)
	dec	a
	jr	NZ, 00208$
	ld	a, -11 (ix)
	or	a, a
	jr	Z, 00208$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00208$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1104: g_FieldScrollSpeed=FIELD_SCROLL_GAME_SPEED;
	ld	hl, #_g_FieldScrollSpeed
	ld	(hl), #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1105: g_MatchStatus=MATCH_KICK_OFF;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x07
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1106: g_Timer=0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1107: g_GoalScorerId = NO_VALUE; // Reset scorer
	ld	hl, #_g_GoalScorerId
	ld	(hl), #0xff
00208$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1111: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1114: char *GetNumberString(u16 value)
;	---------------------------------
; Function GetNumberString
; ---------------------------------
_GetNumberString::
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1118: if (value < 10) {
	ld	c, e
	ld	b, d
	ld	a, c
	sub	a, #0x0a
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1119: str[0] = '0' + value;
	ld	bc, #_GetNumberString_str_65536_1366+0
	ld	a, e
	add	a, #0x30
	ld	(bc), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1120: str[1] = '\0';
	inc	bc
	xor	a, a
	ld	(bc), a
	jp	00103$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1122: str[0] = '0' + (value / 10);
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
	ld	(#_GetNumberString_str_65536_1366),a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1123: str[1] = '0' + (value % 10);
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
	ld	(#(_GetNumberString_str_65536_1366 + 1)),a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1124: str[2] = '\0';
	ld	hl, #(_GetNumberString_str_65536_1366 + 2)
	ld	(hl), #0x00
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1127: return str;
	ld	de, #_GetNumberString_str_65536_1366
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1128: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1130: bool IsTeamJoystickTriggerPressed(u8 teamId){
;	---------------------------------
; Function IsTeamJoystickTriggerPressed
; ---------------------------------
_IsTeamJoystickTriggerPressed::
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1131: if(teamId==TEAM_1){
	dec	c
	jr	NZ, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1133: u8 joyStat = Joystick_Read(JOY_PORT_1);
	ld	l, #0x0f
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1134: if (IS_JOY_PRESSED(joyStat, JOY_INPUT_TRIGGER_A))
	bit	4, l
	jr	NZ, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1136: return true;
	ld	a, #0x01
	ret
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1138: if(Keyboard_IsKeyPressed(KEY_SPACE))
	ld	a, #0x08
	call	_Keyboard_IsKeyPressed
	or	a, a
	jr	Z, 00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1140: return true;
	ld	a, #0x01
	ret
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1144: u8 joyStat = Joystick_Read(JOY_PORT_2);
	ld	l, #0x4f
;	spillPairReg hl
;	spillPairReg hl
	call	_Joystick_Read
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1145: if (IS_JOY_PRESSED(joyStat, JOY_INPUT_TRIGGER_A))
	bit	4, l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1147: return true;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1150: return FALSE;
	ld	a, #0x01
	ret	Z
00109$:
	xor	a, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1151: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1152: u8 GetJoystick1Direction(){
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1153: u8 dir = Joystick_GetDirection(JOY_PORT_1);
	and	a, #0x0f
	ld	b, a
	ld	e, b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1154: u8 retValue=DIRECTION_NONE;
	ld	c, #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1155: switch (dir){
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1156: case JOY_INPUT_DIR_UP:
00101$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1157: retValue=DIRECTION_UP;
	ld	c, #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1158: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1159: case JOY_INPUT_DIR_DOWN:
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1160: retValue=DIRECTION_DOWN;
	ld	c, #0x05
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1161: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1162: case JOY_INPUT_DIR_LEFT:
00103$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1163: retValue=DIRECTION_LEFT;
	ld	c, #0x07
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1164: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1165: case JOY_INPUT_DIR_RIGHT:
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1166: retValue=DIRECTION_RIGHT;
	ld	c, #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1167: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1168: case JOY_INPUT_DIR_UP_RIGHT:
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1169: retValue=DIRECTION_UP_RIGHT;
	ld	c, #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1170: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1171: case JOY_INPUT_DIR_UP_LEFT:
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1172: retValue=DIRECTION_UP_LEFT;
	ld	c, #0x08
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1173: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1174: case JOY_INPUT_DIR_DOWN_RIGHT:
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1175: retValue=DIRECTION_DOWN_RIGHT;
	ld	c, #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1176: break;
	jp	00109$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1177: case JOY_INPUT_DIR_DOWN_LEFT:
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1178: retValue=DIRECTION_DOWN_LEFT;
	ld	c, #0x06
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1180: }
00109$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1181: if(retValue==DIRECTION_NONE){
	ld	a, c
	or	a, a
	jp	NZ, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1182: if(Keyboard_IsKeyPressed(KEY_LEFT) && Keyboard_IsKeyPressed(KEY_UP))
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1184: retValue=DIRECTION_UP_LEFT;
	ld	c, #0x08
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1186: if(Keyboard_IsKeyPressed(KEY_LEFT) && Keyboard_IsKeyPressed(KEY_DOWN))
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1188: retValue=DIRECTION_DOWN_LEFT;
	ld	c, #0x06
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1190: if(Keyboard_IsKeyPressed(KEY_RIGHT) && Keyboard_IsKeyPressed(KEY_DOWN))
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1192: retValue=DIRECTION_DOWN_RIGHT;
	ld	c, #0x04
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1194: if(Keyboard_IsKeyPressed(KEY_RIGHT) && Keyboard_IsKeyPressed(KEY_UP))
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1196: retValue=DIRECTION_UP_RIGHT;
	ld	c, #0x02
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1198: if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_LEFT))
	ld	a, c
	or	a, a
	jr	NZ, 00123$
	push	bc
	ld	a, #0x48
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00123$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1200: retValue=DIRECTION_LEFT;
	ld	c, #0x07
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1202: if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_RIGHT))
	ld	a, c
	or	a, a
	jr	NZ, 00126$
	push	bc
	ld	a, #0x78
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00126$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1204: retValue=DIRECTION_RIGHT;
	ld	c, #0x03
00126$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1206: if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_UP))
	ld	a, c
	or	a, a
	jr	NZ, 00129$
	push	bc
	ld	a, #0x58
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00129$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1208: retValue=DIRECTION_UP;
	ld	c, #0x01
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1210: if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_DOWN))
	ld	a, c
	or	a, a
	jr	NZ, 00135$
	push	bc
	ld	a, #0x68
	call	_Keyboard_IsKeyPressed
	pop	bc
	or	a, a
	jr	Z, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1212: retValue=DIRECTION_DOWN;
	ld	c, #0x05
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1215: return retValue;
	ld	a, c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1216: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1217: u8 GetJoystick2Direction(){
;	---------------------------------
; Function GetJoystick2Direction
; ---------------------------------
_GetJoystick2Direction::
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/bios.h:382: inline u8 Bios_GetJoystickDirection(u8 port) { return ((u8(*)(u8))R_GTSTCK)(port); }
	ld	a, #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1218: return Bios_GetJoystickDirection(2);
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1219: }
	jp  0x00d5
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1221: void ShowFieldZone(u8 zone){
;	---------------------------------
; Function ShowFieldZone
; ---------------------------------
_ShowFieldZone::
	ld	(_g_FieldScrollingActionInProgress+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1222: g_FieldScrollingActionInProgress=zone;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1223: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1224: void TickCheckBallBoundaries(){
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1225: if(g_MatchStatus!=MATCH_IN_ACTION){
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1226: return;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1230: if(g_MatchStatus == MATCH_BALL_ON_GOALKEEPER || g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jp	NZ,00160$
	sub	a, #0x0d
	jr	Z, 00107$
	ld	a, (#(_g_Ball + 6) + 0)
	inc	a
	jr	Z, 00108$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1231: if(g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	hl, #_g_Ball+6
	ld	e, (hl)
	ld	a, e
	inc	a
	jr	Z, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1232: if(g_Players[g_Ball.PossessionPlayerId].Role == PLAYER_ROLE_GOALKEEPER) return;
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
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	Z,00160$
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1237: if (g_Ball.ShotActive != 0 || g_Ball.PassTargetPlayerId != NO_VALUE) {
	ld	a, (#_g_Ball + 27)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1245: if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
	ld	bc, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1237: if (g_Ball.ShotActive != 0 || g_Ball.PassTargetPlayerId != NO_VALUE) {
	ld	a, (#_g_Ball + 16)
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1245: if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
	ld	e, c
	ld	d, b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1237: if (g_Ball.ShotActive != 0 || g_Ball.PassTargetPlayerId != NO_VALUE) {
	ld	a, -3 (ix)
	inc	a
	ld	a, #0x01
	jr	Z, 00314$
	xor	a, a
00314$:
	ld	-2 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1245: if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
	ld	a, e
	sub	a, #0x32
	ld	a, d
	sbc	a, #0x00
	ld	a, #0x00
	rla
	ld	-6 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1237: if (g_Ball.ShotActive != 0 || g_Ball.PassTargetPlayerId != NO_VALUE) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00120$
	bit	0, -2 (ix)
	jr	NZ, 00121$
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1239: u16 destY = g_Ball.TargetY;
	ld	hl, (#_g_Ball + 25)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1240: if (g_Ball.PassTargetPlayerId != NO_VALUE) {
	bit	0, -2 (ix)
	jr	NZ, 00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1241: destY = g_Players[g_Ball.PassTargetPlayerId].Y;
	push	de
	ld	e, -3 (ix)
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
	pop	de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1245: if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00115$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1247: if(destY > g_Ball.Y) return;
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	C,00160$
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1251: if (g_Ball.Y > FIELD_BOUND_Y_BOTTOM) {
	ld	a, #0xae
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1253: if(destY < g_Ball.Y) return;
	xor	a, a
	sbc	hl, bc
	jp	C,00160$
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1269: if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00129$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1271: if (g_Ball.ShotActive && (g_Ball.Direction == DIRECTION_DOWN || g_Ball.Direction == DIRECTION_DOWN_LEFT || g_Ball.Direction == DIRECTION_DOWN_RIGHT)) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00129$
	ld	a, (#_g_Ball + 5)
	cp	a, #0x05
	jp	Z,00160$
	cp	a, #0x06
	jp	Z,00160$
	sub	a, #0x04
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1272: return; 
	jp	Z,00160$
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1277: if (g_Ball.Y > FIELD_BOUND_Y_BOTTOM) {
	ld	a, #0xae
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	ld	a, #0x00
	rla
	ld	-5 (ix), a
	or	a, a
	jr	Z, 00136$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1279: if (g_Ball.ShotActive && (g_Ball.Direction == DIRECTION_UP || g_Ball.Direction == DIRECTION_UP_LEFT || g_Ball.Direction == DIRECTION_UP_RIGHT)) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00136$
	ld	a, (#_g_Ball + 5)
	cp	a, #0x01
	jp	Z,00160$
	cp	a, #0x08
	jp	Z,00160$
	sub	a, #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1280: return;
	jp	Z,00160$
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1284: u8 teamId = g_Ball.LastTouchTeamId;
	ld	a, (#_g_Ball + 14)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1285: if(teamId==NO_VALUE){
	ld	-4 (ix), a
	inc	a
	jr	NZ, 00138$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1286: teamId=TEAM_1; // Default
	ld	-4 (ix), #0x01
00138$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1288: u8 opponentTeamId = (teamId == TEAM_1) ? TEAM_2 : TEAM_1;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1291: if(g_Ball.X < FIELD_BOUND_X_LEFT || g_Ball.X > FIELD_BOUND_X_RIGHT){
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1292: BallThrowIn(opponentTeamId);
	ld	a, c
	call	_BallThrowIn
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1293: return;
	jp	00160$
00140$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1297: if(g_Ball.Y < FIELD_BOUND_Y_TOP){
	ld	a, -6 (ix)
	or	a, a
	jr	Z, 00150$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1300: if(g_Ball.X > (GOAL_X_MIN - 8) && g_Ball.X < (GOAL_X_MAX + 8)){
	ld	a, #0x58
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00146$
	ld	de, #0x0098
	cp	a, a
	sbc	hl, de
	jr	NC, 00146$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1301: BallInGoal(TEAM_1); // Team 1 attacked up and scored
	ld	a, #0x01
	call	_BallInGoal
	jp	00160$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1304: if(teamId == TEAM_1){ // Attacker touched last
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00143$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1305: GoalKick(TEAM_2);
	ld	a, #0x02
	call	_GoalKick
	jp	00160$
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1308: CornerKick(TEAM_1);
	ld	a, #0x01
	call	_CornerKick
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1311: return;
	jp	00160$
00150$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1315: if(g_Ball.Y > FIELD_BOUND_Y_BOTTOM){
	ld	a, -5 (ix)
	or	a, a
	jr	Z, 00160$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1317: if(g_Ball.X > (GOAL_X_MIN - 8) && g_Ball.X < (GOAL_X_MAX + 8)){
	ld	a, #0x58
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00155$
	ld	de, #0x0098
	cp	a, a
	sbc	hl, de
	jr	NC, 00155$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1318: BallInGoal(TEAM_2); // Team 2 attacked down and scored
	ld	a, #0x02
	call	_BallInGoal
	jp	00156$
00155$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1321: if(teamId == TEAM_2){ // Attacker touched last (Team 2 attacking down)
	ld	a, -4 (ix)
	sub	a, #0x02
	jr	NZ, 00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1322: GoalKick(TEAM_1);
	ld	a, #0x01
	call	_GoalKick
	jp	00156$
00152$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1325: CornerKick(TEAM_2);
	ld	a, #0x02
	call	_CornerKick
00156$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1328: return;
00160$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1330: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1334: void TimeUp(){
;	---------------------------------
; Function TimeUp
; ---------------------------------
_TimeUp::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1336: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1338: u8 GetClosestPlayerToBall(u8 teamId, u8 excludePlayerId){
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1339: u8 closestId = NO_VALUE;
	ld	-12 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1340: u16 minDist = 0xFFFF;
	ld	-11 (ix), #0xff
	ld	-10 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1342: for(u8 i=0;i<14;i++){
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1343: if(g_Players[i].TeamId != teamId) continue;
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
	ld	de, #0x0005
	add	hl, de
	ld	a,-2 (ix)
	sub	a,(hl)
	jp	NZ,00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1344: if(i == excludePlayerId) continue;
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jp	Z,00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1346: u16 distX = (g_Players[i].X > g_Ball.X) ? (g_Players[i].X - g_Ball.X) : (g_Ball.X - g_Players[i].X);
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1347: u16 distY = (g_Players[i].Y > g_Ball.Y) ? (g_Players[i].Y - g_Ball.Y) : (g_Ball.Y - g_Players[i].Y);
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1350: u16 totalDist = distX + distY;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	add	hl, bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1352: if(totalDist < minDist){
	ld	a, l
	sub	a, -11 (ix)
	ld	a, h
	sbc	a, -10 (ix)
	jr	NC, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1353: minDist = totalDist;
	ld	-11 (ix), l
	ld	-10 (ix), h
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1354: closestId = i;
	ld	a, -1 (ix)
	ld	-12 (ix), a
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1342: for(u8 i=0;i<14;i++){
	inc	-1 (ix)
	jp	00110$
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1357: return closestId;
	ld	a, -12 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1358: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1364: i32 Math_Abs32(i32 v) { return (v < 0) ? -v : v; }
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1366: u8 GetBestPassTarget(u8 passerId) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1367: u8 bestTarget = NO_VALUE;
	ld	-32 (ix), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1368: i32 bestScore = -2100000000;
	ld	-31 (ix), #0x00
	ld	-30 (ix), #0x8b
	ld	-29 (ix), #0xd4
	ld	-28 (ix), #0x82
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1369: u8 teamId = g_Players[passerId].TeamId;
	ld	c, -2 (ix)
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
	ld	c, l
	ld	b, h
	push	bc
	pop	iy
	ld	a, 5 (iy)
	ld	-27 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1370: u8 dir = g_Players[passerId].Direction;
	push	bc
	pop	iy
	ld	e, 6 (iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1371: i16 px = (i16)g_Players[passerId].X;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1372: i16 py = (i16)g_Players[passerId].Y;
	ld	l, c
	ld	h, b
	ld	d, (hl)
	inc	hl
	ld	a, (hl)
	ld	-24 (ix), d
	ld	-23 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1375: i16 dirX = 0, dirY = 0;
	xor	a, a
	ld	-22 (ix), a
	ld	-21 (ix), a
	xor	a, a
	ld	-20 (ix), a
	ld	-19 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1378: if (dir == DIRECTION_NONE) dir = g_Players[passerId].PreviousDirection;
	ld	a, e
	or	a, a
	jr	NZ, 00102$
	ld	e, c
	ld	d, b
	ld	hl, #7
	add	hl, de
	ld	e, (hl)
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1380: if (dir == DIRECTION_UP) dirY = -100;
	ld	a, e
	dec	a
	jr	NZ, 00128$
	ld	-20 (ix), #0x9c
	ld	-19 (ix), #0xff
	jp	00183$
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1381: else if (dir == DIRECTION_DOWN) dirY = 100;
	ld	a, e
	sub	a, #0x05
	jr	NZ, 00125$
	ld	-20 (ix), #0x64
	ld	-19 (ix), #0
	jp	00183$
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1382: else if (dir == DIRECTION_LEFT) dirX = -100;
	ld	a, e
	sub	a, #0x07
	jr	NZ, 00122$
	ld	-22 (ix), #0x9c
	ld	-21 (ix), #0xff
	jp	00183$
00122$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1383: else if (dir == DIRECTION_RIGHT) dirX = 100;
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00119$
	ld	-22 (ix), #0x64
	ld	-21 (ix), #0
	jp	00183$
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1384: else if (dir == DIRECTION_UP_RIGHT) { dirX = 70; dirY = -70; }
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00116$
	ld	-22 (ix), #0x46
	xor	a, a
	ld	-21 (ix), a
	ld	-20 (ix), #0xba
	ld	-19 (ix), #0xff
	jp	00183$
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1385: else if (dir == DIRECTION_UP_LEFT) { dirX = -70; dirY = -70; }
	ld	a, e
	sub	a, #0x08
	jr	NZ, 00113$
	ld	-22 (ix), #0xba
	ld	-21 (ix), #0xff
	ld	-20 (ix), #0xba
	ld	-19 (ix), #0xff
	jp	00183$
00113$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1386: else if (dir == DIRECTION_DOWN_RIGHT) { dirX = 70; dirY = 70; }
	ld	a, e
	sub	a, #0x04
	jr	NZ, 00110$
	ld	-22 (ix), #0x46
	ld	-21 (ix), #0
	ld	-20 (ix), #0x46
	ld	-19 (ix), #0
	jp	00183$
00110$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1387: else if (dir == DIRECTION_DOWN_LEFT) { dirX = -70; dirY = 70; }
	ld	a, e
	sub	a, #0x06
	jr	NZ, 00107$
	ld	-22 (ix), #0xba
	ld	-21 (ix), #0xff
	ld	-20 (ix), #0x46
	ld	-19 (ix), #0
	jp	00183$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1389: if (teamId == TEAM_1) dirY = -100; 
	ld	a, -27 (ix)
	dec	a
	jr	NZ, 00104$
	ld	-20 (ix), #0x9c
	ld	-19 (ix), #0xff
	jp	00183$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1390: else dirY = 100; 
	ld	-20 (ix), #0x64
	ld	-19 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1393: for(i=0; i<14; i++) {
00183$:
	ld	-18 (ix), c
	ld	-17 (ix), b
	ld	-1 (ix), #0x00
00154$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1398: if(g_Players[i].TeamId != teamId) continue;
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
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	bc,#5
	add	hl,bc
	ld	a,-27 (ix)
	sub	a,(hl)
	jp	NZ,00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1399: if(i == passerId) continue;
	ld	a, -2 (ix)
	sub	a, -1 (ix)
	jp	Z,00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1400: if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	hl, #14
	add	hl, bc
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jp	Z, 00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1401: if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue; 
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jp	Z, 00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1404: if (g_Players[i].Y < g_FieldCurrentYPosition || g_Players[i].Y > (g_FieldCurrentYPosition + 220)) {
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
	jp	C, 00152$
	ld	iy, #0x00dc
	push	bc
	ld	bc, (_g_FieldCurrentYPosition)
	add	iy, bc
	pop	bc
	push	iy
	pop	hl
	xor	a, a
	sbc	hl, de
	jp	C, 00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1408: dx = (i16)g_Players[i].X - px;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1409: dy = (i16)g_Players[i].Y - py;
	ld	a, c
	sub	a, -24 (ix)
	ld	c, a
	ld	a, b
	sbc	a, -23 (ix)
	ld	-4 (ix), c
	ld	-3 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1413: adx = (dx < 0) ? -dx : dx;
	ld	b, -5 (ix)
	bit	7, b
	jr	Z, 00157$
	xor	a, a
	sub	a, -6 (ix)
	ld	-8 (ix), a
	sbc	a, a
	sub	a, -5 (ix)
	ld	-7 (ix), a
	jp	00158$
00157$:
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
00158$:
	ld	c, -8 (ix)
	ld	b, -7 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1414: ady = (dy < 0) ? -dy : dy;
	ld	d, -3 (ix)
	bit	7, d
	jr	Z, 00159$
	xor	a, a
	sub	a, -4 (ix)
	ld	e, a
	sbc	a, a
	sub	a, -3 (ix)
	jp	00160$
00159$:
	ld	e, -4 (ix)
	ld	a, -3 (ix)
00160$:
	ld	-16 (ix), e
	ld	-15 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1415: if (adx < 32 && ady < 32) continue;
	ld	e, c
	ld	d, b
	ld	a, e
	sub	a, #0x20
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00142$
	ld	e, -16 (ix)
	ld	d, -15 (ix)
	ld	a, e
	sub	a, #0x20
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00152$
00142$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1418: if (g_Players[passerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1420: if (((i32)dx*(i32)dx + (i32)dy*(i32)dy) > 6400) continue;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1418: if (g_Players[passerId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, e
	or	a, a
	jr	NZ, 00147$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1420: if (((i32)dx*(i32)dx + (i32)dy*(i32)dy) > 6400) continue;
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
	xor	a, a
	cp	a, e
	ld	a, #0x19
	sbc	a, d
	ld	a, #0x00
	sbc	a, l
	ld	a, #0x00
	sbc	a, h
	jp	PO, 00303$
	xor	a, #0x80
00303$:
	jp	M, 00152$
00147$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1423: dot = ((i32)dx * dirX) + ((i32)dy * dirY);
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1426: if (dot <= 0) continue; 
	xor	a, a
	cp	a, -6 (ix)
	sbc	a, -5 (ix)
	ld	a, #0x00
	sbc	a, -4 (ix)
	ld	a, #0x00
	sbc	a, -3 (ix)
	jp	PO, 00304$
	xor	a, #0x80
00304$:
	jp	P, 00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1431: score = dot - ((i32)(adx + ady) * 40); 
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1433: if (score > bestScore) {
	ld	a, -31 (ix)
	sub	a, -6 (ix)
	ld	a, -30 (ix)
	sbc	a, -5 (ix)
	ld	a, -29 (ix)
	sbc	a, -4 (ix)
	ld	a, -28 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00305$
	xor	a, #0x80
00305$:
	jp	P, 00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1434: bestScore = score;
	ld	hl, #1
	add	hl, sp
	ex	de, hl
	ld	hl, #26
	add	hl, sp
	ld	bc, #4
	ldir
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1435: bestTarget = i;
	ld	a, -1 (ix)
	ld	-32 (ix), a
00152$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1393: for(i=0; i<14; i++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	C, 00154$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1438: return bestTarget;
	ld	a, -32 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1439: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1441: void UpdatePassTarget() {
;	---------------------------------
; Function UpdatePassTarget
; ---------------------------------
_UpdatePassTarget::
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1443: u8 carrier = g_Ball.PossessionPlayerId;
	ld	a, (#_g_Ball + 6)
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1445: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	inc	a
	jr	NZ, 00102$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1446: g_PassTargetPlayer = NO_VALUE;
	ld	hl, #_g_PassTargetPlayer
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1447: return;
	ret
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1451: passUpdateTimer++;
	ld	hl, #_UpdatePassTarget_passUpdateTimer_65536_1445
	inc	(hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1452: if (passUpdateTimer < 8) return;
	ld	a, (_UpdatePassTarget_passUpdateTimer_65536_1445+0)
	sub	a, #0x08
	ret	C
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1453: passUpdateTimer = 0;
	ld	hl, #_UpdatePassTarget_passUpdateTimer_65536_1445
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1455: if (carrier != NO_VALUE) {
	ld	a, c
	inc	a
	jr	Z, 00108$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1456: g_PassTargetPlayer = GetBestPassTarget(carrier);
	ld	a, c
	call	_GetBestPassTarget
	ld	(_g_PassTargetPlayer+0), a
	ret
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1458: if (g_Ball.PassTargetPlayerId == NO_VALUE) g_PassTargetPlayer = NO_VALUE;
	ld	a, (#_g_Ball + 16)
	inc	a
	ret	NZ
	ld	hl, #_g_PassTargetPlayer
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1460: }
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1470: void GoalkeeperWithBall(u8 teamId, bool isSteal) {
;	---------------------------------
; Function GoalkeeperWithBall
; ---------------------------------
_GoalkeeperWithBall::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	iy, #-14
	add	iy, sp
	ld	sp, iy
	ld	-2 (ix), a
	ld	-3 (ix), l
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1471: u8 gkId = GetPlayerIdByRole(teamId, PLAYER_ROLE_GOALKEEPER);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	call	_GetPlayerIdByRole
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1472: if(gkId == NO_VALUE) return;
	ld	-12 (ix), a
	inc	a
	jp	Z,00133$
	jp	00102$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1474: s_GkAnimPlayerId = gkId;
	ld	a, -12 (ix)
	ld	(_s_GkAnimPlayerId+0), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1475: s_GkAnimTimer = 0;
	ld	hl, #_s_GkAnimTimer
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1478: if (teamId == TEAM_1) g_Players[gkId].PatternId = PLAYER_POSE_TEAM1_GK_BALL_FRONT;
	ld	a, -2 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00232$
	xor	a, a
00232$:
	ld	-11 (ix), a
	ld	c, -12 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, -11 (ix)
	or	a, a
	jr	Z, 00104$
	ld	hl, #_g_Players+0
	add	hl, bc
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0x9b
	jp	00105$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1479: else g_Players[gkId].PatternId = PLAYER_POSE_TEAM2_GK_BALL_FRONT;
	ld	hl, #_g_Players+0
	add	hl, bc
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0x3d
00105$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1482: g_Players[gkId].Status = PLAYER_STATUS_POSITIONED;
	ld	hl, #_g_Players
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x04
	inc	hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1486: bool closeToLine = false;
	ld	(hl), #0x00
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1487: if (teamId == TEAM_2) { // GK 2 (Top)
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	NZ, 00111$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1488: s_GkRecoilY = -1;
	ld	hl, #_s_GkRecoilY
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1489: if (g_Players[gkId].Y <= FIELD_BOUND_Y_TOP + 4) closeToLine = true;
	ld	l, c
	ld	h, b
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, #0x36
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	C, 00112$
	ld	e, #0x01
	jp	00112$
00111$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1491: s_GkRecoilY = 1;
	ld	hl, #_s_GkRecoilY
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1492: if (g_Players[gkId].Y >= FIELD_BOUND_Y_BOTTOM - 4) closeToLine = true;
	ld	l, c
	ld	h, b
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0xaa
	ld	a, b
	sbc	a, #0x01
	jr	C, 00112$
	ld	e, #0x01
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1495: if (closeToLine || isSteal) s_GkRecoilY = 0; // No recoil for Steals
	ld	a, e
	or	a, a
	jr	NZ, 00113$
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00114$
00113$:
	ld	hl, #_s_GkRecoilY
	ld	(hl), #0x00
00114$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1498: SetPlayerBallPossession(gkId);
	ld	a, -12 (ix)
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1499: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1501: g_MatchStatus = MATCH_BALL_ON_GOALKEEPER;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1504: for(u8 i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00132$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00133$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1505: if(i == gkId) continue;
	ld	a, -12 (ix)
	sub	a, -1 (ix)
	jp	Z,00129$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1506: if(g_Players[i].TeamId == REFEREE) continue;
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
	ld	-10 (ix), l
	ld	-9 (ix), h
	ld	bc,#5
	add	hl,bc
	ld	a, (hl)
	ld	-8 (ix), a
	sub	a, #0x0e
	jp	Z,00129$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1510: tx = g_Players[i].X;
	ld	a, -10 (ix)
	ld	-5 (ix), a
	ld	a, -9 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1517: ty = (g_Players[i].Y > 50) ? (g_Players[i].Y - 40) : 50;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1513: if(g_Players[i].TeamId == teamId) {
	ld	a, -2 (ix)
	sub	a, -8 (ix)
	jr	NZ, 00127$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1516: if(teamId == TEAM_1) { // Moving UP
	ld	a, -11 (ix)
	or	a, a
	jr	Z, 00121$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1517: ty = (g_Players[i].Y > 50) ? (g_Players[i].Y - 40) : 50;
	ld	a, #0x32
	cp	a, -5 (ix)
	ld	a, #0x00
	sbc	a, -4 (ix)
	jr	NC, 00135$
	ld	a, -5 (ix)
	add	a, #0xd8
	ld	e, a
	ld	a, -4 (ix)
	adc	a, #0xff
	ld	d, a
	jp	00128$
00135$:
	ld	de, #0x0032
	jp	00128$
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1519: ty = (g_Players[i].Y < 380) ? (g_Players[i].Y + 40) : 380;
	ld	a, -5 (ix)
	sub	a, #0x7c
	ld	a, -4 (ix)
	sbc	a, #0x01
	jr	NC, 00137$
	ld	a, -5 (ix)
	add	a, #0x28
	ld	-14 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-13 (ix), a
	jp	00138$
00137$:
	ld	hl, #0x017c
	ex	(sp), hl
00138$:
	pop	de
	push	de
	jp	00128$
00127$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1524: if(teamId == TEAM_1) { // Opponent is Team 2 (Top) -> Retreat UP? No, Team 2 Defends Top.
	ld	a, -11 (ix)
	or	a, a
	jr	Z, 00124$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1527: ty = (g_Players[i].Y > 50) ? (g_Players[i].Y - 40) : 50;
	ld	a, #0x32
	cp	a, -5 (ix)
	ld	a, #0x00
	sbc	a, -4 (ix)
	jr	NC, 00139$
	ld	a, -5 (ix)
	add	a, #0xd8
	ld	e, a
	ld	a, -4 (ix)
	adc	a, #0xff
	ld	d, a
	jp	00128$
00139$:
	ld	de, #0x0032
	jp	00128$
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1530: ty = (g_Players[i].Y < 380) ? (g_Players[i].Y + 40) : 380;
	ld	a, -5 (ix)
	sub	a, #0x7c
	ld	a, -4 (ix)
	sbc	a, #0x01
	jr	NC, 00141$
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	de, #0x0028
	add	hl, de
	jp	00142$
00141$:
	ld	hl, #0x017c
00142$:
	ex	de, hl
00128$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1535: g_Players[i].TargetX = tx;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	bc, #0x000c
	add	hl, bc
	ld	a, -7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -6 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1536: g_Players[i].TargetY = ty;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	bc, #0x000a
	add	hl, bc
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1537: g_Players[i].Status = PLAYER_STATUS_NONE; // Unlock movement
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	de, #0x000e
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00129$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1504: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00132$
00133$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1539: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1541: void TickGoalkeeperAnimation() {
;	---------------------------------
; Function TickGoalkeeperAnimation
; ---------------------------------
_TickGoalkeeperAnimation::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1542: if (g_MatchStatus != MATCH_BALL_ON_GOALKEEPER) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0d
	jp	NZ,00148$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1543: if (s_GkAnimPlayerId == NO_VALUE) return;
	ld	a, (_s_GkAnimPlayerId+0)
	inc	a
	jp	Z,00148$
	jp	00104$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1545: s_GkAnimTimer++;
	ld	iy, #_s_GkAnimTimer
	inc	0 (iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1547: u8 kickTime = 30; // Default kick time (Animation end)
	ld	c, #0x1e
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1548: if (s_GkRecoilY == 0) kickTime = 60; // 1 Second delay for steals/no-recoil
	ld	a, (_s_GkRecoilY+0)
	or	a, a
	jr	NZ, 00106$
	ld	c, #0x3c
00106$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1551: if (s_GkAnimTimer < kickTime) {
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1552: if (s_GkAnimTimer < 30 && (s_GkAnimTimer % 8) == 0 && s_GkRecoilY != 0) { // Slow movement
	ld	a,(_s_GkAnimTimer+0)
	cp	a,c
	jp	NC,00146$
	cp	a,#0x1e
	jp	NC,00112$
	and	a, #0x07
	jp	NZ,00112$
	ld	a, (_s_GkRecoilY+0)
	or	a, a
	jp	Z, 00112$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1553: g_Players[s_GkAnimPlayerId].Y += s_GkRecoilY;
	ld	bc, #_g_Players+0
	ld	de, (_s_GkAnimPlayerId)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, (_s_GkRecoilY+0)
	push	iy
	ld	-3 (ix), a
	pop	iy
	rlca
	sbc	a, a
	push	iy
	ld	-2 (ix), a
	pop	iy
	add	iy, de
	push	iy
	pop	de
	ld	(hl), e
	inc	hl
	ld	(hl), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1556: if(g_Players[s_GkAnimPlayerId].Y < FIELD_BOUND_Y_TOP) g_Players[s_GkAnimPlayerId].Y = FIELD_BOUND_Y_TOP;
	ld	de, (_s_GkAnimPlayerId)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1557: if(g_Players[s_GkAnimPlayerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[s_GkAnimPlayerId].Y = FIELD_BOUND_Y_BOTTOM;
	ld	de, (_s_GkAnimPlayerId)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1559: g_Players[s_GkAnimPlayerId].TargetY = g_Players[s_GkAnimPlayerId].Y; // Sync target
	ld	de, (_s_GkAnimPlayerId)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	a, l
	add	a, #0x0a
	ld	c, a
	ld	a, h
	adc	a, #0x00
	ld	b, a
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1562: if (g_Players[s_GkAnimPlayerId].TeamId == TEAM_1) g_Players[s_GkAnimPlayerId].PatternId = PLAYER_POSE_TEAM1_GK_BALL_FRONT;
	ld	bc, #_g_Players+0
	ld	de, (_s_GkAnimPlayerId)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ex	de, hl
	push	de
	pop	iy
	ld	c, 5 (iy)
	ld	hl, #0x0004
	add	hl, de
	dec	c
	jr	NZ, 00116$
	ld	(hl), #0x9b
	jp	00117$
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1563: else g_Players[s_GkAnimPlayerId].PatternId = PLAYER_POSE_TEAM2_GK_BALL_FRONT;
	ld	(hl), #0x3d
00117$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1565: PutBallOnPlayerFeet(s_GkAnimPlayerId);
	ld	a, (_s_GkAnimPlayerId+0)
	call	_PutBallOnPlayerFeet
	jp	00148$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1567: } else if (s_GkAnimTimer == kickTime) {
	ld	a, (_s_GkAnimTimer+0)
	sub	a, c
	jp	NZ,00143$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1569: u8 targetId = GetBestPassTarget(s_GkAnimPlayerId); 
	ld	a, (_s_GkAnimPlayerId+0)
	call	_GetBestPassTarget
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1571: if (targetId != NO_VALUE) {
	ld	c, a
	inc	a
	jr	Z, 00138$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1572: PerformPass(targetId);
	ld	a, c
	call	_PerformPass
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1575: u8 dir = g_Players[s_GkAnimPlayerId].Direction;
	ld	bc, (_s_GkAnimPlayerId)
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
	ld	a, 6 (iy)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1579: if (dir == DIRECTION_RIGHT || dir == DIRECTION_UP_RIGHT || dir == DIRECTION_DOWN_RIGHT) 
	cp	a, #0x03
	jr	Z, 00123$
	cp	a, #0x02
	jr	Z, 00123$
	cp	a, #0x04
	jr	NZ, 00124$
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1580: pose = (team == TEAM_1) ? PLAYER_POSE_TEAM1_RESTART_RIGHT : PLAYER_POSE_TEAM2_RESTART_RIGHT;
	ld	c, #0xcb
	jp	00125$
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1581: else if (dir == DIRECTION_LEFT || dir == DIRECTION_UP_LEFT || dir == DIRECTION_DOWN_LEFT)
	cp	a, #0x07
	jr	Z, 00118$
	cp	a, #0x08
	jr	Z, 00118$
	sub	a, #0x06
	jr	NZ, 00119$
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1582: pose = (team == TEAM_1) ? PLAYER_POSE_TEAM1_RESTART_LEFT : PLAYER_POSE_TEAM2_RESTART_LEFT;
	ld	c, #0x44
	jp	00125$
00119$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1584: pose = (team == TEAM_1) ? PLAYER_POSE_TEAM1_RESTART_FRONT : PLAYER_POSE_TEAM2_RESTART_FRONT;
	ld	c, #0x45
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1586: g_Players[s_GkAnimPlayerId].PatternId = pose;
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), c
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1588: g_Players[s_GkAnimPlayerId].Status = PLAYER_STATUS_POSITIONED;
	ld	bc, (_s_GkAnimPlayerId)
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
	ld	bc, #0x000e
	add	hl, bc
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1591: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
	jp	00148$
00138$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1595: u8 team = g_Players[s_GkAnimPlayerId].TeamId;
	ld	bc, #_g_Players+0
	ld	de, (_s_GkAnimPlayerId)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ex	de, hl
	push	de
	pop	iy
	ld	a, 5 (iy)
	ld	-1 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1597: g_Players[s_GkAnimPlayerId].PatternId = pose;
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x45
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1600: u16 tx = g_Players[s_GkAnimPlayerId].X;
	ld	de, (_s_GkAnimPlayerId)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1603: if (g_Players[s_GkAnimPlayerId].Y > (FIELD_BOUND_Y_TOP + 100)) ty = g_Players[s_GkAnimPlayerId].Y - 100;
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1602: if (team == TEAM_1) { // Shooting UP
	ld	a, -1 (ix)
	dec	a
	jr	NZ, 00135$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1603: if (g_Players[s_GkAnimPlayerId].Y > (FIELD_BOUND_Y_TOP + 100)) ty = g_Players[s_GkAnimPlayerId].Y - 100;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1604: else ty = FIELD_BOUND_Y_TOP;
	ld	de, #0x0032
	jp	00136$
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1606: if (g_Players[s_GkAnimPlayerId].Y < (FIELD_BOUND_Y_BOTTOM - 100)) ty = g_Players[s_GkAnimPlayerId].Y + 100;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1607: else ty = FIELD_BOUND_Y_BOTTOM;
	ld	de, #0x01ae
00136$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1610: PerformShot(tx, ty);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_PerformShot
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1613: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
	jp	00148$
00143$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1616: } else if (s_GkAnimTimer > (kickTime + 15)) {
	ld	b, #0x00
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (_s_GkAnimTimer+0)
	ld	c, a
	ld	b, #0x00
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jp	PO, 00270$
	xor	a, #0x80
00270$:
	jp	P, 00148$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1619: g_Players[s_GkAnimPlayerId].Status = PLAYER_STATUS_NONE;
	ld	bc, (_s_GkAnimPlayerId)
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
	ld	bc, #0x000e
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00148$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1621: }
	inc	sp
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1623: void PerformShot(u16 targetX, u16 targetY) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1624: u8 fromId = g_Ball.PossessionPlayerId;
	ld	a, (#(_g_Ball + 6) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1625: if (fromId == NO_VALUE) return;
	ld	-5 (ix), a
	inc	a
	jp	Z,00132$
	jp	00102$
00102$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1631: dx = (i16)targetX - (i16)g_Players[fromId].X;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	e, -5 (ix)
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1632: dy = (i16)targetY - (i16)g_Players[fromId].Y;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1633: adx = (dx < 0) ? -dx : dx;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1634: ady = (dy < 0) ? -dy : dy;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1636: if (adx > ady * 2) {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1637: newDir = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1638: } else if (ady > adx * 2) {
	ex	de, hl
	add	hl, hl
	ex	de, hl
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1639: newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1638: } else if (ady > adx * 2) {
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00241$
	xor	a, #0x80
00241$:
	jp	P, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1639: newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1641: if (dx > 0) newDir = (dy > 0) ? DIRECTION_DOWN_RIGHT : DIRECTION_UP_RIGHT;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1642: else newDir = (dy > 0) ? DIRECTION_DOWN_LEFT : DIRECTION_UP_LEFT;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1644: g_Players[fromId].Direction = newDir;
	pop	hl
	push	hl
	ld	de, #0x0006
	add	hl, de
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1647: if (newDir == DIRECTION_UP || newDir == DIRECTION_UP_LEFT || newDir == DIRECTION_UP_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_FRONT;
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
	add	a, #0x04
	ld	-6 (ix), a
	ld	a, -19 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), #0x18
	jp	00124$
00123$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1648: else if (newDir == DIRECTION_DOWN || newDir == DIRECTION_DOWN_LEFT || newDir == DIRECTION_DOWN_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_BACK;
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
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0x15
	jp	00124$
00118$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1649: else if (newDir == DIRECTION_LEFT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_LEFT;
	ld	a, -5 (ix)
	sub	a, #0x07
	jr	NZ, 00115$
	pop	hl
	push	hl
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0xa4
	jp	00124$
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1650: else if (newDir == DIRECTION_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_RIGHT;
	ld	a, -5 (ix)
	sub	a, #0x03
	jr	NZ, 00124$
	pop	hl
	push	hl
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0x1b
00124$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1652: g_Players[fromId].Status = PLAYER_STATUS_POSITIONED; // Lock pose
	pop	hl
	push	hl
	ld	de, #0x000e
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1655: g_Players[fromId].TargetX = g_Players[fromId].X;
	ld	a, -20 (ix)
	add	a, #0x0c
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1656: g_Players[fromId].TargetY = g_Players[fromId].Y;
	ld	a, -20 (ix)
	add	a, #0x0a
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1658: SetPlayerBallPossession(NO_VALUE);
	ld	a, #0xff
	call	_SetPlayerBallPossession
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1659: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1660: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1661: g_Ball.ShotActive = 1;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1662: g_Ball.TargetX = targetX;
	ld	hl, #(_g_Ball + 23)
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1663: g_Ball.TargetY = targetY;
	ld	hl, #(_g_Ball + 25)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1664: g_Ball.PassStartX = g_Ball.X;
	ld	bc, (#_g_Ball + 2)
	ld	((_g_Ball + 17)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1665: g_Ball.PassStartY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 19)), bc
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1668: i16 arcDy = dy;
	ld	c, -14 (ix)
	ld	b, -13 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1669: if (targetY < FIELD_BOUND_Y_TOP) { // Shooting UP
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	a, e
	sub	a, #0x32
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00130$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1670: arcDy = (i16)FIELD_BOUND_Y_TOP - (i16)g_Players[fromId].Y;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1671: } else if (targetY > FIELD_BOUND_Y_BOTTOM) { // Shooting DOWN
	ld	a, #0xae
	cp	a, e
	ld	a, #0x01
	sbc	a, d
	jr	NC, 00131$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1672: arcDy = (i16)FIELD_BOUND_Y_BOTTOM - (i16)g_Players[fromId].Y;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1674: g_Ball.PassTotalDist = (u16)(Math_Abs32(dx) + Math_Abs32(arcDy));
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1675: }
	ld	sp, ix
	pop	ix
	ret
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1677: void TickBallFlying() {
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1679: if (g_Ball.PossessionPlayerId != NO_VALUE) return;
	ld	a, (#(_g_Ball + 6) + 0)
	inc	a
	jp	NZ,00190$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1682: bool isMovingToPlayer = (g_Ball.PassTargetPlayerId != NO_VALUE);
	ld	a, (#(_g_Ball + 16) + 0)
	ld	-17 (ix), a
	inc	a
	ld	a, #0x01
	jr	Z, 00427$
	xor	a, a
00427$:
	xor	a, #0x01
	ld	-16 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1683: bool isFreeMoving = (g_Ball.ShotActive != 0);
	ld	a, (#(_g_Ball + 27) + 0)
	ld	-15 (ix), a
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	c, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1685: if (!isMovingToPlayer && !isFreeMoving) return;
	ld	a, -16 (ix)
	or	a,a
	jr	NZ, 00104$
	or	a,c
	jp	Z,00190$
00104$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1689: if (isMovingToPlayer) {
	ld	a, -16 (ix)
	or	a, a
	jr	Z, 00107$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1690: tx = g_Players[g_Ball.PassTargetPlayerId].X;
	ld	bc, #_g_Players+0
	ld	e, -17 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1691: ty = g_Players[g_Ball.PassTargetPlayerId].Y;
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	jp	00108$
00107$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1693: tx = g_Ball.TargetX;
	ld	bc, (#_g_Ball + 23)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1694: ty = g_Ball.TargetY;
	ld	de, (#_g_Ball + 25)
00108$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1698: i16 dx = tx - (i16)g_Ball.X;
	ld	hl, #(_g_Ball + 2)
	ld	a, (hl)
	ld	-14 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-13 (ix), a
	ld	l, -14 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -13 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
	ld	-12 (ix), c
	ld	-11 (ix), b
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1699: i16 dy = ty - (i16)g_Ball.Y;
	ld	hl, (#_g_Ball + 0)
	ld	a, e
	sub	a, l
	ld	c, a
	ld	a, d
	sbc	a, h
	ld	-10 (ix), c
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1702: u8 speed = 3; 
	ld	-8 (ix), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1703: if (g_Ball.ShotActive == 1) speed = 5; // Fast High Shot/Kick
	ld	a, -15 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00429$
	xor	a, a
00429$:
	ld	-7 (ix), a
	or	a, a
	jr	Z, 00115$
	ld	-8 (ix), #0x05
	jp	00116$
00115$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1704: else if (g_Ball.ShotActive == 2) speed = 3; // Slower Bounce
	ld	a, -15 (ix)
	sub	a, #0x02
	jr	NZ, 00112$
	ld	-8 (ix), #0x03
	jp	00116$
00112$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1705: else if (g_Ball.ShotActive == 3) speed = 2; // Rolling
	ld	a, -15 (ix)
	sub	a, #0x03
	jr	NZ, 00116$
	ld	-8 (ix), #0x02
00116$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1708: if (dx > -speed && dx < speed && dy > -speed && dy < speed) {
	ld	a, -8 (ix)
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
	xor	a, a
	sub	a, -6 (ix)
	ld	-4 (ix), a
	sbc	a, a
	sub	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -12 (ix)
	ld	-2 (ix), a
	ld	a, -11 (ix)
	ld	-1 (ix), a
	ld	a, -4 (ix)
	sub	a, -2 (ix)
	ld	a, -3 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00434$
	xor	a, #0x80
00434$:
	jp	P, 00152$
	ld	c, -8 (ix)
	ld	b, #0x00
	ld	a, -12 (ix)
	sub	a, c
	ld	a, -11 (ix)
	sbc	a, b
	jp	PO, 00435$
	xor	a, #0x80
00435$:
	jp	P, 00152$
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -4 (ix)
	sub	a, l
	ld	a, -3 (ix)
	sbc	a, h
	jp	PO, 00436$
	xor	a, #0x80
00436$:
	jp	P, 00152$
	ld	a, -10 (ix)
	sub	a, c
	ld	a, -9 (ix)
	sbc	a, b
	jp	PO, 00437$
	xor	a, #0x80
00437$:
	jp	P, 00152$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1712: if (isMovingToPlayer) {
	ld	a, -16 (ix)
	or	a, a
	jr	Z, 00149$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1714: PutBallOnPlayerFeet(g_Ball.PassTargetPlayerId);
	ld	a, -17 (ix)
	call	_PutBallOnPlayerFeet
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1715: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1716: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1717: return;
	jp	00190$
00149$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1723: if (g_Ball.ShotActive == 1) {
	ld	a, -7 (ix)
	or	a, a
	jp	Z, 00146$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1727: bool isInsideField = (ty >= FIELD_BOUND_Y_TOP && ty <= FIELD_BOUND_Y_BOTTOM);
	ld	-2 (ix), e
	ld	-1 (ix), d
	ld	a, -2 (ix)
	sub	a, #0x32
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00192$
	ld	a, #0xae
	cp	a, -2 (ix)
	ld	a, #0x01
	sbc	a, -1 (ix)
	jp	PO, 00438$
	xor	a, #0x80
00438$:
	jp	P, 00193$
00192$:
	ld	-1 (ix), #0x00
	jp	00194$
00193$:
	ld	-1 (ix), #0x01
00194$:
	ld	a, -1 (ix)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1729: if (isInsideField) {
	or	a, a
	jp	Z, 00147$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1733: i16 totalVectorX = (i16)g_Ball.TargetX - (i16)g_Ball.PassStartX;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1734: i16 totalVectorY = (i16)g_Ball.TargetY - (i16)g_Ball.PassStartY;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1737: g_Ball.PassStartX = g_Ball.X;
	ld	hl, #(_g_Ball + 17)
	ld	a, -14 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -13 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1738: g_Ball.PassStartY = g_Ball.Y;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1741: i16 bounceDx = totalVectorX / 4; 
	ld	a, -4 (ix)
	ld	-7 (ix), a
	ld	a, -3 (ix)
	ld	-6 (ix), a
	ld	a, -7 (ix)
	ld	-4 (ix), a
	ld	a, -6 (ix)
	ld	-3 (ix), a
	bit	7, -6 (ix)
	jr	Z, 00195$
	ld	a, -7 (ix)
	add	a, #0x03
	ld	-4 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
00195$:
	sra	-3 (ix)
	rr	-4 (ix)
	sra	-3 (ix)
	rr	-4 (ix)
	ld	a, -4 (ix)
	ld	-10 (ix), a
	ld	a, -3 (ix)
	ld	-9 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1742: i16 bounceDy = totalVectorY / 4; 
	ld	a, -2 (ix)
	ld	-5 (ix), a
	ld	a, -1 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, -4 (ix)
	ld	-1 (ix), a
	bit	7, -4 (ix)
	jr	Z, 00196$
	ld	a, -5 (ix)
	add	a, #0x03
	ld	-2 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
00196$:
	sra	-1 (ix)
	rr	-2 (ix)
	sra	-1 (ix)
	rr	-2 (ix)
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1745: i16 newTx = (i16)g_Ball.X + bounceDx;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1746: i16 newTy = (i16)g_Ball.Y + bounceDy;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1749: if (newTx < FIELD_BOUND_X_LEFT) newTx = FIELD_BOUND_X_LEFT;
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
	jr	NC, 00120$
	ld	-6 (ix), #0x0a
	ld	-5 (ix), #0
	jp	00121$
00120$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1750: else if (newTx > FIELD_BOUND_X_RIGHT) newTx = FIELD_BOUND_X_RIGHT;
	ld	a, #0xf6
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00439$
	xor	a, #0x80
00439$:
	jp	P, 00121$
	ld	-6 (ix), #0xf6
	ld	-5 (ix), #0
00121$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1752: if (newTy < FIELD_BOUND_Y_TOP) newTy = FIELD_BOUND_Y_TOP;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	a, c
	sub	a, #0x32
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00125$
	ld	-4 (ix), #0x32
	ld	-3 (ix), #0
	jp	00126$
00125$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1753: else if (newTy > FIELD_BOUND_Y_BOTTOM) newTy = FIELD_BOUND_Y_BOTTOM;
	ld	a, #0xae
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	jp	PO, 00440$
	xor	a, #0x80
00440$:
	jp	P, 00126$
	ld	-4 (ix), #0xae
	ld	-3 (ix), #0x01
00126$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1755: g_Ball.TargetX = newTx;
	ld	hl, #(_g_Ball + 23)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1756: g_Ball.TargetY = newTy;
	ld	hl, #(_g_Ball + 25)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1759: g_Ball.PassTotalDist = (u16)(Math_Abs32(bounceDx) + Math_Abs32(bounceDy));
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1761: if (g_Ball.PassTotalDist > 5) {
	ld	a, #0x05
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	NC, 00147$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1762: g_Ball.ShotActive = 2; // Enter Bounce State
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x02
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1763: return; 
	jp	00190$
00146$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1766: } else if (g_Ball.ShotActive == 2) {
	ld	a, -15 (ix)
	sub	a, #0x02
	jp	NZ,00147$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1770: i16 vecX = (i16)g_Ball.TargetX - (i16)g_Ball.PassStartX;
	ld	bc, (#(_g_Ball + 23) + 0)
	ld	hl, (#(_g_Ball + 17) + 0)
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1771: i16 vecY = (i16)g_Ball.TargetY - (i16)g_Ball.PassStartY;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1773: g_Ball.PassStartX = g_Ball.X;
	ld	hl, #(_g_Ball + 17)
	ld	a, -14 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -13 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1774: g_Ball.PassStartY = g_Ball.Y;
	ld	de, (#_g_Ball + 0)
	ld	((_g_Ball + 19)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1777: i16 rollDx = vecX / 4; 
	ld	e, c
	ld	d, b
	bit	7, b
	jr	Z, 00197$
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
00197$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	-10 (ix), e
	ld	-9 (ix), d
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1778: i16 rollDy = vecY / 4; 
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
	bit	7, -3 (ix)
	jr	Z, 00198$
	ld	a, -4 (ix)
	add	a, #0x03
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
00198$:
	sra	-1 (ix)
	rr	-2 (ix)
	sra	-1 (ix)
	rr	-2 (ix)
	ld	a, -2 (ix)
	ld	-8 (ix), a
	ld	a, -1 (ix)
	ld	-7 (ix), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1783: i16 rollTx = (i16)g_Ball.X + rollDx;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1784: i16 rollTy = (i16)g_Ball.Y + rollDy;
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1787: if (rollTx < FIELD_BOUND_X_LEFT) rollTx = FIELD_BOUND_X_LEFT;
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
	jr	NC, 00134$
	ld	-6 (ix), #0x0a
	ld	-5 (ix), #0
	jp	00135$
00134$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1788: else if (rollTx > FIELD_BOUND_X_RIGHT) rollTx = FIELD_BOUND_X_RIGHT;
	ld	a, #0xf6
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00443$
	xor	a, #0x80
00443$:
	jp	P, 00135$
	ld	-6 (ix), #0xf6
	ld	-5 (ix), #0
00135$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1789: if (rollTy < FIELD_BOUND_Y_TOP) rollTy = FIELD_BOUND_Y_TOP;
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	a, c
	sub	a, #0x32
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00139$
	ld	-4 (ix), #0x32
	ld	-3 (ix), #0
	jp	00140$
00139$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1790: else if (rollTy > FIELD_BOUND_Y_BOTTOM) rollTy = FIELD_BOUND_Y_BOTTOM;
	ld	a, #0xae
	cp	a, c
	ld	a, #0x01
	sbc	a, b
	jp	PO, 00444$
	xor	a, #0x80
00444$:
	jp	P, 00140$
	ld	-4 (ix), #0xae
	ld	-3 (ix), #0x01
00140$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1792: g_Ball.TargetX = rollTx;
	ld	hl, #(_g_Ball + 23)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1793: g_Ball.TargetY = rollTy;
	ld	hl, #(_g_Ball + 25)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1794: g_Ball.PassTotalDist = (u16)(Math_Abs32(rollDx) + Math_Abs32(rollDy));
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1796: if (g_Ball.PassTotalDist > 2) {
	ld	a, #0x02
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00147$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1797: g_Ball.ShotActive = 3; // ROLLING
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x03
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1798: return;
	jp	00190$
00147$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1803: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1804: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1805: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1806: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1808: return;
	jp	00190$
00152$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1813: if (Math_Abs32(dx) > Math_Abs32(dy)) {
	ld	a, -12 (ix)
	ld	-24 (ix), a
	ld	a, -11 (ix)
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
	ld	a, -10 (ix)
	ld	-20 (ix), a
	ld	a, -9 (ix)
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
	ld	-16 (ix), e
	ld	-15 (ix), d
	ld	-14 (ix), l
	ld	-13 (ix), h
	pop	bc
	pop	hl
	ld	a, -16 (ix)
	sub	a, c
	ld	a, -15 (ix)
	sbc	a, b
	ld	a, -14 (ix)
	sbc	a, l
	ld	a, -13 (ix)
	sbc	a, h
	jp	PO, 00445$
	xor	a, #0x80
00445$:
	jp	P, 00161$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1814: g_Ball.X += (dx > 0 ? speed : -speed);
	ld	bc, (#(_g_Ball + 2) + 0)
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00446$
	xor	a, #0x80
00446$:
	jp	P, 00199$
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	jp	00200$
00199$:
	ld	e, -4 (ix)
	ld	d, -3 (ix)
00200$:
	ex	de, hl
	add	hl, bc
	ex	de, hl
	ld	((_g_Ball + 2)), de
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1815: if (dx != 0) g_Ball.Y += (dy * speed) / Math_Abs32(dx);
	ld	a, -11 (ix)
	or	a, -12 (ix)
	jp	Z, 00162$
	ld	bc, (#_g_Ball + 0)
	ld	e, -8 (ix)
	ld	d, #0x00
	push	bc
	ld	l, -10 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -9 (ix)
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
	jp	00162$
00161$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1817: g_Ball.Y += (dy > 0 ? speed : -speed);
	ld	de, #_g_Ball
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	c, -10 (ix)
	ld	b, -9 (ix)
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00447$
	xor	a, #0x80
00447$:
	jp	P, 00201$
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	jp	00202$
00201$:
	ld	l, -4 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
00202$:
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1818: if (dy != 0) g_Ball.X += (dx * speed) / Math_Abs32(dy);
	ld	a, -9 (ix)
	or	a, -10 (ix)
	jr	Z, 00162$
	ld	bc, (#(_g_Ball + 2) + 0)
	ld	e, -8 (ix)
	ld	d, #0x00
	push	bc
	ld	l, -12 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -11 (ix)
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
00162$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1822: i16 diffStartX = (i16)g_Ball.X - (i16)g_Ball.PassStartX;
	ld	bc, (#(_g_Ball + 2) + 0)
	ld	hl, (#_g_Ball + 17)
	ld	a, c
	sub	a, l
	ld	c, a
	ld	a, b
	sbc	a, h
	ld	b, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1823: i16 diffStartY = (i16)g_Ball.Y - (i16)g_Ball.PassStartY;
	ld	de, (#_g_Ball + 0)
	ld	hl, (#_g_Ball + 19)
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1824: u16 distCovered = (u16)(Math_Abs32(diffStartX) + Math_Abs32(diffStartY));
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
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1826: u16 totalDist = g_Ball.PassTotalDist;
	ld	hl, #_g_Ball + 21
	ld	a, (hl)
	ld	-4 (ix), a
	inc	hl
	ld	a, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1827: if (totalDist == 0) totalDist = 1; // Safety
	ld	-3 (ix), a
	or	a, -4 (ix)
	jr	NZ, 00167$
	ld	-4 (ix), #0x01
	ld	-3 (ix), #0
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1830: if (g_Ball.X < 0 || g_Ball.X > 255 || g_Ball.Y < 0 || g_Ball.Y > 211) {
00167$:
	ld	de, (#(_g_Ball + 2) + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1699: i16 dy = ty - (i16)g_Ball.Y;
	ld	hl, (#_g_Ball + 0)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1830: if (g_Ball.X < 0 || g_Ball.X > 255 || g_Ball.Y < 0 || g_Ball.Y > 211) {
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, #0xff
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	C, 00166$
	ld	a, #0xd3
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	ld	a, #0x00
	rla
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1833: if(g_Ball.Y > 230 || g_Ball.Y < 20) {
00166$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1839: if (g_Ball.ShotActive == 2) {
	ld	hl, #(_g_Ball + 27)
	ld	e, (hl)
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1716: g_Ball.Size = 1;
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1839: if (g_Ball.ShotActive == 2) {
	ld	a, e
	sub	a, #0x02
	jr	NZ, 00188$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1841: u16 ratio = (distCovered * 100) / totalDist;
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
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	call	__divuint
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1842: if (ratio < 20 || ratio > 80) g_Ball.Size = 2;
	ld	a, e
	sub	a, #0x14
	ld	a, d
	sbc	a, #0x00
	jr	C, 00170$
	ld	a, #0x50
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00171$
00170$:
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
	jp	00189$
00171$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1843: else g_Ball.Size = 3;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x03
	jp	00189$
00188$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1845: else if (g_Ball.ShotActive == 3) {
	ld	a, e
	sub	a, #0x03
	jr	NZ, 00185$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1847: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
	jp	00189$
00185$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1849: else if (g_Ball.ShotActive == 1) {
	dec	e
	jr	NZ, 00182$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1852: g_Ball.Size = 2;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
	jp	00189$
00182$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1862: if (totalDist > 40) {
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	a, #0x28
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00179$
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1863: u16 ratio = (distCovered * 100) / totalDist;
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
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	call	__divuint
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1864: if (ratio < 15 || ratio > 85) g_Ball.Size = 2;
	ld	a, e
	sub	a, #0x0f
	ld	a, d
	sbc	a, #0x00
	jr	C, 00174$
	ld	a, #0x55
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jr	NC, 00175$
00174$:
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
	jp	00189$
00175$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1865: else g_Ball.Size = 3;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x03
	jp	00189$
00179$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1867: g_Ball.Size = 2;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x02
00189$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1871: g_Ball.PreviousY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
00190$:
;E:\Dropbox\FAUSTO\SVILUPPI\MSX\CODE\C\MSXgl\projects\exsoccer/exsoccer_s2_b0.c:1872: }
	ld	sp, ix
	pop	ix
	ret
	.area _SEG2
	.area _INITIALIZER
__xinit__s_GkAnimTimer:
	.db #0x00	; 0
__xinit__s_GkAnimPlayerId:
	.db #0xff	; 255
__xinit__s_GkRecoilY:
	.db #0x00	;  0
	.area _CABS (ABS)
