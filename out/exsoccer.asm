;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (MINGW64)
;--------------------------------------------------------
	.module exsoccer
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _TickGoalCelebration
	.globl _DEBUG_INIT
	.globl _PerformShot
	.globl _PerformPass
	.globl _GetClosestPlayerToBall
	.globl _TickBallFlying
	.globl _TickGoalkeeperAnimation
	.globl _GetBestPassTarget
	.globl _UpdatePassTarget
	.globl _TickBallCollision
	.globl _TickAI
	.globl _TickCheckBallBoundaries
	.globl _ResetBallInfo
	.globl _GetPlayerIdByRole
	.globl _PutBallOnPlayerFeet
	.globl _ClearTextFromLayerA
	.globl _TickShowKickOff
	.globl _TimeUp
	.globl _ResetPlayersInfo
	.globl _IsTeamJoystickTriggerPressed
	.globl _GetJoystick2Direction
	.globl _GetJoystick1Direction
	.globl _TickPlayerToOwnTarget
	.globl _PutBallSprite
	.globl _UpdateSpritesPositions
	.globl _ShowHeaderInfo
	.globl _ShowFieldZone
	.globl _SetTeam2Palette
	.globl _SetTeam1Palette
	.globl _V9_PrintLayerAStringAtPos
	.globl _V9_PutLayerBTileAtPos
	.globl _V9_PutLayerATileAtPos
	.globl _InitPalette
	.globl _V9_Detect
	.globl _V9_SetScrollingBY
	.globl _V9_SetScrollingY
	.globl _V9_SetScreenMode
	.globl _V9_WriteVRAM_CurrentAddr
	.globl _V9_FillVRAM16_CurrentAddr
	.globl _V9_FillVRAM_CurrentAddr
	.globl _V9_SetWriteAddress
	.globl _V9_GetRegister
	.globl _V9_SetRegister16
	.globl _V9_SetRegister
	.globl _V9_SetPort
	.globl _Print_SetColor
	.globl _Print_DrawText
	.globl _Print_SetTextFont
	.globl _VDP_RegWriteBakMask
	.globl _VDP_SetMode
	.globl _VDP_ClearVRAM
	.globl _g_VSynch
	.globl _g_CornerKickTargetId
	.globl _g_CornerKickSide
	.globl _g_GoalScorerId
	.globl _g_FioBre
	.globl _g_ShotCursorDir
	.globl _g_ShotCursorX
	.globl _g_ActionCooldown
	.globl _g_GameLevel
	.globl _g_GameWith2Players
	.globl _g_PassTargetPlayer
	.globl _g_Team2ActivePlayer
	.globl _g_Team1ActivePlayer
	.globl _g_Timer
	.globl _g_FieldScrollSpeed
	.globl _g_MatchStatus
	.globl _g_PlayersPositioningPhaseCount
	.globl _g_FieldScrollingActionInProgress
	.globl _g_FieldCurrentYPosition
	.globl _g_SecondsToEndOfMatch
	.globl _g_RestartKickTeamId
	.globl _g_ActiveFieldZone
	.globl _g_Ball
	.globl _g_Players
	.globl _g_Team2Score
	.globl _g_Team1Score
	.globl _g_Team2PaletteId
	.globl _g_Team1PaletteId
	.globl _g_FrameCounter
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
	.globl _UpdateV9990
	.globl _InitVariables
	.globl _WaitV9990Synch
	.globl _LoadP1LayerA
	.globl _LoadP1LayerB
	.globl _V9_InterruptVBlank
	.globl _V9_InterruptHBlank
	.globl _V9_InterruptCommand
	.globl _GameStart
	.globl _SetTeamsPresentationSpritesPosition
	.globl _TickActiveFieldZone
	.globl _TickUpdateTime
	.globl _GetOffsideLineY
	.globl _BallInGoal
	.globl _BallThrowIn
	.globl _GoalKick
	.globl _CornerKick
	.globl _InitializeV9990
	.globl _LoadSprites
	.globl _TickTeamJoystick
	.globl _main
	.globl _MainGameLoop
	.globl _UpdatePlayerPatternByDirection
	.globl _GetNoMovingPlayerPatternId
	.globl _GetNewPoseByDirection
	.globl _GetPatternIdByPoseAndDirection
	.globl _SetPlayerTarget
	.globl _SetPlayerBallPossession
	.globl _TickCornerKick
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
_g_FrameCounter::
	.ds 2
_g_Team1PaletteId::
	.ds 1
_g_Team2PaletteId::
	.ds 1
_g_Team1Score::
	.ds 1
_g_Team2Score::
	.ds 1
_g_Players::
	.ds 255
_g_Ball::
	.ds 29
_g_ActiveFieldZone::
	.ds 1
_g_RestartKickTeamId::
	.ds 1
_g_SecondsToEndOfMatch::
	.ds 1
_TickCornerKick_joyMoved_131074_1690:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_FieldCurrentYPosition::
	.ds 2
_g_FieldScrollingActionInProgress::
	.ds 1
_g_PlayersPositioningPhaseCount::
	.ds 1
_g_MatchStatus::
	.ds 1
_g_FieldScrollSpeed::
	.ds 1
_g_Timer::
	.ds 1
_g_Team1ActivePlayer::
	.ds 1
_g_Team2ActivePlayer::
	.ds 1
_g_PassTargetPlayer::
	.ds 1
_g_GameWith2Players::
	.ds 1
_g_GameLevel::
	.ds 1
_g_ActionCooldown::
	.ds 1
_g_ShotCursorX::
	.ds 2
_g_ShotCursorDir::
	.ds 1
_g_FioBre::
	.ds 1
_g_GoalScorerId::
	.ds 1
_g_CornerKickSide::
	.ds 1
_g_CornerKickTargetId::
	.ds 1
_g_VSynch::
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
;./exsoccer.c:1644: static bool joyMoved = false;
	ld	iy, #_TickCornerKick_joyMoved_131074_1690
	ld	0 (iy), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;./exsoccer.c:58: void UpdateV9990()
;	---------------------------------
; Function UpdateV9990
; ---------------------------------
_UpdateV9990::
;./exsoccer.c:60: WaitV9990Synch();
;./exsoccer.c:61: }
	jp	_WaitV9990Synch
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
;./exsoccer.c:62: void InitVariables(){
;	---------------------------------
; Function InitVariables
; ---------------------------------
_InitVariables::
;./exsoccer.c:64: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:65: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;./exsoccer.c:66: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;./exsoccer.c:67: g_Ball.LastTouchTeamId = NO_VALUE;
	ld	hl, #(_g_Ball + 14)
	ld	(hl), #0xff
;./exsoccer.c:69: }
	ret
;./exsoccer.c:71: void WaitV9990Synch()
;	---------------------------------
; Function WaitV9990Synch
; ---------------------------------
_WaitV9990Synch::
;./exsoccer.c:73: while(!g_VSynch) {}
00101$:
	ld	a, (_g_VSynch+0)
	or	a, a
	jr	Z, 00101$
;./exsoccer.c:74: g_VSynch = FALSE;
	ld	hl, #_g_VSynch
	ld	(hl), #0x00
;./exsoccer.c:75: g_FrameCounter++;
	ld	hl, (_g_FrameCounter)
	inc	hl
;./exsoccer.c:76: if(g_FrameCounter==60){
	ld	(_g_FrameCounter), hl
	ld	a, l
	sub	a, #0x3c
	or	a, h
	ret	NZ
;./exsoccer.c:77: g_FrameCounter=0;
	ld	hl, #0x0000
	ld	(_g_FrameCounter), hl
;./exsoccer.c:79: }
	ret
;./exsoccer.c:83: void LoadP1LayerA(){
;	---------------------------------
; Function LoadP1LayerA
; ---------------------------------
_LoadP1LayerA::
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:353: inline void V9_FillVRAM(u32 addr, u8 value, u16 count) { V9_SetWriteAddress(addr); V9_FillVRAM_CurrentAddr(value, count); }
	ld	de, #0x0000
	ld	hl, #0x0000
	call	_V9_SetWriteAddress
	ld	de, #0x6a00
	xor	a, a
	call	_V9_FillVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0007
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:86: V9_WriteVRAM(V9_P1_PGT_A, g_GameFieldLayerATiles, sizeof(g_GameFieldLayerATiles)); // Load fonts
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x0000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_GameFieldLayerATiles
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:362: inline void V9_FillVRAM16(u32 addr, u16 value, u16 count) { V9_SetWriteAddress(addr); V9_FillVRAM16_CurrentAddr(value, count); }
	ld	de, #0xc000
	ld	hl, #0x0007
	call	_V9_SetWriteAddress
	ld	de, #0x1000
	ld	hl, #0x0000
	call	_V9_FillVRAM16_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:92: for (u8 x=0;x<64;x++){
	ld	c, #0x00
00132$:
	ld	a, c
	sub	a, #0x40
	jr	NC, 00101$
;./exsoccer.c:93: V9_PutLayerATileAtPos(x,0,32);
	push	bc
	ld	hl, #0x0020
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_V9_PutLayerATileAtPos
	pop	bc
;./exsoccer.c:92: for (u8 x=0;x<64;x++){
	inc	c
	jp	00132$
00101$:
;./exsoccer.c:95: for (u8 y=1;y<64;y++){
	ld	c, #0x01
00138$:
	ld	a, c
	sub	a, #0x40
	ret	NC
;./exsoccer.c:96: for (u8 x=0;x<64;x++){
	ld	b, #0x00
00135$:
	ld	a, b
	sub	a, #0x40
	jr	NC, 00139$
;./exsoccer.c:97: V9_PutLayerATileAtPos(x,y,0);
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_V9_PutLayerATileAtPos
	pop	bc
;./exsoccer.c:96: for (u8 x=0;x<64;x++){
	inc	b
	jp	00135$
00139$:
;./exsoccer.c:95: for (u8 y=1;y<64;y++){
	inc	c
;./exsoccer.c:101: }
	jp	00138$
;./exsoccer.c:104: void LoadP1LayerB(){
;	---------------------------------
; Function LoadP1LayerB
; ---------------------------------
_LoadP1LayerB::
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:353: inline void V9_FillVRAM(u32 addr, u8 value, u16 count) { V9_SetWriteAddress(addr); V9_FillVRAM_CurrentAddr(value, count); }
	ld	de, #0x0000
	ld	hl, #0x0004
	call	_V9_SetWriteAddress
	ld	de, #0x6a00
	xor	a, a
	call	_V9_FillVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0003
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:107: V9_WriteVRAM(V9_P1_PGT_B, g_GameFieldLayerBTiles_part1, sizeof(g_GameFieldLayerBTiles_part1)); // Load tiles (part 1)
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x0000
	ld	l, #0x04
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_GameFieldLayerBTiles_part1
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0004
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x4000
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_GameFieldLayerBTiles_part2
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0005
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:111: V9_WriteVRAM(V9_P1_PGT_B + 16384L*2, g_GameFieldLayerBTiles_part3, sizeof(g_GameFieldLayerBTiles_part3)); // Load tiles (part 3)
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x8000
	ld	l, #0x04
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_GameFieldLayerBTiles_part3
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0006
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:113: V9_WriteVRAM(V9_P1_PGT_B + 16384L*3, g_GameFieldLayerBTiles_part4, sizeof(g_GameFieldLayerBTiles_part4)); // Load tiles (part 4)
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xc000
	ld	l, #0x04
	call	_V9_SetWriteAddress
	ld	de, #0x3800
	ld	hl, #_g_GameFieldLayerBTiles_part4
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:362: inline void V9_FillVRAM16(u32 addr, u16 value, u16 count) { V9_SetWriteAddress(addr); V9_FillVRAM16_CurrentAddr(value, count); }
	ld	de, #0xe000
	ld	l, #0x07
	call	_V9_SetWriteAddress
	ld	de, #0x1000
	ld	hl, #0x0000
	call	_V9_FillVRAM16_CurrentAddr
;./exsoccer.c:116: u16 tileId=0;
	ld	bc, #0x0000
;./exsoccer.c:117: for (u8 y=0;y<64;y++){
	ld	e, #0x00
00173$:
	ld	a, e
	sub	a, #0x40
	ret	NC
;./exsoccer.c:118: for (u8 x=0;x<32;x++){
	ld	d, #0x00
00170$:
	ld	a, d
	sub	a, #0x20
	jr	NC, 00196$
;./exsoccer.c:119: V9_PutLayerBTileAtPos(x,y,tileId);
	push	bc
	push	de
	push	bc
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	call	_V9_PutLayerBTileAtPos
	pop	de
	pop	bc
;./exsoccer.c:120: tileId++;
	inc	bc
;./exsoccer.c:118: for (u8 x=0;x<32;x++){
	inc	d
	jp	00170$
00196$:
;./exsoccer.c:117: for (u8 y=0;y<64;y++){
	inc	e
;./exsoccer.c:123: }
	jp	00173$
;./exsoccer.c:126: void V9_InterruptVBlank()
;	---------------------------------
; Function V9_InterruptVBlank
; ---------------------------------
_V9_InterruptVBlank::
;./exsoccer.c:128: g_VSynch = TRUE;
	ld	iy, #_g_VSynch
	ld	0 (iy), #0x01
;./exsoccer.c:129: if (g_FieldScrollingActionInProgress != NO_VALUE) {
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	ret	Z
;./exsoccer.c:131: switch (g_FieldScrollingActionInProgress) {
	ld	a, (_g_FieldScrollingActionInProgress+0)
	or	a, a
	jr	Z, 00101$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	dec	a
	jr	Z, 00104$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	sub	a, #0x02
	jp	Z,00115$
	jp	00118$
;./exsoccer.c:132: case FIELD_NORTH_ZONE:
00101$:
;./exsoccer.c:133: g_FieldCurrentYPosition = g_FieldCurrentYPosition - g_FieldScrollSpeed;
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
;./exsoccer.c:134: if (g_FieldCurrentYPosition < 0) {
	ld	a, (_g_FieldCurrentYPosition+1)
	bit	7, a
	jp	Z, 00118$
;./exsoccer.c:135: g_FieldCurrentYPosition = 1;
	ld	hl, #0x0001
	ld	(_g_FieldCurrentYPosition), hl
;./exsoccer.c:136: g_FieldScrollingActionInProgress = NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;./exsoccer.c:137: g_ActiveFieldZone = FIELD_NORTH_ZONE;
	ld	iy, #_g_ActiveFieldZone
	ld	0 (iy), #0x00
;./exsoccer.c:139: break;
	jp	00118$
;./exsoccer.c:140: case FIELD_CENTRAL_ZONE:
00104$:
;./exsoccer.c:141: if (g_FieldCurrentYPosition != 136) {
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x88
	ld	iy, #_g_FieldCurrentYPosition
	or	a, 1 (iy)
	jr	Z, 00113$
;./exsoccer.c:133: g_FieldCurrentYPosition = g_FieldCurrentYPosition - g_FieldScrollSpeed;
	ld	a, (_g_FieldScrollSpeed+0)
	ld	c, a
	ld	b, #0x00
;./exsoccer.c:142: if (g_FieldCurrentYPosition > FIELD_CENTRAL_Y) {
	ld	a, #0x8c
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00178$
	xor	a, #0x80
00178$:
	jp	P, 00110$
;./exsoccer.c:143: g_FieldCurrentYPosition = g_FieldCurrentYPosition - g_FieldScrollSpeed;
	ld	hl, #_g_FieldCurrentYPosition
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	(hl), a
;./exsoccer.c:144: if(g_FieldCurrentYPosition < 136) g_FieldCurrentYPosition = 136;
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x88
	ld	a, (_g_FieldCurrentYPosition+1)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00118$
	ld	hl, #0x0088
	ld	(_g_FieldCurrentYPosition), hl
	jp	00118$
00110$:
;./exsoccer.c:147: g_FieldCurrentYPosition = g_FieldCurrentYPosition + g_FieldScrollSpeed;
	ld	hl, #_g_FieldCurrentYPosition
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;./exsoccer.c:148: if(g_FieldCurrentYPosition > 136) g_FieldCurrentYPosition = 136;
	ld	a, #0x88
	ld	iy, #_g_FieldCurrentYPosition
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00179$
	xor	a, #0x80
00179$:
	jp	P, 00118$
	ld	hl, #0x0088
	ld	(_g_FieldCurrentYPosition), hl
	jp	00118$
00113$:
;./exsoccer.c:153: g_FieldScrollingActionInProgress = NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;./exsoccer.c:154: g_ActiveFieldZone = FIELD_CENTRAL_ZONE;
	ld	iy, #_g_ActiveFieldZone
	ld	0 (iy), #0x01
;./exsoccer.c:156: break;
	jp	00118$
;./exsoccer.c:157: case FIELD_SOUTH_ZONE:
00115$:
;./exsoccer.c:158: g_FieldCurrentYPosition = g_FieldCurrentYPosition + g_FieldScrollSpeed;
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
;./exsoccer.c:159: if (g_FieldCurrentYPosition >= FIELD_BOTTOM_Y) {
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x18
	ld	a, (_g_FieldCurrentYPosition+1)
	rla
	ccf
	rra
	sbc	a, #0x81
	jr	C, 00118$
;./exsoccer.c:160: g_ActiveFieldZone = FIELD_SOUTH_ZONE;
	ld	hl, #_g_ActiveFieldZone
	ld	(hl), #0x02
;./exsoccer.c:161: g_FieldScrollingActionInProgress = NO_VALUE;
	ld	iy, #_g_FieldScrollingActionInProgress
	ld	0 (iy), #0xff
;./exsoccer.c:164: }
00118$:
;./exsoccer.c:165: V9_SetScrollingBY(g_FieldCurrentYPosition);
	ld	hl, (_g_FieldCurrentYPosition)
;./exsoccer.c:167: }
	jp	_V9_SetScrollingBY
;./exsoccer.c:170: void V9_InterruptHBlank()
;	---------------------------------
; Function V9_InterruptHBlank
; ---------------------------------
_V9_InterruptHBlank::
;./exsoccer.c:173: }
	ret
;./exsoccer.c:176: void V9_InterruptCommand()
;	---------------------------------
; Function V9_InterruptCommand
; ---------------------------------
_V9_InterruptCommand::
;./exsoccer.c:179: }
	ret
;./exsoccer.c:201: void GameStart(){
;	---------------------------------
; Function GameStart
; ---------------------------------
_GameStart::
;./exsoccer.c:202: g_FioBre=true;
	ld	hl, #_g_FioBre
	ld	(hl), #0x01
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;./exsoccer.c:204: g_SecondsToEndOfMatch=MATCH_DURATION;
	ld	hl, #_g_SecondsToEndOfMatch
	ld	(hl), #0x78
;./exsoccer.c:205: g_RestartKickTeamId=TEAM_1;
	ld	hl, #_g_RestartKickTeamId
	ld	(hl), #0x01
;./exsoccer.c:206: g_FieldScrollSpeed=FIELD_SCROLL_PRESENTATION_SPEED;
	ld	hl, #_g_FieldScrollSpeed
	ld	(hl), #0x01
;./exsoccer.c:207: g_FieldScrollingActionInProgress=NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;./exsoccer.c:208: g_FieldCurrentYPosition=FIELD_TOP_Y;
	ld	hl, #0x0001
	ld	(_g_FieldCurrentYPosition), hl
;./exsoccer.c:209: g_Team1Score=0;
	xor	a, a
	ld	(#_g_Team1Score), a
;./exsoccer.c:210: g_Team2Score=0;
	xor	a, a
	ld	(#_g_Team2Score), a
;./exsoccer.c:211: g_Team1PaletteId=TEAM_ITA;
	ld	a, #0x02
	ld	(#_g_Team1PaletteId), a
;./exsoccer.c:212: g_Team2PaletteId=TEAM_AUS;
	xor	a, a
	ld	(#_g_Team2PaletteId), a
;./exsoccer.c:213: V9_SetScrollingY(0);
	ld	l, h
	call	_V9_SetScrollingY
;./exsoccer.c:214: V9_SetScrollingBY(1);
	ld	hl, #0x0001
	call	_V9_SetScrollingBY
;./exsoccer.c:215: SetTeam1Palette();
	call	_SetTeam1Palette
;./exsoccer.c:216: SetTeam2Palette();
	call	_SetTeam2Palette
;./exsoccer.c:217: SetTeamsPresentationSpritesPosition();
	call	_SetTeamsPresentationSpritesPosition
;./exsoccer.c:218: ShowFieldZone(FIELD_CENTRAL_ZONE);
	ld	a, #0x01
	call	_ShowFieldZone
;./exsoccer.c:219: ShowHeaderInfo();
	call	_ShowHeaderInfo
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	res	7, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	7, l
	ld	a, #0x08
;./exsoccer.c:220: V9_SetDisplayEnable(TRUE);
;./exsoccer.c:221: }
	jp	_V9_SetRegister
;./exsoccer.c:222: void SetTeamsPresentationSpritesPosition(){
;	---------------------------------
; Function SetTeamsPresentationSpritesPosition
; ---------------------------------
_SetTeamsPresentationSpritesPosition::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;./exsoccer.c:223: g_MatchStatus=MATCH_NOT_STARTED;
	ld	hl, #_g_MatchStatus
;./exsoccer.c:224: for(u8 i=0;i<7;i++){
	ld	(hl), #0x00
	ld	c, (hl)
00120$:
	ld	a, c
	sub	a, #0x07
	jr	NC, 00101$
;./exsoccer.c:225: g_Players[i].Y=230;
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
	ex	(sp), hl
	pop	hl
	push	hl
	ld	(hl), #0xe6
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:226: g_Players[i].X=72+i*20;
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
;./exsoccer.c:227: g_Players[i].PatternId=PLAYER_POSE_FRONT;
	pop	hl
	push	hl
	ld	de, #0x0004
	add	hl, de
	ld	(hl), #0x10
;./exsoccer.c:228: g_Players[i].TeamId=TEAM_2;
	pop	hl
	push	hl
	ld	de, #0x0005
	add	hl, de
	ld	(hl), #0x02
;./exsoccer.c:224: for(u8 i=0;i<7;i++){
	inc	c
	jp	00120$
00101$:
;./exsoccer.c:231: for(u8 i=7;i<14;i++){
	ld	-1 (ix), #0x07
00123$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jr	NC, 00102$
;./exsoccer.c:232: g_Players[i].Y=250;
	ld	c, -1 (ix)
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
	ld	c,l
	ld	b,h
	ld	(hl), #0xfa
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:233: g_Players[i].X=72+(i-7)*20;
	ld	hl, #0x0002
	add	hl, bc
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	a, -1 (ix)
	ld	e, #0x00
	add	a, #0xf9
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	adc	a, #0xff
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #0x0048
	add	hl, de
	ex	de, hl
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;./exsoccer.c:234: g_Players[i].PatternId=PLAYER_POSE_BACK;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x11
;./exsoccer.c:235: g_Players[i].TeamId=TEAM_1;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x01
;./exsoccer.c:231: for(u8 i=7;i<14;i++){
	inc	-1 (ix)
	jp	00123$
00102$:
;./exsoccer.c:237: g_Players[REFEREE].Y=FIELD_POS_Y_CENTER;
	ld	hl, #0x00f3
	ld	((_g_Players + 238)), hl
;./exsoccer.c:238: g_Players[REFEREE].X=30;
	ld	l, #0x1e
	ld	((_g_Players + 240)), hl
;./exsoccer.c:239: g_Players[REFEREE].PatternId=PLAYER_POSE_RIGHT;
	ld	hl, #(_g_Players + 242)
	ld	(hl), #0x9d
;./exsoccer.c:240: g_Players[REFEREE].TeamId=REFEREE;
	ld	hl, #(_g_Players + 243)
	ld	(hl), #0x0e
;./exsoccer.c:241: g_Players[REFEREE].LastPose=0;
	ld	hl, #(_g_Players + 246)
	ld	(hl), #0x00
;./exsoccer.c:242: g_Players[REFEREE].Direction=DIRECTION_RIGHT;
	ld	hl, #(_g_Players + 244)
	ld	(hl), #0x03
;./exsoccer.c:243: g_Players[REFEREE].Role=NO_VALUE;
	ld	hl, #(_g_Players + 247)
	ld	(hl), #0xff
;./exsoccer.c:244: g_Players[REFEREE].Status=PLAYER_STATUS_NONE;
	ld	hl, #0x0000
	ld	((_g_Players + 252)), hl
;./exsoccer.c:245: ResetPlayersInfo();
	call	_ResetPlayersInfo
;./exsoccer.c:246: SetPlayerTarget(REFEREE); 
	ld	a, #0x0e
	call	_SetPlayerTarget
;./exsoccer.c:248: for(u8 i=0;i<14;i++){
	ld	c, #0x00
00126$:
	ld	a, c
	sub	a, #0x0e
	jp	NC, 00118$
;./exsoccer.c:249: g_Players[i].AiTickCounter=0;
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
	ld	hl, #0x0010
	add	hl, de
	ld	(hl), #0x00
;./exsoccer.c:250: switch(i){
	ld	a, #0x0d
	sub	a, c
	jr	C, 00127$
;./exsoccer.c:253: g_Players[i].Role=PLAYER_ROLE_GOALKEEPER;
	ld	hl, #0x0009
	add	hl, de
;./exsoccer.c:250: switch(i){
	push	hl
	ld	e, c
	ld	d, #0x00
	ld	hl, #00168$
	add	hl, de
	add	hl, de
	add	hl, de
	pop	de
	jp	(hl)
00168$:
	jp	00104$
	jp	00106$
	jp	00112$
	jp	00110$
	jp	00108$
	jp	00114$
	jp	00116$
	jp	00104$
	jp	00106$
	jp	00112$
	jp	00110$
	jp	00108$
	jp	00114$
	jp	00116$
;./exsoccer.c:252: case 7:
00104$:
;./exsoccer.c:253: g_Players[i].Role=PLAYER_ROLE_GOALKEEPER;
	xor	a, a
	ld	(de), a
;./exsoccer.c:254: break;
	jp	00127$
;./exsoccer.c:256: case 8:
00106$:
;./exsoccer.c:257: g_Players[i].Role=PLAYER_ROLE_LEFT_DEFENDER;
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:258: break;
	jp	00127$
;./exsoccer.c:260: case 11:
00108$:
;./exsoccer.c:261: g_Players[i].Role=PLAYER_ROLE_RIGHT_DEFENDER;
	ld	a, #0x02
	ld	(de), a
;./exsoccer.c:262: break;
	jp	00127$
;./exsoccer.c:264: case 10:
00110$:
;./exsoccer.c:265: g_Players[i].Role=PLAYER_ROLE_LEFT_HALFFIELDER;
	ld	a, #0x03
	ld	(de), a
;./exsoccer.c:266: break;
	jp	00127$
;./exsoccer.c:268: case 9:
00112$:
;./exsoccer.c:269: g_Players[i].Role=PLAYER_ROLE_RIGHT_HALFFIELDER;
	ld	a, #0x04
	ld	(de), a
;./exsoccer.c:270: break;
	jp	00127$
;./exsoccer.c:272: case 12:
00114$:
;./exsoccer.c:273: g_Players[i].Role=PLAYER_ROLE_LEFT_STRIKER;
	ld	a, #0x05
	ld	(de), a
;./exsoccer.c:274: break;
	jp	00127$
;./exsoccer.c:276: case 13:
00116$:
;./exsoccer.c:277: g_Players[i].Role=PLAYER_ROLE_RIGHT_STRIKER;
	ld	a, #0x06
	ld	(de), a
;./exsoccer.c:279: }
00127$:
;./exsoccer.c:248: for(u8 i=0;i<14;i++){
	inc	c
	jp	00126$
00118$:
;./exsoccer.c:282: g_Ball.X=FIELD_POS_X_CENTER;
	ld	hl, #0x0078
	ld	((_g_Ball + 2)), hl
;./exsoccer.c:283: g_Ball.Y=FIELD_POS_Y_CENTER;
	ld	l, #0xf3
	ld	(_g_Ball), hl
;./exsoccer.c:284: g_Ball.PreviousY=g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
;./exsoccer.c:285: ResetBallInfo(true);
	ld	a, #0x01
	call	_ResetBallInfo
;./exsoccer.c:287: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:290: void TickActiveFieldZone(){
;	---------------------------------
; Function TickActiveFieldZone
; ---------------------------------
_TickActiveFieldZone::
;./exsoccer.c:293: if (g_MatchStatus != MATCH_IN_ACTION) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	ret	NZ
;./exsoccer.c:295: if(g_ActiveFieldZone==FIELD_CENTRAL_ZONE){
	ld	a, (_g_ActiveFieldZone+0)
	dec	a
	jr	NZ, 00115$
;./exsoccer.c:296: if(g_Ball.Y<170){
	ld	hl, (#_g_Ball + 0)
	ld	de, #0x00aa
	cp	a, a
	sbc	hl, de
	jr	NC, 00104$
;./exsoccer.c:297: ShowFieldZone(FIELD_NORTH_ZONE);
	xor	a, a
	call	_ShowFieldZone
00104$:
;./exsoccer.c:299: if(g_Ball.Y>320){
	ld	hl, (#_g_Ball + 0)
	ld	a, #0x40
	cp	a, l
	ld	a, #0x01
	sbc	a, h
	jr	NC, 00116$
;./exsoccer.c:300: ShowFieldZone(FIELD_SOUTH_ZONE);
	ld	a, #0x02
	call	_ShowFieldZone
	jp	00116$
00115$:
;./exsoccer.c:304: if(g_ActiveFieldZone==FIELD_NORTH_ZONE){
	ld	a, (_g_ActiveFieldZone+0)
	or	a, a
	jr	NZ, 00112$
;./exsoccer.c:305: if(g_Ball.Y>190){
	ld	hl, (#_g_Ball + 0)
	ld	a, #0xbe
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00116$
;./exsoccer.c:306: ShowFieldZone(FIELD_CENTRAL_ZONE);
	ld	a, #0x01
	call	_ShowFieldZone
	jp	00116$
00112$:
;./exsoccer.c:310: if(g_Ball.Y<300){
	ld	hl, (#_g_Ball + 0)
	ld	de, #0x012c
	cp	a, a
	sbc	hl, de
	jr	NC, 00116$
;./exsoccer.c:311: ShowFieldZone(FIELD_CENTRAL_ZONE);
	ld	a, #0x01
	call	_ShowFieldZone
00116$:
;./exsoccer.c:315: g_Ball.PreviousY=g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
;./exsoccer.c:316: }
	ret
;./exsoccer.c:317: void TickUpdateTime(){
;	---------------------------------
; Function TickUpdateTime
; ---------------------------------
_TickUpdateTime::
;./exsoccer.c:318: if(g_MatchStatus==MATCH_IN_ACTION){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jr	NZ, 00106$
;./exsoccer.c:320: if(g_FrameCounter==58){
	ld	hl, (_g_FrameCounter)
	ld	a, l
	sub	a, #0x3a
	or	a, h
	jr	NZ, 00106$
;./exsoccer.c:321: g_SecondsToEndOfMatch--;
	ld	hl, #_g_SecondsToEndOfMatch
	dec	(hl)
;./exsoccer.c:322: ShowHeaderInfo();
	call	_ShowHeaderInfo
;./exsoccer.c:323: if(g_SecondsToEndOfMatch==0){
	ld	a, (_g_SecondsToEndOfMatch+0)
	or	a, a
	jr	NZ, 00106$
;./exsoccer.c:324: TimeUp();
	call	_TimeUp
00106$:
;./exsoccer.c:328: if(g_Timer!=NO_VALUE){
	ld	a, (_g_Timer+0)
	inc	a
	ret	Z
;./exsoccer.c:329: if(g_FrameCounter==58){
	ld	hl, (_g_FrameCounter)
	ld	a, l
	sub	a, #0x3a
	or	a, h
	ret	NZ
;./exsoccer.c:330: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
;./exsoccer.c:334: }
	ret
;./exsoccer.c:335: u16 GetOffsideLineY(u8 attackingTeamId) {
;	---------------------------------
; Function GetOffsideLineY
; ---------------------------------
_GetOffsideLineY::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
	ld	c, a
;./exsoccer.c:336: u8 defendingTeamId = (attackingTeamId == TEAM_1) ? TEAM_2 : TEAM_1;
	dec	c
	ld	a, #0x01
	jr	Z, 00207$
	xor	a, a
00207$:
	or	a, a
	jr	Z, 00132$
	ld	bc, #0x0002
	jp	00133$
00132$:
	ld	bc, #0x0001
00133$:
	ld	-4 (ix), c
;./exsoccer.c:339: if (attackingTeamId == TEAM_1) {
	or	a, a
	jp	Z, 00124$
;./exsoccer.c:341: u16 min1 = 0xFFFF;
	ld	bc, #0xffff
;./exsoccer.c:342: u16 min2 = 0xFFFF;
	ld	de, #0xffff
;./exsoccer.c:344: for(u8 i=0; i<14; i++){
	ld	-1 (ix), #0x00
00127$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jr	NC, 00109$
;./exsoccer.c:345: if(g_Players[i].TeamId != defendingTeamId) continue;
	push	de
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	ld	a, l
	add	a, #<(_g_Players)
	ld	-3 (ix), a
	ld	a, h
	adc	a, #>(_g_Players)
	ld	-2 (ix), a
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
;	spillPairReg hl
	ld	a,-4 (ix)
	sub	a,(hl)
	jr	NZ, 00108$
;./exsoccer.c:347: if (g_Players[i].Y < min1) {
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	sub	a, c
	ld	a, -2 (ix)
	sbc	a, b
	jr	NC, 00106$
;./exsoccer.c:348: min2 = min1;
	ld	e, c
	ld	d, b
;./exsoccer.c:349: min1 = g_Players[i].Y;
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	jp	00108$
00106$:
;./exsoccer.c:350: } else if (g_Players[i].Y < min2) {
	ld	a, -3 (ix)
	sub	a, e
	ld	a, -2 (ix)
	sbc	a, d
	jr	NC, 00108$
;./exsoccer.c:351: min2 = g_Players[i].Y;
	ld	e, -3 (ix)
	ld	d, -2 (ix)
00108$:
;./exsoccer.c:344: for(u8 i=0; i<14; i++){
	inc	-1 (ix)
	jp	00127$
00109$:
;./exsoccer.c:354: if (min2 == 0xFFFF) return FIELD_BOUND_Y_TOP; 
	ld	c, e
	ld	b, d
	ld	a, c
	and	a, b
	inc	a
	jr	NZ, 00125$
	ld	de, #0x0032
;./exsoccer.c:355: limitY = min2;
	jp	00130$
00124$:
;./exsoccer.c:359: u16 max1 = 0;
	ld	hl, #0x0000
	ex	(sp), hl
;./exsoccer.c:360: u16 max2 = 0;
	ld	de, #0x0000
;./exsoccer.c:361: for(u8 i=0; i<14; i++){
	ld	c, #0x00
00129$:
	ld	a, c
	sub	a, #0x0e
	jr	NC, 00120$
;./exsoccer.c:362: if(g_Players[i].TeamId != defendingTeamId) continue;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	a, l
	add	a, #<(_g_Players)
	ld	-2 (ix), a
	ld	a, h
	adc	a, #>(_g_Players)
	ld	-1 (ix), a
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,-4 (ix)
	sub	a,(hl)
	jr	NZ, 00119$
;./exsoccer.c:364: if (g_Players[i].Y > max1) {
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	b, (hl)
	inc	hl
	ld	l, (hl)
;	spillPairReg hl
	ld	a, -6 (ix)
	sub	a, b
	ld	a, -5 (ix)
	sbc	a, l
	jr	NC, 00117$
;./exsoccer.c:365: max2 = max1;
	pop	de
	push	de
;./exsoccer.c:366: max1 = g_Players[i].Y;
	ld	-6 (ix), b
	ld	-5 (ix), l
	jp	00119$
00117$:
;./exsoccer.c:367: } else if (g_Players[i].Y > max2) {
	ld	a, e
	sub	a, b
	ld	a, d
	sbc	a, l
	jr	NC, 00119$
;./exsoccer.c:368: max2 = g_Players[i].Y;
	ld	d, l
	ld	e, b
00119$:
;./exsoccer.c:361: for(u8 i=0; i<14; i++){
	inc	c
	jp	00129$
00120$:
;./exsoccer.c:371: if (max2 == 0) return FIELD_BOUND_Y_BOTTOM;
	ld	a, d
	or	a, e
	jr	NZ, 00122$
	ld	de, #0x01ae
	jp	00130$
00122$:
;./exsoccer.c:372: limitY = max2;
00125$:
;./exsoccer.c:374: return limitY;
00130$:
;./exsoccer.c:375: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:376: void BallInGoal(u8 teamScored){
;	---------------------------------
; Function BallInGoal
; ---------------------------------
_BallInGoal::
	ld	e, a
;./exsoccer.c:378: V9_PrintLayerAStringAtPos(12,18,"IN  GOAL");
	push	de
	ld	hl, #___str_0
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
	pop	de
;./exsoccer.c:380: g_GoalScorerId = g_Ball.PossessionPlayerId;
	ld	hl, #_g_Ball + 6
	ld	a, (hl)
;./exsoccer.c:381: if(g_GoalScorerId==NO_VALUE){
	ld	(_g_GoalScorerId+0), a
;./exsoccer.c:382: for(u8 i=0;i<14;i++){
	inc	a
	jr	NZ, 00107$
	ld	d,a
	ld	c, d
00114$:
	ld	a, c
	sub	a, #0x0e
	jr	NC, 00107$
;./exsoccer.c:383: if(g_Players[i].TeamId==teamScored){
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	iy, #_g_Players
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a, 5 (iy)
	sub	a, e
	jr	NZ, 00115$
;./exsoccer.c:384: if(g_Ball.LastTouchTeamId==teamScored ){
	ld	a, (#_g_Ball + 14)
	sub	a, e
	jr	NZ, 00115$
;./exsoccer.c:386: g_GoalScorerId=i; // This assumes index is consistent; probably player 0 or 7 (GK) shouldn't score often.
	ld	hl, #_g_GoalScorerId
	ld	(hl), d
;./exsoccer.c:387: break;
	jp	00107$
00115$:
;./exsoccer.c:382: for(u8 i=0;i<14;i++){
	inc	c
	ld	d, c
	jp	00114$
00107$:
;./exsoccer.c:381: if(g_GoalScorerId==NO_VALUE){
	ld	a, (_g_GoalScorerId+0)
	inc	a
	jr	NZ, 00109$
;./exsoccer.c:397: if (g_GoalScorerId == NO_VALUE) {
;./exsoccer.c:398: g_GoalScorerId = GetClosestPlayerToBall(teamScored, NO_VALUE);
	push	de
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, e
	call	_GetClosestPlayerToBall
	pop	de
	ld	(_g_GoalScorerId+0), a
00109$:
;./exsoccer.c:401: if(teamScored==TEAM_1){
	dec	e
	ld	a, #0x01
	jr	Z, 00175$
	xor	a, a
00175$:
	ld	c, a
	or	a, a
	jr	Z, 00111$
;./exsoccer.c:403: g_Ball.Y = FIELD_BOUND_Y_TOP - 20;
	ld	hl, #0x001e
	ld	(_g_Ball), hl
;./exsoccer.c:404: g_Team1Score++;
	ld	hl, #_g_Team1Score
	inc	(hl)
	jp	00112$
00111$:
;./exsoccer.c:408: g_Ball.Y = FIELD_BOUND_Y_BOTTOM + 20;
	ld	hl, #0x01c2
	ld	(_g_Ball), hl
;./exsoccer.c:409: g_Team2Score++;
	ld	hl, #_g_Team2Score
	inc	(hl)
00112$:
;./exsoccer.c:411: ShowHeaderInfo();
	push	bc
	call	_ShowHeaderInfo
	pop	bc
;./exsoccer.c:413: g_MatchStatus=MATCH_AFTER_IN_GOAL;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x06
;./exsoccer.c:414: g_RestartKickTeamId = (teamScored == TEAM_1) ? TEAM_2 : TEAM_1;
	ld	a, c
	or	a, a
	jr	Z, 00121$
	ld	a, #0x02
	ld	c, #0x00
	jp	00122$
00121$:
	ld	a, #0x01
	ld	c, #0x00
00122$:
	ld	(_g_RestartKickTeamId+0), a
;./exsoccer.c:415: g_Timer = 0; // Start timer for celebration/reset
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;./exsoccer.c:416: }
	ret
___str_0:
	.ascii "IN  GOAL"
	.db 0x00
;./exsoccer.c:417: void BallThrowIn(u8 teamId){
;	---------------------------------
; Function BallThrowIn
; ---------------------------------
_BallThrowIn::
	ld	c, a
;./exsoccer.c:419: V9_PrintLayerAStringAtPos(10,18,"THROW IN");
	push	bc
	ld	hl, #___str_1
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
	pop	bc
;./exsoccer.c:420: g_MatchStatus=MATCH_BEFORE_THROW_IN;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x03
;./exsoccer.c:421: g_RestartKickTeamId = teamId;
	ld	hl, #_g_RestartKickTeamId
	ld	(hl), c
;./exsoccer.c:422: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;./exsoccer.c:423: }
	ret
___str_1:
	.ascii "THROW IN"
	.db 0x00
;./exsoccer.c:424: void GoalKick(u8 teamId){
;	---------------------------------
; Function GoalKick
; ---------------------------------
_GoalKick::
	ld	c, a
;./exsoccer.c:426: V9_PrintLayerAStringAtPos(10,18,"GOAL KICK");
	push	bc
	ld	hl, #___str_2
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
	pop	bc
;./exsoccer.c:427: g_MatchStatus=MATCH_BEFORE_GOAL_KICK;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x05
;./exsoccer.c:428: g_RestartKickTeamId = teamId;
	ld	hl, #_g_RestartKickTeamId
	ld	(hl), c
;./exsoccer.c:429: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;./exsoccer.c:430: }
	ret
___str_2:
	.ascii "GOAL KICK"
	.db 0x00
;./exsoccer.c:431: void CornerKick(u8 teamId){
;	---------------------------------
; Function CornerKick
; ---------------------------------
_CornerKick::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-33
	add	hl, sp
	ld	sp, hl
	ld	-2 (ix), a
;./exsoccer.c:433: V9_PrintLayerAStringAtPos(18,18,"CORNER KICK");
	ld	hl, #___str_3
	push	hl
;	spillPairReg hl
;	spillPairReg hl
	ld	a,#0x12
	ld	l,a
	call	_V9_PrintLayerAStringAtPos
;./exsoccer.c:434: g_MatchStatus=MATCH_BEFORE_CORNER_KICK;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x02
;./exsoccer.c:435: g_RestartKickTeamId = teamId;
	ld	a, -2 (ix)
	ld	(_g_RestartKickTeamId+0), a
;./exsoccer.c:436: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;./exsoccer.c:439: if (g_Ball.X < FIELD_POS_X_CENTER) g_CornerKickSide = CORNER_SIDE_LEFT;
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
;./exsoccer.c:440: else g_CornerKickSide = CORNER_SIDE_RIGHT;
	ld	hl, #_g_CornerKickSide
	ld	(hl), #0x01
;./exsoccer.c:445: u16 kickX = (g_CornerKickSide == CORNER_SIDE_LEFT) ? FIELD_BOUND_X_LEFT : FIELD_BOUND_X_RIGHT;
	jp	00146$
;./exsoccer.c:440: else g_CornerKickSide = CORNER_SIDE_RIGHT;
00103$:
;./exsoccer.c:445: u16 kickX = (g_CornerKickSide == CORNER_SIDE_LEFT) ? FIELD_BOUND_X_LEFT : FIELD_BOUND_X_RIGHT;
	ld	de, #0x000a
	jp	00147$
00146$:
	ld	de, #0x00f6
00147$:
	ld	-23 (ix), e
	ld	-22 (ix), d
;./exsoccer.c:446: u16 kickY = (teamId == TEAM_1) ? FIELD_BOUND_Y_TOP : FIELD_BOUND_Y_BOTTOM;
	ld	a, -2 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00301$
	xor	a, a
00301$:
	ld	-3 (ix), a
	or	a, a
	jr	Z, 00148$
	ld	de, #0x0032
	jp	00149$
00148$:
	ld	de, #0x01ae
00149$:
	ld	-21 (ix), e
	ld	-20 (ix), d
;./exsoccer.c:450: if (g_CornerKickSide == CORNER_SIDE_LEFT) kickerId = GetPlayerIdByRole(teamId, PLAYER_ROLE_LEFT_STRIKER);
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00105$
	push	bc
	ld	l, #0x05
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	call	_GetPlayerIdByRole
	pop	bc
	ld	-19 (ix), a
	jp	00106$
00105$:
;./exsoccer.c:451: else kickerId = GetPlayerIdByRole(teamId, PLAYER_ROLE_RIGHT_STRIKER);
	push	bc
	ld	l, #0x06
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	call	_GetPlayerIdByRole
	pop	bc
	ld	-19 (ix), a
00106$:
;./exsoccer.c:454: SetPlayerBallPossession(kickerId); 
	push	bc
	ld	a, -19 (ix)
	call	_SetPlayerBallPossession
	pop	bc
;./exsoccer.c:455: g_Ball.PossessionPlayerId = kickerId; // Snap ball to him eventually
	ld	hl, #(_g_Ball + 6)
	ld	a, -19 (ix)
	ld	(hl), a
;./exsoccer.c:459: u8 cornerIdx = (teamId == TEAM_1 ? 0 : 2) + g_CornerKickSide;
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00150$
	ld	de, #0x0000
	jp	00151$
00150$:
	ld	de, #0x0002
00151$:
	ld	a, (_g_CornerKickSide+0)
	add	a, e
	ld	-1 (ix), a
;./exsoccer.c:460: const i8 ballOffsetX[4] = { 0, 0, 0, -30 };
	ld	hl, #2
	add	hl, sp
	ex	de, hl
	xor	a, a
	ld	(de), a
	ld	-30 (ix), #0x00
	ld	-29 (ix), #0x00
	ld	-28 (ix), #0xe2
;./exsoccer.c:461: const i8 ballOffsetY[4] = { 0, 0, 0, -5 };
	ld	-27 (ix), #0x00
	ld	-26 (ix), #0x00
	ld	-25 (ix), #0x00
	ld	-24 (ix), #0xfb
;./exsoccer.c:463: g_Ball.X = kickX + ballOffsetX[cornerIdx];
	ld	l, -1 (ix)
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
	ld	e, -23 (ix)
	ld	d, -22 (ix)
	add	hl, de
	ex	de, hl
	ld	((_g_Ball + 2)), de
;./exsoccer.c:464: g_Ball.Y = kickY + ballOffsetY[cornerIdx];
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	hl, #6
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
	ld	e, -21 (ix)
	ld	d, -20 (ix)
	add	hl, de
	ex	de, hl
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
;./exsoccer.c:465: g_Ball.PreviousY = g_Ball.Y;
	ld	((_g_Ball + 7)), de
;./exsoccer.c:469: bool attackingUp = (teamId == TEAM_1);
	ld	a, -3 (ix)
;./exsoccer.c:473: u16 yBoxInside     = (attackingUp) ? (FIELD_BOUND_Y_TOP + 40) : (FIELD_BOUND_Y_BOTTOM - 40);
	ld	-18 (ix), a
	or	a, a
	jr	Z, 00154$
	ld	bc, #0x005a
	jp	00155$
00154$:
	ld	bc, #0x0186
00155$:
	ld	-17 (ix), c
	ld	-16 (ix), b
;./exsoccer.c:474: u16 yBoxOutside    = (attackingUp) ? (FIELD_BOUND_Y_TOP + 90) : (FIELD_BOUND_Y_BOTTOM - 90);
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00156$
	ld	bc, #0x008c
	jp	00157$
00156$:
	ld	bc, #0x0154
00157$:
	ld	-15 (ix), c
	ld	-14 (ix), b
;./exsoccer.c:475: u16 yMidfieldAdv   = (attackingUp) ? (FIELD_BOUND_Y_TOP + 160) : (FIELD_BOUND_Y_BOTTOM - 160);
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00158$
	ld	bc, #0x00d2
	jp	00159$
00158$:
	ld	bc, #0x010e
00159$:
	ld	-13 (ix), c
	ld	-12 (ix), b
;./exsoccer.c:477: u16 ySafety        = (attackingUp) ? (FIELD_BOUND_Y_BOTTOM - 100) : (FIELD_BOUND_Y_TOP + 100);
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00160$
	ld	bc, #0x014a
	jp	00161$
00160$:
	ld	bc, #0x0096
00161$:
	ld	-11 (ix), c
	ld	-10 (ix), b
;./exsoccer.c:479: for(u8 i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00143$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00144$
;./exsoccer.c:480: g_Players[i].Status = PLAYER_STATUS_NONE;
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
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
	add	a, #0x0e
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
;./exsoccer.c:481: g_Players[i].TargetX = g_Players[i].X;
	ld	a, -4 (ix)
	add	a, #0x0c
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
;./exsoccer.c:482: g_Players[i].TargetY = g_Players[i].Y;
	ld	a, -4 (ix)
	add	a, #0x0a
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
;./exsoccer.c:484: u8 role = g_Players[i].Role;
	ld	a, -4 (ix)
	ld	-33 (ix), a
	ld	a, -3 (ix)
	ld	-32 (ix), a
	pop	hl
	push	hl
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	ld	-5 (ix), a
;./exsoccer.c:485: bool isAttacker = (g_Players[i].TeamId == teamId);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	a,-2 (ix)
	sub	a,(hl)
	ld	a, #0x01
	jr	Z, 00303$
	xor	a, a
00303$:
	ld	c, a
;./exsoccer.c:488: if (i == kickerId) {
	ld	a, -19 (ix)
	sub	a, -1 (ix)
	jr	NZ, 00108$
;./exsoccer.c:489: g_Players[i].TargetX = kickX;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, -23 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -22 (ix)
	ld	(hl), a
;./exsoccer.c:490: g_Players[i].TargetY = kickY;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -21 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -20 (ix)
	ld	(hl), a
;./exsoccer.c:491: continue;
	jp	00140$
00108$:
;./exsoccer.c:494: if (isAttacker) {
	ld	a, c
	or	a, a
	jp	Z, 00138$
;./exsoccer.c:496: if (role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00124$
;./exsoccer.c:498: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:499: g_Players[i].TargetY = (attackingUp) ? FIELD_BOUND_Y_BOTTOM - 20 : FIELD_BOUND_Y_TOP + 20;
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00162$
	ld	de, #0x019a
	jp	00163$
00162$:
	ld	de, #0x0046
00163$:
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00140$
00124$:
;./exsoccer.c:501: else if (role == PLAYER_ROLE_LEFT_DEFENDER || role == PLAYER_ROLE_RIGHT_DEFENDER) {
	ld	a, -5 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00307$
	xor	a, a
00307$:
	ld	c, a
	or	a, a
	jr	NZ, 00119$
	ld	a, -5 (ix)
	sub	a, #0x02
	jr	NZ, 00120$
00119$:
;./exsoccer.c:502: if (role == PLAYER_ROLE_LEFT_DEFENDER) {
	ld	a, c
	or	a, a
	jr	Z, 00110$
;./exsoccer.c:504: g_Players[i].TargetX = FIELD_POS_X_CENTER - 30;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:505: g_Players[i].TargetY = yMidfieldAdv;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
	jp	00140$
00110$:
;./exsoccer.c:508: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:509: g_Players[i].TargetY = ySafety;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
	jp	00140$
00120$:
;./exsoccer.c:512: else if (role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
	ld	a, -5 (ix)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00311$
	xor	a, a
00311$:
	ld	c, a
	or	a, a
	jr	NZ, 00115$
	ld	a, -5 (ix)
	sub	a, #0x04
	jr	NZ, 00116$
00115$:
;./exsoccer.c:513: if (role == PLAYER_ROLE_LEFT_HALFFIELDER) {
	ld	a, c
	or	a, a
	jr	Z, 00113$
;./exsoccer.c:515: g_Players[i].TargetX = FIELD_POS_X_CENTER - 50; 
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x46
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:516: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00140$
00113$:
;./exsoccer.c:519: g_Players[i].TargetX = FIELD_POS_X_CENTER + 30;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x96
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:520: g_Players[i].TargetY = yMidfieldAdv;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
	jp	00140$
00116$:
;./exsoccer.c:526: g_Players[i].TargetX = FIELD_POS_X_CENTER + 50;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0xaa
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:527: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00140$
00138$:
;./exsoccer.c:532: if (role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00135$
;./exsoccer.c:534: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:535: g_Players[i].TargetY = (attackingUp) ? FIELD_POS_Y_TEAM2_GOALKEEPER : FIELD_POS_Y_TEAM1_GOALKEEPER;
	ld	l, -7 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -18 (ix)
	or	a, a
	jr	Z, 00164$
	ld	de, #0x0032
	jp	00165$
00164$:
	ld	de, #0x01a8
00165$:
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00140$
00135$:
;./exsoccer.c:537: else if (role == PLAYER_ROLE_LEFT_DEFENDER || role == PLAYER_ROLE_RIGHT_DEFENDER) {
	ld	a, -5 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00315$
	xor	a, a
00315$:
	ld	c, a
	or	a, a
	jr	NZ, 00130$
	ld	a, -5 (ix)
	sub	a, #0x02
	jr	NZ, 00131$
00130$:
;./exsoccer.c:539: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_DEFENDER) ? FIELD_POS_X_CENTER - 20 : FIELD_POS_X_CENTER + 20;
	ld	a, c
	or	a, a
	ld	c, #0x64
	jr	NZ, 00167$
	ld	c, #0x8c
00167$:
	ld	b, #0x00
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:540: g_Players[i].TargetY = yBoxInside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -17 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -16 (ix)
	ld	(hl), a
	jp	00140$
00131$:
;./exsoccer.c:542: else if (role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
	ld	a, -5 (ix)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00319$
	xor	a, a
00319$:
	ld	c, a
	or	a, a
	jr	NZ, 00126$
	ld	a, -5 (ix)
	sub	a, #0x04
	jr	NZ, 00127$
00126$:
;./exsoccer.c:544: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_HALFFIELDER) ? FIELD_POS_X_CENTER - 40 : FIELD_POS_X_CENTER + 40;
	ld	a, c
	or	a, a
	ld	c, #0x50
	jr	NZ, 00169$
	ld	c, #0xa0
00169$:
	ld	b, #0x00
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:545: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00140$
00127$:
;./exsoccer.c:549: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_STRIKER) ? FIELD_POS_X_LEFT + 20 : FIELD_POS_X_RIGHT - 20;
	ld	a, -9 (ix)
	ld	-4 (ix), a
	ld	a, -8 (ix)
	ld	-3 (ix), a
	ld	a, -5 (ix)
	sub	a, #0x05
	ld	c, #0x3c
	jr	Z, 00171$
	ld	c, #0xb2
00171$:
	ld	b, #0x00
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:550: g_Players[i].TargetY = yMidfield;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0xf3
	inc	hl
	ld	(hl), #0x00
00140$:
;./exsoccer.c:479: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00143$
00144$:
;./exsoccer.c:554: }
	ld	sp, ix
	pop	ix
	ret
___str_3:
	.ascii "CORNER KICK"
	.db 0x00
;./exsoccer.c:555: void InitializeV9990()
;	---------------------------------
; Function InitializeV9990
; ---------------------------------
_InitializeV9990::
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:558: V9_SetScreenMode(V9_MODE_P1);
	xor	a, a
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
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:574: inline void V9_SetInterrupt(u8 flags) { V9_SetRegister(9, flags); }
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_V9_SetRegister
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:480: inline void V9_SetBackgroundColor(u8 color) { V9_SetRegister(15, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_V9_SetRegister
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
	res	7, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;./exsoccer.c:565: LoadSprites();
	call	_LoadSprites
;./exsoccer.c:566: InitPalette();
	call	_InitPalette
;./exsoccer.c:567: LoadP1LayerA();
	call	_LoadP1LayerA
;./exsoccer.c:568: LoadP1LayerB();
	call	_LoadP1LayerB
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:574: inline void V9_SetInterrupt(u8 flags) { V9_SetRegister(9, flags); }
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_V9_SetRegister
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:606: inline void V9_SetInterruptLine(u16 line) { V9_SetRegister16(10, line); }
	ld	de, #0x0047
	ld	a, #0x0a
	call	_V9_SetRegister16
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	res	7, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	7, l
	ld	a, #0x08
;./exsoccer.c:572: V9_SetDisplayEnable(TRUE);
;./exsoccer.c:574: }
	jp	_V9_SetRegister
;./exsoccer.c:577: void LoadSprites(){
;	---------------------------------
; Function LoadSprites
; ---------------------------------
_LoadSprites::
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0008
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:739: inline void V9_SetSpritePatternAddr(u8 addr) { V9_SetRegister(25, addr); }
	ld	l, #0x02
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x19
	call	_V9_SetRegister
;./exsoccer.c:581: V9_WriteVRAM(0x08000, g_Sprites1, sizeof(g_Sprites1));	
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x8000
	ld	hl, #0x0000
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_Sprites1
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0009
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:583: V9_WriteVRAM(0x08000+sizeof(g_Sprites1), g_Sprites2, sizeof(g_Sprites2));	
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xc000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_Sprites2
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:584: SET_BANK_SEGMENT(2, 1); 
;./exsoccer.c:585: }
	ret
;./exsoccer.c:586: void TickTeamJoystick(u8 teamId, u8 direction){
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
;./exsoccer.c:589: if (g_MatchStatus == MATCH_NOT_STARTED || 
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jp	Z,00261$
;./exsoccer.c:590: g_MatchStatus == MATCH_PLAYERS_PRESENTATION || 
;./exsoccer.c:591: g_MatchStatus == MATCH_AFTER_IN_GOAL) {
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0b
	jp	Z,00261$
	sub	a, #0x06
;./exsoccer.c:592: return;
	jp	Z,00261$
;./exsoccer.c:596: if(teamId==TEAM_1){
	ld	a, -1 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00703$
	xor	a, a
00703$:
	ld	-61 (ix), a
	or	a, a
	jr	Z, 00112$
;./exsoccer.c:597: if(g_Team1ActivePlayer==NO_VALUE){
	ld	a, (_g_Team1ActivePlayer+0)
	inc	a
	jp	Z,00261$
;./exsoccer.c:598: return;
	jp	00106$
00106$:
;./exsoccer.c:601: playerId=g_Team1ActivePlayer;
	ld	a, (_g_Team1ActivePlayer+0)
	ld	-3 (ix), a
	jp	00113$
00112$:
;./exsoccer.c:605: if(g_Team2ActivePlayer==NO_VALUE){
	ld	a, (_g_Team2ActivePlayer+0)
	inc	a
	jp	Z,00261$
;./exsoccer.c:606: return;
	jp	00109$
00109$:
;./exsoccer.c:609: playerId=g_Team2ActivePlayer;
	ld	a, (_g_Team2ActivePlayer+0)
	ld	-3 (ix), a
00113$:
;./exsoccer.c:615: bool frameTriggerPressed = IsTeamJoystickTriggerPressed(teamId);
	ld	a, -1 (ix)
	call	_IsTeamJoystickTriggerPressed
	ld	-60 (ix), a
;./exsoccer.c:618: bool canSwitch = false;
	ld	-4 (ix), #0x00
;./exsoccer.c:619: if (g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	a, (#(_g_Ball + 6) + 0)
	cp	a, #0xff
	jr	NZ, 00117$
;./exsoccer.c:620: canSwitch = true; // Always allow switch on loose ball
	ld	-4 (ix), #0x01
	jp	00118$
00117$:
;./exsoccer.c:622: u8 ballOwner = g_Ball.PossessionPlayerId;
	ld	e, a
;./exsoccer.c:623: if (g_Players[ballOwner].TeamId != teamId) {
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
	ld	a,-1 (ix)
	sub	a,(hl)
	jr	Z, 00118$
;./exsoccer.c:624: canSwitch = true;
	ld	-4 (ix), #0x01
00118$:
;./exsoccer.c:628: if (canSwitch) {
	ld	a, -4 (ix)
	or	a, a
	jp	Z, 00140$
;./exsoccer.c:631: bool forceSwitch = frameTriggerPressed;
	ld	a, -60 (ix)
	ld	-8 (ix), a
;./exsoccer.c:635: bool inputActive = (direction != DIRECTION_NONE);
	ld	a, -2 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	-4 (ix), a
	xor	a, #0x01
	ld	-4 (ix), a
;./exsoccer.c:637: if (!inputActive || forceSwitch) {
	or	a, a
	jr	Z, 00136$
	ld	a, -60 (ix)
	or	a, a
	jp	Z, 00140$
00136$:
;./exsoccer.c:639: u8 closestId = GetClosestPlayerToBall(teamId, NO_VALUE);
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_GetClosestPlayerToBall
;./exsoccer.c:642: if (closestId != NO_VALUE && g_Players[closestId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	-11 (ix), a
	inc	a
	jr	Z, 00120$
	ld	c, -11 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
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
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00120$
;./exsoccer.c:644: closestId = GetClosestPlayerToBall(teamId, closestId);
	ld	l, -11 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -1 (ix)
	call	_GetClosestPlayerToBall
	ld	-11 (ix), a
00120$:
;./exsoccer.c:647: if (closestId != playerId && closestId != NO_VALUE) {
	ld	a, -11 (ix)
	sub	a, -3 (ix)
	jp	Z,00140$
	ld	a, -11 (ix)
	inc	a
	jp	Z,00140$
;./exsoccer.c:649: if (forceSwitch) {
	ld	a, -8 (ix)
	or	a, a
	jr	Z, 00131$
;./exsoccer.c:651: if (teamId == TEAM_1) g_Team1ActivePlayer = closestId;
	ld	a, -61 (ix)
	or	a, a
	jr	Z, 00123$
	ld	a, -11 (ix)
	ld	(_g_Team1ActivePlayer+0), a
	jp	00124$
00123$:
;./exsoccer.c:652: else g_Team2ActivePlayer = closestId;
	ld	a, -11 (ix)
	ld	(_g_Team2ActivePlayer+0), a
00124$:
;./exsoccer.c:653: playerId = closestId; 
	ld	a, -11 (ix)
	ld	-3 (ix), a
;./exsoccer.c:656: frameTriggerPressed = false;
	ld	-60 (ix), #0x00
	jp	00140$
00131$:
;./exsoccer.c:661: u8 histThreshold = (g_Ball.PossessionPlayerId == NO_VALUE) ? 10 : 30;
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
;./exsoccer.c:664: u16 distX_Curr = (g_Players[playerId].X > g_Ball.X) ? (g_Players[playerId].X - g_Ball.X) : (g_Ball.X - g_Players[playerId].X);
	ld	c, -3 (ix)
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
;./exsoccer.c:665: u16 distY_Curr = (g_Players[playerId].Y > g_Ball.Y) ? (g_Players[playerId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[playerId].Y);
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
;./exsoccer.c:666: u16 distCurr = distX_Curr + distY_Curr;
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	add	hl, bc
	ld	-9 (ix), l
	ld	-8 (ix), h
;./exsoccer.c:668: u16 distX_New = (g_Players[closestId].X > g_Ball.X) ? (g_Players[closestId].X - g_Ball.X) : (g_Ball.X - g_Players[closestId].X);
	ld	c, -11 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
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
;./exsoccer.c:669: u16 distY_New = (g_Players[closestId].Y > g_Ball.Y) ? (g_Players[closestId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[closestId].Y);
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
;./exsoccer.c:670: u16 distNew = distX_New + distY_New;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	add	hl, bc
	ex	de, hl
;./exsoccer.c:672: if (distNew < (distCurr - histThreshold)) {
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
	jr	NC, 00140$
;./exsoccer.c:673: if (teamId == TEAM_1) g_Team1ActivePlayer = closestId;
	ld	a, -61 (ix)
	or	a, a
	jr	Z, 00126$
	ld	a, -11 (ix)
	ld	(_g_Team1ActivePlayer+0), a
	jp	00127$
00126$:
;./exsoccer.c:674: else g_Team2ActivePlayer = closestId;
	ld	a, -11 (ix)
	ld	(_g_Team2ActivePlayer+0), a
00127$:
;./exsoccer.c:675: playerId = closestId;
	ld	a, -11 (ix)
	ld	-3 (ix), a
00140$:
;./exsoccer.c:682: if (g_Players[playerId].Status == PLAYER_STATUS_POSITIONED) return;
	ld	bc, #_g_Players+0
	ld	e, -3 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	-15 (ix), l
	ld	-14 (ix), h
	ld	a, -15 (ix)
	add	a, #0x0e
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
	jp	00142$
00142$:
;./exsoccer.c:689: if (g_ActionCooldown > 0) frameTriggerPressed = false;
	ld	a, (_g_ActionCooldown+0)
	or	a, a
	jr	Z, 00144$
	ld	-60 (ix), #0x00
00144$:
;./exsoccer.c:692: if (frameTriggerPressed && g_Ball.PossessionPlayerId == NO_VALUE) {
	ld	a, -60 (ix)
	or	a, a
	jp	Z, 00151$
	ld	a, (#(_g_Ball + 6) + 0)
	inc	a
	jp	NZ,00151$
;./exsoccer.c:693: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
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
;./exsoccer.c:694: i16 dy = (i16)g_Players[playerId].Y - (i16)g_Ball.Y;
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
;./exsoccer.c:695: if (dx > -16 && dx < 16 && dy > -16 && dy < 16) {
	ld	a, #0xf0
	cp	a, -11 (ix)
	ld	a, #0xff
	sbc	a, -10 (ix)
	jp	PO, 00720$
	xor	a, #0x80
00720$:
	jp	P, 00151$
	ld	e, -11 (ix)
	ld	d, -10 (ix)
	ld	a, e
	sub	a, #0x10
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00151$
	ld	a, #0xf0
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	jp	PO, 00721$
	xor	a, #0x80
00721$:
	jp	P, 00151$
	ld	a, c
	sub	a, #0x10
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00151$
;./exsoccer.c:696: PutBallOnPlayerFeet(playerId);
	ld	a, -3 (ix)
	call	_PutBallOnPlayerFeet
00151$:
;./exsoccer.c:700: if(g_Ball.PossessionPlayerId==playerId){
	ld	hl, #(_g_Ball + 6)
	ld	a,-3 (ix)
	sub	a,(hl)
	jp	NZ,00259$
;./exsoccer.c:703: if (g_ActionCooldown > 0) return;
	ld	a, (_g_ActionCooldown+0)
	or	a, a
	jp	NZ,00261$
;./exsoccer.c:705: if (frameTriggerPressed) {
	ld	a, -60 (ix)
	or	a, a
	jp	Z, 00195$
;./exsoccer.c:709: if (g_MatchStatus == MATCH_IN_ACTION) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jp	NZ,00189$
;./exsoccer.c:710: bool isShooting = false;
	ld	-10 (ix), #0x00
;./exsoccer.c:717: u16 plY = g_Players[playerId].Y;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-8 (ix), a
;./exsoccer.c:718: u16 plX = g_Players[playerId].X;
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
;./exsoccer.c:722: if (plY >= FIELD_BOUND_Y_TOP && plY <= (FIELD_BOUND_Y_TOP + 120)) { 
	ld	a, -9 (ix)
	ld	-5 (ix), a
	ld	a, -8 (ix)
	ld	-4 (ix), a
;./exsoccer.c:720: if (teamId == TEAM_1) { // Attacking UP (Towards Top)
	ld	a, -61 (ix)
	or	a, a
	jr	Z, 00184$
;./exsoccer.c:722: if (plY >= FIELD_BOUND_Y_TOP && plY <= (FIELD_BOUND_Y_TOP + 120)) { 
	ld	a, -5 (ix)
	sub	a, #0x32
	ld	a, -4 (ix)
	sbc	a, #0x00
	jp	C, 00185$
	ld	a, #0xaa
	cp	a, -9 (ix)
	ld	a, #0x00
	sbc	a, -8 (ix)
	jp	C, 00185$
;./exsoccer.c:723: if (checkDir == DIRECTION_UP || checkDir == DIRECTION_UP_LEFT || checkDir == DIRECTION_UP_RIGHT) {
	ld	a, -2 (ix)
	dec	a
	jr	Z, 00162$
	ld	a, -2 (ix)
	sub	a, #0x08
	jr	Z, 00162$
	ld	a, -2 (ix)
	sub	a, #0x02
	jp	NZ,00185$
00162$:
;./exsoccer.c:726: bool allowed = true;
	ld	-4 (ix), #0x01
;./exsoccer.c:727: if (plY < (FIELD_BOUND_Y_TOP + 20)) {
	ld	a, -9 (ix)
	sub	a, #0x46
	ld	a, -8 (ix)
	sbc	a, #0x00
	jr	NC, 00159$
;./exsoccer.c:728: if (plX < (GOAL_X_MIN - 15) || plX > (GOAL_X_MAX + 15)) allowed = false;
	ld	a, -7 (ix)
	sub	a, #0x51
	ld	a, -6 (ix)
	sbc	a, #0x00
	jr	C, 00155$
	ld	a, #0x9f
	cp	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	jr	NC, 00159$
00155$:
	ld	-4 (ix), #0x00
00159$:
;./exsoccer.c:731: if (allowed) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00185$
;./exsoccer.c:732: isShooting = true;
	ld	-10 (ix), #0x01
;./exsoccer.c:733: PerformShot(g_ShotCursorX, FIELD_BOUND_Y_TOP - 10);
	ld	de, #0x0028
	ld	hl, (_g_ShotCursorX)
	call	_PerformShot
	jp	00185$
00184$:
;./exsoccer.c:739: if (plY <= FIELD_BOUND_Y_BOTTOM && plY >= (FIELD_BOUND_Y_BOTTOM - 120)) { 
	ld	a, #0xae
	cp	a, -5 (ix)
	ld	a, #0x01
	sbc	a, -4 (ix)
	jr	C, 00185$
	ld	a, -5 (ix)
	sub	a, #0x36
	ld	a, -4 (ix)
	sbc	a, #0x01
	jr	C, 00185$
;./exsoccer.c:740: if (checkDir == DIRECTION_DOWN || checkDir == DIRECTION_DOWN_LEFT || checkDir == DIRECTION_DOWN_RIGHT) {
	ld	a, -2 (ix)
	sub	a, #0x05
	jr	Z, 00176$
	ld	a, -2 (ix)
	sub	a, #0x06
	jr	Z, 00176$
	ld	a, -2 (ix)
	sub	a, #0x04
	jr	NZ, 00185$
00176$:
;./exsoccer.c:743: bool allowed = true;
	ld	e, #0x01
;./exsoccer.c:744: if (plY > (FIELD_BOUND_Y_BOTTOM - 20)) {
	ld	a, #0x9a
	cp	a, -5 (ix)
	ld	a, #0x01
	sbc	a, -4 (ix)
	jr	NC, 00173$
;./exsoccer.c:745: if (plX < (GOAL_X_MIN - 15) || plX > (GOAL_X_MAX + 15)) allowed = false;
	ld	a, -7 (ix)
	sub	a, #0x51
	ld	a, -6 (ix)
	sbc	a, #0x00
	jr	C, 00169$
	ld	a, #0x9f
	cp	a, -7 (ix)
	ld	a, #0x00
	sbc	a, -6 (ix)
	jr	NC, 00173$
00169$:
	ld	e, #0x00
00173$:
;./exsoccer.c:748: if (allowed) {
	ld	a, e
	or	a, a
	jr	Z, 00185$
;./exsoccer.c:749: isShooting = true;
	ld	-10 (ix), #0x01
;./exsoccer.c:750: PerformShot(g_ShotCursorX, FIELD_BOUND_Y_BOTTOM + 10);
	ld	de, #0x01b8
	ld	hl, (_g_ShotCursorX)
	call	_PerformShot
00185$:
;./exsoccer.c:756: if (isShooting) {
	ld	a, -10 (ix)
	or	a, a
	jr	Z, 00189$
;./exsoccer.c:757: g_ActionCooldown = 20;
	ld	hl, #_g_ActionCooldown
	ld	(hl), #0x14
;./exsoccer.c:758: return;
	jp	00261$
00189$:
;./exsoccer.c:767: if(direction != DIRECTION_NONE){
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00191$
;./exsoccer.c:768: g_Players[playerId].Direction = direction;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x0006
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
00191$:
;./exsoccer.c:772: g_PassTargetPlayer = GetBestPassTarget(playerId);
	ld	a, -3 (ix)
	call	_GetBestPassTarget
;./exsoccer.c:774: if (g_PassTargetPlayer != NO_VALUE) {
	ld	(_g_PassTargetPlayer+0), a
	inc	a
	jr	Z, 00195$
;./exsoccer.c:776: PerformPass(g_PassTargetPlayer);
	ld	a, (_g_PassTargetPlayer+0)
	call	_PerformPass
;./exsoccer.c:779: return; 
	jp	00261$
00195$:
;./exsoccer.c:783: if((g_FrameCounter % 4)!=0){ 
	ld	hl, (_g_FrameCounter)
	ld	a, l
	and	a, #0x03
;./exsoccer.c:784: return;
	jp	NZ,00261$
;./exsoccer.c:787: if(g_Ball.KickMoveState==NO_VALUE){
	ld	bc, #_g_Ball + 13
	ld	a, (bc)
;./exsoccer.c:788: g_Ball.KickMoveState=0;
	inc	a
	jr	NZ, 00199$
	ld	(bc), a
00199$:
;./exsoccer.c:791: u8 moveDir = direction;
	ld	a, -2 (ix)
	ld	-11 (ix), a
;./exsoccer.c:792: if(g_Ball.KickMoveState != 0){
	ld	a, (bc)
	or	a, a
	jr	Z, 00201$
;./exsoccer.c:793: moveDir = g_Players[playerId].Direction;
	ld	e, -15 (ix)
	ld	d, -14 (ix)
	ld	hl, #6
	add	hl, de
	ld	a, (hl)
	ld	-11 (ix), a
00201$:
;./exsoccer.c:799: if(g_Players[playerId].PreviousDirection!=DIRECTION_NONE){
	ld	a, -15 (ix)
	add	a, #0x07
	ld	-10 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-9 (ix), a
;./exsoccer.c:796: if(moveDir==DIRECTION_NONE){
	ld	a, -11 (ix)
	or	a, a
	jr	NZ, 00216$
;./exsoccer.c:797: g_Players[playerId].Status=PLAYER_STATUS_POSITIONED;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:798: PutBallOnPlayerFeet(playerId);
	push	bc
	ld	a, -3 (ix)
	call	_PutBallOnPlayerFeet
	pop	bc
;./exsoccer.c:799: if(g_Players[playerId].PreviousDirection!=DIRECTION_NONE){
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	e, (hl)
	ld	a, e
	or	a, a
	jr	Z, 00203$
;./exsoccer.c:800: g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
	ld	a, -15 (ix)
	add	a, #0x04
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
00203$:
;./exsoccer.c:802: g_Ball.KickMoveState=0;
	xor	a, a
	ld	(bc), a
	jp	00261$
00216$:
;./exsoccer.c:808: const u8 BallBaseDistX[] = { 0, 0, 4, 6, 4, 0, 4, 6, 4 };
	ld	-59 (ix), #0x00
	ld	-58 (ix), #0x00
	ld	-57 (ix), #0x04
	ld	-56 (ix), #0x06
	ld	-55 (ix), #0x04
	ld	-54 (ix), #0x00
	ld	-53 (ix), #0x04
	ld	-52 (ix), #0x06
	ld	-51 (ix), #0x04
;./exsoccer.c:809: const u8 BallBaseDistY[] = { 0, 6, 4, 0, 4, 6, 4, 0, 4 };
	ld	-50 (ix), #0x00
	ld	-49 (ix), #0x06
	ld	-48 (ix), #0x04
	ld	-47 (ix), #0x00
	ld	-46 (ix), #0x04
	ld	-45 (ix), #0x06
	ld	-44 (ix), #0x04
	ld	-43 (ix), #0x00
	ld	-42 (ix), #0x04
;./exsoccer.c:828: const i8 BallAlignCorrectX[] = { 0, 0, 0, 0, 2, 0, -2, 0, 0 };
	ld	-41 (ix), #0x00
	ld	-40 (ix), #0x00
	ld	-39 (ix), #0x00
	ld	-38 (ix), #0x00
	ld	-37 (ix), #0x02
	ld	-36 (ix), #0x00
	ld	-35 (ix), #0xfe
	ld	-34 (ix), #0x00
	ld	-33 (ix), #0x00
;./exsoccer.c:829: const i8 BallAlignCorrectY[] = { 0, 0, 0, 8, 2, -2, 2, 8, 0 };
	ld	-32 (ix), #0x00
	ld	-31 (ix), #0x00
	ld	-30 (ix), #0x00
	ld	-29 (ix), #0x08
	ld	-28 (ix), #0x02
	ld	-27 (ix), #0xfe
	ld	-26 (ix), #0x02
	ld	-25 (ix), #0x08
	ld	-24 (ix), #0x00
;./exsoccer.c:831: const u8 DribbleAnimOffsets[] = {5, 4, 2, 0};
	ld	-23 (ix), #0x05
	ld	-22 (ix), #0x04
	ld	-21 (ix), #0x02
	ld	-20 (ix), #0x00
;./exsoccer.c:832: const u8 DribbleAnimOffsetsDiag[] = {3, 3, 1, 0};
	ld	-19 (ix), #0x03
	ld	-18 (ix), #0x03
	ld	-17 (ix), #0x01
	ld	-16 (ix), #0x00
;./exsoccer.c:834: u8 animStep = g_Ball.KickMoveState;
	ld	a, (bc)
	ld	e, a
;./exsoccer.c:835: u8 diagStep = (animStep % 2) ? 1 : 2;
	bit	0, e
	jr	Z, 00273$
	ld	hl, #0x0001
	jp	00274$
00273$:
	ld	hl, #0x0002
00274$:
	ld	-8 (ix), l
;./exsoccer.c:837: u8 currentOffset = DribbleAnimOffsets[animStep];
	push	de
	ld	d, #0x00
	ld	hl, #40
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	-7 (ix), a
;./exsoccer.c:838: u8 currentOffsetDiag = DribbleAnimOffsetsDiag[animStep];
	ld	d, #0x00
	ld	hl, #42
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ld	-6 (ix), a
;./exsoccer.c:840: u8 distX = BallBaseDistX[moveDir] + ((moveDir==DIRECTION_UP || moveDir==DIRECTION_DOWN) ? 0 : (moveDir == DIRECTION_LEFT || moveDir == DIRECTION_RIGHT ? currentOffset : currentOffsetDiag));
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #2
	add	hl, sp
	add	hl, de
	ld	e, (hl)
	ld	a, -11 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00740$
	xor	a, a
00740$:
	ld	-5 (ix), a
	ld	a, -11 (ix)
	sub	a, #0x07
	ld	a, #0x01
	jr	Z, 00742$
	xor	a, a
00742$:
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
;./exsoccer.c:841: u8 distY = BallBaseDistY[moveDir] + ((moveDir==DIRECTION_LEFT || moveDir==DIRECTION_RIGHT) ? 0 : (moveDir == DIRECTION_UP || moveDir == DIRECTION_DOWN ? currentOffset : currentOffsetDiag));
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
;./exsoccer.c:693: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
	ld	a, -15 (ix)
	add	a, #0x02
	ld	-5 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;./exsoccer.c:843: switch(moveDir){
	ld	a, #0x08
	sub	a, -11 (ix)
	jp	C, 00212$
	ld	e, -11 (ix)
	ld	d, #0x00
	ld	hl, #00751$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00751$:
	jp	00212$
	jp	00204$
	jp	00208$
	jp	00207$
	jp	00210$
	jp	00205$
	jp	00211$
	jp	00206$
	jp	00209$
;./exsoccer.c:844: case DIRECTION_UP:
00204$:
;./exsoccer.c:845: g_Players[playerId].Y -= 2;
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
;./exsoccer.c:846: g_Ball.Y = g_Players[playerId].Y - distY + BallAlignCorrectY[moveDir];
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
;./exsoccer.c:847: g_Ball.X = g_Players[playerId].X + BallAlignCorrectX[moveDir];
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
;./exsoccer.c:848: break;
	jp	00212$
;./exsoccer.c:849: case DIRECTION_DOWN:
00205$:
;./exsoccer.c:850: g_Players[playerId].Y += 2;
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
;./exsoccer.c:851: g_Ball.Y = g_Players[playerId].Y + distY + BallAlignCorrectY[moveDir]+5;
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
;./exsoccer.c:852: g_Ball.X = g_Players[playerId].X + BallAlignCorrectX[moveDir];
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
;./exsoccer.c:853: break;
	jp	00212$
;./exsoccer.c:854: case DIRECTION_LEFT:
00206$:
;./exsoccer.c:855: g_Players[playerId].X -= 2;
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
;./exsoccer.c:856: g_Ball.X = g_Players[playerId].X - distX + BallAlignCorrectX[moveDir];
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
;./exsoccer.c:857: g_Ball.Y = g_Players[playerId].Y + BallAlignCorrectY[moveDir]-4;
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
;./exsoccer.c:858: break;
	jp	00212$
;./exsoccer.c:859: case DIRECTION_RIGHT:
00207$:
;./exsoccer.c:860: g_Players[playerId].X += 2;
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
;./exsoccer.c:861: g_Ball.X = g_Players[playerId].X + distX + BallAlignCorrectX[moveDir];
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
;./exsoccer.c:862: g_Ball.Y = g_Players[playerId].Y + BallAlignCorrectY[moveDir]-4;
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
;./exsoccer.c:863: break;
	jp	00212$
;./exsoccer.c:864: case DIRECTION_UP_RIGHT:
00208$:
;./exsoccer.c:865: g_Players[playerId].Y -= diagStep;
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
;./exsoccer.c:866: g_Players[playerId].X += diagStep;
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
;./exsoccer.c:867: g_Ball.Y = g_Players[playerId].Y - distY + BallAlignCorrectY[moveDir];
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
;./exsoccer.c:868: g_Ball.X = g_Players[playerId].X + distX + BallAlignCorrectX[moveDir];
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
;./exsoccer.c:869: break;
	jp	00212$
;./exsoccer.c:870: case DIRECTION_UP_LEFT:
00209$:
;./exsoccer.c:871: g_Players[playerId].Y -= diagStep;
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
;./exsoccer.c:872: g_Players[playerId].X -= diagStep;
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
;./exsoccer.c:873: g_Ball.Y = g_Players[playerId].Y - distY + BallAlignCorrectY[moveDir];
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
;./exsoccer.c:874: g_Ball.X = g_Players[playerId].X - distX + BallAlignCorrectX[moveDir];
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
;./exsoccer.c:875: break;
	jp	00212$
;./exsoccer.c:876: case DIRECTION_DOWN_RIGHT:
00210$:
;./exsoccer.c:877: g_Players[playerId].Y += diagStep;
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
;./exsoccer.c:878: g_Players[playerId].X += diagStep;
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
;./exsoccer.c:879: g_Ball.Y = g_Players[playerId].Y + distY + BallAlignCorrectY[moveDir];
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
;./exsoccer.c:880: g_Ball.X = g_Players[playerId].X + distX + BallAlignCorrectX[moveDir];
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
;./exsoccer.c:881: break;
	jp	00212$
;./exsoccer.c:882: case DIRECTION_DOWN_LEFT:
00211$:
;./exsoccer.c:883: g_Players[playerId].Y += diagStep;
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
;./exsoccer.c:884: g_Players[playerId].X -= diagStep;
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
;./exsoccer.c:885: g_Ball.Y = g_Players[playerId].Y + distY + BallAlignCorrectY[moveDir];
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
;./exsoccer.c:886: g_Ball.X = g_Players[playerId].X - distX + BallAlignCorrectX[moveDir];
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
;./exsoccer.c:888: }
00212$:
;./exsoccer.c:889: g_Players[playerId].TargetY=g_Players[playerId].Y;
	ld	a, -15 (ix)
	add	a, #0x0a
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
;./exsoccer.c:890: g_Players[playerId].TargetX=g_Players[playerId].X;
	ld	a, -15 (ix)
	add	a, #0x0c
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
;./exsoccer.c:891: g_Players[playerId].Status=PLAYER_STATUS_HAS_BALL; 
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:892: g_Players[playerId].Direction=moveDir;
	ld	a, -15 (ix)
	add	a, #0x06
	ld	e, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -11 (ix)
	ld	(de), a
;./exsoccer.c:894: g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
	ld	a, -15 (ix)
	add	a, #0x04
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
;./exsoccer.c:895: g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
	ld	a, (de)
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), a
;./exsoccer.c:897: g_Ball.Direction = moveDir;
	ld	hl, #(_g_Ball + 5)
	ld	a, -11 (ix)
	ld	(hl), a
;./exsoccer.c:899: g_Ball.KickMoveState++;
	ld	a, (bc)
	inc	a
	ld	e, a
	ld	(bc), a
;./exsoccer.c:900: if(g_Ball.KickMoveState>3){
	ld	a, #0x03
	sub	a, e
	jp	NC, 00261$
;./exsoccer.c:901: g_Ball.KickMoveState=0;
	xor	a, a
	ld	(bc), a
	jp	00261$
00259$:
;./exsoccer.c:908: if (frameTriggerPressed) {
	ld	a, -60 (ix)
	or	a, a
	jp	Z, 00237$
;./exsoccer.c:909: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
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
;./exsoccer.c:910: i16 dy = (i16)g_Players[playerId].Y - (i16)g_Ball.Y;
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
;./exsoccer.c:913: if (dx > -16 && dx < 16 && dy > -16 && dy < 16) {
	ld	a, #0xf0
	cp	a, c
	ld	a, #0xff
	sbc	a, b
	jp	PO, 00752$
	xor	a, #0x80
00752$:
	jp	P, 00237$
	ld	a, c
	sub	a, #0x10
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00237$
	ld	a, #0xf0
	cp	a, e
	ld	a, #0xff
	sbc	a, d
	jp	PO, 00753$
	xor	a, #0x80
00753$:
	jp	P, 00237$
	ld	a, e
	sub	a, #0x10
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00237$
;./exsoccer.c:924: if (dx < 0) slidePose = PLAYER_POSE_TACKLE_FROM_UP_LEFT;    // UP-LEFT -> Slides towards Bottom-Right?
	ld	a, b
	rlca
	and	a,#0x01
	ld	c, a
;./exsoccer.c:922: if (dy < 0) {
	bit	7, d
	jr	Z, 00225$
;./exsoccer.c:924: if (dx < 0) slidePose = PLAYER_POSE_TACKLE_FROM_UP_LEFT;    // UP-LEFT -> Slides towards Bottom-Right?
	ld	a, c
	or	a, a
	jr	Z, 00219$
	ld	b, #0x24
	jp	00226$
00219$:
;./exsoccer.c:925: else        slidePose = PLAYER_POSE_TACKLE_FROM_UP_RIGHT;   // UP-RIGHT -> Slides towards Bottom-Left?
	ld	b, #0xbb
	jp	00226$
00225$:
;./exsoccer.c:928: if (dx < 0) slidePose = PLAYER_POSE_TACKLE_FROM_DOWN_LEFT;  // DOWN-LEFT -> Slides towards Top-Right?
	ld	a, c
	or	a, a
	jr	Z, 00222$
	ld	b, #0x22
	jp	00226$
00222$:
;./exsoccer.c:929: else        slidePose = PLAYER_POSE_TACKLE_FROM_DOWN_RIGHT; // DOWN-RIGHT -> Slides towards Top-Left?
	ld	b, #0xbd
00226$:
;./exsoccer.c:932: if (slidePose != 0) {
	ld	a, b
	or	a, a
	jr	Z, 00228$
;./exsoccer.c:933: g_Players[playerId].PatternId = slidePose;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x0004
	add	hl, de
	ld	(hl), b
00228$:
;./exsoccer.c:937: PutBallOnPlayerFeet(playerId);
	push	bc
	ld	a, -3 (ix)
	call	_PutBallOnPlayerFeet
	pop	bc
;./exsoccer.c:939: if (slidePose != 0) {
	ld	a, b
	or	a, a
	jr	Z, 00230$
;./exsoccer.c:940: g_Players[playerId].Status = PLAYER_STATUS_POSITIONED; // Lock visual (Override HAS_BALL)
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00230$:
;./exsoccer.c:943: g_ActionCooldown = 15; // Set 15 frames cooldown to avoid immediate pass
	ld	hl, #_g_ActionCooldown
	ld	(hl), #0x0f
;./exsoccer.c:944: return;
	jp	00261$
00237$:
;./exsoccer.c:948: if((g_FrameCounter % 4)!=0){ 
	ld	hl, (_g_FrameCounter)
	ld	a, l
	and	a, #0x03
;./exsoccer.c:949: return;
	jp	NZ,00261$
;./exsoccer.c:693: i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
	ld	a, -15 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
;./exsoccer.c:952: switch(direction){
	ld	a, #0x08
	sub	a, -2 (ix)
	jp	C, 00248$
	ld	c, -2 (ix)
	ld	b, #0x00
	ld	hl, #00755$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00755$:
	jp	00248$
	jp	00240$
	jp	00244$
	jp	00243$
	jp	00246$
	jp	00241$
	jp	00247$
	jp	00242$
	jp	00245$
;./exsoccer.c:953: case DIRECTION_UP:
00240$:
;./exsoccer.c:954: g_Players[playerId].Y=g_Players[playerId].Y-2;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	dec	bc
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:955: break;
	jp	00248$
;./exsoccer.c:956: case DIRECTION_DOWN:
00241$:
;./exsoccer.c:957: g_Players[playerId].Y=g_Players[playerId].Y+2;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:958: break;
	jp	00248$
;./exsoccer.c:959: case DIRECTION_LEFT:
00242$:
;./exsoccer.c:960: g_Players[playerId].X=g_Players[playerId].X-2;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	dec	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:961: break;
	jp	00248$
;./exsoccer.c:962: case DIRECTION_RIGHT:
00243$:
;./exsoccer.c:963: g_Players[playerId].X=g_Players[playerId].X+2;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:964: break;
	jp	00248$
;./exsoccer.c:965: case DIRECTION_UP_RIGHT:
00244$:
;./exsoccer.c:966: g_Players[playerId].Y=g_Players[playerId].Y-2;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	dec	bc
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:967: g_Players[playerId].X=g_Players[playerId].X+2;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:968: break;
	jp	00248$
;./exsoccer.c:969: case DIRECTION_UP_LEFT:
00245$:
;./exsoccer.c:970: g_Players[playerId].Y=g_Players[playerId].Y-2;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	dec	bc
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:971: g_Players[playerId].X=g_Players[playerId].X-2;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	dec	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:972: break;
	jp	00248$
;./exsoccer.c:973: case DIRECTION_DOWN_RIGHT:
00246$:
;./exsoccer.c:974: g_Players[playerId].Y=g_Players[playerId].Y+2;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:975: g_Players[playerId].X=g_Players[playerId].X+2;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:976: break;
	jp	00248$
;./exsoccer.c:977: case DIRECTION_DOWN_LEFT:
00247$:
;./exsoccer.c:978: g_Players[playerId].Y=g_Players[playerId].Y+2;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:979: g_Players[playerId].X=g_Players[playerId].X-2;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	dec	bc
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:981: }
00248$:
;./exsoccer.c:984: if(g_Players[playerId].Y < FIELD_BOUND_Y_TOP) g_Players[playerId].Y = FIELD_BOUND_Y_TOP;
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
;./exsoccer.c:985: if(g_Players[playerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[playerId].Y = FIELD_BOUND_Y_BOTTOM;
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
;./exsoccer.c:987: g_Players[playerId].TargetY=g_Players[playerId].Y;
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
;./exsoccer.c:988: g_Players[playerId].TargetX=g_Players[playerId].X;
	ld	a, -15 (ix)
	add	a, #0x0c
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
;./exsoccer.c:799: if(g_Players[playerId].PreviousDirection!=DIRECTION_NONE){
	ld	a, -15 (ix)
	add	a, #0x07
	ld	-4 (ix), a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
;./exsoccer.c:989: if(direction==DIRECTION_NONE){
	ld	a, -2 (ix)
	or	a, a
	jr	NZ, 00256$
;./exsoccer.c:990: g_Players[playerId].Status=PLAYER_STATUS_POSITIONED;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:991: if(g_Players[playerId].PreviousDirection!=DIRECTION_NONE){
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, (hl)
	ld	-7 (ix), a
	or	a, a
	jr	Z, 00257$
;./exsoccer.c:992: g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
	ld	a, -15 (ix)
	add	a, #0x04
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
;./exsoccer.c:997: g_Players[playerId].Status=PLAYER_STATUS_NONE;
	ld	l, -13 (ix)
	ld	h, -12 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00257$:
;./exsoccer.c:1000: g_Players[playerId].Direction=direction;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	de, #0x0006
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
;./exsoccer.c:1001: g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
00261$:
;./exsoccer.c:1006: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:1007: void TickGoalCelebration(){
;	---------------------------------
; Function TickGoalCelebration
; ---------------------------------
_TickGoalCelebration::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-14
	add	hl, sp
	ld	sp, hl
;./exsoccer.c:1008: if(g_MatchStatus!=MATCH_AFTER_IN_GOAL) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x06
	jp	NZ,00182$
;./exsoccer.c:1010: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
;./exsoccer.c:1012: if((g_Timer % 10) < 5){
	ld	a, (_g_Timer+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x000a
	call	__modsint
	ld	a, e
	sub	a, #0x05
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00104$
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:480: inline void V9_SetBackgroundColor(u8 color) { V9_SetRegister(15, color); }
	ld	l, #0x08
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_V9_SetRegister
;./exsoccer.c:1013: V9_SetBackgroundColor(8); // Cyan/Flash
	jp	00105$
00104$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:480: inline void V9_SetBackgroundColor(u8 color) { V9_SetRegister(15, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_V9_SetRegister
;./exsoccer.c:1015: V9_SetBackgroundColor(1); // Default Blue
00105$:
;./exsoccer.c:1021: if (g_Timer < 120) {
	ld	a, (_g_Timer+0)
	sub	a, #0x78
	jp	NC, 00160$
;./exsoccer.c:1022: u8 scoringTeamId = (g_RestartKickTeamId == TEAM_1) ? TEAM_2 : TEAM_1;
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00184$
	ld	bc, #0x0002
	jp	00185$
00184$:
	ld	bc, #0x0001
00185$:
	ld	-14 (ix), c
;./exsoccer.c:1025: u16 limitY_Top = FIELD_BOUND_Y_TOP;
	ld	-13 (ix), #0x32
	xor	a, a
	ld	-12 (ix), a
;./exsoccer.c:1026: u16 limitY_Bottom = FIELD_BOUND_Y_BOTTOM;
	ld	-11 (ix), #0xae
	ld	-10 (ix), #0x01
;./exsoccer.c:1028: if (g_Ball.Y < FIELD_CENTRAL_Y) { // Top Goal
	ld	hl, #_g_Ball
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	sub	a, #0x8c
	ld	a, -1 (ix)
	sbc	a, #0x00
	jr	NC, 00107$
;./exsoccer.c:1029: limitY_Bottom = FIELD_BOUND_Y_TOP + 160; 
	ld	-11 (ix), #0xd2
	ld	-10 (ix), #0
	jp	00220$
00107$:
;./exsoccer.c:1031: limitY_Top = FIELD_BOUND_Y_BOTTOM - 160;
	ld	-13 (ix), #0x0e
	ld	-12 (ix), #0x01
;./exsoccer.c:1034: for(u8 i=0; i<15; i++){
00220$:
	ld	-1 (ix), #0x00
00178$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	NC, 00160$
;./exsoccer.c:1035: if(i == REFEREE) continue;
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	Z,00157$
;./exsoccer.c:1038: if (g_Players[i].TeamId == scoringTeamId) {
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
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	bc,#5
	add	hl,bc
	ld	c, (hl)
;./exsoccer.c:1046: g_Players[i].Direction = (rnd % 8) + 1; 
	ld	a, -9 (ix)
	add	a, #0x06
	ld	-3 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
;./exsoccer.c:1082: g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_BACK_1 : PLAYER_POSE_CELEBRATION_BACK_2;
	ld	a, -9 (ix)
	add	a, #0x04
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
;./exsoccer.c:1038: if (g_Players[i].TeamId == scoringTeamId) {
	ld	a, -14 (ix)
	sub	a, c
	jp	NZ,00155$
;./exsoccer.c:1042: if ((g_Timer % 19) == 0) {
	ld	a, (_g_Timer+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x0013
	call	__modsint
	ld	a, d
	or	a, e
	jr	NZ, 00112$
;./exsoccer.c:1045: u8 rnd = (g_Timer * 3) + (i * 37); 
	ld	a, (_g_Timer+0)
	ld	c, a
	add	a, a
	add	a, c
	ld	c, a
	ld	a, -1 (ix)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, e
	add	a, c
;./exsoccer.c:1046: g_Players[i].Direction = (rnd % 8) + 1; 
	and	a, #0x07
	inc	a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), a
00112$:
;./exsoccer.c:1049: u8 dir = g_Players[i].Direction;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
;./exsoccer.c:1052: bool movedNorth = false;
	ld	-4 (ix), #0x00
;./exsoccer.c:1054: if (dir == DIRECTION_UP || dir == DIRECTION_UP_LEFT || dir == DIRECTION_UP_RIGHT) {
	ld	a, -5 (ix)
	sub	a, #0x08
	ld	a, #0x01
	jr	Z, 00428$
	xor	a, a
00428$:
	ld	b, a
	ld	a, -5 (ix)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00430$
	xor	a, a
00430$:
	ld	c, a
	ld	a, -5 (ix)
	dec	a
	jr	Z, 00131$
	ld	a, b
	or	a,a
	jr	NZ, 00131$
	or	a,c
	jr	Z, 00132$
00131$:
;./exsoccer.c:1055: if (g_Players[i].Y > limitY_Top) g_Players[i].Y--;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, -13 (ix)
	sub	a, e
	ld	a, -12 (ix)
	sbc	a, d
	jr	NC, 00114$
	dec	de
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
00114$:
;./exsoccer.c:1056: movedNorth = true;
	ld	-4 (ix), #0x01
	jp	00133$
00132$:
;./exsoccer.c:1058: else if (dir == DIRECTION_DOWN || dir == DIRECTION_DOWN_LEFT || dir == DIRECTION_DOWN_RIGHT) {
	ld	a, -5 (ix)
	sub	a, #0x05
	jr	Z, 00126$
	ld	a, -5 (ix)
	sub	a, #0x06
	jr	Z, 00126$
	ld	a, -5 (ix)
	sub	a, #0x04
	jr	NZ, 00127$
00126$:
;./exsoccer.c:1059: if (g_Players[i].Y < limitY_Bottom) g_Players[i].Y++;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, -11 (ix)
	ld	a, d
	sbc	a, -10 (ix)
	jr	NC, 00133$
	inc	de
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00133$
00127$:
;./exsoccer.c:1061: else if (dir == DIRECTION_LEFT) {
	ld	a, -5 (ix)
	sub	a, #0x07
	jr	NZ, 00124$
;./exsoccer.c:1062: if (g_Players[i].X > FIELD_BOUND_X_LEFT) g_Players[i].X--;
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	-3 (ix), e
	ld	-2 (ix), d
	ld	a, #0x0a
	cp	a, -3 (ix)
	ld	a, #0x00
	sbc	a, -2 (ix)
	jr	NC, 00133$
	dec	de
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00133$
00124$:
;./exsoccer.c:1064: else if (dir == DIRECTION_RIGHT) {
	ld	a, -5 (ix)
	sub	a, #0x03
	jr	NZ, 00133$
;./exsoccer.c:1065: if (g_Players[i].X < FIELD_BOUND_X_RIGHT) g_Players[i].X++;
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	-3 (ix), e
	ld	-2 (ix), d
	ld	a, -3 (ix)
	sub	a, #0xf6
	ld	a, -2 (ix)
	sbc	a, #0x00
	jr	NC, 00133$
	inc	de
	ld	(hl), e
	inc	hl
	ld	(hl), d
00133$:
;./exsoccer.c:1069: if (dir == DIRECTION_UP_LEFT || dir == DIRECTION_DOWN_LEFT) {
	ld	a, b
	or	a, a
	jr	NZ, 00138$
	ld	a, -5 (ix)
	sub	a, #0x06
	jr	NZ, 00139$
00138$:
;./exsoccer.c:1070: if (g_Players[i].X > FIELD_BOUND_X_LEFT) g_Players[i].X--;
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	-3 (ix), e
	ld	-2 (ix), d
	ld	a, #0x0a
	cp	a, -3 (ix)
	ld	a, #0x00
	sbc	a, -2 (ix)
	jr	NC, 00139$
	dec	de
	ld	(hl), e
	inc	hl
	ld	(hl), d
00139$:
;./exsoccer.c:1072: if (dir == DIRECTION_UP_RIGHT || dir == DIRECTION_DOWN_RIGHT) {
	ld	a, c
	or	a, a
	jr	NZ, 00143$
	ld	a, -5 (ix)
	sub	a, #0x04
	jr	NZ, 00144$
00143$:
;./exsoccer.c:1073: if (g_Players[i].X < FIELD_BOUND_X_RIGHT) g_Players[i].X++;
	ld	l, -9 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -8 (ix)
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	e, c
	ld	d, b
	ld	a, e
	sub	a, #0xf6
	ld	a, d
	sbc	a, #0x00
	jr	NC, 00144$
	inc	bc
	ld	(hl), c
	inc	hl
	ld	(hl), b
00144$:
;./exsoccer.c:1078: bool animFrame1 = ((g_Timer / 8) % 2) == 0;
	ld	a, (_g_Timer+0)
	ld	e, a
	ld	d, #0x00
	ld	c, e
	ld	b, d
	bit	7, d
	jr	Z, 00186$
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
00186$:
	ld	-3 (ix), c
	ld	-2 (ix), b
	sra	-2 (ix)
	rr	-3 (ix)
	sra	-2 (ix)
	rr	-3 (ix)
	sra	-2 (ix)
	rr	-3 (ix)
	ld	de, #0x0002
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	ld	-3 (ix), e
	ld	-2 (ix), d
	ld	a, -3 (ix)
	or	a, a
	or	a, -2 (ix)
	ld	a, #0x01
	jr	Z, 00445$
	xor	a, a
00445$:
	ld	-2 (ix), a
;./exsoccer.c:1080: if (movedNorth) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00147$
;./exsoccer.c:1082: g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_BACK_1 : PLAYER_POSE_CELEBRATION_BACK_2;
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00187$
	ld	-3 (ix), #0x32
	ld	-2 (ix), #0
	jp	00188$
00187$:
	ld	-3 (ix), #0x33
	ld	-2 (ix), #0
00188$:
	ld	a, -3 (ix)
	ld	-2 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00157$
00147$:
;./exsoccer.c:1085: g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_FRONT_1 : PLAYER_POSE_CELEBRATION_FRONT_2;
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00189$
	ld	-3 (ix), #0x30
	ld	-2 (ix), #0
	jp	00190$
00189$:
	ld	-3 (ix), #0x31
	ld	-2 (ix), #0
00190$:
	ld	a, -3 (ix)
	ld	-2 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00157$
00155$:
;./exsoccer.c:1092: if (g_Players[i].Direction == DIRECTION_UP || 
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	dec	a
	jr	Z, 00149$
;./exsoccer.c:1093: g_Players[i].Direction == DIRECTION_UP_LEFT || 
	ld	a, -2 (ix)
	sub	a, #0x08
	jr	Z, 00149$
;./exsoccer.c:1094: g_Players[i].Direction == DIRECTION_UP_RIGHT) {
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	NZ, 00150$
00149$:
;./exsoccer.c:1095: g_Players[i].PatternId = PLAYER_POSE_BACK;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x11
	jp	00157$
00150$:
;./exsoccer.c:1097: g_Players[i].PatternId = PLAYER_POSE_FRONT;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x10
00157$:
;./exsoccer.c:1034: for(u8 i=0; i<15; i++){
	inc	-1 (ix)
	jp	00178$
00160$:
;./exsoccer.c:1103: if(g_Timer > 150){
	ld	a, #0x96
	ld	hl, #_g_Timer
	sub	a, (hl)
	jp	NC, 00182$
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:480: inline void V9_SetBackgroundColor(u8 color) { V9_SetRegister(15, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_V9_SetRegister
;./exsoccer.c:1105: ClearTextFromLayerA(12, 18, 8); // "IN  GOAL"
	ld	a, #0x08
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_ClearTextFromLayerA
;./exsoccer.c:1107: g_MatchStatus = MATCH_BEFORE_KICK_OFF;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x01
;./exsoccer.c:1108: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:1109: g_Ball.KickMoveState = 0;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0x00
;./exsoccer.c:1110: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;./exsoccer.c:1111: if(g_Team1ActivePlayer!=NO_VALUE) g_Players[g_Team1ActivePlayer].Status=PLAYER_STATUS_NONE;
	ld	a, (_g_Team1ActivePlayer+0)
	inc	a
	jr	Z, 00162$
	ld	bc, #_g_Players+0
	ld	de, (_g_Team1ActivePlayer)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	bc, #0x000e
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00162$:
;./exsoccer.c:1112: if(g_Team2ActivePlayer!=NO_VALUE) g_Players[g_Team2ActivePlayer].Status=PLAYER_STATUS_NONE;
	ld	a, (_g_Team2ActivePlayer+0)
	inc	a
	jr	Z, 00164$
	ld	bc, #_g_Players+0
	ld	de, (_g_Team2ActivePlayer)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	bc, #0x000e
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
00164$:
;./exsoccer.c:1113: g_Team1ActivePlayer=NO_VALUE;
	ld	hl, #_g_Team1ActivePlayer
	ld	(hl), #0xff
;./exsoccer.c:1114: g_Team2ActivePlayer=NO_VALUE;
	ld	hl, #_g_Team2ActivePlayer
	ld	(hl), #0xff
;./exsoccer.c:1116: g_Ball.X = FIELD_POS_X_CENTER;
	ld	hl, #0x0078
	ld	((_g_Ball + 2)), hl
;./exsoccer.c:1117: g_Ball.Y = FIELD_POS_Y_CENTER;
	ld	l, #0xf3
	ld	(_g_Ball), hl
;./exsoccer.c:1118: g_Ball.PreviousY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
;./exsoccer.c:1119: PutBallSprite();
	call	_PutBallSprite
;./exsoccer.c:1121: for(u8 i=0; i<15; i++){
	ld	de, #_g_Players
	ld	-1 (ix), #0x00
00180$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jr	NC, 00171$
;./exsoccer.c:1122: if(i==REFEREE || g_Players[i].TeamId==TEAM_1 || g_Players[i].TeamId==TEAM_2){
	ld	a, -1 (ix)
	sub	a, #0x0e
	ld	a, #0x01
	jr	Z, 00453$
	xor	a, a
00453$:
	ld	c, a
	or	a, a
	jr	NZ, 00167$
	push	de
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	pop	de
	ld	iy, #_g_Players
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a, 5 (iy)
	cp	a, #0x01
	jr	Z, 00167$
	sub	a, #0x02
	jr	NZ, 00181$
00167$:
;./exsoccer.c:1124: if (i==REFEREE) {
	ld	a, c
	or	a, a
	jr	Z, 00166$
;./exsoccer.c:1125: g_Players[i].Direction=DIRECTION_RIGHT;
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
	ld	a, e
	add	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, d
	adc	a, -4 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	bc, #0x0006
	add	hl, bc
	ld	(hl), #0x03
;./exsoccer.c:1126: g_Players[i].LastPose=0;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	bc, #0x0008
	add	hl, bc
	ld	(hl), #0x00
00166$:
;./exsoccer.c:1128: SetPlayerTarget(i); 
	push	de
	ld	a, -1 (ix)
	call	_SetPlayerTarget
	pop	de
00181$:
;./exsoccer.c:1121: for(u8 i=0; i<15; i++){
	inc	-1 (ix)
	jp	00180$
00171$:
;./exsoccer.c:1133: ShowFieldZone(FIELD_CENTRAL_ZONE);
	ld	a, #0x01
	call	_ShowFieldZone
00182$:
;./exsoccer.c:1135: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:1138: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./exsoccer.c:1140: DEBUG_INIT();
	call	_DEBUG_INIT
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:1142: InitVariables();
	call	_InitVariables
;./exsoccer.c:1143: V9_SetPort(V9_P15, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x6f
	call	_V9_SetPort
;./exsoccer.c:1145: VDP_SetMode(VDP_MODE_SCREEN0);
	xor	a, a
	call	_VDP_SetMode
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/vdp.h:712: inline void VDP_EnableVBlank(bool enable) { VDP_RegWriteBakMask(1, (u8)~R01_IE0, enable ? R01_IE0 : 0); }
	xor	a, a
	push	af
	inc	sp
	ld	l, #0xdf
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_VDP_RegWriteBakMask
;./exsoccer.c:1147: VDP_ClearVRAM();
	call	_VDP_ClearVRAM
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x000a
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:1154: Print_SetTextFont(g_Font_MGL_Sample6, 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_g_Font_MGL_Sample6
	call	_Print_SetTextFont
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:1156: Print_SetColor(15, 1);
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_Print_SetColor
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	ld	bc, #_g_PrintData + 5
	xor	a, a
	ld	(bc), a
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x00
;./exsoccer.c:1158: Print_DrawText("EX Soccer - 2026 Fausto Pracek");
	push	bc
	ld	hl, #___str_5
	call	_Print_DrawText
	pop	bc
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	xor	a, a
	ld	(bc), a
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x01
;./exsoccer.c:1160: Print_DrawText("fpracek@gmail.com");
	push	bc
	ld	hl, #___str_6
	call	_Print_DrawText
	pop	bc
;./exsoccer.c:1162: const c8* str = "V9990 not found!";
	ld	de, #___str_4
;./exsoccer.c:1163: bool v9990IsFound=V9_Detect();
	push	bc
	push	de
	call	_V9_Detect
	pop	de
	pop	bc
	ld	-1 (ix), a
;./exsoccer.c:1165: if (v9990IsFound){
	or	a, a
	jr	Z, 00102$
;./exsoccer.c:1166: str = "V9990 found!";
	ld	de, #___str_7
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	xor	a, a
	ld	(bc), a
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x07
;./exsoccer.c:1168: Print_DrawText("The game is running on V9990 monitor.");
	push	bc
	push	de
	ld	hl, #___str_8
	call	_Print_DrawText
	pop	de
	pop	bc
00102$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	xor	a, a
	ld	(bc), a
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x03
;./exsoccer.c:1171: Print_DrawText(str);
	ex	de, hl
	call	_Print_DrawText
;./exsoccer.c:1172: if(!v9990IsFound){
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00105$
00148$:
	jp	00148$
00105$:
;./exsoccer.c:1176: InitializeV9990();
	call	_InitializeV9990
;./exsoccer.c:1179: V9_SetPort(V9_P15, 0x10);
	ld	l, #0x10
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x6f
	call	_V9_SetPort
;./exsoccer.c:1181: GameStart();
	call	_GameStart
;./exsoccer.c:1182: MainGameLoop();
	call	_MainGameLoop
;./exsoccer.c:1186: }
	inc	sp
	pop	ix
	ret
___str_4:
	.ascii "V9990 not found!"
	.db 0x00
___str_5:
	.ascii "EX Soccer - 2026 Fausto Pracek"
	.db 0x00
___str_6:
	.ascii "fpracek@gmail.com"
	.db 0x00
___str_7:
	.ascii "V9990 found!"
	.db 0x00
___str_8:
	.ascii "The game is running on V9990 monitor."
	.db 0x00
;./exsoccer.c:1187: void MainGameLoop(){
;	---------------------------------
; Function MainGameLoop
; ---------------------------------
_MainGameLoop::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;./exsoccer.c:1188: u8 TickAiPlayerId=0;
	ld	-2 (ix), #0x00
;./exsoccer.c:1189: u8 AiTickSpeed=0;
	ld	-1 (ix), #0x00
00142$:
;./exsoccer.c:1191: UpdateV9990();
	call	_UpdateV9990
;./exsoccer.c:1193: if(g_MatchStatus==MATCH_NOT_STARTED && g_FieldScrollingActionInProgress==NO_VALUE && g_ActiveFieldZone==FIELD_CENTRAL_ZONE){
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jr	NZ, 00103$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00103$
	ld	a, (_g_ActiveFieldZone+0)
	dec	a
	jr	NZ, 00103$
;./exsoccer.c:1194: g_MatchStatus=MATCH_BEFORE_KICK_OFF;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x01
;./exsoccer.c:1195: for(u8 i=0;i<15;i++){
	ld	c, #0x00
00140$:
	ld	a, c
	sub	a, #0x0f
	jr	NC, 00101$
;./exsoccer.c:1196: SetPlayerTarget(i);
	push	bc
	ld	a, c
	call	_SetPlayerTarget
	pop	bc
;./exsoccer.c:1195: for(u8 i=0;i<15;i++){
	inc	c
	jp	00140$
00101$:
;./exsoccer.c:1198: TickPlayerToOwnTarget();
	call	_TickPlayerToOwnTarget
00103$:
;./exsoccer.c:1201: TickCornerKick(); // <<< Added Hook
	call	_TickCornerKick
;./exsoccer.c:1203: TickGoalCelebration();
	call	_TickGoalCelebration
;./exsoccer.c:1204: TickPlayerToOwnTarget();
	call	_TickPlayerToOwnTarget
;./exsoccer.c:1205: TickActiveFieldZone();
	call	_TickActiveFieldZone
;./exsoccer.c:1206: if(g_FieldScrollingActionInProgress==NO_VALUE){
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00119$
;./exsoccer.c:1208: if(g_MatchStatus == MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jr	Z, 00115$
	sub	a, #0x0d
	jr	NZ, 00119$
00115$:
;./exsoccer.c:1210: if(AiTickSpeed >= 2){ // Speed up AI cycle (was 5)
	ld	a, -1 (ix)
	sub	a, #0x02
	jr	C, 00119$
;./exsoccer.c:1211: AiTickSpeed=0;
	ld	-1 (ix), #0x00
;./exsoccer.c:1212: TickAI(REFEREE);
	ld	a, #0x0e
	call	_TickAI
;./exsoccer.c:1213: TickAI(TickAiPlayerId);
	ld	a, -2 (ix)
	call	_TickAI
;./exsoccer.c:1214: TickAiPlayerId++;
	inc	-2 (ix)
;./exsoccer.c:1215: if(TickAiPlayerId==14){ // Only iterate 0-13 (Players)
	ld	a, -2 (ix)
	sub	a, #0x0e
	jr	NZ, 00107$
;./exsoccer.c:1216: TickAiPlayerId=0;
	ld	-2 (ix), #0x00
00107$:
;./exsoccer.c:1220: if (g_Ball.PossessionPlayerId != NO_VALUE && g_Ball.PossessionPlayerId < 14) {
	ld	hl, #_g_Ball+6
	ld	c, (hl)
	ld	a, c
	inc	a
	jr	Z, 00119$
	ld	a, c
	sub	a, #0x0e
	jr	NC, 00119$
;./exsoccer.c:1222: if (g_Ball.PossessionPlayerId != TickAiPlayerId) {
	ld	a, -2 (ix)
	sub	a, c
	jr	Z, 00119$
;./exsoccer.c:1223: TickAI(g_Ball.PossessionPlayerId);
	ld	a, c
	call	_TickAI
00119$:
;./exsoccer.c:1231: UpdateSpritesPositions();
	call	_UpdateSpritesPositions
;./exsoccer.c:1232: TickUpdateTime();
	call	_TickUpdateTime
;./exsoccer.c:1233: TickShowKickOff();
	call	_TickShowKickOff
;./exsoccer.c:1234: if(g_FieldScrollingActionInProgress==NO_VALUE){
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00121$
;./exsoccer.c:1235: TickBallCollision();
	call	_TickBallCollision
;./exsoccer.c:1236: TickBallFlying();
	call	_TickBallFlying
;./exsoccer.c:1237: UpdatePassTarget();
	call	_UpdatePassTarget
;./exsoccer.c:1238: TickGoalkeeperAnimation();
	call	_TickGoalkeeperAnimation
00121$:
;./exsoccer.c:1241: TickCheckBallBoundaries();
	call	_TickCheckBallBoundaries
;./exsoccer.c:1242: TickTeamJoystick(TEAM_1,GetJoystick1Direction());
	call	_GetJoystick1Direction
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_TickTeamJoystick
;./exsoccer.c:1243: if(g_GameWith2Players){
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00123$
;./exsoccer.c:1244: TickTeamJoystick(TEAM_2,GetJoystick2Direction());
	call	_GetJoystick2Direction
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_TickTeamJoystick
00123$:
;./exsoccer.c:1247: AiTickSpeed++;
	inc	-1 (ix)
;./exsoccer.c:1249: if (g_ActionCooldown > 0) {
	ld	a, (_g_ActionCooldown+0)
	or	a, a
	jr	Z, 00132$
;./exsoccer.c:1250: g_ActionCooldown--;
	ld	hl, #_g_ActionCooldown
	dec	(hl)
	jp	00133$
00132$:
;./exsoccer.c:1253: if (g_Team1ActivePlayer != NO_VALUE && g_Players[g_Team1ActivePlayer].Status == PLAYER_STATUS_POSITIONED) 
	ld	a, (_g_Team1ActivePlayer+0)
	inc	a
	jr	Z, 00125$
	ld	bc, #_g_Players+0
	ld	de, (_g_Team1ActivePlayer)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	bc, #0x000e
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	sub	a, #0x04
;./exsoccer.c:1254: g_Players[g_Team1ActivePlayer].Status = PLAYER_STATUS_NONE;
	or	a,b
	jr	NZ, 00125$
	ld	(hl), a
	inc	hl
	ld	(hl), a
00125$:
;./exsoccer.c:1255: if (g_GameWith2Players && g_Team2ActivePlayer != NO_VALUE && g_Players[g_Team2ActivePlayer].Status == PLAYER_STATUS_POSITIONED)
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00133$
	ld	a, (_g_Team2ActivePlayer+0)
	inc	a
	jr	Z, 00133$
	ld	bc, (_g_Team2ActivePlayer)
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
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	sub	a, #0x04
;./exsoccer.c:1256: g_Players[g_Team2ActivePlayer].Status = PLAYER_STATUS_NONE;
	or	a,b
	jr	NZ, 00133$
	ld	(hl), a
	inc	hl
	ld	(hl), a
00133$:
;./exsoccer.c:1260: g_ShotCursorX += g_ShotCursorDir;
	ld	a, (_g_ShotCursorDir+0)
	ld	c, a
	rlca
	sbc	a, a
	ld	hl, (_g_ShotCursorX)
	ld	b, a
	add	hl, bc
	ld	(_g_ShotCursorX), hl
;./exsoccer.c:1261: if (g_ShotCursorX < (GOAL_X_MIN - 20)) {
	ld	de, #0x004c
	ld	hl, (_g_ShotCursorX)
	cp	a, a
	sbc	hl, de
	jr	NC, 00135$
;./exsoccer.c:1262: g_ShotCursorX = (GOAL_X_MIN - 20);
	ld	hl, #0x004c
	ld	(_g_ShotCursorX), hl
;./exsoccer.c:1263: g_ShotCursorDir = -g_ShotCursorDir;
	ld	hl, #_g_ShotCursorDir
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00135$:
;./exsoccer.c:1265: if (g_ShotCursorX > (GOAL_X_MAX + 20)) {
	ld	a, #0xa4
	ld	iy, #_g_ShotCursorX
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	NC, 00142$
;./exsoccer.c:1266: g_ShotCursorX = (GOAL_X_MAX + 20);
	ld	hl, #0x00a4
	ld	(_g_ShotCursorX), hl
;./exsoccer.c:1267: g_ShotCursorDir = -g_ShotCursorDir;
	ld	hl, #_g_ShotCursorDir
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
;./exsoccer.c:1270: }
	jp	00142$
;./exsoccer.c:1274: void UpdatePlayerPatternByDirection(u8 playerId){
;	---------------------------------
; Function UpdatePlayerPatternByDirection
; ---------------------------------
_UpdatePlayerPatternByDirection::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;./exsoccer.c:1275: if(g_Players[playerId].Status==PLAYER_STATUS_POSITIONED){
	ld	bc, #_g_Players+0
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
	ex	de, hl
	ld	c, e
	ld	b, d
	ld	hl, #14
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x04
	or	a, b
	jp	Z,00122$
;./exsoccer.c:1276: return;
	jp	00102$
00102$:
;./exsoccer.c:1280: if(g_Players[playerId].Direction!=g_Players[playerId].PreviousDirection){
	ld	hl, #0x0006
	add	hl, de
	ex	(sp), hl
	pop	hl
	push	hl
	ld	c, (hl)
	ld	hl, #0x0007
	add	hl, de
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	b, (hl)
;./exsoccer.c:1281: if(g_Players[playerId].Direction==DIRECTION_NONE){
	ld	a,c
	cp	a,b
	jr	Z, 00112$
	or	a, a
	jr	NZ, 00104$
;./exsoccer.c:1282: g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
	ld	hl, #0x0004
	add	hl, de
	push	hl
	push	de
	ld	a, b
	call	_GetNoMovingPlayerPatternId
	pop	de
	pop	hl
	ld	(hl), a
;./exsoccer.c:1283: g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
	pop	hl
	push	hl
	ld	a, (hl)
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	(hl), a
	jp	00113$
00104$:
;./exsoccer.c:1286: g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), c
;./exsoccer.c:1287: g_Players[playerId].LastPose=0;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
	jp	00113$
00112$:
;./exsoccer.c:1293: if(g_Players[playerId].Direction!=DIRECTION_NONE){
	ld	a, c
	or	a, a
	jr	Z, 00113$
;./exsoccer.c:1294: if(g_Players[playerId].LastPose==1){
	ld	hl, #0x0008
	add	hl, de
	ld	a, (hl)
;./exsoccer.c:1295: g_Players[playerId].LastPose=0;
	dec	a
	jr	NZ, 00107$
	ld	(hl),a
	jp	00113$
00107$:
;./exsoccer.c:1298: g_Players[playerId].LastPose=1;
	ld	(hl), #0x01
00113$:
;./exsoccer.c:1304: if(g_Players[playerId].TeamId==REFEREE && g_MatchStatus==MATCH_BEFORE_KICK_OFF ){
	ld	c, e
	ld	b, d
	ld	hl, #5
	add	hl, bc
	ld	a, (hl)
;./exsoccer.c:1280: if(g_Players[playerId].Direction!=g_Players[playerId].PreviousDirection){
	pop	hl
	push	hl
	ld	c, (hl)
;./exsoccer.c:1304: if(g_Players[playerId].TeamId==REFEREE && g_MatchStatus==MATCH_BEFORE_KICK_OFF ){
	sub	a, #0x0e
	jr	NZ, 00119$
	ld	a, (_g_MatchStatus+0)
	dec	a
	jr	NZ, 00119$
;./exsoccer.c:1307: if(g_Players[playerId].Direction!=DIRECTION_NONE){
	ld	a, c
	or	a, a
	jr	Z, 00122$
;./exsoccer.c:1308: g_Players[playerId].PatternId=GetPatternIdByPoseAndDirection(playerId);
	inc	de
	inc	de
	inc	de
	inc	de
	push	de
	ld	a, -1 (ix)
	call	_GetPatternIdByPoseAndDirection
	pop	de
	ld	(de), a
	jp	00122$
00119$:
;./exsoccer.c:1312: if(g_Players[playerId].Direction!=DIRECTION_NONE){
	ld	a, c
	or	a, a
	jr	Z, 00122$
;./exsoccer.c:1313: g_Players[playerId].PatternId=GetPatternIdByPoseAndDirection(playerId);
	inc	de
	inc	de
	inc	de
	inc	de
	push	de
	ld	a, -1 (ix)
	call	_GetPatternIdByPoseAndDirection
	pop	de
	ld	(de), a
00122$:
;./exsoccer.c:1316: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:1319: u8 GetNoMovingPlayerPatternId(u8 direction){
;	---------------------------------
; Function GetNoMovingPlayerPatternId
; ---------------------------------
_GetNoMovingPlayerPatternId::
	ld	e, a
;./exsoccer.c:1320: u8 patternId=NO_VALUE;
	ld	c, #0xff
;./exsoccer.c:1321: switch (direction){
	ld	a, #0x08
	sub	a, e
	jr	C, 00109$
	ld	d, #0x00
	ld	hl, #00117$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00117$:
	jp	00109$
	jp	00102$
	jp	00106$
	jp	00104$
	jp	00108$
	jp	00101$
	jp	00107$
	jp	00103$
	jp	00105$
;./exsoccer.c:1322: case DIRECTION_DOWN:
00101$:
;./exsoccer.c:1323: patternId=PLAYER_POSE_FRONT_PLAYING;
	ld	c, #0x13
;./exsoccer.c:1324: break;
	jp	00109$
;./exsoccer.c:1325: case DIRECTION_UP:
00102$:
;./exsoccer.c:1326: patternId=PLAYER_POSE_BACK_PLAYING;
	ld	c, #0x16
;./exsoccer.c:1327: break;
	jp	00109$
;./exsoccer.c:1328: case DIRECTION_LEFT:
00103$:
;./exsoccer.c:1329: patternId=PLAYER_POSE_LEFT;
	ld	c, #0x12
;./exsoccer.c:1330: break;
	jp	00109$
;./exsoccer.c:1331: case DIRECTION_RIGHT:
00104$:
;./exsoccer.c:1332: patternId=PLAYER_POSE_RIGHT;
	ld	c, #0x9d
;./exsoccer.c:1333: break;
	jp	00109$
;./exsoccer.c:1334: case DIRECTION_UP_LEFT:
00105$:
;./exsoccer.c:1335: patternId=PLAYER_POSE_MOVE_UP_LEFT_2;
	ld	c, #0x82
;./exsoccer.c:1336: break;
	jp	00109$
;./exsoccer.c:1337: case DIRECTION_UP_RIGHT:
00106$:
;./exsoccer.c:1338: patternId=PLAYER_POSE_MOVE_UP_RIGHT_1;
	ld	c, #0x0d
;./exsoccer.c:1339: break;
	jp	00109$
;./exsoccer.c:1340: case DIRECTION_DOWN_LEFT:
00107$:
;./exsoccer.c:1341: patternId=PLAYER_POSE_MOVE_DOWN_LEFT_1;
	ld	c, #0x09
;./exsoccer.c:1342: break;
	jp	00109$
;./exsoccer.c:1343: case DIRECTION_DOWN_RIGHT:
00108$:
;./exsoccer.c:1344: patternId=PLAYER_POSE_MOVE_DOWN_RIGHT_2;
	ld	c, #0x86
;./exsoccer.c:1346: }
00109$:
;./exsoccer.c:1347: return patternId;
	ld	a, c
;./exsoccer.c:1348: }
	ret
;./exsoccer.c:1350: u8 GetNewPoseByDirection(u8 direction){
;	---------------------------------
; Function GetNewPoseByDirection
; ---------------------------------
_GetNewPoseByDirection::
	ld	e, a
;./exsoccer.c:1351: u8 pose=NO_VALUE;
	ld	c, #0xff
;./exsoccer.c:1352: switch (direction)
	ld	a, #0x08
	sub	a, e
	jr	C, 00109$
	ld	d, #0x00
	ld	hl, #00117$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00117$:
	jp	00109$
	jp	00102$
	jp	00105$
	jp	00104$
	jp	00106$
	jp	00101$
	jp	00108$
	jp	00103$
	jp	00107$
;./exsoccer.c:1354: case DIRECTION_DOWN:
00101$:
;./exsoccer.c:1355: pose=PLAYER_POSE_MOVE_DOWN_1;
	ld	c, #0x00
;./exsoccer.c:1356: break;
	jp	00109$
;./exsoccer.c:1357: case DIRECTION_UP:
00102$:
;./exsoccer.c:1358: pose=PLAYER_POSE_MOVE_UP_1;
	ld	c, #0x02
;./exsoccer.c:1359: break;
	jp	00109$
;./exsoccer.c:1360: case DIRECTION_LEFT:
00103$:
;./exsoccer.c:1361: pose=PLAYER_POSE_MOVE_LEFT_1;
	ld	c, #0x05
;./exsoccer.c:1362: break;	
	jp	00109$
;./exsoccer.c:1363: case DIRECTION_RIGHT:
00104$:
;./exsoccer.c:1364: pose=PLAYER_POSE_MOVE_RIGHT_1;
	ld	c, #0x89
;./exsoccer.c:1365: break;	
	jp	00109$
;./exsoccer.c:1366: case DIRECTION_UP_RIGHT:
00105$:
;./exsoccer.c:1367: pose=PLAYER_POSE_MOVE_UP_RIGHT_1;
	ld	c, #0x0d
;./exsoccer.c:1368: break;	
	jp	00109$
;./exsoccer.c:1369: case DIRECTION_DOWN_RIGHT:
00106$:
;./exsoccer.c:1370: pose=PLAYER_POSE_MOVE_DOWN_RIGHT_1;
	ld	c, #0x85
;./exsoccer.c:1371: break;	
	jp	00109$
;./exsoccer.c:1372: case DIRECTION_UP_LEFT:
00107$:
;./exsoccer.c:1373: pose=PLAYER_POSE_MOVE_UP_LEFT_1;
	ld	c, #0x83
;./exsoccer.c:1374: break;	
	jp	00109$
;./exsoccer.c:1375: case DIRECTION_DOWN_LEFT:
00108$:
;./exsoccer.c:1376: pose=PLAYER_POSE_MOVE_DOWN_LEFT_1;
	ld	c, #0x09
;./exsoccer.c:1378: }
00109$:
;./exsoccer.c:1379: return pose;
	ld	a, c
;./exsoccer.c:1380: }
	ret
;./exsoccer.c:1382: u8 GetPatternIdByPoseAndDirection(u8 playerId){
;	---------------------------------
; Function GetPatternIdByPoseAndDirection
; ---------------------------------
_GetPatternIdByPoseAndDirection::
	ld	e, a
;./exsoccer.c:1383: u8 pose=g_Players[playerId].LastPose;
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
	ex	de, hl
	push	de
	pop	iy
	ld	c, 8 (iy)
;./exsoccer.c:1384: u8 direction=g_Players[playerId].Direction;
	ld	hl, #6
	add	hl, de
	ld	b, (hl)
;./exsoccer.c:1385: u8 patternId=NO_VALUE;
	ld	e, #0xff
;./exsoccer.c:1386: switch(direction){
	ld	a, #0x08
	sub	a, b
	jp	C, 00134$
	ld	e, b
	ld	d, #0x00
	ld	hl, #00182$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00182$:
	jp	00101$
	jp	00102$
	jp	00126$
	jp	00114$
	jp	00130$
	jp	00106$
	jp	00122$
	jp	00110$
	jp	00118$
;./exsoccer.c:1387: case DIRECTION_NONE:
00101$:
;./exsoccer.c:1388: patternId=GetNoMovingPlayerPatternId(direction);
	ld	a, b
	call	_GetNoMovingPlayerPatternId
	ld	e, a
;./exsoccer.c:1389: break;
	jp	00134$
;./exsoccer.c:1390: case DIRECTION_UP:
00102$:
;./exsoccer.c:1391: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00104$
;./exsoccer.c:1392: patternId=PLAYER_POSE_MOVE_UP_1;
	ld	e, #0x02
	jp	00134$
00104$:
;./exsoccer.c:1395: patternId=PLAYER_POSE_MOVE_UP_2;
	ld	e, #0x03
;./exsoccer.c:1397: break;
	jp	00134$
;./exsoccer.c:1398: case DIRECTION_DOWN:
00106$:
;./exsoccer.c:1399: if(pose==0){
	ld	a, c
;./exsoccer.c:1400: patternId=PLAYER_POSE_MOVE_DOWN_1;
	or	a,a
	jr	NZ, 00108$
	ld	e,a
	jp	00134$
00108$:
;./exsoccer.c:1403: patternId=PLAYER_POSE_MOVE_DOWN_2;
	ld	e, #0x01
;./exsoccer.c:1405: break;
	jp	00134$
;./exsoccer.c:1406: case DIRECTION_LEFT:
00110$:
;./exsoccer.c:1407: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00112$
;./exsoccer.c:1408: patternId=PLAYER_POSE_MOVE_LEFT_1;
	ld	e, #0x05
	jp	00134$
00112$:
;./exsoccer.c:1411: patternId=PLAYER_POSE_MOVE_LEFT_2;
	ld	e, #0x06
;./exsoccer.c:1413: break;
	jp	00134$
;./exsoccer.c:1414: case DIRECTION_RIGHT:
00114$:
;./exsoccer.c:1415: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00116$
;./exsoccer.c:1416: patternId=PLAYER_POSE_MOVE_RIGHT_1;
	ld	e, #0x89
	jp	00134$
00116$:
;./exsoccer.c:1419: patternId=PLAYER_POSE_MOVE_RIGHT_2;
	ld	e, #0x8a
;./exsoccer.c:1421: break;
	jp	00134$
;./exsoccer.c:1422: case DIRECTION_UP_LEFT:
00118$:
;./exsoccer.c:1423: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00120$
;./exsoccer.c:1424: patternId=PLAYER_POSE_MOVE_UP_LEFT_1;
	ld	e, #0x83
	jp	00134$
00120$:
;./exsoccer.c:1427: patternId=PLAYER_POSE_MOVE_UP_LEFT_2;
	ld	e, #0x82
;./exsoccer.c:1429: break;
	jp	00134$
;./exsoccer.c:1430: case DIRECTION_DOWN_LEFT:
00122$:
;./exsoccer.c:1431: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00124$
;./exsoccer.c:1432: patternId=PLAYER_POSE_MOVE_DOWN_LEFT_1;
	ld	e, #0x09
	jp	00134$
00124$:
;./exsoccer.c:1435: patternId=PLAYER_POSE_MOVE_DOWN_LEFT_2;
	ld	e, #0x0a
;./exsoccer.c:1437: break;
	jp	00134$
;./exsoccer.c:1438: case DIRECTION_UP_RIGHT:
00126$:
;./exsoccer.c:1439: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00128$
;./exsoccer.c:1440: patternId=PLAYER_POSE_MOVE_UP_RIGHT_1;
	ld	e, #0x0d
	jp	00134$
00128$:
;./exsoccer.c:1443: patternId=PLAYER_POSE_MOVE_UP_RIGHT_2;
	ld	e, #0x0e
;./exsoccer.c:1445: break;
	jp	00134$
;./exsoccer.c:1446: case DIRECTION_DOWN_RIGHT:
00130$:
;./exsoccer.c:1447: if(pose==0){
	ld	a, c
	or	a, a
;./exsoccer.c:1448: patternId=PLAYER_POSE_MOVE_DOWN_RIGHT_1;
;./exsoccer.c:1451: patternId=PLAYER_POSE_MOVE_DOWN_RIGHT_2;
;./exsoccer.c:1454: }
	ld	e, #0x85
	jr	Z, 00134$
	ld	e, #0x86
00134$:
;./exsoccer.c:1455: return patternId;
	ld	a, e
;./exsoccer.c:1456: }
	ret
;./exsoccer.c:1457: void SetPlayerTarget(u8 playerId){
;	---------------------------------
; Function SetPlayerTarget
; ---------------------------------
_SetPlayerTarget::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
;./exsoccer.c:1458: if(g_FieldScrollingActionInProgress!=NO_VALUE && g_MatchStatus!=MATCH_BEFORE_KICK_OFF){
	ld	a, (_g_MatchStatus+0)
	dec	a
	ld	a, #0x01
	jr	Z, 00198$
	xor	a, a
00198$:
	ld	e, a
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	Z, 00102$
	bit	0, e
;./exsoccer.c:1459: return;
	jp	Z,00140$
00102$:
;./exsoccer.c:1461: switch(g_MatchStatus){
	ld	a, e
	or	a, a
	jp	Z, 00140$
;./exsoccer.c:1463: if(g_Players[playerId].TeamId==REFEREE){
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
	ex	de, hl
	push	de
	pop	iy
	ld	c, 5 (iy)
	ld	a, c
	sub	a, #0x0e
	jr	NZ, 00137$
;./exsoccer.c:1465: g_Players[playerId].TargetX=FIELD_POS_X_CENTER - 30; 
	ld	hl, #0x000c
	add	hl, de
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:1466: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER - 40; 
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0xcb
	inc	hl
	ld	(hl), #0x00
	jp	00140$
00137$:
;./exsoccer.c:1470: switch (g_Players[playerId].Role)
	push	de
	pop	iy
	ld	a, 9 (iy)
	ld	-1 (ix), a
	ld	a, #0x06
	sub	a, -1 (ix)
	ld	a, #0x00
	rla
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./exsoccer.c:1469: if(g_Players[playerId].TeamId==TEAM_1){
	dec	c
	jp	NZ,00134$
;./exsoccer.c:1470: switch (g_Players[playerId].Role)
	ld	a, l
	or	a, a
	jp	NZ, 00140$
;./exsoccer.c:1465: g_Players[playerId].TargetX=FIELD_POS_X_CENTER - 30; 
	ld	hl, #0x000c
	add	hl, de
	ld	c, l
	ld	b, h
;./exsoccer.c:1466: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER - 40; 
	ld	hl, #0x000a
	add	hl, de
;./exsoccer.c:1470: switch (g_Players[playerId].Role)
	push	hl
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	hl, #00204$
	add	hl, de
	add	hl, de
	add	hl, de
	pop	de
	jp	(hl)
00204$:
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
	jp	00112$
	jp	00116$
	jp	00117$
;./exsoccer.c:1472: case PLAYER_ROLE_GOALKEEPER:
00105$:
;./exsoccer.c:1473: g_Players[playerId].TargetX=FIELD_POS_X_CENTER;
	ld	a, #0x78
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1474: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_GOALKEEPER;
	ld	a, #0xa8
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:1475: break;
	jp	00140$
;./exsoccer.c:1476: case PLAYER_ROLE_LEFT_DEFENDER:
00106$:
;./exsoccer.c:1477: g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
	ld	a, #0x28
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1478: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_DEFENDERS;
	ld	a, #0x76
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:1479: break;
	jp	00140$
;./exsoccer.c:1480: case PLAYER_ROLE_RIGHT_DEFENDER:
00107$:
;./exsoccer.c:1481: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
	ld	a, #0xc6
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1482: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_DEFENDERS;
	ld	a, #0x76
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:1483: break;
	jp	00140$
;./exsoccer.c:1484: case PLAYER_ROLE_LEFT_HALFFIELDER:
00108$:
;./exsoccer.c:1485: if(g_RestartKickTeamId!=TEAM_1){
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	Z, 00110$
;./exsoccer.c:1486: g_Players[playerId].TargetX=FIELD_POS_X_LEFT+100;
	ld	a, #0x8c
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1487: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS+40;
	ld	a, #0x44
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
	jp	00140$
00110$:
;./exsoccer.c:1490: g_Players[playerId].TargetX=FIELD_POS_X_CENTER-7;
	ld	a, #0x71
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1491: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER;
	ld	a, #0xf3
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1493: break;
	jp	00140$
;./exsoccer.c:1494: case PLAYER_ROLE_RIGHT_HALFFIELDER:
00112$:
;./exsoccer.c:1495: if(g_RestartKickTeamId!=TEAM_1){
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	Z, 00114$
;./exsoccer.c:1496: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT-100;
	ld	a, #0x62
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1497: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS+40;
	ld	a, #0x44
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
	jp	00140$
00114$:
;./exsoccer.c:1500: g_Players[playerId].TargetX=FIELD_POS_X_CENTER+7;
	ld	a, #0x7f
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1501: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER;
	ld	a, #0xf3
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1503: break;
	jp	00140$
;./exsoccer.c:1504: case PLAYER_ROLE_LEFT_STRIKER:
00116$:
;./exsoccer.c:1505: g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
	ld	a, #0x28
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1506: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS;
	ld	a, #0x1c
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:1507: break;
	jp	00140$
;./exsoccer.c:1508: case PLAYER_ROLE_RIGHT_STRIKER:
00117$:
;./exsoccer.c:1509: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
	ld	a, #0xc6
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1510: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS;
	ld	a, #0x1c
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:1512: }
	jp	00140$
00134$:
;./exsoccer.c:1515: switch (g_Players[playerId].Role)
	ld	a, l
	or	a, a
	jp	NZ, 00140$
;./exsoccer.c:1465: g_Players[playerId].TargetX=FIELD_POS_X_CENTER - 30; 
	ld	hl, #0x000c
	add	hl, de
	ld	c, l
	ld	b, h
;./exsoccer.c:1466: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER - 40; 
	ld	hl, #0x000a
	add	hl, de
;./exsoccer.c:1515: switch (g_Players[playerId].Role)
	push	hl
	ld	e, -1 (ix)
	ld	d, #0x00
	ld	hl, #00207$
	add	hl, de
	add	hl, de
	add	hl, de
	pop	de
	jp	(hl)
00207$:
	jp	00119$
	jp	00120$
	jp	00121$
	jp	00122$
	jp	00126$
	jp	00130$
	jp	00131$
;./exsoccer.c:1517: case PLAYER_ROLE_GOALKEEPER:
00119$:
;./exsoccer.c:1518: g_Players[playerId].TargetX=FIELD_POS_X_CENTER;
	ld	a, #0x78
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1519: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_GOALKEEPER;
	ld	a, #0x32
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1520: break;
	jp	00140$
;./exsoccer.c:1521: case PLAYER_ROLE_LEFT_DEFENDER:
00120$:
;./exsoccer.c:1522: g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
	ld	a, #0x28
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1523: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_DEFENDERS;
	ld	a, #0x82
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1524: break;
	jp	00140$
;./exsoccer.c:1525: case PLAYER_ROLE_RIGHT_DEFENDER:
00121$:
;./exsoccer.c:1526: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
	ld	a, #0xc6
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1527: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_DEFENDERS;
	ld	a, #0x82
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1528: break;
	jp	00140$
;./exsoccer.c:1529: case PLAYER_ROLE_LEFT_HALFFIELDER:
00122$:
;./exsoccer.c:1530: if(g_RestartKickTeamId!=TEAM_2){
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, #0x02
	jr	Z, 00124$
;./exsoccer.c:1531: g_Players[playerId].TargetX=FIELD_POS_X_LEFT+100;
	ld	a, #0x8c
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1532: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS-40;
	ld	a, #0xb4
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
	jp	00140$
00124$:
;./exsoccer.c:1535: g_Players[playerId].TargetX=FIELD_POS_X_CENTER-7;
	ld	a, #0x71
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1536: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER-10;
	ld	a, #0xe9
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1538: break;
	jp	00140$
;./exsoccer.c:1539: case PLAYER_ROLE_RIGHT_HALFFIELDER:
00126$:
;./exsoccer.c:1540: if(g_RestartKickTeamId!=TEAM_2){
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, #0x02
	jr	Z, 00128$
;./exsoccer.c:1541: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT-116;
	ld	a, #0x52
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1542: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS-40;
	ld	a, #0xb4
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
	jp	00140$
00128$:
;./exsoccer.c:1545: g_Players[playerId].TargetX=FIELD_POS_X_CENTER+7;
	ld	a, #0x7f
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1546: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER-10;
	ld	a, #0xe9
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1548: break;
	jp	00140$
;./exsoccer.c:1549: case PLAYER_ROLE_LEFT_STRIKER:
00130$:
;./exsoccer.c:1550: g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
	ld	a, #0x28
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1551: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS;
	ld	a, #0xdc
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1552: break;
	jp	00140$
;./exsoccer.c:1553: case PLAYER_ROLE_RIGHT_STRIKER:
00131$:
;./exsoccer.c:1554: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
	ld	a, #0xc6
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1555: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS;
	ld	a, #0xdc
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1562: }
00140$:
;./exsoccer.c:1563: }
	inc	sp
	pop	ix
	ret
;./exsoccer.c:1564: void SetPlayerBallPossession(u8 playerId){
;	---------------------------------
; Function SetPlayerBallPossession
; ---------------------------------
_SetPlayerBallPossession::
;./exsoccer.c:1565: if (playerId == NO_VALUE) {
	ld	c, a
	inc	a
	ret	Z
;./exsoccer.c:1570: return;
	jp	00102$
00102$:
;./exsoccer.c:1573: if(g_Players[playerId].TeamId==TEAM_1){
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
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
;./exsoccer.c:1574: if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team1ActivePlayer=playerId;
	ld	hl, #9
	add	hl, de
	ld	b, (hl)
;./exsoccer.c:1573: if(g_Players[playerId].TeamId==TEAM_1){
	dec	a
	jr	NZ, 00108$
;./exsoccer.c:1574: if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team1ActivePlayer=playerId;
	ld	a, b
	or	a, a
	jr	Z, 00109$
	ld	hl, #_g_Team1ActivePlayer
	ld	(hl), c
	jp	00109$
00108$:
;./exsoccer.c:1577: if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team2ActivePlayer=playerId;
	ld	a, b
	or	a, a
	jr	Z, 00109$
	ld	hl, #_g_Team2ActivePlayer
	ld	(hl), c
00109$:
;./exsoccer.c:1580: g_Ball.PossessionTimer = 0; // Reset hold timer
	ld	hl, #(_g_Ball + 28)
	ld	(hl), #0x00
;./exsoccer.c:1581: }
	ret
;./exsoccer.c:1583: void TickCornerKick() {
;	---------------------------------
; Function TickCornerKick
; ---------------------------------
_TickCornerKick::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
;./exsoccer.c:1584: if (g_MatchStatus != MATCH_BEFORE_CORNER_KICK) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x02
	jp	NZ,00165$
;./exsoccer.c:1587: if (g_Timer < 180) { // 60fps * 3s
	ld	a, (_g_Timer+0)
	sub	a, #0xb4
	jp	NC, 00170$
;./exsoccer.c:1588: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
;./exsoccer.c:1589: TickPlayerToOwnTarget();
	call	_TickPlayerToOwnTarget
;./exsoccer.c:1590: if (g_Timer == 60) ClearTextFromLayerA(18, 18, 11);
	ld	a, (_g_Timer+0)
	sub	a, #0x3c
	jr	NZ, 00104$
	ld	a, #0x0b
	push	af
	inc	sp
;	spillPairReg hl
;	spillPairReg hl
	ld	a,#0x12
	ld	l,a
	call	_ClearTextFromLayerA
00104$:
;./exsoccer.c:1595: if (g_Ball.PossessionPlayerId != NO_VALUE) kickerId = g_Ball.PossessionPlayerId;
	ld	a, (#(_g_Ball + 6) + 0)
	cp	a, #0xff
	jr	Z, 00106$
	ld	c, a
	jp	00107$
00106$:
;./exsoccer.c:1596: else kickerId = GetClosestPlayerToBall(g_RestartKickTeamId, NO_VALUE);
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	c, a
00107$:
;./exsoccer.c:1598: if (kickerId != NO_VALUE && g_Players[kickerId].X == g_Players[kickerId].TargetX && g_Players[kickerId].Y == g_Players[kickerId].TargetY) {
	ld	a, c
	inc	a
	jp	Z,00165$
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
;	spillPairReg hl
;	spillPairReg hl
	ld	-2 (ix), l
	ld	-1 (ix), h
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000c
	add	hl, bc
	pop	bc
	ld	b, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, b
	cp	a, a
	sbc	hl, de
	jp	NZ,00165$
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	bc, #0x000a
	add	hl, bc
	pop	bc
	ld	b, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, b
	cp	a, a
	sbc	hl, de
	jp	NZ,00165$
;./exsoccer.c:1600: u8 cornerIdx = (g_RestartKickTeamId == TEAM_1 ? 0 : 2) + g_CornerKickSide;
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00167$
	ld	de, #0x0000
	jp	00168$
00167$:
	ld	de, #0x0002
00168$:
	ld	a, (_g_CornerKickSide+0)
	add	a, e
	ld	b, a
;./exsoccer.c:1601: const u8 kickerDirs[4] = { DIRECTION_DOWN_RIGHT, DIRECTION_DOWN_LEFT, DIRECTION_UP_RIGHT, DIRECTION_UP_LEFT };
	ld	-10 (ix), #0x04
	ld	-9 (ix), #0x06
	ld	-8 (ix), #0x02
	ld	-7 (ix), #0x08
;./exsoccer.c:1604: g_Players[kickerId].Direction = kickerDirs[cornerIdx];
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0006
	add	hl, de
	ld	iy, #2
	add	iy, sp
	ld	e, b
	ld	d, #0x00
	add	iy, de
	ld	a, 0 (iy)
	ld	(hl), a
;./exsoccer.c:1605: g_Players[kickerId].Status = PLAYER_STATUS_POSITIONED;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:1606: g_Players[kickerId].PatternId = GetPatternIdByPoseAndDirection(kickerId); // Manually set pattern
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x0004
	add	hl, de
	push	hl
	ld	a, c
	call	_GetPatternIdByPoseAndDirection
	pop	hl
	ld	(hl), a
;./exsoccer.c:1610: return;
	jp	00165$
;./exsoccer.c:1614: u16 cornerX = (g_CornerKickSide == CORNER_SIDE_LEFT) ? FIELD_BOUND_X_LEFT : FIELD_BOUND_X_RIGHT;
00170$:
;./exsoccer.c:1620: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#_g_Ball + 6)
	cp	a, #0xff
	jr	Z, 00117$
;./exsoccer.c:1621: kickerId = g_Ball.PossessionPlayerId;
	ld	-6 (ix), a
	jp	00118$
00117$:
;./exsoccer.c:1623: kickerId = GetClosestPlayerToBall(g_RestartKickTeamId, NO_VALUE);
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
;./exsoccer.c:1624: if (kickerId != NO_VALUE) SetPlayerBallPossession(kickerId);
	ld	-6 (ix), a
	inc	a
	jr	Z, 00118$
	ld	a, -6 (ix)
	call	_SetPlayerBallPossession
00118$:
	ld	a, -6 (ix)
	inc	a
	jp	Z,00165$
;./exsoccer.c:1634: if (kickerId == NO_VALUE) return;
	jp	00120$
00120$:
;./exsoccer.c:1600: u8 cornerIdx = (g_RestartKickTeamId == TEAM_1 ? 0 : 2) + g_CornerKickSide;
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	ld	a, #0x01
	jr	Z, 00396$
	xor	a, a
00396$:
	ld	c, a
;./exsoccer.c:1637: bool isHuman = (g_RestartKickTeamId == TEAM_1 || (g_GameWith2Players && g_RestartKickTeamId == TEAM_2));
	ld	b, c
	bit	0, b
	jr	NZ, 00177$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00176$
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, #0x02
	jr	Z, 00177$
00176$:
	xor	a, a
	jp	00178$
00177$:
	ld	a, #0x01
00178$:
;./exsoccer.c:1639: if (isHuman) {
	or	a, a
	jp	Z, 00163$
;./exsoccer.c:1641: u8 joyDir = (g_RestartKickTeamId == TEAM_1) ? GetJoystick1Direction() : GetJoystick2Direction();
	ld	a, c
	or	a, a
	jr	Z, 00182$
	call	_GetJoystick1Direction
	jp	00183$
00182$:
	call	_GetJoystick2Direction
00183$:
	ld	-2 (ix), a
;./exsoccer.c:1642: bool trigger = IsTeamJoystickTriggerPressed(g_RestartKickTeamId);
	ld	a, (_g_RestartKickTeamId+0)
	call	_IsTeamJoystickTriggerPressed
	ld	-5 (ix), a
;./exsoccer.c:1646: if (joyDir == DIRECTION_LEFT || joyDir == DIRECTION_RIGHT) {
	ld	a, -2 (ix)
	sub	a, #0x07
	jr	Z, 00141$
	ld	a, -2 (ix)
	sub	a, #0x03
	jp	NZ,00142$
00141$:
;./exsoccer.c:1647: if (!joyMoved) {
	ld	a, (_TickCornerKick_joyMoved_131074_1690+0)
	or	a, a
	jp	NZ, 00143$
;./exsoccer.c:1649: u8 startIdx = (g_RestartKickTeamId == TEAM_1) ? 0 : 7;
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	ld	a, #0x01
	jr	Z, 00402$
	xor	a, a
00402$:
	ld	e, a
	or	a, a
	jr	Z, 00184$
	ld	bc, #0x0000
	jp	00185$
00184$:
	ld	bc, #0x0007
00185$:
	ld	-4 (ix), c
;./exsoccer.c:1650: u8 endIdx = (g_RestartKickTeamId == TEAM_1) ? 6 : 13;
	ld	a, e
	or	a, a
	jr	Z, 00186$
	ld	hl, #0x0006
	ex	(sp), hl
	jp	00187$
00186$:
	ld	hl, #0x000d
	ex	(sp), hl
00187$:
	ld	a, -12 (ix)
	ld	-3 (ix), a
;./exsoccer.c:1653: u8 currentIdx = startIdx;
	ld	a, -4 (ix)
	ld	-1 (ix), a
;./exsoccer.c:1654: if (g_CornerKickTargetId >= startIdx && g_CornerKickTargetId <= endIdx) {
	ld	a, (_g_CornerKickTargetId+0)
	sub	a, -4 (ix)
	jr	C, 00219$
	ld	a, -3 (ix)
	ld	hl, #_g_CornerKickTargetId
	sub	a, (hl)
	jr	C, 00219$
;./exsoccer.c:1655: currentIdx = g_CornerKickTargetId;
	ld	a, (_g_CornerKickTargetId+0)
	ld	-1 (ix), a
;./exsoccer.c:1660: do {
00219$:
	ld	a, -2 (ix)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00404$
	xor	a, a
00404$:
	ld	-2 (ix), a
	ld	c, #0x00
00134$:
;./exsoccer.c:1661: if (joyDir == DIRECTION_RIGHT) currentIdx++; else currentIdx--;
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00125$
	inc	-1 (ix)
	jp	00126$
00125$:
	dec	-1 (ix)
00126$:
;./exsoccer.c:1663: if (currentIdx > endIdx) currentIdx = startIdx;
	ld	a, -3 (ix)
	sub	a, -1 (ix)
	jr	NC, 00128$
	ld	a, -4 (ix)
	ld	-1 (ix), a
00128$:
;./exsoccer.c:1664: if (currentIdx < startIdx) currentIdx = endIdx;
	ld	a, -1 (ix)
	sub	a, -4 (ix)
	jr	NC, 00130$
	ld	a, -3 (ix)
	ld	-1 (ix), a
00130$:
;./exsoccer.c:1667: if (currentIdx != kickerId && g_Players[currentIdx].Role != PLAYER_ROLE_GOALKEEPER) {
	ld	a, -6 (ix)
	sub	a, -1 (ix)
	jr	Z, 00132$
	ld	e, -1 (ix)
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
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z, 00132$
;./exsoccer.c:1668: g_CornerKickTargetId = currentIdx;
	ld	a, -1 (ix)
	ld	(_g_CornerKickTargetId+0), a
;./exsoccer.c:1669: break;
	jp	00136$
00132$:
;./exsoccer.c:1671: tries++;
	inc	c
;./exsoccer.c:1672: } while (tries < 16);
	ld	a, c
	sub	a, #0x10
	jr	C, 00134$
00136$:
;./exsoccer.c:1674: joyMoved = true;
	ld	hl, #_TickCornerKick_joyMoved_131074_1690
	ld	(hl), #0x01
	jp	00143$
00142$:
;./exsoccer.c:1676: } else if (joyDir == DIRECTION_NONE) {
	ld	a, -2 (ix)
	or	a, a
	jr	NZ, 00143$
;./exsoccer.c:1677: joyMoved = false;
	ld	hl, #_TickCornerKick_joyMoved_131074_1690
	ld	(hl), #0x00
00143$:
;./exsoccer.c:1681: if (g_CornerKickTargetId != NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	Z, 00146$
;./exsoccer.c:1682: g_Ball.PassTargetPlayerId = g_CornerKickTargetId; // Reuse visual logic
	ld	hl, #(_g_Ball + 16)
	ld	a, (_g_CornerKickTargetId+0)
	ld	(hl), a
00146$:
;./exsoccer.c:1686: if (trigger) {
	ld	a, -5 (ix)
	or	a, a
	jp	Z, 00165$
;./exsoccer.c:1687: if (g_CornerKickTargetId != NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	Z, 00165$
;./exsoccer.c:1688: PerformPass(g_CornerKickTargetId);
	ld	a, (_g_CornerKickTargetId+0)
	call	_PerformPass
;./exsoccer.c:1689: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;./exsoccer.c:1690: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
	jp	00165$
00163$:
;./exsoccer.c:1696: if (g_CornerKickTargetId == NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	NZ, 00156$
;./exsoccer.c:1698: u8 randomRole = ((g_Timer & 1) == 0) ? PLAYER_ROLE_LEFT_STRIKER : PLAYER_ROLE_RIGHT_STRIKER;
	ld	a, (_g_Timer+0)
	rrca
	jr	C, 00188$
	ld	hl, #0x0005
	jp	00189$
00188$:
	ld	hl, #0x0006
00189$:
;./exsoccer.c:1699: u8 strikerId = GetPlayerIdByRole(g_RestartKickTeamId, randomRole);
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetPlayerIdByRole
;./exsoccer.c:1700: if (strikerId != NO_VALUE && strikerId != kickerId) {
	ld	c, a
	inc	a
	jr	Z, 00152$
	ld	a, -6 (ix)
	sub	a, c
	jr	Z, 00152$
;./exsoccer.c:1701: g_CornerKickTargetId = strikerId;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), c
	jp	00156$
00152$:
;./exsoccer.c:1705: g_CornerKickTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, kickerId);
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	(_g_CornerKickTargetId+0), a
00156$:
;./exsoccer.c:1710: if (g_Timer > 200) {
	ld	a, #0xc8
	ld	hl, #_g_Timer
	sub	a, (hl)
	jr	NC, 00160$
;./exsoccer.c:1711: if (g_CornerKickTargetId == NO_VALUE) g_CornerKickTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, kickerId);
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	NZ, 00158$
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	(_g_CornerKickTargetId+0), a
00158$:
;./exsoccer.c:1713: PerformPass(g_CornerKickTargetId);
	ld	a, (_g_CornerKickTargetId+0)
	call	_PerformPass
;./exsoccer.c:1714: g_MatchStatus = MATCH_IN_ACTION; 
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;./exsoccer.c:1715: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
	jp	00165$
00160$:
;./exsoccer.c:1717: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
00165$:
;./exsoccer.c:1720: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__g_FieldCurrentYPosition:
	.dw #0x0000
__xinit__g_FieldScrollingActionInProgress:
	.db #0x00	; 0
__xinit__g_PlayersPositioningPhaseCount:
	.db #0xff	; 255
__xinit__g_MatchStatus:
	.db #0x00	; 0
__xinit__g_FieldScrollSpeed:
	.db #0x01	; 1
__xinit__g_Timer:
	.db #0xff	; 255
__xinit__g_Team1ActivePlayer:
	.db #0xff	; 255
__xinit__g_Team2ActivePlayer:
	.db #0xff	; 255
__xinit__g_PassTargetPlayer:
	.db #0xff	; 255
__xinit__g_GameWith2Players:
	.db #0x00	; 0
__xinit__g_GameLevel:
	.db #0x01	; 1
__xinit__g_ActionCooldown:
	.db #0x00	; 0
__xinit__g_ShotCursorX:
	.dw #0x0078
__xinit__g_ShotCursorDir:
	.db #0x04	;  4
__xinit__g_FioBre:
	.db #0x00	; 0
__xinit__g_GoalScorerId:
	.db #0xff	; 255
__xinit__g_CornerKickSide:
	.db #0x00	; 0
__xinit__g_CornerKickTargetId:
	.db #0xff	; 255
__xinit__g_VSynch:
	.db #0x00	; 0
	.area _CABS (ABS)
