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
	.globl _PerformPass
	.globl _GetClosestPlayerToBall
	.globl _TickBallFlying
	.globl _TickGoalkeeperAnimation
	.globl _UpdatePassTarget
	.globl _TickBallCollision
	.globl _TickAI
	.globl _TickCheckBallBoundaries
	.globl _ResetBallInfo
	.globl _TickTeamJoystick
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
_TickCornerKick_joyMoved_196613_1656:
	.ds 1
_TickCornerKick_t1Latched_196614_1661:
	.ds 1
_TickCornerKick_joyMoved_196612_1664:
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
;./exsoccer.c:1328: static bool joyMoved = false;
	ld	iy, #_TickCornerKick_joyMoved_196613_1656
	ld	0 (iy), #0x00
;./exsoccer.c:1354: static bool t1Latched = false;
	ld	iy, #_TickCornerKick_t1Latched_196614_1661
	ld	0 (iy), #0x00
;./exsoccer.c:1374: static bool joyMoved = false;
	ld	iy, #_TickCornerKick_joyMoved_196612_1664
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
	ld	hl, #-25
	add	hl, sp
	ld	sp, hl
	ld	-2 (ix), a
;./exsoccer.c:433: V9_PrintLayerAStringAtPos(10,12,"CORNER KICK");
	ld	hl, #___str_3
	push	hl
	ld	l, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
;./exsoccer.c:434: g_MatchStatus=MATCH_BEFORE_CORNER_KICK;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x02
;./exsoccer.c:435: g_RestartKickTeamId = teamId;
	ld	a, -2 (ix)
	ld	(_g_RestartKickTeamId+0), a
;./exsoccer.c:436: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
;./exsoccer.c:437: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;./exsoccer.c:440: if (g_Ball.X < FIELD_POS_X_CENTER) g_CornerKickSide = CORNER_SIDE_LEFT;
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
;./exsoccer.c:441: else g_CornerKickSide = CORNER_SIDE_RIGHT;
	ld	hl, #_g_CornerKickSide
	ld	(hl), #0x01
;./exsoccer.c:446: u16 kickX = (g_CornerKickSide == CORNER_SIDE_LEFT) ? FIELD_BOUND_X_LEFT : FIELD_BOUND_X_RIGHT;
	jp	00155$
;./exsoccer.c:441: else g_CornerKickSide = CORNER_SIDE_RIGHT;
00103$:
;./exsoccer.c:446: u16 kickX = (g_CornerKickSide == CORNER_SIDE_LEFT) ? FIELD_BOUND_X_LEFT : FIELD_BOUND_X_RIGHT;
	ld	de, #0x000a
	jp	00156$
00155$:
	ld	de, #0x00f6
00156$:
	ld	-23 (ix), e
	ld	-22 (ix), d
;./exsoccer.c:447: u16 kickY = (teamId == TEAM_1) ? FIELD_BOUND_Y_TOP : FIELD_BOUND_Y_BOTTOM;
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
;./exsoccer.c:450: if (teamId == TEAM_1) ShowFieldZone(FIELD_NORTH_ZONE);
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00105$
	push	bc
	xor	a, a
	call	_ShowFieldZone
	pop	bc
	jp	00106$
00105$:
;./exsoccer.c:451: else ShowFieldZone(FIELD_SOUTH_ZONE);
	push	bc
	ld	a, #0x02
	call	_ShowFieldZone
	pop	bc
00106$:
;./exsoccer.c:455: if (g_CornerKickSide == CORNER_SIDE_LEFT) kickerId = GetPlayerIdByRole(teamId, PLAYER_ROLE_LEFT_STRIKER);
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
;./exsoccer.c:456: else kickerId = GetPlayerIdByRole(teamId, PLAYER_ROLE_RIGHT_STRIKER);
	push	bc
	ld	l, #0x06
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	call	_GetPlayerIdByRole
	pop	bc
	ld	-19 (ix), a
00109$:
;./exsoccer.c:459: g_Ball.PossessionPlayerId = NO_VALUE; 
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:460: SetPlayerBallPossession(NO_VALUE);
	push	bc
	ld	a, #0xff
	call	_SetPlayerBallPossession
	pop	bc
;./exsoccer.c:461: if(teamId == TEAM_1) g_Team1ActivePlayer = kickerId; // Ensure kicker is selected active
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00111$
	ld	a, -19 (ix)
	ld	(_g_Team1ActivePlayer+0), a
	jp	00112$
00111$:
;./exsoccer.c:462: else g_Team2ActivePlayer = kickerId;
	ld	a, -19 (ix)
	ld	(_g_Team2ActivePlayer+0), a
00112$:
;./exsoccer.c:470: i8 offX = 0; i8 offY = 0;
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	-1 (ix), #0x00
;./exsoccer.c:471: if (teamId == TEAM_2 && g_CornerKickSide == CORNER_SIDE_RIGHT) {
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	NZ, 00114$
	ld	a, (_g_CornerKickSide+0)
	dec	a
	jr	NZ, 00114$
;./exsoccer.c:472: offX = -30;
	ld	l, #0xe2
;	spillPairReg hl
;	spillPairReg hl
;./exsoccer.c:473: offY = -5;
	ld	-1 (ix), #0xfb
00114$:
;./exsoccer.c:476: g_Ball.X = kickX + offX;
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
;./exsoccer.c:477: g_Ball.Y = kickY + offY;
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
;./exsoccer.c:478: g_Ball.PreviousY = g_Ball.Y;
	ld	((_g_Ball + 7)), de
;./exsoccer.c:482: bool attackingUp = (teamId == TEAM_1);
	ld	a, -3 (ix)
;./exsoccer.c:486: u16 yBoxInside     = (attackingUp) ? (FIELD_BOUND_Y_TOP + 40) : (FIELD_BOUND_Y_BOTTOM - 40);
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
;./exsoccer.c:487: u16 yBoxOutside    = (attackingUp) ? (FIELD_BOUND_Y_TOP + 90) : (FIELD_BOUND_Y_BOTTOM - 90);
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
;./exsoccer.c:488: u16 yMidfieldAdv   = (attackingUp) ? (FIELD_BOUND_Y_TOP + 160) : (FIELD_BOUND_Y_BOTTOM - 160);
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
;./exsoccer.c:490: u16 ySafety        = (attackingUp) ? (FIELD_BOUND_Y_BOTTOM - 100) : (FIELD_BOUND_Y_TOP + 100);
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
;./exsoccer.c:492: for(u8 i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00152$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00153$
;./exsoccer.c:493: g_Players[i].Status = PLAYER_STATUS_NONE;
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
;./exsoccer.c:494: g_Players[i].TargetX = g_Players[i].X;
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
;./exsoccer.c:495: g_Players[i].TargetY = g_Players[i].Y;
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
;./exsoccer.c:497: u8 role = g_Players[i].Role;
	ld	a, -4 (ix)
	ld	-25 (ix), a
	ld	a, -3 (ix)
	ld	-24 (ix), a
	pop	hl
	push	hl
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	ld	-5 (ix), a
;./exsoccer.c:498: bool isAttacker = (g_Players[i].TeamId == teamId);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	a,-2 (ix)
	sub	a,(hl)
	ld	a, #0x01
	jr	Z, 00329$
	xor	a, a
00329$:
	ld	c, a
;./exsoccer.c:501: if (i == kickerId) {
	ld	a, -19 (ix)
	sub	a, -1 (ix)
	jr	NZ, 00117$
;./exsoccer.c:502: g_Players[i].TargetX = kickX;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, -23 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -22 (ix)
	ld	(hl), a
;./exsoccer.c:503: g_Players[i].TargetY = kickY;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -21 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -20 (ix)
	ld	(hl), a
;./exsoccer.c:504: continue;
	jp	00149$
00117$:
;./exsoccer.c:507: if (isAttacker) {
	ld	a, c
	or	a, a
	jp	Z, 00147$
;./exsoccer.c:509: if (role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00133$
;./exsoccer.c:511: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:512: g_Players[i].TargetY = (attackingUp) ? FIELD_BOUND_Y_BOTTOM - 20 : FIELD_BOUND_Y_TOP + 20;
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
;./exsoccer.c:514: else if (role == PLAYER_ROLE_LEFT_DEFENDER || role == PLAYER_ROLE_RIGHT_DEFENDER) {
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
;./exsoccer.c:515: if (role == PLAYER_ROLE_LEFT_DEFENDER) {
	ld	a, c
	or	a, a
	jr	Z, 00119$
;./exsoccer.c:517: g_Players[i].TargetX = FIELD_POS_X_CENTER - 30;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:518: g_Players[i].TargetY = yMidfieldAdv;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
	jp	00149$
00119$:
;./exsoccer.c:521: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:522: g_Players[i].TargetY = ySafety;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
	jp	00149$
00129$:
;./exsoccer.c:525: else if (role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
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
;./exsoccer.c:526: if (role == PLAYER_ROLE_LEFT_HALFFIELDER) {
	ld	a, c
	or	a, a
	jr	Z, 00122$
;./exsoccer.c:528: g_Players[i].TargetX = FIELD_POS_X_CENTER - 50; 
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x46
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:529: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00149$
00122$:
;./exsoccer.c:532: g_Players[i].TargetX = FIELD_POS_X_CENTER + 30;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x96
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:533: g_Players[i].TargetY = yMidfieldAdv;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
	jp	00149$
00125$:
;./exsoccer.c:539: g_Players[i].TargetX = FIELD_POS_X_CENTER + 50;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0xaa
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:540: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00149$
00147$:
;./exsoccer.c:545: if (role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00144$
;./exsoccer.c:547: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:548: g_Players[i].TargetY = (attackingUp) ? FIELD_POS_Y_TEAM2_GOALKEEPER : FIELD_POS_Y_TEAM1_GOALKEEPER;
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
;./exsoccer.c:550: else if (role == PLAYER_ROLE_LEFT_DEFENDER || role == PLAYER_ROLE_RIGHT_DEFENDER) {
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
;./exsoccer.c:552: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_DEFENDER) ? FIELD_POS_X_CENTER - 20 : FIELD_POS_X_CENTER + 20;
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
;./exsoccer.c:553: g_Players[i].TargetY = yBoxInside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -17 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -16 (ix)
	ld	(hl), a
	jp	00149$
00140$:
;./exsoccer.c:555: else if (role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
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
;./exsoccer.c:557: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_HALFFIELDER) ? FIELD_POS_X_CENTER - 40 : FIELD_POS_X_CENTER + 40;
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
;./exsoccer.c:558: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00149$
00136$:
;./exsoccer.c:562: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_STRIKER) ? FIELD_POS_X_LEFT + 20 : FIELD_POS_X_RIGHT - 20;
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
;./exsoccer.c:563: g_Players[i].TargetY = yMidfield;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0xf3
	inc	hl
	ld	(hl), #0x00
00149$:
;./exsoccer.c:492: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00152$
00153$:
;./exsoccer.c:567: }
	ld	sp, ix
	pop	ix
	ret
___str_3:
	.ascii "CORNER KICK"
	.db 0x00
;./exsoccer.c:568: void InitializeV9990()
;	---------------------------------
; Function InitializeV9990
; ---------------------------------
_InitializeV9990::
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:571: V9_SetScreenMode(V9_MODE_P1);
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
;./exsoccer.c:578: LoadSprites();
	call	_LoadSprites
;./exsoccer.c:579: InitPalette();
	call	_InitPalette
;./exsoccer.c:580: LoadP1LayerA();
	call	_LoadP1LayerA
;./exsoccer.c:581: LoadP1LayerB();
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
;./exsoccer.c:585: V9_SetDisplayEnable(TRUE);
;./exsoccer.c:587: }
	jp	_V9_SetRegister
;./exsoccer.c:590: void LoadSprites(){
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
;./exsoccer.c:594: V9_WriteVRAM(0x08000, g_Sprites1, sizeof(g_Sprites1));	
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
;./exsoccer.c:596: V9_WriteVRAM(0x08000+sizeof(g_Sprites1), g_Sprites2, sizeof(g_Sprites2));	
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
;./exsoccer.c:597: SET_BANK_SEGMENT(2, 1); 
;./exsoccer.c:598: }
	ret
;./exsoccer.c:600: void TickGoalCelebration(){
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
;./exsoccer.c:601: if(g_MatchStatus!=MATCH_AFTER_IN_GOAL) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x06
	jp	NZ,00182$
;./exsoccer.c:603: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
;./exsoccer.c:605: if((g_Timer % 10) < 5){
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
;./exsoccer.c:606: V9_SetBackgroundColor(8); // Cyan/Flash
	jp	00105$
00104$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:480: inline void V9_SetBackgroundColor(u8 color) { V9_SetRegister(15, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_V9_SetRegister
;./exsoccer.c:608: V9_SetBackgroundColor(1); // Default Blue
00105$:
;./exsoccer.c:614: if (g_Timer < 120) {
	ld	a, (_g_Timer+0)
	sub	a, #0x78
	jp	NC, 00160$
;./exsoccer.c:615: u8 scoringTeamId = (g_RestartKickTeamId == TEAM_1) ? TEAM_2 : TEAM_1;
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00184$
	ld	bc, #0x0002
	jp	00185$
00184$:
	ld	bc, #0x0001
00185$:
	ld	-14 (ix), c
;./exsoccer.c:618: u16 limitY_Top = FIELD_BOUND_Y_TOP;
	ld	-13 (ix), #0x32
	xor	a, a
	ld	-12 (ix), a
;./exsoccer.c:619: u16 limitY_Bottom = FIELD_BOUND_Y_BOTTOM;
	ld	-11 (ix), #0xae
	ld	-10 (ix), #0x01
;./exsoccer.c:621: if (g_Ball.Y < FIELD_CENTRAL_Y) { // Top Goal
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
;./exsoccer.c:622: limitY_Bottom = FIELD_BOUND_Y_TOP + 160; 
	ld	-11 (ix), #0xd2
	ld	-10 (ix), #0
	jp	00220$
00107$:
;./exsoccer.c:624: limitY_Top = FIELD_BOUND_Y_BOTTOM - 160;
	ld	-13 (ix), #0x0e
	ld	-12 (ix), #0x01
;./exsoccer.c:627: for(u8 i=0; i<15; i++){
00220$:
	ld	-1 (ix), #0x00
00178$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	NC, 00160$
;./exsoccer.c:628: if(i == REFEREE) continue;
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	Z,00157$
;./exsoccer.c:631: if (g_Players[i].TeamId == scoringTeamId) {
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
;./exsoccer.c:639: g_Players[i].Direction = (rnd % 8) + 1; 
	ld	a, -9 (ix)
	add	a, #0x06
	ld	-3 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
;./exsoccer.c:675: g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_BACK_1 : PLAYER_POSE_CELEBRATION_BACK_2;
	ld	a, -9 (ix)
	add	a, #0x04
	ld	-7 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
;./exsoccer.c:631: if (g_Players[i].TeamId == scoringTeamId) {
	ld	a, -14 (ix)
	sub	a, c
	jp	NZ,00155$
;./exsoccer.c:635: if ((g_Timer % 19) == 0) {
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
;./exsoccer.c:638: u8 rnd = (g_Timer * 3) + (i * 37); 
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
;./exsoccer.c:639: g_Players[i].Direction = (rnd % 8) + 1; 
	and	a, #0x07
	inc	a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), a
00112$:
;./exsoccer.c:642: u8 dir = g_Players[i].Direction;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
;./exsoccer.c:645: bool movedNorth = false;
	ld	-4 (ix), #0x00
;./exsoccer.c:647: if (dir == DIRECTION_UP || dir == DIRECTION_UP_LEFT || dir == DIRECTION_UP_RIGHT) {
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
;./exsoccer.c:648: if (g_Players[i].Y > limitY_Top) g_Players[i].Y--;
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
;./exsoccer.c:649: movedNorth = true;
	ld	-4 (ix), #0x01
	jp	00133$
00132$:
;./exsoccer.c:651: else if (dir == DIRECTION_DOWN || dir == DIRECTION_DOWN_LEFT || dir == DIRECTION_DOWN_RIGHT) {
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
;./exsoccer.c:652: if (g_Players[i].Y < limitY_Bottom) g_Players[i].Y++;
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
;./exsoccer.c:654: else if (dir == DIRECTION_LEFT) {
	ld	a, -5 (ix)
	sub	a, #0x07
	jr	NZ, 00124$
;./exsoccer.c:655: if (g_Players[i].X > FIELD_BOUND_X_LEFT) g_Players[i].X--;
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
;./exsoccer.c:657: else if (dir == DIRECTION_RIGHT) {
	ld	a, -5 (ix)
	sub	a, #0x03
	jr	NZ, 00133$
;./exsoccer.c:658: if (g_Players[i].X < FIELD_BOUND_X_RIGHT) g_Players[i].X++;
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
;./exsoccer.c:662: if (dir == DIRECTION_UP_LEFT || dir == DIRECTION_DOWN_LEFT) {
	ld	a, b
	or	a, a
	jr	NZ, 00138$
	ld	a, -5 (ix)
	sub	a, #0x06
	jr	NZ, 00139$
00138$:
;./exsoccer.c:663: if (g_Players[i].X > FIELD_BOUND_X_LEFT) g_Players[i].X--;
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
;./exsoccer.c:665: if (dir == DIRECTION_UP_RIGHT || dir == DIRECTION_DOWN_RIGHT) {
	ld	a, c
	or	a, a
	jr	NZ, 00143$
	ld	a, -5 (ix)
	sub	a, #0x04
	jr	NZ, 00144$
00143$:
;./exsoccer.c:666: if (g_Players[i].X < FIELD_BOUND_X_RIGHT) g_Players[i].X++;
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
;./exsoccer.c:671: bool animFrame1 = ((g_Timer / 8) % 2) == 0;
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
;./exsoccer.c:673: if (movedNorth) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00147$
;./exsoccer.c:675: g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_BACK_1 : PLAYER_POSE_CELEBRATION_BACK_2;
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
;./exsoccer.c:678: g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_FRONT_1 : PLAYER_POSE_CELEBRATION_FRONT_2;
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
;./exsoccer.c:685: if (g_Players[i].Direction == DIRECTION_UP || 
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-2 (ix), a
	dec	a
	jr	Z, 00149$
;./exsoccer.c:686: g_Players[i].Direction == DIRECTION_UP_LEFT || 
	ld	a, -2 (ix)
	sub	a, #0x08
	jr	Z, 00149$
;./exsoccer.c:687: g_Players[i].Direction == DIRECTION_UP_RIGHT) {
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	NZ, 00150$
00149$:
;./exsoccer.c:688: g_Players[i].PatternId = PLAYER_POSE_BACK;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x11
	jp	00157$
00150$:
;./exsoccer.c:690: g_Players[i].PatternId = PLAYER_POSE_FRONT;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0x10
00157$:
;./exsoccer.c:627: for(u8 i=0; i<15; i++){
	inc	-1 (ix)
	jp	00178$
00160$:
;./exsoccer.c:696: if(g_Timer > 150){
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
;./exsoccer.c:698: ClearTextFromLayerA(12, 18, 8); // "IN  GOAL"
	ld	a, #0x08
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_ClearTextFromLayerA
;./exsoccer.c:700: g_MatchStatus = MATCH_BEFORE_KICK_OFF;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x01
;./exsoccer.c:701: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:702: g_Ball.KickMoveState = 0;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0x00
;./exsoccer.c:703: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;./exsoccer.c:704: if(g_Team1ActivePlayer!=NO_VALUE) g_Players[g_Team1ActivePlayer].Status=PLAYER_STATUS_NONE;
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
;./exsoccer.c:705: if(g_Team2ActivePlayer!=NO_VALUE) g_Players[g_Team2ActivePlayer].Status=PLAYER_STATUS_NONE;
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
;./exsoccer.c:706: g_Team1ActivePlayer=NO_VALUE;
	ld	hl, #_g_Team1ActivePlayer
	ld	(hl), #0xff
;./exsoccer.c:707: g_Team2ActivePlayer=NO_VALUE;
	ld	hl, #_g_Team2ActivePlayer
	ld	(hl), #0xff
;./exsoccer.c:709: g_Ball.X = FIELD_POS_X_CENTER;
	ld	hl, #0x0078
	ld	((_g_Ball + 2)), hl
;./exsoccer.c:710: g_Ball.Y = FIELD_POS_Y_CENTER;
	ld	l, #0xf3
	ld	(_g_Ball), hl
;./exsoccer.c:711: g_Ball.PreviousY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
;./exsoccer.c:712: PutBallSprite();
	call	_PutBallSprite
;./exsoccer.c:714: for(u8 i=0; i<15; i++){
	ld	de, #_g_Players
	ld	-1 (ix), #0x00
00180$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jr	NC, 00171$
;./exsoccer.c:715: if(i==REFEREE || g_Players[i].TeamId==TEAM_1 || g_Players[i].TeamId==TEAM_2){
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
;./exsoccer.c:717: if (i==REFEREE) {
	ld	a, c
	or	a, a
	jr	Z, 00166$
;./exsoccer.c:718: g_Players[i].Direction=DIRECTION_RIGHT;
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
;./exsoccer.c:719: g_Players[i].LastPose=0;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	bc, #0x0008
	add	hl, bc
	ld	(hl), #0x00
00166$:
;./exsoccer.c:721: SetPlayerTarget(i); 
	push	de
	ld	a, -1 (ix)
	call	_SetPlayerTarget
	pop	de
00181$:
;./exsoccer.c:714: for(u8 i=0; i<15; i++){
	inc	-1 (ix)
	jp	00180$
00171$:
;./exsoccer.c:726: ShowFieldZone(FIELD_CENTRAL_ZONE);
	ld	a, #0x01
	call	_ShowFieldZone
00182$:
;./exsoccer.c:728: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:731: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./exsoccer.c:733: DEBUG_INIT();
	call	_DEBUG_INIT
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:735: InitVariables();
	call	_InitVariables
;./exsoccer.c:736: V9_SetPort(V9_P15, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x6f
	call	_V9_SetPort
;./exsoccer.c:738: VDP_SetMode(VDP_MODE_SCREEN0);
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
;./exsoccer.c:740: VDP_ClearVRAM();
	call	_VDP_ClearVRAM
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x000a
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:747: Print_SetTextFont(g_Font_MGL_Sample6, 1);
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
;./exsoccer.c:749: Print_SetColor(15, 1);
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
;./exsoccer.c:751: Print_DrawText("EX Soccer - 2026 Fausto Pracek");
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
;./exsoccer.c:753: Print_DrawText("fpracek@gmail.com");
	push	bc
	ld	hl, #___str_6
	call	_Print_DrawText
	pop	bc
;./exsoccer.c:755: const c8* str = "V9990 not found!";
	ld	de, #___str_4
;./exsoccer.c:756: bool v9990IsFound=V9_Detect();
	push	bc
	push	de
	call	_V9_Detect
	pop	de
	pop	bc
	ld	-1 (ix), a
;./exsoccer.c:758: if (v9990IsFound){
	or	a, a
	jr	Z, 00102$
;./exsoccer.c:759: str = "V9990 found!";
	ld	de, #___str_7
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	xor	a, a
	ld	(bc), a
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x07
;./exsoccer.c:761: Print_DrawText("The game is running on V9990 monitor.");
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
;./exsoccer.c:764: Print_DrawText(str);
	ex	de, hl
	call	_Print_DrawText
;./exsoccer.c:765: if(!v9990IsFound){
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00105$
00148$:
	jp	00148$
00105$:
;./exsoccer.c:769: InitializeV9990();
	call	_InitializeV9990
;./exsoccer.c:772: V9_SetPort(V9_P15, 0x10);
	ld	l, #0x10
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x6f
	call	_V9_SetPort
;./exsoccer.c:774: GameStart();
	call	_GameStart
;./exsoccer.c:775: MainGameLoop();
	call	_MainGameLoop
;./exsoccer.c:779: }
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
;./exsoccer.c:780: void MainGameLoop(){
;	---------------------------------
; Function MainGameLoop
; ---------------------------------
_MainGameLoop::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;./exsoccer.c:781: u8 TickAiPlayerId=0;
	ld	-2 (ix), #0x00
;./exsoccer.c:782: u8 AiTickSpeed=0;
	ld	-1 (ix), #0x00
00142$:
;./exsoccer.c:784: UpdateV9990();
	call	_UpdateV9990
;./exsoccer.c:786: if(g_MatchStatus==MATCH_NOT_STARTED && g_FieldScrollingActionInProgress==NO_VALUE && g_ActiveFieldZone==FIELD_CENTRAL_ZONE){
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jr	NZ, 00103$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00103$
	ld	a, (_g_ActiveFieldZone+0)
	dec	a
	jr	NZ, 00103$
;./exsoccer.c:787: g_MatchStatus=MATCH_BEFORE_KICK_OFF;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x01
;./exsoccer.c:788: for(u8 i=0;i<15;i++){
	ld	c, #0x00
00140$:
	ld	a, c
	sub	a, #0x0f
	jr	NC, 00101$
;./exsoccer.c:789: SetPlayerTarget(i);
	push	bc
	ld	a, c
	call	_SetPlayerTarget
	pop	bc
;./exsoccer.c:788: for(u8 i=0;i<15;i++){
	inc	c
	jp	00140$
00101$:
;./exsoccer.c:791: TickPlayerToOwnTarget();
	call	_TickPlayerToOwnTarget
00103$:
;./exsoccer.c:794: TickCornerKick(); // <<< Added Hook
	call	_TickCornerKick
;./exsoccer.c:796: TickGoalCelebration();
	call	_TickGoalCelebration
;./exsoccer.c:797: TickPlayerToOwnTarget();
	call	_TickPlayerToOwnTarget
;./exsoccer.c:798: TickActiveFieldZone();
	call	_TickActiveFieldZone
;./exsoccer.c:799: if(g_FieldScrollingActionInProgress==NO_VALUE){
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00119$
;./exsoccer.c:801: if(g_MatchStatus == MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jr	Z, 00115$
	sub	a, #0x0d
	jr	NZ, 00119$
00115$:
;./exsoccer.c:803: if(AiTickSpeed >= 2){ // Speed up AI cycle (was 5)
	ld	a, -1 (ix)
	sub	a, #0x02
	jr	C, 00119$
;./exsoccer.c:804: AiTickSpeed=0;
	ld	-1 (ix), #0x00
;./exsoccer.c:805: TickAI(REFEREE);
	ld	a, #0x0e
	call	_TickAI
;./exsoccer.c:806: TickAI(TickAiPlayerId);
	ld	a, -2 (ix)
	call	_TickAI
;./exsoccer.c:807: TickAiPlayerId++;
	inc	-2 (ix)
;./exsoccer.c:808: if(TickAiPlayerId==14){ // Only iterate 0-13 (Players)
	ld	a, -2 (ix)
	sub	a, #0x0e
	jr	NZ, 00107$
;./exsoccer.c:809: TickAiPlayerId=0;
	ld	-2 (ix), #0x00
00107$:
;./exsoccer.c:813: if (g_Ball.PossessionPlayerId != NO_VALUE && g_Ball.PossessionPlayerId < 14) {
	ld	hl, #_g_Ball+6
	ld	c, (hl)
	ld	a, c
	inc	a
	jr	Z, 00119$
	ld	a, c
	sub	a, #0x0e
	jr	NC, 00119$
;./exsoccer.c:815: if (g_Ball.PossessionPlayerId != TickAiPlayerId) {
	ld	a, -2 (ix)
	sub	a, c
	jr	Z, 00119$
;./exsoccer.c:816: TickAI(g_Ball.PossessionPlayerId);
	ld	a, c
	call	_TickAI
00119$:
;./exsoccer.c:824: UpdateSpritesPositions();
	call	_UpdateSpritesPositions
;./exsoccer.c:825: TickUpdateTime();
	call	_TickUpdateTime
;./exsoccer.c:826: TickShowKickOff();
	call	_TickShowKickOff
;./exsoccer.c:827: if(g_FieldScrollingActionInProgress==NO_VALUE){
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00121$
;./exsoccer.c:828: TickBallCollision();
	call	_TickBallCollision
;./exsoccer.c:829: TickBallFlying();
	call	_TickBallFlying
;./exsoccer.c:830: UpdatePassTarget();
	call	_UpdatePassTarget
;./exsoccer.c:831: TickGoalkeeperAnimation();
	call	_TickGoalkeeperAnimation
00121$:
;./exsoccer.c:834: TickCheckBallBoundaries();
	call	_TickCheckBallBoundaries
;./exsoccer.c:835: TickTeamJoystick(TEAM_1,GetJoystick1Direction());
	call	_GetJoystick1Direction
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_TickTeamJoystick
;./exsoccer.c:836: if(g_GameWith2Players){
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00123$
;./exsoccer.c:837: TickTeamJoystick(TEAM_2,GetJoystick2Direction());
	call	_GetJoystick2Direction
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_TickTeamJoystick
00123$:
;./exsoccer.c:840: AiTickSpeed++;
	inc	-1 (ix)
;./exsoccer.c:842: if (g_ActionCooldown > 0) {
	ld	a, (_g_ActionCooldown+0)
	or	a, a
	jr	Z, 00132$
;./exsoccer.c:843: g_ActionCooldown--;
	ld	hl, #_g_ActionCooldown
	dec	(hl)
	jp	00133$
00132$:
;./exsoccer.c:846: if (g_Team1ActivePlayer != NO_VALUE && g_Players[g_Team1ActivePlayer].Status == PLAYER_STATUS_POSITIONED) 
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
;./exsoccer.c:847: g_Players[g_Team1ActivePlayer].Status = PLAYER_STATUS_NONE;
	or	a,b
	jr	NZ, 00125$
	ld	(hl), a
	inc	hl
	ld	(hl), a
00125$:
;./exsoccer.c:848: if (g_GameWith2Players && g_Team2ActivePlayer != NO_VALUE && g_Players[g_Team2ActivePlayer].Status == PLAYER_STATUS_POSITIONED)
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
;./exsoccer.c:849: g_Players[g_Team2ActivePlayer].Status = PLAYER_STATUS_NONE;
	or	a,b
	jr	NZ, 00133$
	ld	(hl), a
	inc	hl
	ld	(hl), a
00133$:
;./exsoccer.c:853: g_ShotCursorX += g_ShotCursorDir;
	ld	a, (_g_ShotCursorDir+0)
	ld	c, a
	rlca
	sbc	a, a
	ld	hl, (_g_ShotCursorX)
	ld	b, a
	add	hl, bc
	ld	(_g_ShotCursorX), hl
;./exsoccer.c:854: if (g_ShotCursorX < (GOAL_X_MIN - 20)) {
	ld	de, #0x004c
	ld	hl, (_g_ShotCursorX)
	cp	a, a
	sbc	hl, de
	jr	NC, 00135$
;./exsoccer.c:855: g_ShotCursorX = (GOAL_X_MIN - 20);
	ld	hl, #0x004c
	ld	(_g_ShotCursorX), hl
;./exsoccer.c:856: g_ShotCursorDir = -g_ShotCursorDir;
	ld	hl, #_g_ShotCursorDir
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00135$:
;./exsoccer.c:858: if (g_ShotCursorX > (GOAL_X_MAX + 20)) {
	ld	a, #0xa4
	ld	iy, #_g_ShotCursorX
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	NC, 00142$
;./exsoccer.c:859: g_ShotCursorX = (GOAL_X_MAX + 20);
	ld	hl, #0x00a4
	ld	(_g_ShotCursorX), hl
;./exsoccer.c:860: g_ShotCursorDir = -g_ShotCursorDir;
	ld	hl, #_g_ShotCursorDir
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
;./exsoccer.c:863: }
	jp	00142$
;./exsoccer.c:867: void UpdatePlayerPatternByDirection(u8 playerId){
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
;./exsoccer.c:868: if(g_Players[playerId].Status==PLAYER_STATUS_POSITIONED){
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
;./exsoccer.c:869: return;
	jp	00102$
00102$:
;./exsoccer.c:873: if(g_Players[playerId].Direction!=g_Players[playerId].PreviousDirection){
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
;./exsoccer.c:874: if(g_Players[playerId].Direction==DIRECTION_NONE){
	ld	a,c
	cp	a,b
	jr	Z, 00112$
	or	a, a
	jr	NZ, 00104$
;./exsoccer.c:875: g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
	ld	hl, #0x0004
	add	hl, de
	push	hl
	push	de
	ld	a, b
	call	_GetNoMovingPlayerPatternId
	pop	de
	pop	hl
	ld	(hl), a
;./exsoccer.c:876: g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
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
;./exsoccer.c:879: g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), c
;./exsoccer.c:880: g_Players[playerId].LastPose=0;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x00
	jp	00113$
00112$:
;./exsoccer.c:886: if(g_Players[playerId].Direction!=DIRECTION_NONE){
	ld	a, c
	or	a, a
	jr	Z, 00113$
;./exsoccer.c:887: if(g_Players[playerId].LastPose==1){
	ld	hl, #0x0008
	add	hl, de
	ld	a, (hl)
;./exsoccer.c:888: g_Players[playerId].LastPose=0;
	dec	a
	jr	NZ, 00107$
	ld	(hl),a
	jp	00113$
00107$:
;./exsoccer.c:891: g_Players[playerId].LastPose=1;
	ld	(hl), #0x01
00113$:
;./exsoccer.c:897: if(g_Players[playerId].TeamId==REFEREE && g_MatchStatus==MATCH_BEFORE_KICK_OFF ){
	ld	c, e
	ld	b, d
	ld	hl, #5
	add	hl, bc
	ld	a, (hl)
;./exsoccer.c:873: if(g_Players[playerId].Direction!=g_Players[playerId].PreviousDirection){
	pop	hl
	push	hl
	ld	c, (hl)
;./exsoccer.c:897: if(g_Players[playerId].TeamId==REFEREE && g_MatchStatus==MATCH_BEFORE_KICK_OFF ){
	sub	a, #0x0e
	jr	NZ, 00119$
	ld	a, (_g_MatchStatus+0)
	dec	a
	jr	NZ, 00119$
;./exsoccer.c:900: if(g_Players[playerId].Direction!=DIRECTION_NONE){
	ld	a, c
	or	a, a
	jr	Z, 00122$
;./exsoccer.c:901: g_Players[playerId].PatternId=GetPatternIdByPoseAndDirection(playerId);
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
;./exsoccer.c:905: if(g_Players[playerId].Direction!=DIRECTION_NONE){
	ld	a, c
	or	a, a
	jr	Z, 00122$
;./exsoccer.c:906: g_Players[playerId].PatternId=GetPatternIdByPoseAndDirection(playerId);
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
;./exsoccer.c:909: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:912: u8 GetNoMovingPlayerPatternId(u8 direction){
;	---------------------------------
; Function GetNoMovingPlayerPatternId
; ---------------------------------
_GetNoMovingPlayerPatternId::
	ld	e, a
;./exsoccer.c:913: u8 patternId=PLAYER_POSE_FRONT_PLAYING; // Default fallback
	ld	c, #0x13
;./exsoccer.c:914: switch (direction){
	ld	a, #0x08
	sub	a, e
	jr	C, 00110$
	ld	d, #0x00
	ld	hl, #00118$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00118$:
	jp	00109$
	jp	00102$
	jp	00106$
	jp	00104$
	jp	00108$
	jp	00101$
	jp	00107$
	jp	00103$
	jp	00105$
;./exsoccer.c:915: case DIRECTION_DOWN:
00101$:
;./exsoccer.c:916: patternId=PLAYER_POSE_FRONT_PLAYING;
	ld	c, #0x13
;./exsoccer.c:917: break;
	jp	00110$
;./exsoccer.c:918: case DIRECTION_UP:
00102$:
;./exsoccer.c:919: patternId=PLAYER_POSE_BACK_PLAYING;
	ld	c, #0x16
;./exsoccer.c:920: break;
	jp	00110$
;./exsoccer.c:921: case DIRECTION_LEFT:
00103$:
;./exsoccer.c:922: patternId=PLAYER_POSE_LEFT;
	ld	c, #0x12
;./exsoccer.c:923: break;
	jp	00110$
;./exsoccer.c:924: case DIRECTION_RIGHT:
00104$:
;./exsoccer.c:925: patternId=PLAYER_POSE_RIGHT;
	ld	c, #0x9d
;./exsoccer.c:926: break;
	jp	00110$
;./exsoccer.c:927: case DIRECTION_UP_LEFT:
00105$:
;./exsoccer.c:928: patternId=PLAYER_POSE_MOVE_UP_LEFT_2;
	ld	c, #0x82
;./exsoccer.c:929: break;
	jp	00110$
;./exsoccer.c:930: case DIRECTION_UP_RIGHT:
00106$:
;./exsoccer.c:931: patternId=PLAYER_POSE_MOVE_UP_RIGHT_1;
	ld	c, #0x0d
;./exsoccer.c:932: break;
	jp	00110$
;./exsoccer.c:933: case DIRECTION_DOWN_LEFT:
00107$:
;./exsoccer.c:934: patternId=PLAYER_POSE_MOVE_DOWN_LEFT_1;
	ld	c, #0x09
;./exsoccer.c:935: break;
	jp	00110$
;./exsoccer.c:936: case DIRECTION_DOWN_RIGHT:
00108$:
;./exsoccer.c:937: patternId=PLAYER_POSE_MOVE_DOWN_RIGHT_2;
	ld	c, #0x86
;./exsoccer.c:938: break;
	jp	00110$
;./exsoccer.c:939: case DIRECTION_NONE:
00109$:
;./exsoccer.c:942: patternId=PLAYER_POSE_FRONT_PLAYING;
	ld	c, #0x13
;./exsoccer.c:944: }
00110$:
;./exsoccer.c:945: return patternId;
	ld	a, c
;./exsoccer.c:946: }
	ret
;./exsoccer.c:948: u8 GetNewPoseByDirection(u8 direction){
;	---------------------------------
; Function GetNewPoseByDirection
; ---------------------------------
_GetNewPoseByDirection::
	ld	e, a
;./exsoccer.c:949: u8 pose=NO_VALUE;
	ld	c, #0xff
;./exsoccer.c:950: switch (direction)
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
;./exsoccer.c:952: case DIRECTION_DOWN:
00101$:
;./exsoccer.c:953: pose=PLAYER_POSE_MOVE_DOWN_1;
	ld	c, #0x00
;./exsoccer.c:954: break;
	jp	00109$
;./exsoccer.c:955: case DIRECTION_UP:
00102$:
;./exsoccer.c:956: pose=PLAYER_POSE_MOVE_UP_1;
	ld	c, #0x02
;./exsoccer.c:957: break;
	jp	00109$
;./exsoccer.c:958: case DIRECTION_LEFT:
00103$:
;./exsoccer.c:959: pose=PLAYER_POSE_MOVE_LEFT_1;
	ld	c, #0x05
;./exsoccer.c:960: break;	
	jp	00109$
;./exsoccer.c:961: case DIRECTION_RIGHT:
00104$:
;./exsoccer.c:962: pose=PLAYER_POSE_MOVE_RIGHT_1;
	ld	c, #0x89
;./exsoccer.c:963: break;	
	jp	00109$
;./exsoccer.c:964: case DIRECTION_UP_RIGHT:
00105$:
;./exsoccer.c:965: pose=PLAYER_POSE_MOVE_UP_RIGHT_1;
	ld	c, #0x0d
;./exsoccer.c:966: break;	
	jp	00109$
;./exsoccer.c:967: case DIRECTION_DOWN_RIGHT:
00106$:
;./exsoccer.c:968: pose=PLAYER_POSE_MOVE_DOWN_RIGHT_1;
	ld	c, #0x85
;./exsoccer.c:969: break;	
	jp	00109$
;./exsoccer.c:970: case DIRECTION_UP_LEFT:
00107$:
;./exsoccer.c:971: pose=PLAYER_POSE_MOVE_UP_LEFT_1;
	ld	c, #0x83
;./exsoccer.c:972: break;	
	jp	00109$
;./exsoccer.c:973: case DIRECTION_DOWN_LEFT:
00108$:
;./exsoccer.c:974: pose=PLAYER_POSE_MOVE_DOWN_LEFT_1;
	ld	c, #0x09
;./exsoccer.c:976: }
00109$:
;./exsoccer.c:977: return pose;
	ld	a, c
;./exsoccer.c:978: }
	ret
;./exsoccer.c:980: u8 GetPatternIdByPoseAndDirection(u8 playerId){
;	---------------------------------
; Function GetPatternIdByPoseAndDirection
; ---------------------------------
_GetPatternIdByPoseAndDirection::
	ld	e, a
;./exsoccer.c:981: u8 pose=g_Players[playerId].LastPose;
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
;./exsoccer.c:982: u8 direction=g_Players[playerId].Direction;
	ld	hl, #6
	add	hl, de
	ld	b, (hl)
;./exsoccer.c:983: u8 patternId=NO_VALUE;
	ld	e, #0xff
;./exsoccer.c:984: switch(direction){
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
;./exsoccer.c:985: case DIRECTION_NONE:
00101$:
;./exsoccer.c:986: patternId=GetNoMovingPlayerPatternId(direction);
	ld	a, b
	call	_GetNoMovingPlayerPatternId
	ld	e, a
;./exsoccer.c:987: break;
	jp	00134$
;./exsoccer.c:988: case DIRECTION_UP:
00102$:
;./exsoccer.c:989: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00104$
;./exsoccer.c:990: patternId=PLAYER_POSE_MOVE_UP_1;
	ld	e, #0x02
	jp	00134$
00104$:
;./exsoccer.c:993: patternId=PLAYER_POSE_MOVE_UP_2;
	ld	e, #0x03
;./exsoccer.c:995: break;
	jp	00134$
;./exsoccer.c:996: case DIRECTION_DOWN:
00106$:
;./exsoccer.c:997: if(pose==0){
	ld	a, c
;./exsoccer.c:998: patternId=PLAYER_POSE_MOVE_DOWN_1;
	or	a,a
	jr	NZ, 00108$
	ld	e,a
	jp	00134$
00108$:
;./exsoccer.c:1001: patternId=PLAYER_POSE_MOVE_DOWN_2;
	ld	e, #0x01
;./exsoccer.c:1003: break;
	jp	00134$
;./exsoccer.c:1004: case DIRECTION_LEFT:
00110$:
;./exsoccer.c:1005: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00112$
;./exsoccer.c:1006: patternId=PLAYER_POSE_MOVE_LEFT_1;
	ld	e, #0x05
	jp	00134$
00112$:
;./exsoccer.c:1009: patternId=PLAYER_POSE_MOVE_LEFT_2;
	ld	e, #0x06
;./exsoccer.c:1011: break;
	jp	00134$
;./exsoccer.c:1012: case DIRECTION_RIGHT:
00114$:
;./exsoccer.c:1013: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00116$
;./exsoccer.c:1014: patternId=PLAYER_POSE_MOVE_RIGHT_1;
	ld	e, #0x89
	jp	00134$
00116$:
;./exsoccer.c:1017: patternId=PLAYER_POSE_MOVE_RIGHT_2;
	ld	e, #0x8a
;./exsoccer.c:1019: break;
	jp	00134$
;./exsoccer.c:1020: case DIRECTION_UP_LEFT:
00118$:
;./exsoccer.c:1021: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00120$
;./exsoccer.c:1022: patternId=PLAYER_POSE_MOVE_UP_LEFT_1;
	ld	e, #0x83
	jp	00134$
00120$:
;./exsoccer.c:1025: patternId=PLAYER_POSE_MOVE_UP_LEFT_2;
	ld	e, #0x82
;./exsoccer.c:1027: break;
	jp	00134$
;./exsoccer.c:1028: case DIRECTION_DOWN_LEFT:
00122$:
;./exsoccer.c:1029: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00124$
;./exsoccer.c:1030: patternId=PLAYER_POSE_MOVE_DOWN_LEFT_1;
	ld	e, #0x09
	jp	00134$
00124$:
;./exsoccer.c:1033: patternId=PLAYER_POSE_MOVE_DOWN_LEFT_2;
	ld	e, #0x0a
;./exsoccer.c:1035: break;
	jp	00134$
;./exsoccer.c:1036: case DIRECTION_UP_RIGHT:
00126$:
;./exsoccer.c:1037: if(pose==0){
	ld	a, c
	or	a, a
	jr	NZ, 00128$
;./exsoccer.c:1038: patternId=PLAYER_POSE_MOVE_UP_RIGHT_1;
	ld	e, #0x0d
	jp	00134$
00128$:
;./exsoccer.c:1041: patternId=PLAYER_POSE_MOVE_UP_RIGHT_2;
	ld	e, #0x0e
;./exsoccer.c:1043: break;
	jp	00134$
;./exsoccer.c:1044: case DIRECTION_DOWN_RIGHT:
00130$:
;./exsoccer.c:1045: if(pose==0){
	ld	a, c
	or	a, a
;./exsoccer.c:1046: patternId=PLAYER_POSE_MOVE_DOWN_RIGHT_1;
;./exsoccer.c:1049: patternId=PLAYER_POSE_MOVE_DOWN_RIGHT_2;
;./exsoccer.c:1052: }
	ld	e, #0x85
	jr	Z, 00134$
	ld	e, #0x86
00134$:
;./exsoccer.c:1053: return patternId;
	ld	a, e
;./exsoccer.c:1054: }
	ret
;./exsoccer.c:1055: void SetPlayerTarget(u8 playerId){
;	---------------------------------
; Function SetPlayerTarget
; ---------------------------------
_SetPlayerTarget::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
	ld	c, a
;./exsoccer.c:1056: if(g_FieldScrollingActionInProgress!=NO_VALUE && g_MatchStatus!=MATCH_BEFORE_KICK_OFF){
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
;./exsoccer.c:1057: return;
	jp	Z,00140$
00102$:
;./exsoccer.c:1059: switch(g_MatchStatus){
	ld	a, e
	or	a, a
	jp	Z, 00140$
;./exsoccer.c:1061: if(g_Players[playerId].TeamId==REFEREE){
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
;./exsoccer.c:1063: g_Players[playerId].TargetX=FIELD_POS_X_CENTER - 30; 
	ld	hl, #0x000c
	add	hl, de
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:1064: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER - 40; 
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0xcb
	inc	hl
	ld	(hl), #0x00
	jp	00140$
00137$:
;./exsoccer.c:1068: switch (g_Players[playerId].Role)
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
;./exsoccer.c:1067: if(g_Players[playerId].TeamId==TEAM_1){
	dec	c
	jp	NZ,00134$
;./exsoccer.c:1068: switch (g_Players[playerId].Role)
	ld	a, l
	or	a, a
	jp	NZ, 00140$
;./exsoccer.c:1063: g_Players[playerId].TargetX=FIELD_POS_X_CENTER - 30; 
	ld	hl, #0x000c
	add	hl, de
	ld	c, l
	ld	b, h
;./exsoccer.c:1064: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER - 40; 
	ld	hl, #0x000a
	add	hl, de
;./exsoccer.c:1068: switch (g_Players[playerId].Role)
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
;./exsoccer.c:1070: case PLAYER_ROLE_GOALKEEPER:
00105$:
;./exsoccer.c:1071: g_Players[playerId].TargetX=FIELD_POS_X_CENTER;
	ld	a, #0x78
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1072: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_GOALKEEPER;
	ld	a, #0xa8
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:1073: break;
	jp	00140$
;./exsoccer.c:1074: case PLAYER_ROLE_LEFT_DEFENDER:
00106$:
;./exsoccer.c:1075: g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
	ld	a, #0x28
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1076: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_DEFENDERS;
	ld	a, #0x76
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:1077: break;
	jp	00140$
;./exsoccer.c:1078: case PLAYER_ROLE_RIGHT_DEFENDER:
00107$:
;./exsoccer.c:1079: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
	ld	a, #0xc6
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1080: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_DEFENDERS;
	ld	a, #0x76
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:1081: break;
	jp	00140$
;./exsoccer.c:1082: case PLAYER_ROLE_LEFT_HALFFIELDER:
00108$:
;./exsoccer.c:1083: if(g_RestartKickTeamId!=TEAM_1){
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	Z, 00110$
;./exsoccer.c:1084: g_Players[playerId].TargetX=FIELD_POS_X_LEFT+100;
	ld	a, #0x8c
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1085: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS+40;
	ld	a, #0x44
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
	jp	00140$
00110$:
;./exsoccer.c:1088: g_Players[playerId].TargetX=FIELD_POS_X_CENTER-7;
	ld	a, #0x71
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1089: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER;
	ld	a, #0xf3
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1091: break;
	jp	00140$
;./exsoccer.c:1092: case PLAYER_ROLE_RIGHT_HALFFIELDER:
00112$:
;./exsoccer.c:1093: if(g_RestartKickTeamId!=TEAM_1){
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	Z, 00114$
;./exsoccer.c:1094: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT-100;
	ld	a, #0x62
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1095: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS+40;
	ld	a, #0x44
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
	jp	00140$
00114$:
;./exsoccer.c:1098: g_Players[playerId].TargetX=FIELD_POS_X_CENTER+7;
	ld	a, #0x7f
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1099: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER;
	ld	a, #0xf3
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1101: break;
	jp	00140$
;./exsoccer.c:1102: case PLAYER_ROLE_LEFT_STRIKER:
00116$:
;./exsoccer.c:1103: g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
	ld	a, #0x28
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1104: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS;
	ld	a, #0x1c
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:1105: break;
	jp	00140$
;./exsoccer.c:1106: case PLAYER_ROLE_RIGHT_STRIKER:
00117$:
;./exsoccer.c:1107: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
	ld	a, #0xc6
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1108: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS;
	ld	a, #0x1c
	ld	(de), a
	inc	de
	ld	a, #0x01
	ld	(de), a
;./exsoccer.c:1110: }
	jp	00140$
00134$:
;./exsoccer.c:1113: switch (g_Players[playerId].Role)
	ld	a, l
	or	a, a
	jp	NZ, 00140$
;./exsoccer.c:1063: g_Players[playerId].TargetX=FIELD_POS_X_CENTER - 30; 
	ld	hl, #0x000c
	add	hl, de
	ld	c, l
	ld	b, h
;./exsoccer.c:1064: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER - 40; 
	ld	hl, #0x000a
	add	hl, de
;./exsoccer.c:1113: switch (g_Players[playerId].Role)
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
;./exsoccer.c:1115: case PLAYER_ROLE_GOALKEEPER:
00119$:
;./exsoccer.c:1116: g_Players[playerId].TargetX=FIELD_POS_X_CENTER;
	ld	a, #0x78
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1117: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_GOALKEEPER;
	ld	a, #0x32
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1118: break;
	jp	00140$
;./exsoccer.c:1119: case PLAYER_ROLE_LEFT_DEFENDER:
00120$:
;./exsoccer.c:1120: g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
	ld	a, #0x28
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1121: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_DEFENDERS;
	ld	a, #0x82
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1122: break;
	jp	00140$
;./exsoccer.c:1123: case PLAYER_ROLE_RIGHT_DEFENDER:
00121$:
;./exsoccer.c:1124: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
	ld	a, #0xc6
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1125: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_DEFENDERS;
	ld	a, #0x82
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1126: break;
	jp	00140$
;./exsoccer.c:1127: case PLAYER_ROLE_LEFT_HALFFIELDER:
00122$:
;./exsoccer.c:1128: if(g_RestartKickTeamId!=TEAM_2){
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, #0x02
	jr	Z, 00124$
;./exsoccer.c:1129: g_Players[playerId].TargetX=FIELD_POS_X_LEFT+100;
	ld	a, #0x8c
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1130: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS-40;
	ld	a, #0xb4
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
	jp	00140$
00124$:
;./exsoccer.c:1133: g_Players[playerId].TargetX=FIELD_POS_X_CENTER-7;
	ld	a, #0x71
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1134: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER-10;
	ld	a, #0xe9
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1136: break;
	jp	00140$
;./exsoccer.c:1137: case PLAYER_ROLE_RIGHT_HALFFIELDER:
00126$:
;./exsoccer.c:1138: if(g_RestartKickTeamId!=TEAM_2){
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, #0x02
	jr	Z, 00128$
;./exsoccer.c:1139: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT-116;
	ld	a, #0x52
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1140: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS-40;
	ld	a, #0xb4
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
	jp	00140$
00128$:
;./exsoccer.c:1143: g_Players[playerId].TargetX=FIELD_POS_X_CENTER+7;
	ld	a, #0x7f
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1144: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER-10;
	ld	a, #0xe9
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1146: break;
	jp	00140$
;./exsoccer.c:1147: case PLAYER_ROLE_LEFT_STRIKER:
00130$:
;./exsoccer.c:1148: g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
	ld	a, #0x28
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1149: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS;
	ld	a, #0xdc
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1150: break;
	jp	00140$
;./exsoccer.c:1151: case PLAYER_ROLE_RIGHT_STRIKER:
00131$:
;./exsoccer.c:1152: g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
	ld	a, #0xc6
	ld	(bc), a
	inc	bc
	xor	a, a
	ld	(bc), a
;./exsoccer.c:1153: g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS;
	ld	a, #0xdc
	ld	(de), a
	inc	de
	xor	a, a
	ld	(de), a
;./exsoccer.c:1160: }
00140$:
;./exsoccer.c:1161: }
	inc	sp
	pop	ix
	ret
;./exsoccer.c:1162: void SetPlayerBallPossession(u8 playerId){
;	---------------------------------
; Function SetPlayerBallPossession
; ---------------------------------
_SetPlayerBallPossession::
;./exsoccer.c:1163: if (playerId == NO_VALUE) {
	ld	c, a
	inc	a
	ret	Z
;./exsoccer.c:1168: return;
	jp	00102$
00102$:
;./exsoccer.c:1171: if(g_Players[playerId].TeamId==TEAM_1){
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
;./exsoccer.c:1172: if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team1ActivePlayer=playerId;
	ld	hl, #9
	add	hl, de
	ld	b, (hl)
;./exsoccer.c:1171: if(g_Players[playerId].TeamId==TEAM_1){
	dec	a
	jr	NZ, 00108$
;./exsoccer.c:1172: if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team1ActivePlayer=playerId;
	ld	a, b
	or	a, a
	jr	Z, 00109$
	ld	hl, #_g_Team1ActivePlayer
	ld	(hl), c
	jp	00109$
00108$:
;./exsoccer.c:1175: if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team2ActivePlayer=playerId;
	ld	a, b
	or	a, a
	jr	Z, 00109$
	ld	hl, #_g_Team2ActivePlayer
	ld	(hl), c
00109$:
;./exsoccer.c:1178: g_Ball.PossessionTimer = 0; // Reset hold timer
	ld	hl, #(_g_Ball + 28)
	ld	(hl), #0x00
;./exsoccer.c:1179: }
	ret
;./exsoccer.c:1181: void TickCornerKick() {
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
;./exsoccer.c:1182: if (g_MatchStatus != MATCH_BEFORE_CORNER_KICK) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x02
	jp	NZ,00263$
;./exsoccer.c:1188: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	a, (#(_g_Ball + 6) + 0)
	ld	-1 (ix), a
	inc	a
	jr	Z, 00107$
;./exsoccer.c:1189: kickerId = g_Ball.PossessionPlayerId;
	ld	a, -1 (ix)
	ld	-23 (ix), a
	jp	00108$
00107$:
;./exsoccer.c:1191: if (g_CornerKickSide == CORNER_SIDE_LEFT) kickerId = GetPlayerIdByRole(g_RestartKickTeamId, PLAYER_ROLE_LEFT_STRIKER);
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00104$
	ld	l, #0x05
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetPlayerIdByRole
	ld	-1 (ix), a
	ld	-23 (ix), a
	jp	00108$
00104$:
;./exsoccer.c:1192: else kickerId = GetPlayerIdByRole(g_RestartKickTeamId, PLAYER_ROLE_RIGHT_STRIKER);
	ld	l, #0x06
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetPlayerIdByRole
	ld	-23 (ix), a
00108$:
;./exsoccer.c:1196: if (kickerId == NO_VALUE) {
	ld	a, -23 (ix)
	inc	a
	jr	NZ, 00110$
;./exsoccer.c:1197: kickerId = GetClosestPlayerToBall(g_RestartKickTeamId, NO_VALUE);
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	-23 (ix), a
00110$:
;./exsoccer.c:1205: bool kickerArrived = false;
	ld	-22 (ix), #0x00
;./exsoccer.c:1206: if (kickerId != NO_VALUE) {
	ld	a, -23 (ix)
	inc	a
	ld	a, #0x01
	jr	Z, 00783$
	xor	a, a
00783$:
	ld	-21 (ix), a
	bit	0, -21 (ix)
	jp	NZ, 00119$
;./exsoccer.c:1207: i16 dx = (i16)g_Players[kickerId].X - (i16)g_Players[kickerId].TargetX;
	ld	c, -23 (ix)
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
	ld	de, #0x000c
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
;./exsoccer.c:1208: i16 dy = (i16)g_Players[kickerId].Y - (i16)g_Players[kickerId].TargetY;
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
	add	a, #0x0a
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
;./exsoccer.c:1210: if (dx >= -2 && dx <= 2 && dy >= -2 && dy <= 2) {
	ld	a, -10 (ix)
	sub	a, #0xfe
	ld	a, -9 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jp	C, 00119$
	ld	c, -10 (ix)
	ld	b, -9 (ix)
	ld	a, #0x02
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00784$
	xor	a, #0x80
00784$:
	jp	M, 00119$
	ld	a, -2 (ix)
	sub	a, #0xfe
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00119$
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	a, #0x02
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00785$
	xor	a, #0x80
00785$:
	jp	M, 00119$
;./exsoccer.c:1211: kickerArrived = true;
	ld	-22 (ix), #0x01
;./exsoccer.c:1212: g_Players[kickerId].X = g_Players[kickerId].TargetX;
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, -12 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -11 (ix)
	ld	(hl), a
;./exsoccer.c:1213: g_Players[kickerId].Y = g_Players[kickerId].TargetY;
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
;./exsoccer.c:1214: g_Players[kickerId].Status = PLAYER_STATUS_POSITIONED;
	ld	l, -16 (ix)
	ld	h, -15 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:1216: if (g_Ball.PossessionPlayerId != kickerId) {
	ld	hl, #(_g_Ball + 6)
	ld	a,-23 (ix)
	sub	a,(hl)
	jr	Z, 00119$
;./exsoccer.c:1217: SetPlayerBallPossession(kickerId);
	ld	a, -23 (ix)
	call	_SetPlayerBallPossession
;./exsoccer.c:1218: g_Ball.PossessionPlayerId = kickerId;
	ld	hl, #(_g_Ball + 6)
	ld	a, -23 (ix)
	ld	(hl), a
;./exsoccer.c:1219: PutBallOnPlayerFeet(kickerId);
	ld	a, -23 (ix)
	call	_PutBallOnPlayerFeet
00119$:
;./exsoccer.c:1225: bool teammatesArrived = true;
	ld	-20 (ix), #0x01
;./exsoccer.c:1226: for(u8 i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00256$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00132$
;./exsoccer.c:1227: if (g_Players[i].TeamId == g_RestartKickTeamId && i != kickerId && g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) {
	ld	c, -1 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
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
	ld	de, #0x0005
	add	hl, de
	ld	c, (hl)
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, c
	jp	NZ,00257$
	ld	a, -1 (ix)
	sub	a, -23 (ix)
	jp	Z,00257$
	ld	a, -19 (ix)
	ld	-3 (ix), a
	ld	a, -18 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	or	a, a
	jp	Z, 00257$
;./exsoccer.c:1229: if (g_Players[i].Status != PLAYER_STATUS_POSITIONED) {
	ld	a, -19 (ix)
	add	a, #0x0e
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
	jp	Z,00257$
;./exsoccer.c:1230: i16 dx = (i16)g_Players[i].X - (i16)g_Players[i].TargetX;
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
	ld	-7 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, -19 (ix)
	ld	-3 (ix), a
	ld	a, -18 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x000c
	add	hl, de
	ld	a, (hl)
	ld	-13 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-12 (ix), a
	ld	a, -13 (ix)
	ld	-5 (ix), a
	ld	a, -12 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	sub	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	sbc	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-11 (ix), a
	ld	a, -2 (ix)
	ld	-10 (ix), a
;./exsoccer.c:1231: i16 dy = (i16)g_Players[i].Y - (i16)g_Players[i].TargetY;
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
	add	a, #0x0a
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
;./exsoccer.c:1232: if (dx < -6 || dx > 6 || dy < -6 || dy > 6) {
	ld	a, -11 (ix)
	sub	a, #0xfa
	ld	a, -10 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00120$
	ld	a, -11 (ix)
	ld	-5 (ix), a
	ld	a, -10 (ix)
	ld	-4 (ix), a
	ld	a, #0x06
	cp	a, -5 (ix)
	ld	a, #0x00
	sbc	a, -4 (ix)
	jp	PO, 00791$
	xor	a, #0x80
00791$:
	jp	M, 00120$
	ld	a, -3 (ix)
	sub	a, #0xfa
	ld	a, -2 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00120$
	ld	a, #0x06
	cp	a, -3 (ix)
	ld	a, #0x00
	sbc	a, -2 (ix)
	jp	PO, 00792$
	xor	a, #0x80
00792$:
	jp	P, 00121$
00120$:
;./exsoccer.c:1233: teammatesArrived = false; // Someone is still far away
	ld	-20 (ix), #0x00
	jp	00257$
00121$:
;./exsoccer.c:1236: g_Players[i].X = g_Players[i].TargetX;
	ld	l, -15 (ix)
	ld	h, -14 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
;./exsoccer.c:1237: g_Players[i].Y = g_Players[i].TargetY;
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
;./exsoccer.c:1238: g_Players[i].Status = PLAYER_STATUS_POSITIONED;
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00257$:
;./exsoccer.c:1226: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00256$
00132$:
;./exsoccer.c:1245: if (g_Timer < 180 || (kickerId != NO_VALUE && !kickerArrived) || !teammatesArrived) {
	ld	a, (_g_Timer+0)
	sub	a, #0xb4
	ld	a, #0x00
	rla
	ld	c, a
	or	a, a
	jr	NZ, 00163$
	bit	0, -21 (ix)
	jr	NZ, 00167$
	ld	a, -22 (ix)
	or	a, a
	jr	Z, 00163$
00167$:
	ld	a, -20 (ix)
	or	a, a
	jp	NZ, 00164$
00163$:
;./exsoccer.c:1246: if (g_Timer < 180) g_Timer++;
	ld	a, c
	or	a, a
	jr	Z, 00338$
	ld	hl, #_g_Timer
	inc	(hl)
;./exsoccer.c:1249: for(u8 i=0; i<14; i++) {
00338$:
	ld	c, #0x00
00259$:
	ld	a, c
	sub	a, #0x0e
	jp	NC,00263$
;./exsoccer.c:1251: if (i != kickerId && g_Players[i].Status != PLAYER_STATUS_POSITIONED && 
	ld	a, -23 (ix)
	sub	a, c
	ld	a, #0x01
	jr	Z, 00794$
	xor	a, a
00794$:
	ld	-3 (ix), a
	bit	0, -3 (ix)
	jr	NZ, 00136$
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	iy, #_g_Players
	add	iy, de
	push	iy
	pop	de
	ld	hl, #14
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, #0x04
	or	a, d
	jr	Z, 00136$
;./exsoccer.c:1252: !(g_Players[i].X == g_Players[i].TargetX && g_Players[i].Y == g_Players[i].TargetY)) continue;
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
	jp	NZ,00161$
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	push	iy
	pop	hl
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
	jp	NZ,00161$
00136$:
;./exsoccer.c:1256: if (i == kickerId) {
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00157$
;./exsoccer.c:1258: if (g_RestartKickTeamId == TEAM_1) lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_DOWN_RIGHT : DIRECTION_DOWN_LEFT;
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00141$
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00265$
	ld	de, #0x0004
	jp	00266$
00265$:
	ld	de, #0x0006
00266$:
	ld	-1 (ix), e
	jp	00158$
00141$:
;./exsoccer.c:1259: else lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_UP_RIGHT : DIRECTION_UP_LEFT;
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00267$
	ld	de, #0x0002
	jp	00268$
00267$:
	ld	de, #0x0008
00268$:
	ld	-1 (ix), e
	jp	00158$
00157$:
;./exsoccer.c:1261: else if (g_Players[i].TeamId == g_RestartKickTeamId) {
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
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	de, #5
	add	hl, de
	ld	b, (hl)
;./exsoccer.c:1263: if (g_RestartKickTeamId == TEAM_1 && i != kickerId) { 
	ld	a,(_g_RestartKickTeamId+0)
	cp	a,b
	jr	NZ, 00154$
	dec	a
	ld	a, #0x01
	jr	Z, 00805$
	xor	a, a
00805$:
	ld	-1 (ix), a
	or	a, a
	jr	Z, 00144$
	bit	0, -3 (ix)
	jr	NZ, 00144$
;./exsoccer.c:1265: lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_UP_LEFT : DIRECTION_UP_RIGHT;
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00269$
	ld	de, #0x0008
	jp	00270$
00269$:
	ld	de, #0x0002
00270$:
	ld	-1 (ix), e
	jp	00158$
00144$:
;./exsoccer.c:1268: lookDir = (g_RestartKickTeamId == TEAM_1) ? DIRECTION_UP : DIRECTION_DOWN;
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00271$
	ld	de, #0x0001
	jp	00272$
00271$:
	ld	de, #0x0005
00272$:
	ld	-1 (ix), e
	jp	00158$
00154$:
;./exsoccer.c:1272: i16 dx = (i16)g_Ball.X - (i16)g_Players[i].X;
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
;./exsoccer.c:1273: i16 dy = (i16)g_Ball.Y - (i16)g_Players[i].Y;
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
;./exsoccer.c:1275: if (dy < -20) lookDir = (dx > 20) ? DIRECTION_UP_RIGHT : ((dx < -20) ? DIRECTION_UP_LEFT : DIRECTION_UP);
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
	jr	NC, 00151$
	ld	a, #0x14
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00806$
	xor	a, #0x80
00806$:
	jp	P, 00273$
	ld	de, #0x0002
	jp	00274$
00273$:
	ld	a, -4 (ix)
	sub	a, #0xec
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00275$
	ld	de, #0x0008
	jp	00276$
00275$:
	ld	de, #0x0001
00276$:
00274$:
	ld	-1 (ix), e
	jp	00158$
00151$:
;./exsoccer.c:1276: else if (dy > 20) lookDir = (dx > 20) ? DIRECTION_DOWN_RIGHT : ((dx < -20) ? DIRECTION_DOWN_LEFT : DIRECTION_DOWN);
	ld	a, #0x14
	cp	a, e
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00807$
	xor	a, #0x80
00807$:
	jp	P, 00148$
	ld	a, #0x14
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00808$
	xor	a, #0x80
00808$:
	jp	P, 00277$
	ld	de, #0x0004
	jp	00278$
00277$:
	ld	a, -4 (ix)
	sub	a, #0xec
	ld	a, -3 (ix)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC, 00279$
	ld	de, #0x0006
	jp	00280$
00279$:
	ld	de, #0x0005
00280$:
00278$:
	ld	-1 (ix), e
	jp	00158$
00148$:
;./exsoccer.c:1277: else lookDir = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00809$
	xor	a, #0x80
00809$:
	jp	P, 00281$
	ld	de, #0x0003
	jp	00282$
00281$:
	ld	de, #0x0007
00282$:
	ld	-1 (ix), e
00158$:
;./exsoccer.c:1280: if (lookDir != DIRECTION_NONE) {
	ld	a, -1 (ix)
	or	a, a
	jr	Z, 00161$
;./exsoccer.c:1281: g_Players[i].Direction = lookDir;
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
	ld	a, -1 (ix)
	ld	(hl), a
;./exsoccer.c:1282: g_Players[i].PatternId = GetNoMovingPlayerPatternId(lookDir);
	inc	de
	inc	de
	inc	de
	inc	de
	push	bc
	push	de
	ld	a, -1 (ix)
	call	_GetNoMovingPlayerPatternId
	pop	de
	pop	bc
	ld	(de), a
00161$:
;./exsoccer.c:1249: for(u8 i=0; i<14; i++) {
	inc	c
;./exsoccer.c:1285: return; // END SETUP PHASE
	jp	00259$
00164$:
;./exsoccer.c:1289: ClearTextFromLayerA(10, 12, 11);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_ClearTextFromLayerA
;./exsoccer.c:1296: if (kickerId != NO_VALUE) {
	bit	0, -21 (ix)
	jr	NZ, 00169$
;./exsoccer.c:1297: g_Players[kickerId].X = g_Players[kickerId].TargetX;
	ld	c, -23 (ix)
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
	ld	de, #0x000c
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
;./exsoccer.c:1298: g_Players[kickerId].Y = g_Players[kickerId].TargetY;
	ld	l, -6 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -5 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #0x000a
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	c, (hl)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), c
00169$:
;./exsoccer.c:1258: if (g_RestartKickTeamId == TEAM_1) lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_DOWN_RIGHT : DIRECTION_DOWN_LEFT;
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	ld	a, #0x01
	jr	Z, 00811$
	xor	a, a
00811$:
	ld	c, a
;./exsoccer.c:1301: bool isHuman = (g_RestartKickTeamId == TEAM_1 || (g_GameWith2Players && g_RestartKickTeamId == TEAM_2));
	ld	e, c
	bit	0, e
	jr	NZ, 00284$
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00283$
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, #0x02
	jr	Z, 00284$
00283$:
	xor	a, a
	jp	00285$
00284$:
	ld	a, #0x01
00285$:
;./exsoccer.c:1303: if (isHuman) {
	or	a, a
	jp	Z, 00253$
;./exsoccer.c:1304: if (g_RestartKickTeamId == TEAM_1) {
	ld	a, c
	or	a, a
	jp	Z, 00239$
;./exsoccer.c:1306: u8 candLeft = NO_VALUE;
	ld	-5 (ix), #0xff
;./exsoccer.c:1307: u8 candRight = NO_VALUE;
	ld	-4 (ix), #0xff
;./exsoccer.c:1309: for(u8 c=0; c<14; c++) {
	ld	-1 (ix), #0x00
00261$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00179$
;./exsoccer.c:1310: if (g_Players[c].TeamId == TEAM_1 && c != kickerId) {
	ld	c, -1 (ix)
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
	ld	a, -7 (ix)
	add	a, #<(_g_Players)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	adc	a, #>(_g_Players)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-7 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	a, (hl)
	dec	a
	jr	NZ, 00262$
	ld	a, -1 (ix)
	sub	a, -23 (ix)
	jr	Z, 00262$
;./exsoccer.c:1311: u8 tx = g_Players[c].TargetX;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x000c
	add	hl, de
	ld	a, (hl)
;./exsoccer.c:1313: if (tx >= 40 && tx <= 110) candLeft = c;
	ld	-2 (ix), a
	sub	a, #0x28
	jr	C, 00171$
	ld	a, #0x6e
	sub	a, -2 (ix)
	jr	C, 00171$
	ld	a, -1 (ix)
	ld	-5 (ix), a
00171$:
;./exsoccer.c:1314: if (tx >= 130 && tx <= 220) candRight = c;
	ld	a, -2 (ix)
	sub	a, #0x82
	jr	C, 00262$
	ld	a, #0xdc
	sub	a, -2 (ix)
	jr	C, 00262$
	ld	a, -1 (ix)
	ld	-4 (ix), a
00262$:
;./exsoccer.c:1309: for(u8 c=0; c<14; c++) {
	inc	-1 (ix)
	jp	00261$
00179$:
;./exsoccer.c:1317: if (candLeft == NO_VALUE) candLeft = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_LEFT_HALFFIELDER);
	ld	a, -5 (ix)
	inc	a
	jr	NZ, 00181$
	ld	l, #0x03
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_GetPlayerIdByRole
	ld	-5 (ix), a
00181$:
;./exsoccer.c:1318: if (candRight == NO_VALUE) candRight = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_RIGHT_HALFFIELDER);
	ld	a, -4 (ix)
	inc	a
	jr	NZ, 00183$
	ld	l, #0x04
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_GetPlayerIdByRole
	ld	-4 (ix), a
00183$:
;./exsoccer.c:1321: if (g_CornerKickTargetId == NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	NZ, 00190$
;./exsoccer.c:1322: if (candLeft != NO_VALUE) g_CornerKickTargetId = candLeft;
	ld	a, -5 (ix)
	inc	a
	jr	Z, 00187$
	ld	a, -5 (ix)
	ld	(_g_CornerKickTargetId+0), a
	jp	00190$
00187$:
;./exsoccer.c:1323: else if (candRight != NO_VALUE) g_CornerKickTargetId = candRight; 
	ld	a, -4 (ix)
	inc	a
	jr	Z, 00190$
	ld	a, -4 (ix)
	ld	(_g_CornerKickTargetId+0), a
00190$:
;./exsoccer.c:1327: u8 joyDir = GetJoystick1Direction();
	call	_GetJoystick1Direction
;./exsoccer.c:1330: if (joyDir == DIRECTION_LEFT && !joyMoved && candLeft != NO_VALUE) {
	ld	-1 (ix), a
	sub	a, #0x07
	jr	NZ, 00199$
	ld	a, (_TickCornerKick_joyMoved_196613_1656+0)
	or	a, a
	jr	NZ, 00199$
	ld	a, -5 (ix)
	inc	a
	jr	Z, 00199$
;./exsoccer.c:1331: g_CornerKickTargetId = candLeft; joyMoved = true;
	ld	a, -5 (ix)
	ld	(_g_CornerKickTargetId+0), a
	ld	hl, #_TickCornerKick_joyMoved_196613_1656
	ld	(hl), #0x01
	jp	00200$
00199$:
;./exsoccer.c:1332: } else if (joyDir == DIRECTION_RIGHT && !joyMoved && candRight != NO_VALUE) {
	ld	a, -1 (ix)
	sub	a, #0x03
	jr	NZ, 00194$
	ld	a, (_TickCornerKick_joyMoved_196613_1656+0)
	or	a, a
	jr	NZ, 00194$
	ld	a, -4 (ix)
	inc	a
	jr	Z, 00194$
;./exsoccer.c:1333: g_CornerKickTargetId = candRight; joyMoved = true;
	ld	a, -4 (ix)
	ld	(_g_CornerKickTargetId+0), a
	ld	hl, #_TickCornerKick_joyMoved_196613_1656
	ld	(hl), #0x01
	jp	00200$
00194$:
;./exsoccer.c:1334: } else if (joyDir == DIRECTION_NONE) {
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00200$
;./exsoccer.c:1335: joyMoved = false;
	ld	hl, #_TickCornerKick_joyMoved_196613_1656
	ld	(hl), #0x00
00200$:
;./exsoccer.c:1342: if (kickerId != NO_VALUE) {
	bit	0, -21 (ix)
	jp	NZ, 00204$
;./exsoccer.c:1343: u8 kDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_DOWN_RIGHT : DIRECTION_DOWN_LEFT;
	ld	a, (_g_CornerKickSide+0)
	or	a, a
	jr	NZ, 00289$
	ld	-2 (ix), #0x04
	ld	-1 (ix), #0
	jp	00290$
00289$:
	ld	-2 (ix), #0x06
	ld	-1 (ix), #0
00290$:
	ld	a, -2 (ix)
	ld	-3 (ix), a
;./exsoccer.c:1344: g_Players[kickerId].Direction = kDir;
	ld	c, -23 (ix)
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
	ld	a, #<(_g_Players)
	add	a, -2 (ix)
	ld	-6 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -1 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	add	a, #0x06
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, -3 (ix)
	ld	(hl), a
;./exsoccer.c:1345: g_Players[kickerId].PatternId = GetNoMovingPlayerPatternId(kDir);
	ld	a, -6 (ix)
	add	a, #0x04
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
;./exsoccer.c:1346: g_Players[kickerId].X = g_Players[kickerId].TargetX;
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
	ld	de, #0x000c
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
;./exsoccer.c:1347: g_Players[kickerId].Y = g_Players[kickerId].TargetY;
	ld	a, -6 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	de, #0x000a
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
;./exsoccer.c:1349: g_Players[kickerId].Status = PLAYER_STATUS_POSITIONED; 
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
00204$:
;./exsoccer.c:1353: bool t1Trigger = IsTeamJoystickTriggerPressed(TEAM_1);
	ld	a, #0x01
	call	_IsTeamJoystickTriggerPressed
	ld	c, a
;./exsoccer.c:1355: if (g_Timer == 180) t1Latched = true;
	ld	a, (_g_Timer+0)
	sub	a, #0xb4
	jr	NZ, 00206$
	ld	hl, #_TickCornerKick_t1Latched_196614_1661
	ld	(hl), #0x01
00206$:
;./exsoccer.c:1356: if (!t1Trigger) t1Latched = false;
	ld	a, c
	or	a, a
	jr	NZ, 00208$
	ld	hl, #_TickCornerKick_t1Latched_196614_1661
	ld	(hl), #0x00
00208$:
;./exsoccer.c:1359: if (g_CornerKickTargetId != NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	Z, 00210$
;./exsoccer.c:1360: g_Ball.PassTargetPlayerId = g_CornerKickTargetId;
	ld	hl, #(_g_Ball + 16)
	ld	a, (_g_CornerKickTargetId+0)
	ld	(hl), a
;./exsoccer.c:1361: g_PassTargetPlayer = g_CornerKickTargetId;
	ld	a, (_g_CornerKickTargetId+0)
	ld	(_g_PassTargetPlayer+0), a
00210$:
;./exsoccer.c:1364: if (t1Trigger && !t1Latched && g_CornerKickTargetId != NO_VALUE) {
	ld	a, c
	or	a, a
	jp	Z, 00263$
	ld	a, (_TickCornerKick_t1Latched_196614_1661+0)
	or	a, a
	jp	NZ, 00263$
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jp	Z,00263$
;./exsoccer.c:1365: PerformPass(g_CornerKickTargetId);
	ld	a, (_g_CornerKickTargetId+0)
	call	_PerformPass
;./exsoccer.c:1366: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;./exsoccer.c:1367: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
	jp	00263$
00239$:
;./exsoccer.c:1372: u8 joyDir = GetJoystick2Direction();
	call	_GetJoystick2Direction
	ld	-1 (ix), a
;./exsoccer.c:1373: bool trigger = IsTeamJoystickTriggerPressed(TEAM_2);
	ld	a, #0x02
	call	_IsTeamJoystickTriggerPressed
	ld	-6 (ix), a
;./exsoccer.c:1376: if (g_CornerKickTargetId == NO_VALUE) g_CornerKickTargetId = GetPlayerIdByRole(TEAM_2, PLAYER_ROLE_LEFT_STRIKER);
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	NZ, 00216$
	ld	l, #0x05
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_GetPlayerIdByRole
	ld	(_g_CornerKickTargetId+0), a
00216$:
;./exsoccer.c:1378: if ((joyDir == DIRECTION_LEFT || joyDir == DIRECTION_RIGHT) && !joyMoved) {
	ld	a, -1 (ix)
	sub	a, #0x07
	jr	Z, 00232$
	ld	a, -1 (ix)
	sub	a, #0x03
	jp	NZ,00229$
00232$:
	ld	a, (_TickCornerKick_joyMoved_196612_1664+0)
	or	a, a
	jp	NZ, 00229$
;./exsoccer.c:1379: u8 curr = g_CornerKickTargetId;
	ld	a, (_g_CornerKickTargetId+0)
	ld	-5 (ix), a
;./exsoccer.c:1381: do {
	ld	a, -1 (ix)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00840$
	xor	a, a
00840$:
	ld	-4 (ix), a
	ld	-1 (ix), #0x00
00223$:
;./exsoccer.c:1382: curr = (joyDir==DIRECTION_RIGHT) ? curr+1 : curr-1;
	ld	a, -5 (ix)
	ld	-2 (ix), a
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00291$
	inc	-2 (ix)
	jp	00292$
00291$:
	dec	-2 (ix)
00292$:
	ld	a, -2 (ix)
	ld	-5 (ix), a
;./exsoccer.c:1383: if (curr > 13) curr = 0;
	ld	a, #0x0d
	sub	a, -5 (ix)
	jr	NC, 00218$
	ld	-5 (ix), #0x00
00218$:
;./exsoccer.c:1384: if (g_Players[curr].TeamId == TEAM_2 && g_Players[curr].Role != PLAYER_ROLE_GOALKEEPER && curr != kickerId) {
	ld	c, -5 (ix)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, #<(_g_Players)
	add	a, -8 (ix)
	ld	-3 (ix), a
	ld	a, #>(_g_Players)
	adc	a, -7 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-8 (ix), a
	ld	a, -2 (ix)
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	de, #0x0005
	add	hl, de
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00220$
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	de, #0x0009
	add	hl, de
	ld	a, (hl)
	ld	-2 (ix), a
	or	a, a
	jr	Z, 00220$
	ld	a, -23 (ix)
	sub	a, -5 (ix)
	jr	Z, 00220$
;./exsoccer.c:1385: g_CornerKickTargetId = curr; break;
	ld	a, -5 (ix)
	ld	(_g_CornerKickTargetId+0), a
	jp	00225$
00220$:
;./exsoccer.c:1387: loop++;
	inc	-1 (ix)
;./exsoccer.c:1388: } while (loop < 15);
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	C, 00223$
00225$:
;./exsoccer.c:1389: joyMoved = true;
	ld	hl, #_TickCornerKick_joyMoved_196612_1664
	ld	(hl), #0x01
	jp	00230$
00229$:
;./exsoccer.c:1390: } else if (joyDir == DIRECTION_NONE) joyMoved = false;
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00230$
	ld	hl, #_TickCornerKick_joyMoved_196612_1664
	ld	(hl), #0x00
00230$:
;./exsoccer.c:1392: if (g_CornerKickTargetId != NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	Z, 00234$
;./exsoccer.c:1393: g_Ball.PassTargetPlayerId = g_CornerKickTargetId;
	ld	hl, #(_g_Ball + 16)
	ld	a, (_g_CornerKickTargetId+0)
	ld	(hl), a
;./exsoccer.c:1394: g_PassTargetPlayer = g_CornerKickTargetId;
	ld	a, (_g_CornerKickTargetId+0)
	ld	(_g_PassTargetPlayer+0), a
00234$:
;./exsoccer.c:1397: if (trigger && g_CornerKickTargetId != NO_VALUE) {
	ld	a, -6 (ix)
	or	a, a
	jp	Z, 00263$
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	Z, 00263$
;./exsoccer.c:1398: PerformPass(g_CornerKickTargetId);
	ld	a, (_g_CornerKickTargetId+0)
	call	_PerformPass
;./exsoccer.c:1399: g_MatchStatus = MATCH_IN_ACTION;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;./exsoccer.c:1400: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
	jp	00263$
00253$:
;./exsoccer.c:1406: if (g_CornerKickTargetId == NO_VALUE) {
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	NZ, 00246$
;./exsoccer.c:1407: u8 randomRole = ((g_Timer & 1) == 0) ? PLAYER_ROLE_LEFT_STRIKER : PLAYER_ROLE_RIGHT_STRIKER;
	ld	a, (_g_Timer+0)
	rrca
	jr	C, 00293$
	ld	hl, #0x0005
	jp	00294$
00293$:
	ld	hl, #0x0006
00294$:
;./exsoccer.c:1408: u8 strikerId = GetPlayerIdByRole(g_RestartKickTeamId, randomRole);
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetPlayerIdByRole
;./exsoccer.c:1411: if (strikerId != NO_VALUE && strikerId != kickerId) {
	ld	c, a
	inc	a
	jr	Z, 00242$
	ld	a, -23 (ix)
	sub	a, c
	jr	Z, 00242$
;./exsoccer.c:1412: g_CornerKickTargetId = strikerId;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), c
	jp	00246$
00242$:
;./exsoccer.c:1414: g_CornerKickTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, kickerId);
	ld	l, -23 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	(_g_CornerKickTargetId+0), a
00246$:
;./exsoccer.c:1418: if (g_Timer > 200) {
	ld	a, #0xc8
	ld	hl, #_g_Timer
	sub	a, (hl)
	jr	NC, 00250$
;./exsoccer.c:1419: if (g_CornerKickTargetId == NO_VALUE) g_CornerKickTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, kickerId);
	ld	a, (_g_CornerKickTargetId+0)
	inc	a
	jr	NZ, 00248$
	ld	l, -23 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GetClosestPlayerToBall
	ld	(_g_CornerKickTargetId+0), a
00248$:
;./exsoccer.c:1421: PerformPass(g_CornerKickTargetId);
	ld	a, (_g_CornerKickTargetId+0)
	call	_PerformPass
;./exsoccer.c:1422: g_MatchStatus = MATCH_IN_ACTION; 
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x0c
;./exsoccer.c:1423: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
	jp	00263$
00250$:
;./exsoccer.c:1425: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
00263$:
;./exsoccer.c:1428: }
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
