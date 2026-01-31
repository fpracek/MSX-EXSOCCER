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
	.globl _ShowMenu
	.globl _LoadPresentation
	.globl _TickPonPonGirlsAnimation
	.globl _InitPonPonGirls
	.globl _PutPonPonGirlSprite
	.globl _EnforcePenaltyBoxRestriction
	.globl _GetClosestPlayerToBall
	.globl _TickBallFlying
	.globl _GoalkeeperWithBall
	.globl _TickThrowIn
	.globl _TickCornerKick
	.globl _TickGoalkeeperAnimation
	.globl _UpdatePassTarget
	.globl _TickBallCollision
	.globl _TickAI
	.globl _TickCheckBallBoundaries
	.globl _ResetBallInfo
	.globl _TickTeamJoystick
	.globl _GetPlayerIdByRole
	.globl _ClearTextFromLayerA
	.globl _TickShowKickOff
	.globl _TimeUp
	.globl _ResetPlayersInfo
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
	.globl _V9_SetRegister
	.globl _V9_SetPort
	.globl _Print_SetColor
	.globl _Print_DrawText
	.globl _Print_SetTextFont
	.globl _VDP_RegWriteBakMask
	.globl _VDP_SetMode
	.globl _VDP_ClearVRAM
	.globl _g_GkIsGroundKick
	.globl _g_GkRecoilY
	.globl _g_VSynch
	.globl _g_ThrowInPlayerId
	.globl _g_CornerKickTargetId
	.globl _g_GoalKickSide
	.globl _g_CornerKickSide
	.globl _g_GoalScorerId
	.globl _g_ShotCursorDir
	.globl _g_ShotCursorX
	.globl _g_ShootCooldown
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
	.globl _g_FieldCurrentYPosition
	.globl _g_History2
	.globl _g_History1
	.globl _g_FioBre
	.globl _g_SecondsToEndOfMatch
	.globl _g_RestartKickTeamId
	.globl _g_ActiveFieldZone
	.globl _g_Ball
	.globl _g_PonPonGirls
	.globl _g_Players
	.globl _g_Team2Score
	.globl _g_Team1Score
	.globl _g_Team2PaletteId
	.globl _g_Team1PaletteId
	.globl _g_FieldScrollingActionInProgress
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
	.globl _g_TeamStats
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
	.globl _ShowField
	.globl _PeopleMoving
	.globl _V9_InterruptHBlank
	.globl _V9_InterruptVBlank
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
	.globl _TickShotCursor
	.globl _LoadSprites
	.globl _main
	.globl _MainGameLoop
	.globl _UpdatePlayerPatternByDirection
	.globl _GetNoMovingPlayerPatternId
	.globl _GetNewPoseByDirection
	.globl _GetPatternIdByPoseAndDirection
	.globl _SetPlayerTarget
	.globl _GetTeamStats
	.globl _IsOffside
	.globl _PerformPass
	.globl _SetPlayerBallPossession
	.globl _TickGoalKick
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
_g_FieldScrollingActionInProgress::
	.ds 1
_g_Team1PaletteId::
	.ds 1
_g_Team2PaletteId::
	.ds 1
_g_Team1Score::
	.ds 1
_g_Team2Score::
	.ds 1
_g_Players::
	.ds 315
_g_PonPonGirls::
	.ds 30
_g_Ball::
	.ds 30
_g_ActiveFieldZone::
	.ds 1
_g_RestartKickTeamId::
	.ds 1
_g_SecondsToEndOfMatch::
	.ds 1
_g_FioBre::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_g_History1::
	.ds 20
_g_History2::
	.ds 20
_g_FieldCurrentYPosition::
	.ds 2
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
_g_ShootCooldown::
	.ds 1
_g_ShotCursorX::
	.ds 2
_g_ShotCursorDir::
	.ds 1
_g_GoalScorerId::
	.ds 1
_g_CornerKickSide::
	.ds 1
_g_GoalKickSide::
	.ds 1
_g_CornerKickTargetId::
	.ds 1
_g_ThrowInPlayerId::
	.ds 1
_g_VSynch::
	.ds 1
_g_GkRecoilY::
	.ds 1
_g_GkIsGroundKick::
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;./exsoccer.c:77: void UpdateV9990()
;	---------------------------------
; Function UpdateV9990
; ---------------------------------
_UpdateV9990::
;./exsoccer.c:79: WaitV9990Synch();
;./exsoccer.c:80: }
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
_g_TeamStats:
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x10	; 16
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x06	; 6
	.db #0x08	; 8
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x0f	; 15
;./exsoccer.c:81: void InitVariables(){
;	---------------------------------
; Function InitVariables
; ---------------------------------
_InitVariables::
;./exsoccer.c:83: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:84: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;./exsoccer.c:85: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;./exsoccer.c:86: g_Ball.LastTouchTeamId = NO_VALUE;
	ld	hl, #(_g_Ball + 14)
	ld	(hl), #0xff
;./exsoccer.c:87: g_Ball.ComingFromRestart = 0;
	ld	hl, #(_g_Ball + 29)
	ld	(hl), #0x00
;./exsoccer.c:89: }
	ret
;./exsoccer.c:91: void WaitV9990Synch()
;	---------------------------------
; Function WaitV9990Synch
; ---------------------------------
_WaitV9990Synch::
;./exsoccer.c:93: while(!g_VSynch) {}
00101$:
	ld	a, (_g_VSynch+0)
	or	a, a
	jr	Z, 00101$
;./exsoccer.c:94: g_VSynch = FALSE;
	ld	hl, #_g_VSynch
	ld	(hl), #0x00
;./exsoccer.c:95: g_FrameCounter++;
	ld	hl, (_g_FrameCounter)
	inc	hl
;./exsoccer.c:96: if(g_FrameCounter==60){
	ld	(_g_FrameCounter), hl
	ld	a, l
	sub	a, #0x3c
	or	a, h
	ret	NZ
;./exsoccer.c:97: g_FrameCounter=0;
	ld	hl, #0x0000
	ld	(_g_FrameCounter), hl
;./exsoccer.c:99: }
	ret
;./exsoccer.c:103: void LoadP1LayerA(){
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
;./exsoccer.c:106: V9_WriteVRAM(V9_P1_PGT_A, g_GameFieldLayerATiles, sizeof(g_GameFieldLayerATiles)); // Load fonts
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x0000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_GameFieldLayerATiles
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0010
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:108: V9_WriteVRAM(V9_P1_PGT_A + 8192L, g_Teams_part1, sizeof(g_Teams_part1));
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x2000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_Teams_part1
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0011
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:110: V9_WriteVRAM(V9_P1_PGT_A + 8192L + 16384L, g_Teams_part2, sizeof(g_Teams_part2));
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x6000
	ld	l, h
	call	_V9_SetWriteAddress
	ld	de, #0x1000
	ld	hl, #_g_Teams_part2
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
;./exsoccer.c:113: SET_BANK_SEGMENT(2, 1);
;./exsoccer.c:116: }
	ret
;./exsoccer.c:119: void LoadP1LayerB(){
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
;./exsoccer.c:122: V9_WriteVRAM(V9_P1_PGT_B, g_GameFieldLayerBTiles_part1, sizeof(g_GameFieldLayerBTiles_part1)); // Load tiles (part 1)
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
;./exsoccer.c:124: V9_WriteVRAM(V9_P1_PGT_B + 16384, g_GameFieldLayerBTiles_part2, sizeof(g_GameFieldLayerBTiles_part2)); // Load tiles (part 2)
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
;./exsoccer.c:126: V9_WriteVRAM(V9_P1_PGT_B + 16384L*2, g_GameFieldLayerBTiles_part3, sizeof(g_GameFieldLayerBTiles_part3)); // Load tiles (part 3)
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
;./exsoccer.c:128: V9_WriteVRAM(V9_P1_PGT_B + 16384L*3, g_GameFieldLayerBTiles_part4, sizeof(g_GameFieldLayerBTiles_part4)); // Load tiles (part 4)
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xc000
	ld	l, #0x04
	call	_V9_SetWriteAddress
	ld	de, #0x3800
	ld	hl, #_g_GameFieldLayerBTiles_part4
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x000b
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:130: V9_WriteVRAM(V9_P1_PGT_B + 16384L*4, g_GameFieldLayerBTiles_part5, sizeof(g_GameFieldLayerBTiles_part5)); // Load tiles (part 4)
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0x0000
	ld	l, #0x05
	call	_V9_SetWriteAddress
	ld	de, #0x4000
	ld	hl, #_g_GameFieldLayerBTiles_part5
	call	_V9_WriteVRAM_CurrentAddr
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:131: SET_BANK_SEGMENT(2, 1); 
;./exsoccer.c:134: }
	ret
;./exsoccer.c:135: void ShowField(){
;	---------------------------------
; Function ShowField
; ---------------------------------
_ShowField::
;./exsoccer.c:136: u16 tileId=0;
	ld	bc, #0x0000
;./exsoccer.c:138: for (u8 y=0;y<64;y++){
	ld	e, #0x00
00110$:
	ld	a, e
	sub	a, #0x40
	jr	NC, 00102$
;./exsoccer.c:139: for (u8 x=0;x<32;x++){
	ld	d, #0x00
00107$:
	ld	a, d
	sub	a, #0x20
	jr	NC, 00133$
;./exsoccer.c:140: V9_PutLayerBTileAtPos(x,y,tileId++);
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
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	a, d
	call	_V9_PutLayerBTileAtPos
	pop	de
	pop	bc
;./exsoccer.c:139: for (u8 x=0;x<32;x++){
	inc	d
	jp	00107$
00133$:
;./exsoccer.c:138: for (u8 y=0;y<64;y++){
	inc	e
	jp	00110$
00102$:
;./exsoccer.c:144: for (u8 y=0;y<64;y++){
	ld	c, #0x00
00116$:
	ld	a, c
	sub	a, #0x40
	jr	NC, 00104$
;./exsoccer.c:145: for (u8 x=0;x<32;x++){
	ld	b, #0x00
00113$:
	ld	a, b
	sub	a, #0x20
	jr	NC, 00117$
;./exsoccer.c:146: V9_PutLayerATileAtPos(x,y,0);
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, b
	call	_V9_PutLayerATileAtPos
	pop	bc
;./exsoccer.c:145: for (u8 x=0;x<32;x++){
	inc	b
	jp	00113$
00117$:
;./exsoccer.c:144: for (u8 y=0;y<64;y++){
	inc	c
	jp	00116$
00104$:
;./exsoccer.c:149: for (u8 x=0;x<64;x++){
	ld	c, #0x00
00119$:
	ld	a, c
	sub	a, #0x40
	ret	NC
;./exsoccer.c:150: V9_PutLayerATileAtPos(x,0,32);
	push	bc
	ld	hl, #0x0020
	push	hl
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_V9_PutLayerATileAtPos
	pop	bc
;./exsoccer.c:149: for (u8 x=0;x<64;x++){
	inc	c
;./exsoccer.c:152: }
	jp	00119$
;./exsoccer.c:153: void PeopleMoving(bool isBasicMoving){
;	---------------------------------
; Function PeopleMoving
; ---------------------------------
_PeopleMoving::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ld	d, a
;./exsoccer.c:154: u16 tileId=PUBLIC_TILE_1;
	ld	bc, #0x0000
;./exsoccer.c:155: u8  yPosition=0;
	ld	e, #0x00
;./exsoccer.c:156: if(!g_ActiveFieldZone==FIELD_NORTH_ZONE){
	ld	a, (_g_ActiveFieldZone+0)
	or	a, a
	jr	Z, 00102$
;./exsoccer.c:157: yPosition=62;
	ld	e, #0x3e
00102$:
;./exsoccer.c:161: if(!isBasicMoving){
	ld	a, d
	or	a, a
	jr	NZ, 00120$
;./exsoccer.c:162: tileId=PUBLIC_TILE_2;
	ld	bc, #0x0801
;./exsoccer.c:164: for (u8 y=yPosition;y<yPosition+2;y++){
00120$:
	ld	d, e
00111$:
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	-2 (ix), d
	ld	-1 (ix), #0x00
	ld	a, -2 (ix)
	sub	a, l
	ld	a, -1 (ix)
	sbc	a, h
	jp	PO, 00147$
	xor	a, #0x80
00147$:
	jp	P, 00113$
;./exsoccer.c:165: for (u8 x=0;x<32;x++){
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
00108$:
	ld	a, h
	sub	a, #0x20
	jr	NC, 00112$
;./exsoccer.c:166: V9_PutLayerBTileAtPos(x,y,tileId);
	push	hl
	push	bc
	push	de
	push	bc
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	a, h
	call	_V9_PutLayerBTileAtPos
	pop	de
	pop	bc
	pop	hl
;./exsoccer.c:165: for (u8 x=0;x<32;x++){
	inc	h
	jp	00108$
00112$:
;./exsoccer.c:164: for (u8 y=yPosition;y<yPosition+2;y++){
	inc	d
	jp	00111$
00113$:
;./exsoccer.c:169: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:171: void V9_InterruptHBlank(){
;	---------------------------------
; Function V9_InterruptHBlank
; ---------------------------------
_V9_InterruptHBlank::
;./exsoccer.c:173: }
	ret
;./exsoccer.c:174: void V9_InterruptVBlank(){
;	---------------------------------
; Function V9_InterruptVBlank
; ---------------------------------
_V9_InterruptVBlank::
;./exsoccer.c:175: if(g_MatchStatus==MATCH_PRESENTATION){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0f
	jr	NZ, 00102$
;./exsoccer.c:176: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
;./exsoccer.c:177: return;
	ret
00102$:
;./exsoccer.c:181: g_VSynch = TRUE;
	ld	a, #0x01
	ld	(#_g_VSynch), a
;./exsoccer.c:183: if (g_FieldScrollingActionInProgress != NO_VALUE) {
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	ret	Z
;./exsoccer.c:184: switch (g_FieldScrollingActionInProgress) {
	ld	a, (_g_FieldScrollingActionInProgress+0)
	or	a, a
	jr	Z, 00103$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	dec	a
	jr	Z, 00106$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	sub	a, #0x02
	jp	Z,00117$
	jp	00120$
;./exsoccer.c:185: case FIELD_NORTH_ZONE:
00103$:
;./exsoccer.c:186: g_FieldCurrentYPosition = g_FieldCurrentYPosition - g_FieldScrollSpeed;
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
;./exsoccer.c:187: if (g_FieldCurrentYPosition < 0) {
	ld	a, (_g_FieldCurrentYPosition+1)
	bit	7, a
	jp	Z, 00120$
;./exsoccer.c:188: g_FieldCurrentYPosition = 1;
	ld	hl, #0x0001
	ld	(_g_FieldCurrentYPosition), hl
;./exsoccer.c:189: g_FieldScrollingActionInProgress = NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;./exsoccer.c:190: g_ActiveFieldZone = FIELD_NORTH_ZONE;
	ld	hl, #_g_ActiveFieldZone
	ld	(hl), #0x00
;./exsoccer.c:192: break;
	jp	00120$
;./exsoccer.c:193: case FIELD_CENTRAL_ZONE:
00106$:
;./exsoccer.c:194: if (g_FieldCurrentYPosition != 136) {
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x88
	ld	iy, #_g_FieldCurrentYPosition
	or	a, 1 (iy)
	jr	Z, 00115$
;./exsoccer.c:186: g_FieldCurrentYPosition = g_FieldCurrentYPosition - g_FieldScrollSpeed;
	ld	a, (_g_FieldScrollSpeed+0)
	ld	c, a
	ld	b, #0x00
;./exsoccer.c:195: if (g_FieldCurrentYPosition > FIELD_CENTRAL_Y) {
	ld	a, #0x8c
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00202$
	xor	a, #0x80
00202$:
	jp	P, 00112$
;./exsoccer.c:196: g_FieldCurrentYPosition = g_FieldCurrentYPosition - g_FieldScrollSpeed;
	ld	hl, #_g_FieldCurrentYPosition
	ld	a, (hl)
	sub	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	(hl), a
;./exsoccer.c:197: if(g_FieldCurrentYPosition < 136) g_FieldCurrentYPosition = 136;
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x88
	ld	a, (_g_FieldCurrentYPosition+1)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00120$
	ld	hl, #0x0088
	ld	(_g_FieldCurrentYPosition), hl
	jp	00120$
00112$:
;./exsoccer.c:200: g_FieldCurrentYPosition = g_FieldCurrentYPosition + g_FieldScrollSpeed;
	ld	a, c
	ld	iy, #_g_FieldCurrentYPosition
	add	a, 0 (iy)
	ld	(_g_FieldCurrentYPosition+0), a
	ld	a, b
	adc	a, 1 (iy)
	ld	(_g_FieldCurrentYPosition+1), a
;./exsoccer.c:201: if(g_FieldCurrentYPosition > 136) g_FieldCurrentYPosition = 136;
	ld	a, #0x88
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00203$
	xor	a, #0x80
00203$:
	jp	P, 00120$
	ld	hl, #0x0088
	ld	(_g_FieldCurrentYPosition), hl
	jp	00120$
00115$:
;./exsoccer.c:206: g_FieldScrollingActionInProgress = NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;./exsoccer.c:207: g_ActiveFieldZone = FIELD_CENTRAL_ZONE;
	ld	hl, #_g_ActiveFieldZone
	ld	(hl), #0x01
;./exsoccer.c:209: break;
	jp	00120$
;./exsoccer.c:210: case FIELD_SOUTH_ZONE:
00117$:
;./exsoccer.c:211: g_FieldCurrentYPosition = g_FieldCurrentYPosition + g_FieldScrollSpeed;
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
;./exsoccer.c:212: if (g_FieldCurrentYPosition >= FIELD_BOTTOM_Y) {
	ld	a, (_g_FieldCurrentYPosition+0)
	sub	a, #0x18
	ld	a, (_g_FieldCurrentYPosition+1)
	rla
	ccf
	rra
	sbc	a, #0x81
	jr	C, 00120$
;./exsoccer.c:213: g_ActiveFieldZone = FIELD_SOUTH_ZONE;
	ld	hl, #_g_ActiveFieldZone
	ld	(hl), #0x02
;./exsoccer.c:214: g_FieldScrollingActionInProgress = NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;./exsoccer.c:217: }
00120$:
;./exsoccer.c:218: V9_SetScrollingBY(g_FieldCurrentYPosition);
	ld	hl, (_g_FieldCurrentYPosition)
	call	_V9_SetScrollingBY
;./exsoccer.c:219: for(u8 i=0;i<6;i++){
	ld	c, #0x00
00125$:
	ld	a, c
	sub	a, #0x06
	ret	NC
;./exsoccer.c:220: PutPonPonGirlSprite(i);
	push	bc
	ld	a, c
	call	_PutPonPonGirlSprite
	pop	bc
;./exsoccer.c:219: for(u8 i=0;i<6;i++){
	inc	c
;./exsoccer.c:223: }
	jp	00125$
;./exsoccer.c:227: void V9_InterruptCommand()
;	---------------------------------
; Function V9_InterruptCommand
; ---------------------------------
_V9_InterruptCommand::
;./exsoccer.c:230: }
	ret
;./exsoccer.c:233: void GameStart(){
;	---------------------------------
; Function GameStart
; ---------------------------------
_GameStart::
;./exsoccer.c:235: g_PassTargetPlayer=NO_VALUE;
	ld	hl, #_g_PassTargetPlayer
	ld	(hl), #0xff
;./exsoccer.c:236: g_Team1ActivePlayer=NO_VALUE;
	ld	hl, #_g_Team1ActivePlayer
	ld	(hl), #0xff
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	res	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;./exsoccer.c:238: g_SecondsToEndOfMatch=MATCH_DURATION;
	ld	hl, #_g_SecondsToEndOfMatch
	ld	(hl), #0x02
;./exsoccer.c:239: g_RestartKickTeamId=TEAM_1;
	ld	hl, #_g_RestartKickTeamId
	ld	(hl), #0x01
;./exsoccer.c:240: g_FieldScrollSpeed=FIELD_SCROLL_PRESENTATION_SPEED;
	ld	hl, #_g_FieldScrollSpeed
	ld	(hl), #0x01
;./exsoccer.c:241: g_FieldScrollingActionInProgress=NO_VALUE;
	ld	hl, #_g_FieldScrollingActionInProgress
	ld	(hl), #0xff
;./exsoccer.c:242: g_FieldCurrentYPosition=FIELD_TOP_Y;
	ld	hl, #0x0001
	ld	(_g_FieldCurrentYPosition), hl
;./exsoccer.c:243: g_Team1Score=1;
	ld	a, #0x01
	ld	(#_g_Team1Score), a
;./exsoccer.c:244: g_Team2Score=0;
	xor	a, a
	ld	(#_g_Team2Score), a
;./exsoccer.c:245: V9_SetScrollingY(0);
	ld	l, h
	call	_V9_SetScrollingY
;./exsoccer.c:246: V9_SetScrollingBY(1);
	ld	hl, #0x0001
	call	_V9_SetScrollingBY
;./exsoccer.c:247: SetTeam1Palette();
	call	_SetTeam1Palette
;./exsoccer.c:248: SetTeam2Palette();
	call	_SetTeam2Palette
;./exsoccer.c:249: SetTeamsPresentationSpritesPosition();
	call	_SetTeamsPresentationSpritesPosition
;./exsoccer.c:250: ShowFieldZone(FIELD_CENTRAL_ZONE);
	ld	a, #0x01
	call	_ShowFieldZone
;./exsoccer.c:251: ShowHeaderInfo();
	call	_ShowHeaderInfo
;./exsoccer.c:252: InitPonPonGirls();
	call	_InitPonPonGirls
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:258: inline void V9_SetFlag(u8 reg, u8 mask, u8 flag) { V9_SetRegister(reg, V9_GetRegister(reg) & (~mask) | flag); }
	ld	a, #0x08
	call	_V9_GetRegister
	res	7, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	set	7, l
	ld	a, #0x08
;./exsoccer.c:253: V9_SetDisplayEnable(TRUE);
;./exsoccer.c:254: }
	jp	_V9_SetRegister
;./exsoccer.c:255: void SetTeamsPresentationSpritesPosition(){
;	---------------------------------
; Function SetTeamsPresentationSpritesPosition
; ---------------------------------
_SetTeamsPresentationSpritesPosition::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;./exsoccer.c:256: g_MatchStatus=MATCH_NOT_STARTED;
	ld	hl, #_g_MatchStatus
;./exsoccer.c:257: for(u8 i=0;i<7;i++){
	ld	(hl), #0x00
	ld	c, (hl)
00105$:
	ld	a, c
	sub	a, #0x07
	jr	NC, 00101$
;./exsoccer.c:258: g_Players[i].Y=230;
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
;./exsoccer.c:259: g_Players[i].X=72+i*20;
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
;./exsoccer.c:260: g_Players[i].PatternId=PLAYER_POSE_FRONT;
	pop	hl
	push	hl
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0x10
;./exsoccer.c:261: g_Players[i].TeamId=TEAM_2;
	pop	hl
	push	hl
	ld	de, #0x0009
	add	hl, de
	ld	(hl), #0x02
;./exsoccer.c:257: for(u8 i=0;i<7;i++){
	inc	c
	jp	00105$
00101$:
;./exsoccer.c:264: for(u8 i=7;i<14;i++){
	ld	c, #0x07
00108$:
	ld	a, c
	sub	a, #0x0e
	jr	NC, 00102$
;./exsoccer.c:265: g_Players[i].Y=250;
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
;./exsoccer.c:266: g_Players[i].X=72+(i-7)*20;
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
;./exsoccer.c:267: g_Players[i].PatternId=PLAYER_POSE_BACK;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x11
;./exsoccer.c:268: g_Players[i].TeamId=TEAM_1;
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x01
;./exsoccer.c:264: for(u8 i=7;i<14;i++){
	inc	c
	jp	00108$
00102$:
;./exsoccer.c:270: g_Players[REFEREE].Y=FIELD_POS_Y_CENTER;
	ld	hl, #0x00f3
	ld	((_g_Players + 294)), hl
;./exsoccer.c:271: g_Players[REFEREE].X=30;
	ld	l, #0x1e
	ld	((_g_Players + 296)), hl
;./exsoccer.c:272: g_Players[REFEREE].PatternId=PLAYER_POSE_RIGHT;
	ld	hl, #(_g_Players + 302)
	ld	(hl), #0x9d
;./exsoccer.c:273: g_Players[REFEREE].TeamId=REFEREE;
	ld	hl, #(_g_Players + 303)
	ld	(hl), #0x0e
;./exsoccer.c:274: g_Players[REFEREE].LastPose=0;
	ld	hl, #(_g_Players + 306)
	ld	(hl), #0x00
;./exsoccer.c:275: g_Players[REFEREE].Direction=DIRECTION_RIGHT;
	ld	hl, #(_g_Players + 304)
	ld	(hl), #0x03
;./exsoccer.c:276: g_Players[REFEREE].Role=NO_VALUE;
	ld	hl, #(_g_Players + 307)
	ld	(hl), #0xff
;./exsoccer.c:277: g_Players[REFEREE].Status=PLAYER_STATUS_NONE;
	ld	hl, #0x0000
	ld	((_g_Players + 312)), hl
;./exsoccer.c:278: ResetPlayersInfo();
	call	_ResetPlayersInfo
;./exsoccer.c:279: SetPlayerTarget(REFEREE); 
	ld	a, #0x0e
	call	_SetPlayerTarget
;./exsoccer.c:287: for(u8 i=0;i<14;i++){
	ld	c, #0x00
00111$:
	ld	a, c
	sub	a, #0x0e
	jr	NC, 00103$
;./exsoccer.c:288: g_Players[i].AiTickCounter=0;
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
;./exsoccer.c:289: g_Players[i].Role = k_PlayerRoles[i % 7];
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
	ld	hl, #_SetTeamsPresentationSpritesPosition_k_PlayerRoles_65537_1366
	add	hl, de
	ld	a, (hl)
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), a
;./exsoccer.c:287: for(u8 i=0;i<14;i++){
	inc	c
	jp	00111$
00103$:
;./exsoccer.c:291: g_Ball.X=FIELD_POS_X_CENTER;
	ld	hl, #0x0078
	ld	((_g_Ball + 2)), hl
;./exsoccer.c:292: g_Ball.Y=FIELD_POS_Y_CENTER;
	ld	l, #0xf3
	ld	(_g_Ball), hl
;./exsoccer.c:293: g_Ball.PreviousY=g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
;./exsoccer.c:294: ResetBallInfo(true);
	ld	a, #0x01
	call	_ResetBallInfo
;./exsoccer.c:296: }
	ld	sp, ix
	pop	ix
	ret
_SetTeamsPresentationSpritesPosition_k_PlayerRoles_65537_1366:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x06	; 6
;./exsoccer.c:299: void TickActiveFieldZone(){
;	---------------------------------
; Function TickActiveFieldZone
; ---------------------------------
_TickActiveFieldZone::
;./exsoccer.c:302: if (g_MatchStatus != MATCH_IN_ACTION) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	ret	NZ
;./exsoccer.c:304: if (g_ActiveFieldZone == FIELD_CENTRAL_ZONE) {
	ld	a, (_g_ActiveFieldZone+0)
	dec	a
	jr	NZ, 00116$
;./exsoccer.c:305: if (g_Ball.Y < 170) ShowFieldZone(FIELD_NORTH_ZONE);
	ld	hl, (#_g_Ball + 0)
	ld	a, l
	sub	a, #0xaa
	ld	a, h
	sbc	a, #0x00
	jr	NC, 00106$
	xor	a, a
	call	_ShowFieldZone
	jp	00117$
00106$:
;./exsoccer.c:306: else if (g_Ball.Y > 320) ShowFieldZone(FIELD_SOUTH_ZONE);
	ld	a, #0x40
	cp	a, l
	ld	a, #0x01
	sbc	a, h
	jr	NC, 00117$
	ld	a, #0x02
	call	_ShowFieldZone
	jp	00117$
00116$:
;./exsoccer.c:308: else if (g_ActiveFieldZone == FIELD_NORTH_ZONE) {
	ld	a, (_g_ActiveFieldZone+0)
	or	a, a
	jr	NZ, 00113$
;./exsoccer.c:309: if (g_Ball.Y > 190) ShowFieldZone(FIELD_CENTRAL_ZONE);
	ld	hl, (#_g_Ball + 0)
	ld	a, #0xbe
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	jr	NC, 00117$
	ld	a, #0x01
	call	_ShowFieldZone
	jp	00117$
00113$:
;./exsoccer.c:312: if (g_Ball.Y < 300) ShowFieldZone(FIELD_CENTRAL_ZONE);
	ld	hl, (#_g_Ball + 0)
	ld	de, #0x012c
	cp	a, a
	sbc	hl, de
	jr	NC, 00117$
	ld	a, #0x01
	call	_ShowFieldZone
00117$:
;./exsoccer.c:314: g_Ball.PreviousY=g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
;./exsoccer.c:315: }
	ret
;./exsoccer.c:316: void TickUpdateTime(){
;	---------------------------------
; Function TickUpdateTime
; ---------------------------------
_TickUpdateTime::
;./exsoccer.c:317: if(g_MatchStatus==MATCH_IN_ACTION){
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jr	NZ, 00106$
;./exsoccer.c:319: if(g_FrameCounter==58){
	ld	hl, (_g_FrameCounter)
	ld	a, l
	sub	a, #0x3a
	or	a, h
	jr	NZ, 00106$
;./exsoccer.c:320: g_SecondsToEndOfMatch--;
	ld	hl, #_g_SecondsToEndOfMatch
	dec	(hl)
;./exsoccer.c:321: ShowHeaderInfo();
	call	_ShowHeaderInfo
;./exsoccer.c:322: if(g_SecondsToEndOfMatch==0){
	ld	a, (_g_SecondsToEndOfMatch+0)
	or	a, a
	jr	NZ, 00106$
;./exsoccer.c:323: TimeUp();
	call	_TimeUp
00106$:
;./exsoccer.c:327: if(g_Timer!=NO_VALUE){
	ld	a, (_g_Timer+0)
	inc	a
	ret	Z
;./exsoccer.c:328: if(g_FrameCounter==58){
	ld	hl, (_g_FrameCounter)
	ld	a, l
	sub	a, #0x3a
	or	a, h
	ret	NZ
;./exsoccer.c:329: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
;./exsoccer.c:333: }
	ret
;./exsoccer.c:334: u16 GetOffsideLineY(u8 attackingTeamId) {
;	---------------------------------
; Function GetOffsideLineY
; ---------------------------------
_GetOffsideLineY::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-5
	add	hl, sp
	ld	sp, hl
	ld	c, a
;./exsoccer.c:335: u8 defendingTeamId = (attackingTeamId == TEAM_1) ? TEAM_2 : TEAM_1;
	dec	c
	ld	a, #0x01
	jr	Z, 00199$
	xor	a, a
00199$:
	or	a, a
	jr	Z, 00124$
	ld	bc, #0x0002
	jp	00125$
00124$:
	ld	bc, #0x0001
00125$:
	ld	-5 (ix), c
;./exsoccer.c:336: bool findMin = (attackingTeamId == TEAM_1);
;./exsoccer.c:339: u16 val1 = findMin ? 0xFFFF : 0;
	ld	e, a
	or	a, a
	jr	Z, 00126$
	ld	bc, #0xffff
	jp	00127$
00126$:
	ld	bc, #0x0000
00127$:
;./exsoccer.c:340: u16 val2 = val1;
	ld	-4 (ix), c
	ld	-3 (ix), b
;./exsoccer.c:342: for(u8 i=0; i<14; i++){
	ld	d, #0x00
00121$:
	ld	a, d
	sub	a, #0x0e
	jp	NC, 00117$
;./exsoccer.c:343: if(g_Players[i].TeamId != defendingTeamId) continue;
	push	de
	ld	e, d
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
	push	bc
	ld	bc, #0x0009
	add	hl, bc
	pop	bc
;	spillPairReg hl
	ld	a,-5 (ix)
	sub	a,(hl)
	jr	NZ, 00116$
;./exsoccer.c:344: u16 y = g_Players[i].Y;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./exsoccer.c:346: if (findMin) {
	ld	a, e
	or	a, a
	jr	Z, 00114$
;./exsoccer.c:347: if (y < val1) { val2 = val1; val1 = y; }
	ld	a, l
	sub	a, -4 (ix)
	ld	a, h
	sbc	a, -3 (ix)
	jr	NC, 00106$
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	-4 (ix), l
	ld	-3 (ix), h
	jp	00116$
00106$:
;./exsoccer.c:348: else if (y < val2) { val2 = y; }
	ld	a, l
	sub	a, c
	ld	a, h
	sbc	a, b
	jr	NC, 00116$
	ld	c, l
	ld	b, h
	jp	00116$
00114$:
;./exsoccer.c:350: if (y > val1) { val2 = val1; val1 = y; }
	ld	a, -4 (ix)
	sub	a, l
	ld	a, -3 (ix)
	sbc	a, h
	jr	NC, 00111$
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	ld	-4 (ix), l
	ld	-3 (ix), h
	jp	00116$
00111$:
;./exsoccer.c:351: else if (y > val2) { val2 = y; }
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jr	NC, 00116$
	ld	c, l
	ld	b, h
00116$:
;./exsoccer.c:342: for(u8 i=0; i<14; i++){
	inc	d
	jp	00121$
00117$:
;./exsoccer.c:355: if (findMin) return (val2 == 0xFFFF) ? FIELD_BOUND_Y_TOP : val2;
	ld	a, e
	or	a, a
	jr	Z, 00119$
	ld	e, c
	ld	d, b
	ld	a, e
	and	a, d
	inc	a
	jr	NZ, 00128$
	ld	bc, #0x0032
00128$:
	ld	e, c
	ld	d, b
	jp	00122$
00119$:
;./exsoccer.c:356: return (val2 == 0) ? FIELD_BOUND_Y_BOTTOM : val2;
	ld	a, b
	or	a, c
	jr	NZ, 00130$
	ld	bc, #0x01ae
00130$:
	ld	e, c
	ld	d, b
00122$:
;./exsoccer.c:357: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:358: void BallInGoal(u8 teamScored){
;	---------------------------------
; Function BallInGoal
; ---------------------------------
_BallInGoal::
	ld	c, a
;./exsoccer.c:360: V9_PrintLayerAStringAtPos(12,18,"IN  GOAL");
	push	bc
	ld	hl, #___str_0
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_V9_PrintLayerAStringAtPos
	pop	bc
;./exsoccer.c:362: g_GoalScorerId = g_Ball.PossessionPlayerId;
	ld	hl, #(_g_Ball + 6)
	ld	a, (hl)
;./exsoccer.c:365: if (g_GoalScorerId == NO_VALUE) {
	ld	(_g_GoalScorerId+0), a
	inc	a
	jr	NZ, 00102$
;./exsoccer.c:366: g_GoalScorerId = GetClosestPlayerToBall(teamScored, NO_VALUE);
	push	bc
	ld	l, #0xff
;	spillPairReg hl
;	spillPairReg hl
	ld	a, c
	call	_GetClosestPlayerToBall
	pop	bc
	ld	(_g_GoalScorerId+0), a
00102$:
;./exsoccer.c:369: if(teamScored==TEAM_1){
	dec	c
	ld	a, #0x01
	jr	Z, 00128$
	xor	a, a
00128$:
	ld	c, a
	or	a, a
	jr	Z, 00104$
;./exsoccer.c:371: g_Ball.Y = FIELD_BOUND_Y_TOP - 12;
	ld	hl, #0x0026
	ld	(_g_Ball), hl
;./exsoccer.c:372: g_Team1Score++;
	ld	hl, #_g_Team1Score
	inc	(hl)
	jp	00105$
00104$:
;./exsoccer.c:376: g_Ball.Y = FIELD_BOUND_Y_BOTTOM + 12L;
	ld	hl, #0x01ba
	ld	(_g_Ball), hl
;./exsoccer.c:377: g_Team2Score++;
	ld	hl, #_g_Team2Score
	inc	(hl)
00105$:
;./exsoccer.c:379: ShowHeaderInfo();
	push	bc
	call	_ShowHeaderInfo
	pop	bc
;./exsoccer.c:381: g_MatchStatus=MATCH_AFTER_IN_GOAL;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x06
;./exsoccer.c:382: g_RestartKickTeamId = (teamScored == TEAM_1) ? TEAM_2 : TEAM_1;
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
;./exsoccer.c:383: g_Timer = 0; // Start timer for celebration/reset
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;./exsoccer.c:384: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;./exsoccer.c:385: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;./exsoccer.c:386: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:387: }
	ret
___str_0:
	.ascii "IN  GOAL"
	.db 0x00
;./exsoccer.c:388: void BallThrowIn(u8 teamId){
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
;./exsoccer.c:391: V9_PrintLayerAStringAtPos(10,18,"THROW IN");
	ld	hl, #___str_1
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
;./exsoccer.c:392: g_MatchStatus=MATCH_BEFORE_THROW_IN;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x03
;./exsoccer.c:393: g_RestartKickTeamId = teamId;
	ld	a, -2 (ix)
	ld	(_g_RestartKickTeamId+0), a
;./exsoccer.c:394: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;./exsoccer.c:397: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;./exsoccer.c:398: g_Ball.PassTargetPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 16)
	ld	(hl), #0xff
;./exsoccer.c:399: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:402: for(i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00110$:
;./exsoccer.c:403: g_Players[i].TargetX = g_Players[i].X;
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
;./exsoccer.c:404: g_Players[i].TargetY = g_Players[i].Y;
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
;./exsoccer.c:406: if (g_Players[i].TargetX < FIELD_BOUND_X_LEFT) g_Players[i].TargetX = FIELD_BOUND_X_LEFT;
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
;./exsoccer.c:407: if (g_Players[i].TargetX > FIELD_BOUND_X_RIGHT) g_Players[i].TargetX = FIELD_BOUND_X_RIGHT;
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
;./exsoccer.c:408: if (g_Players[i].TargetY < FIELD_BOUND_Y_TOP) g_Players[i].TargetY = FIELD_BOUND_Y_TOP;
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
;./exsoccer.c:409: if (g_Players[i].TargetY > FIELD_BOUND_Y_BOTTOM) g_Players[i].TargetY = FIELD_BOUND_Y_BOTTOM;
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
;./exsoccer.c:411: g_Players[i].Status = PLAYER_STATUS_NONE;
	pop	hl
	push	hl
	ld	de, #0x0012
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;./exsoccer.c:402: for(i=0; i<14; i++) {
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	C, 00110$
;./exsoccer.c:413: }
	ld	sp, ix
	pop	ix
	ret
___str_1:
	.ascii "THROW IN"
	.db 0x00
;./exsoccer.c:414: void GoalKick(u8 teamId){
;	---------------------------------
; Function GoalKick
; ---------------------------------
_GoalKick::
	ld	c, a
;./exsoccer.c:416: V9_PrintLayerAStringAtPos(10,18,"GOAL KICK");
	push	bc
	ld	hl, #___str_2
	push	hl
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
	pop	bc
;./exsoccer.c:417: g_MatchStatus=MATCH_BEFORE_GOAL_KICK;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x05
;./exsoccer.c:418: g_RestartKickTeamId = teamId;
	ld	hl, #_g_RestartKickTeamId
	ld	(hl), c
;./exsoccer.c:419: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;./exsoccer.c:422: if (g_Ball.X < FIELD_POS_X_CENTER) g_GoalKickSide = CORNER_SIDE_LEFT;
	ld	hl, (#(_g_Ball + 2) + 0)
	ld	de, #0x0078
	cp	a, a
	sbc	hl, de
	jr	NC, 00102$
	ld	hl, #_g_GoalKickSide
	ld	(hl), #0x00
	ret
00102$:
;./exsoccer.c:423: else g_GoalKickSide = CORNER_SIDE_RIGHT;
	ld	hl, #_g_GoalKickSide
	ld	(hl), #0x01
;./exsoccer.c:424: }
	ret
___str_2:
	.ascii "GOAL KICK"
	.db 0x00
;./exsoccer.c:425: void CornerKick(u8 teamId){
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
;./exsoccer.c:427: V9_PrintLayerAStringAtPos(10,12,"CORNER KICK");
	ld	hl, #___str_3
	push	hl
	ld	l, #0x0c
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_V9_PrintLayerAStringAtPos
;./exsoccer.c:428: g_MatchStatus=MATCH_BEFORE_CORNER_KICK;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x02
;./exsoccer.c:429: g_RestartKickTeamId = teamId;
	ld	a, -2 (ix)
	ld	(_g_RestartKickTeamId+0), a
;./exsoccer.c:430: g_CornerKickTargetId = NO_VALUE;
	ld	hl, #_g_CornerKickTargetId
	ld	(hl), #0xff
;./exsoccer.c:431: g_Timer = 0;
	ld	hl, #_g_Timer
	ld	(hl), #0x00
;./exsoccer.c:434: if (g_Ball.X < FIELD_POS_X_CENTER) g_CornerKickSide = CORNER_SIDE_LEFT;
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
;./exsoccer.c:435: else g_CornerKickSide = CORNER_SIDE_RIGHT;
	ld	hl, #_g_CornerKickSide
	ld	(hl), #0x01
;./exsoccer.c:440: u16 kickX = (g_CornerKickSide == CORNER_SIDE_LEFT) ? FIELD_BOUND_X_LEFT : FIELD_BOUND_X_RIGHT;
	jp	00155$
;./exsoccer.c:435: else g_CornerKickSide = CORNER_SIDE_RIGHT;
00103$:
;./exsoccer.c:440: u16 kickX = (g_CornerKickSide == CORNER_SIDE_LEFT) ? FIELD_BOUND_X_LEFT : FIELD_BOUND_X_RIGHT;
	ld	de, #0x000a
	jp	00156$
00155$:
	ld	de, #0x00f6
00156$:
	ld	-23 (ix), e
	ld	-22 (ix), d
;./exsoccer.c:441: u16 kickY = (teamId == TEAM_1) ? FIELD_BOUND_Y_TOP : FIELD_BOUND_Y_BOTTOM;
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
;./exsoccer.c:444: if (teamId == TEAM_1) ShowFieldZone(FIELD_NORTH_ZONE);
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00105$
	push	bc
	xor	a, a
	call	_ShowFieldZone
	pop	bc
	jp	00106$
00105$:
;./exsoccer.c:445: else ShowFieldZone(FIELD_SOUTH_ZONE);
	push	bc
	ld	a, #0x02
	call	_ShowFieldZone
	pop	bc
00106$:
;./exsoccer.c:449: if (g_CornerKickSide == CORNER_SIDE_LEFT) kickerId = GetPlayerIdByRole(teamId, PLAYER_ROLE_LEFT_STRIKER);
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
;./exsoccer.c:450: else kickerId = GetPlayerIdByRole(teamId, PLAYER_ROLE_RIGHT_STRIKER);
	push	bc
	ld	l, #0x06
;	spillPairReg hl
;	spillPairReg hl
	ld	a, -2 (ix)
	call	_GetPlayerIdByRole
	pop	bc
	ld	-19 (ix), a
00109$:
;./exsoccer.c:453: g_Ball.PossessionPlayerId = NO_VALUE; 
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:454: SetPlayerBallPossession(NO_VALUE);
	push	bc
	ld	a, #0xff
	call	_SetPlayerBallPossession
	pop	bc
;./exsoccer.c:455: if(teamId == TEAM_1) g_Team1ActivePlayer = kickerId; // Ensure kicker is selected active
	ld	a, -3 (ix)
	or	a, a
	jr	Z, 00111$
	ld	a, -19 (ix)
	ld	(_g_Team1ActivePlayer+0), a
	jp	00112$
00111$:
;./exsoccer.c:456: else g_Team2ActivePlayer = kickerId;
	ld	a, -19 (ix)
	ld	(_g_Team2ActivePlayer+0), a
00112$:
;./exsoccer.c:464: i8 offX = 0; i8 offY = 0;
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	-1 (ix), #0x00
;./exsoccer.c:465: if (teamId == TEAM_2 && g_CornerKickSide == CORNER_SIDE_RIGHT) {
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	NZ, 00114$
	ld	a, (_g_CornerKickSide+0)
	dec	a
	jr	NZ, 00114$
;./exsoccer.c:466: offX = -30;
	ld	l, #0xe2
;	spillPairReg hl
;	spillPairReg hl
;./exsoccer.c:467: offY = -5;
	ld	-1 (ix), #0xfb
00114$:
;./exsoccer.c:470: g_Ball.X = kickX + offX;
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
;./exsoccer.c:471: g_Ball.Y = kickY + offY;
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
;./exsoccer.c:472: g_Ball.PreviousY = g_Ball.Y;
	ld	((_g_Ball + 7)), de
;./exsoccer.c:476: bool attackingUp = (teamId == TEAM_1);
	ld	a, -3 (ix)
;./exsoccer.c:480: u16 yBoxInside     = (attackingUp) ? (FIELD_BOUND_Y_TOP + 40) : (FIELD_BOUND_Y_BOTTOM - 40);
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
;./exsoccer.c:481: u16 yBoxOutside    = (attackingUp) ? (FIELD_BOUND_Y_TOP + 90) : (FIELD_BOUND_Y_BOTTOM - 90);
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
;./exsoccer.c:482: u16 yMidfieldAdv   = (attackingUp) ? (FIELD_BOUND_Y_TOP + 160) : (FIELD_BOUND_Y_BOTTOM - 160);
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
;./exsoccer.c:484: u16 ySafety        = (attackingUp) ? (FIELD_BOUND_Y_BOTTOM - 100) : (FIELD_BOUND_Y_TOP + 100);
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
;./exsoccer.c:486: for(u8 i=0; i<14; i++) {
	ld	-1 (ix), #0x00
00152$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00153$
;./exsoccer.c:487: g_Players[i].Status = PLAYER_STATUS_NONE;
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
;./exsoccer.c:488: g_Players[i].TargetX = g_Players[i].X;
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
;./exsoccer.c:489: g_Players[i].TargetY = g_Players[i].Y;
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
;./exsoccer.c:491: u8 role = g_Players[i].Role;
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
;./exsoccer.c:492: bool isAttacker = (g_Players[i].TeamId == teamId);
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
;./exsoccer.c:495: if (i == kickerId) {
	ld	a, -19 (ix)
	sub	a, -1 (ix)
	jr	NZ, 00117$
;./exsoccer.c:496: g_Players[i].TargetX = kickX;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	a, -23 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -22 (ix)
	ld	(hl), a
;./exsoccer.c:497: g_Players[i].TargetY = kickY;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -21 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -20 (ix)
	ld	(hl), a
;./exsoccer.c:498: continue;
	jp	00149$
00117$:
;./exsoccer.c:501: if (isAttacker) {
	ld	a, c
	or	a, a
	jp	Z, 00147$
;./exsoccer.c:503: if (role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00133$
;./exsoccer.c:505: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:506: g_Players[i].TargetY = (attackingUp) ? FIELD_BOUND_Y_BOTTOM - 20 : FIELD_BOUND_Y_TOP + 20;
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
;./exsoccer.c:508: else if (role == PLAYER_ROLE_LEFT_DEFENDER || role == PLAYER_ROLE_RIGHT_DEFENDER) {
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
;./exsoccer.c:509: if (role == PLAYER_ROLE_LEFT_DEFENDER) {
	ld	a, c
	or	a, a
	jr	Z, 00119$
;./exsoccer.c:511: g_Players[i].TargetX = FIELD_POS_X_CENTER - 30;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:512: g_Players[i].TargetY = yMidfieldAdv;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
	jp	00149$
00119$:
;./exsoccer.c:515: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:516: g_Players[i].TargetY = ySafety;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -11 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -10 (ix)
	ld	(hl), a
	jp	00149$
00129$:
;./exsoccer.c:519: else if (role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
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
;./exsoccer.c:520: if (role == PLAYER_ROLE_LEFT_HALFFIELDER) {
	ld	a, c
	or	a, a
	jr	Z, 00122$
;./exsoccer.c:522: g_Players[i].TargetX = FIELD_POS_X_CENTER - 50; 
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x46
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:523: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00149$
00122$:
;./exsoccer.c:526: g_Players[i].TargetX = FIELD_POS_X_CENTER + 30;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x96
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:527: g_Players[i].TargetY = yMidfieldAdv;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -12 (ix)
	ld	(hl), a
	jp	00149$
00125$:
;./exsoccer.c:533: g_Players[i].TargetX = FIELD_POS_X_CENTER + 50;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0xaa
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:534: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00149$
00147$:
;./exsoccer.c:539: if (role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, -5 (ix)
	or	a, a
	jr	NZ, 00144$
;./exsoccer.c:541: g_Players[i].TargetX = FIELD_POS_X_CENTER;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	(hl), #0x78
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:542: g_Players[i].TargetY = (attackingUp) ? FIELD_POS_Y_TEAM2_GOALKEEPER : FIELD_POS_Y_TEAM1_GOALKEEPER;
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
;./exsoccer.c:544: else if (role == PLAYER_ROLE_LEFT_DEFENDER || role == PLAYER_ROLE_RIGHT_DEFENDER) {
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
;./exsoccer.c:546: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_DEFENDER) ? FIELD_POS_X_CENTER - 20 : FIELD_POS_X_CENTER + 20;
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
;./exsoccer.c:547: g_Players[i].TargetY = yBoxInside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -17 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -16 (ix)
	ld	(hl), a
	jp	00149$
00140$:
;./exsoccer.c:549: else if (role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
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
;./exsoccer.c:551: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_HALFFIELDER) ? FIELD_POS_X_CENTER - 40 : FIELD_POS_X_CENTER + 40;
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
;./exsoccer.c:552: g_Players[i].TargetY = yBoxOutside;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	a, -15 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -14 (ix)
	ld	(hl), a
	jp	00149$
00136$:
;./exsoccer.c:556: g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_STRIKER) ? FIELD_POS_X_LEFT + 20 : FIELD_POS_X_RIGHT - 20;
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
;./exsoccer.c:557: g_Players[i].TargetY = yMidfield;
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), #0xf3
	inc	hl
	ld	(hl), #0x00
00149$:
;./exsoccer.c:486: for(u8 i=0; i<14; i++) {
	inc	-1 (ix)
	jp	00152$
00153$:
;./exsoccer.c:561: }
	ld	sp, ix
	pop	ix
	ret
___str_3:
	.ascii "CORNER KICK"
	.db 0x00
;./exsoccer.c:562: void InitializeV9990()
;	---------------------------------
; Function InitializeV9990
; ---------------------------------
_InitializeV9990::
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:574: inline void V9_SetInterrupt(u8 flags) { V9_SetRegister(9, flags); }
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x09
	call	_V9_SetRegister
;./exsoccer.c:566: LoadPresentation();
	call	_LoadPresentation
;./exsoccer.c:570: InitPalette();
	call	_InitPalette
;./exsoccer.c:571: V9_SetScreenMode(V9_MODE_P1);
	xor	a, a
	call	_V9_SetScreenMode
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
	res	7, l
	ld	a, #0x08
	call	_V9_SetRegister
;./exsoccer.c:582: LoadP1LayerA();
	call	_LoadP1LayerA
;./exsoccer.c:584: ShowMenu();
;./exsoccer.c:587: }
	jp	_ShowMenu
;./exsoccer.c:588: void TickShotCursor() {
;	---------------------------------
; Function TickShotCursor
; ---------------------------------
_TickShotCursor::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;./exsoccer.c:590: g_ShotCursorX += g_ShotCursorDir;
	ld	a, (_g_ShotCursorDir+0)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	hl, (_g_ShotCursorX)
	add	hl, bc
	ld	(_g_ShotCursorX), hl
;./exsoccer.c:591: if (g_ShotCursorX < (GOAL_X_MIN - 30)) {
	ld	de, #0x0042
	ld	hl, (_g_ShotCursorX)
	cp	a, a
	sbc	hl, de
	jr	NC, 00102$
;./exsoccer.c:592: g_ShotCursorX = (GOAL_X_MIN - 30);
	ld	hl, #0x0042
	ld	(_g_ShotCursorX), hl
;./exsoccer.c:593: g_ShotCursorDir = -g_ShotCursorDir;
	ld	hl, #_g_ShotCursorDir
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00102$:
;./exsoccer.c:595: if (g_ShotCursorX > (GOAL_X_MAX + 30)) {
	ld	a, #0xae
	ld	iy, #_g_ShotCursorX
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jr	NC, 00104$
;./exsoccer.c:596: g_ShotCursorX = (GOAL_X_MAX + 30);
	ld	hl, #0x00ae
	ld	(_g_ShotCursorX), hl
;./exsoccer.c:597: g_ShotCursorDir = -g_ShotCursorDir;
	ld	hl, #_g_ShotCursorDir
	xor	a, a
	sub	a, (hl)
	ld	(hl), a
00104$:
;./exsoccer.c:601: bool show = false;
	ld	c, #0x00
;./exsoccer.c:602: if (g_MatchStatus == MATCH_IN_ACTION && g_ActiveFieldZone == FIELD_NORTH_ZONE) {
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x0c
	jr	NZ, 00110$
	ld	a, (_g_ActiveFieldZone+0)
	or	a, a
	jr	NZ, 00110$
;./exsoccer.c:603: if (g_Ball.PossessionPlayerId != NO_VALUE) {
	ld	hl, #_g_Ball+6
	ld	e, (hl)
	ld	a, e
	inc	a
	jr	Z, 00110$
;./exsoccer.c:604: if (g_Players[g_Ball.PossessionPlayerId].TeamId == TEAM_1) {
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
	ld	a, (hl)
	dec	a
	jr	NZ, 00110$
;./exsoccer.c:605: show = true;
	ld	c, #0x01
00110$:
;./exsoccer.c:611: if (show) {
	ld	a, c
	or	a, a
	jr	Z, 00117$
;./exsoccer.c:613: int screenY = (FIELD_BOUND_Y_TOP - 30) - g_FieldCurrentYPosition;
	ld	hl, #_g_FieldCurrentYPosition
	ld	a, #0x14
	sub	a, (hl)
	inc	hl
	ld	c, a
	sbc	a, a
	sub	a, (hl)
	ld	b, a
;./exsoccer.c:616: if (screenY < -16 || screenY > 212) {
	ld	a, c
	sub	a, #0xf0
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	C, 00112$
	ld	a, #0xd4
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00170$
	xor	a, #0x80
00170$:
	jp	P, 00113$
00112$:
;./exsoccer.c:617: attr.Y = 216; 
	ld	-4 (ix), #0xd8
	jp	00114$
00113$:
;./exsoccer.c:619: attr.Y = (u8)screenY;
	ld	-4 (ix), c
00114$:
;./exsoccer.c:622: attr.X = (u8)g_ShotCursorX;
	ld	a, (_g_ShotCursorX+0)
	ld	c, a
	ld	b, #0x00
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
;./exsoccer.c:623: attr.Pattern = SPRITE_DOWN_ARROW;
	ld	-3 (ix), #0x79
;./exsoccer.c:624: attr.P = 1; 
	ld	hl,#0x3
	add	hl,sp
	set	5, (hl)
;./exsoccer.c:625: attr.SC = 0; 
	ld	a, (hl)
	and	a, #0x3f
	ld	(hl), a
;./exsoccer.c:627: V9_SetSpriteP1(16, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xfe40
	ld	hl, #0x0003
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;./exsoccer.c:627: V9_SetSpriteP1(16, &attr);
	jp	00123$
00117$:
;./exsoccer.c:630: attr.Y = 216;
	ld	-4 (ix), #0xd8
;./exsoccer.c:631: V9_SetSpriteP1(16, &attr);
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:781: inline void V9_SetSpriteP1(u8 id, const V9_Sprite* attr) { V9_WriteVRAM(V9_P1_SPAT + (id * 4), (const u8*)attr, 4); }
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:371: inline void V9_WriteVRAM(u32 addr, const u8* src, u16 count) { V9_SetWriteAddress(addr); V9_WriteVRAM_CurrentAddr(src, count); }
	ld	de, #0xfe40
	ld	hl, #0x0003
	call	_V9_SetWriteAddress
	ld	de, #0x0004
	ld	hl, #0
	add	hl, sp
	call	_V9_WriteVRAM_CurrentAddr
;./exsoccer.c:631: V9_SetSpriteP1(16, &attr);
00123$:
;./exsoccer.c:633: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:636: void LoadSprites(){
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
;./exsoccer.c:639: V9_WriteVRAM(0x08000, g_Sprites1, sizeof(g_Sprites1));	
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
;./exsoccer.c:641: V9_WriteVRAM(0x08000+sizeof(g_Sprites1), g_Sprites2, sizeof(g_Sprites2));	
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
;./exsoccer.c:642: SET_BANK_SEGMENT(2, 1); 
;./exsoccer.c:643: }
	ret
;./exsoccer.c:645: void TickGoalCelebration(){
;	---------------------------------
; Function TickGoalCelebration
; ---------------------------------
_TickGoalCelebration::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
;./exsoccer.c:646: if(g_MatchStatus!=MATCH_AFTER_IN_GOAL) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x06
	jp	NZ,00158$
;./exsoccer.c:648: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
;./exsoccer.c:650: if((g_Timer % 10) < 5){
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
;./exsoccer.c:651: V9_SetBackgroundColor(8); // Cyan/Flash
	jp	00105$
00104$:
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:480: inline void V9_SetBackgroundColor(u8 color) { V9_SetRegister(15, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_V9_SetRegister
;./exsoccer.c:653: V9_SetBackgroundColor(1); // Default Blue
00105$:
;./exsoccer.c:659: if (g_Timer < 120) {
	ld	a, (_g_Timer+0)
	sub	a, #0x78
	jp	NC, 00136$
;./exsoccer.c:660: u8 scoringTeamId = (g_RestartKickTeamId == TEAM_1) ? TEAM_2 : TEAM_1;
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00160$
	ld	bc, #0x0002
	jp	00161$
00160$:
	ld	bc, #0x0001
00161$:
	ld	-11 (ix), c
;./exsoccer.c:663: u16 limitY_Top = FIELD_BOUND_Y_TOP;
	ld	-10 (ix), #0x32
	xor	a, a
	ld	-9 (ix), a
;./exsoccer.c:664: u16 limitY_Bottom = FIELD_BOUND_Y_BOTTOM;
	ld	-8 (ix), #0xae
	ld	-7 (ix), #0x01
;./exsoccer.c:666: if (g_Ball.Y < FIELD_CENTRAL_Y) { // Top Goal
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
;./exsoccer.c:667: limitY_Bottom = FIELD_BOUND_Y_TOP + 160; 
	ld	-8 (ix), #0xd2
	ld	-7 (ix), #0
	jp	00200$
00107$:
;./exsoccer.c:669: limitY_Top = FIELD_BOUND_Y_BOTTOM - 160;
	ld	-10 (ix), #0x0e
	ld	-9 (ix), #0x01
;./exsoccer.c:677: for(u8 i=0; i<15; i++){
00200$:
	ld	-1 (ix), #0x00
00154$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	NC, 00136$
;./exsoccer.c:678: if(i == REFEREE) continue;
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	Z,00133$
;./exsoccer.c:679: u8 dir = g_Players[i].Direction;
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
	ld	a, -13 (ix)
	add	a, #0x0a
	ld	c, a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	-2 (ix), a
;./exsoccer.c:682: if (g_Players[i].TeamId == scoringTeamId) {
	pop	de
	push	de
	ld	hl, #9
	add	hl, de
	ld	e, (hl)
;./exsoccer.c:706: if (isBack) g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_BACK_1 : PLAYER_POSE_CELEBRATION_BACK_2;
	ld	a, -13 (ix)
	add	a, #0x08
	ld	-6 (ix), a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
;./exsoccer.c:682: if (g_Players[i].TeamId == scoringTeamId) {
	ld	a, -11 (ix)
	sub	a, e
	jp	NZ,00131$
;./exsoccer.c:686: if ((g_Timer % 19) == 0) {
	ld	a, (_g_Timer+0)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	ld	de, #0x0013
	call	__modsint
	pop	bc
	ld	a, d
	or	a, e
	jr	NZ, 00112$
;./exsoccer.c:688: u8 rnd = (g_Timer * 3) + (i * 37); 
	ld	a, (_g_Timer+0)
	ld	e, a
	add	a, a
	add	a, e
	ld	e, a
	ld	a, -1 (ix)
	push	de
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	add	a, e
	add	a, a
	add	a, a
	add	a, e
	pop	de
	add	a, e
;./exsoccer.c:689: dir = (rnd % 8) + 1; 
	and	a, #0x07
	inc	a
;./exsoccer.c:690: g_Players[i].Direction = dir;
	ld	-2 (ix), a
	ld	(bc), a
00112$:
;./exsoccer.c:693: i8 dy = k_CelebDY[dir];
	ld	a, #<(_TickGoalCelebration_k_CelebDY_131073_1526)
	add	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_TickGoalCelebration_k_CelebDY_131073_1526)
	adc	a, #0x00
	ld	h, a
	ld	c, (hl)
;./exsoccer.c:694: i8 dx = k_CelebDX[dir];
	ld	a, #<(_TickGoalCelebration_k_CelebDX_131073_1526)
	add	a, -2 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_TickGoalCelebration_k_CelebDX_131073_1526)
	adc	a, #0x00
	ld	h, a
	ld	b, (hl)
;./exsoccer.c:696: if (dy < 0 && g_Players[i].Y > limitY_Top) g_Players[i].Y--;
	ld	a, c
	rlca
	and	a,#0x01
	ld	-4 (ix), a
	or	a, a
	jr	Z, 00117$
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, -10 (ix)
	sub	a, e
	ld	a, -9 (ix)
	sbc	a, d
	jr	NC, 00117$
	dec	de
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00118$
00117$:
;./exsoccer.c:697: else if (dy > 0 && g_Players[i].Y < limitY_Bottom) g_Players[i].Y++;
	xor	a, a
	sub	a, c
	jp	PO, 00387$
	xor	a, #0x80
00387$:
	jp	P, 00118$
	pop	hl
	push	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	sub	a, -8 (ix)
	ld	a, d
	sbc	a, -7 (ix)
	jr	NC, 00118$
	inc	de
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
00118$:
;./exsoccer.c:699: if (dx < 0 && g_Players[i].X > FIELD_BOUND_X_LEFT) g_Players[i].X--;
	bit	7, b
	jr	Z, 00124$
	pop	hl
	push	hl
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
	jr	NC, 00124$
	dec	de
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jp	00125$
00124$:
;./exsoccer.c:700: else if (dx > 0 && g_Players[i].X < FIELD_BOUND_X_RIGHT) g_Players[i].X++;
	xor	a, a
	sub	a, b
	jp	PO, 00388$
	xor	a, #0x80
00388$:
	jp	P, 00125$
	pop	hl
	push	hl
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
	jr	NC, 00125$
	inc	bc
	ld	(hl), c
	inc	hl
	ld	(hl), b
00125$:
;./exsoccer.c:703: bool animFrame1 = ((g_Timer / 8) % 2) == 0;
	ld	a, (_g_Timer+0)
	ld	e, a
	ld	d, #0x00
	ld	c, e
	ld	b, d
	bit	7, d
	jr	Z, 00162$
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
00162$:
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
	jr	Z, 00390$
	xor	a, a
00390$:
	ld	-2 (ix), a
;./exsoccer.c:706: if (isBack) g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_BACK_1 : PLAYER_POSE_CELEBRATION_BACK_2;
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00128$
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00163$
	ld	-3 (ix), #0x32
	ld	-2 (ix), #0
	jp	00164$
00163$:
	ld	-3 (ix), #0x33
	ld	-2 (ix), #0
00164$:
	ld	a, -3 (ix)
	ld	-2 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
	jp	00133$
00128$:
;./exsoccer.c:707: else g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_FRONT_1 : PLAYER_POSE_CELEBRATION_FRONT_2;
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00165$
	ld	-3 (ix), #0x30
	ld	-2 (ix), #0
	jp	00166$
00165$:
	ld	-3 (ix), #0x31
	ld	-2 (ix), #0
00166$:
	ld	a, -3 (ix)
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), a
	jp	00133$
00131$:
;./exsoccer.c:711: bool isUp = (dir == DIRECTION_UP || dir == DIRECTION_UP_LEFT || dir == DIRECTION_UP_RIGHT);
	ld	a, -2 (ix)
	dec	a
	jr	Z, 00168$
	ld	a, -2 (ix)
	sub	a, #0x08
	jr	Z, 00168$
	ld	a, -2 (ix)
	sub	a, #0x02
	jr	Z, 00168$
	xor	a, a
	jp	00169$
00168$:
	ld	a, #0x01
00169$:
;./exsoccer.c:712: g_Players[i].PatternId = isUp ? PLAYER_POSE_BACK : PLAYER_POSE_FRONT;
	or	a, a
	jr	Z, 00173$
	ld	-3 (ix), #0x11
	ld	-2 (ix), #0
	jp	00174$
00173$:
	ld	-3 (ix), #0x10
	ld	-2 (ix), #0
00174$:
	ld	a, -3 (ix)
	ld	-2 (ix), a
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	a, -2 (ix)
	ld	(hl), a
00133$:
;./exsoccer.c:677: for(u8 i=0; i<15; i++){
	inc	-1 (ix)
	jp	00154$
00136$:
;./exsoccer.c:717: if(g_Timer > 150){
	ld	a, #0x96
	ld	hl, #_g_Timer
	sub	a, (hl)
	jp	NC, 00158$
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/v9990.h:480: inline void V9_SetBackgroundColor(u8 color) { V9_SetRegister(15, color); }
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0f
	call	_V9_SetRegister
;./exsoccer.c:719: ClearTextFromLayerA(12, 18, 8); // "IN  GOAL"
	ld	a, #0x08
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0c
	call	_ClearTextFromLayerA
;./exsoccer.c:721: g_MatchStatus = MATCH_BEFORE_KICK_OFF;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x01
;./exsoccer.c:722: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:723: g_Ball.KickMoveState = 0;
	ld	hl, #(_g_Ball + 13)
	ld	(hl), #0x00
;./exsoccer.c:724: g_Ball.ShotActive = 0;
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;./exsoccer.c:725: if(g_Team1ActivePlayer!=NO_VALUE) g_Players[g_Team1ActivePlayer].Status=PLAYER_STATUS_NONE;
	ld	a, (_g_Team1ActivePlayer+0)
	inc	a
	jr	Z, 00138$
	ld	bc, #_g_Players+0
	ld	de, (_g_Team1ActivePlayer)
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
00138$:
;./exsoccer.c:726: if(g_Team2ActivePlayer!=NO_VALUE) g_Players[g_Team2ActivePlayer].Status=PLAYER_STATUS_NONE;
	ld	a, (_g_Team2ActivePlayer+0)
	inc	a
	jr	Z, 00140$
	ld	bc, #_g_Players+0
	ld	de, (_g_Team2ActivePlayer)
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
00140$:
;./exsoccer.c:727: g_Team1ActivePlayer=NO_VALUE;
	ld	hl, #_g_Team1ActivePlayer
	ld	(hl), #0xff
;./exsoccer.c:728: g_Team2ActivePlayer=NO_VALUE;
	ld	hl, #_g_Team2ActivePlayer
	ld	(hl), #0xff
;./exsoccer.c:730: g_Ball.X = FIELD_POS_X_CENTER;
	ld	hl, #0x0078
	ld	((_g_Ball + 2)), hl
;./exsoccer.c:731: g_Ball.Y = FIELD_POS_Y_CENTER;
	ld	l, #0xf3
	ld	(_g_Ball), hl
;./exsoccer.c:732: g_Ball.PreviousY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 7)), bc
;./exsoccer.c:733: PutBallSprite();
	call	_PutBallSprite
;./exsoccer.c:735: for(u8 i=0; i<15; i++){
	ld	de, #_g_Players
	ld	-1 (ix), #0x00
00156$:
	ld	a, -1 (ix)
	sub	a, #0x0f
	jp	NC, 00147$
;./exsoccer.c:736: if(i==REFEREE || g_Players[i].TeamId==TEAM_1 || g_Players[i].TeamId==TEAM_2){
	ld	a, -1 (ix)
	sub	a, #0x0e
	ld	a, #0x01
	jr	Z, 00397$
	xor	a, a
00397$:
	ld	c, a
	or	a, a
	jr	NZ, 00143$
	push	de
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
	ld	iy, #_g_Players
	push	bc
	ld	c, l
	ld	b, h
	add	iy, bc
	pop	bc
	ld	a, 9 (iy)
	cp	a, #0x01
	jr	Z, 00143$
	sub	a, #0x02
	jr	NZ, 00157$
00143$:
;./exsoccer.c:738: if (i==REFEREE) {
	ld	a, c
	or	a, a
	jr	Z, 00142$
;./exsoccer.c:739: g_Players[i].Direction=DIRECTION_RIGHT;
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
	ld	a, e
	add	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, d
	adc	a, -4 (ix)
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	bc, #0x000a
	add	hl, bc
	ld	(hl), #0x03
;./exsoccer.c:740: g_Players[i].LastPose=0;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	bc, #0x000c
	add	hl, bc
	ld	(hl), #0x00
00142$:
;./exsoccer.c:742: SetPlayerTarget(i); 
	push	de
	ld	a, -1 (ix)
	call	_SetPlayerTarget
	pop	de
00157$:
;./exsoccer.c:735: for(u8 i=0; i<15; i++){
	inc	-1 (ix)
	jp	00156$
00147$:
;./exsoccer.c:747: ShowFieldZone(FIELD_CENTRAL_ZONE);
	ld	a, #0x01
	call	_ShowFieldZone
00158$:
;./exsoccer.c:749: }
	ld	sp, ix
	pop	ix
	ret
_TickGoalCelebration_k_CelebDX_131073_1526:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0xff	; -1
_TickGoalCelebration_k_CelebDY_131073_1526:
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0xff	; -1
;./exsoccer.c:752: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;./exsoccer.c:754: DEBUG_INIT();
	call	_DEBUG_INIT
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:756: InitVariables();
	call	_InitVariables
;./exsoccer.c:757: V9_SetPort(V9_P15, 0);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x6f
	call	_V9_SetPort
;./exsoccer.c:759: VDP_SetMode(VDP_MODE_SCREEN0);
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
;./exsoccer.c:761: VDP_ClearVRAM();
	call	_VDP_ClearVRAM
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x000a
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:768: Print_SetTextFont(g_Font_MGL_Sample6, 1);
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
;./exsoccer.c:770: Print_SetColor(15, 1);
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
;./exsoccer.c:772: Print_DrawText("Soccer League - 2026 Fausto Pracek");
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
;./exsoccer.c:774: Print_DrawText("fpracek@gmail.com");
	push	bc
	ld	hl, #___str_6
	call	_Print_DrawText
	pop	bc
;./exsoccer.c:776: const c8* str = "V9990 not found!";
	ld	de, #___str_4
;./exsoccer.c:777: bool v9990IsFound=V9_Detect();
	push	bc
	push	de
	call	_V9_Detect
	pop	de
	pop	bc
	ld	-1 (ix), a
;./exsoccer.c:779: if (v9990IsFound){
	or	a, a
	jr	Z, 00102$
;./exsoccer.c:780: str = "V9990 found!";
	ld	de, #___str_7
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:223: g_PrintData.CursorX = x;
	xor	a, a
	ld	(bc), a
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/print.h:224: g_PrintData.CursorY = y;
	ld	hl, #(_g_PrintData + 6)
	ld	(hl), #0x07
;./exsoccer.c:782: Print_DrawText("The game is running on V9990 monitor.");
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
;./exsoccer.c:785: Print_DrawText(str);
	ex	de, hl
	call	_Print_DrawText
;./exsoccer.c:786: if(!v9990IsFound){
	ld	a, -1 (ix)
	or	a, a
	jr	NZ, 00105$
00148$:
	jp	00148$
00105$:
;./exsoccer.c:790: InitializeV9990();
	call	_InitializeV9990
;./exsoccer.c:793: V9_SetPort(V9_P15, 0x10);
	ld	l, #0x10
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x6f
	call	_V9_SetPort
;./exsoccer.c:797: MainGameLoop();
	call	_MainGameLoop
;./exsoccer.c:801: }
	inc	sp
	pop	ix
	ret
___str_4:
	.ascii "V9990 not found!"
	.db 0x00
___str_5:
	.ascii "Soccer League - 2026 Fausto Pracek"
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
;./exsoccer.c:803: void MainGameLoop(){
;	---------------------------------
; Function MainGameLoop
; ---------------------------------
_MainGameLoop::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;./exsoccer.c:804: u8 TickAiPlayerId=0;
	ld	-2 (ix), #0x00
;./exsoccer.c:805: u8 AiTickSpeed=0;
	ld	-1 (ix), #0x00
00188$:
;./exsoccer.c:807: UpdateV9990();
	call	_UpdateV9990
;./exsoccer.c:809: if(g_MatchStatus==MATCH_NOT_STARTED && g_FieldScrollingActionInProgress==NO_VALUE && g_ActiveFieldZone==FIELD_CENTRAL_ZONE){
	ld	a, (_g_MatchStatus+0)
	or	a, a
	jr	NZ, 00103$
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00103$
	ld	a, (_g_ActiveFieldZone+0)
	dec	a
	jr	NZ, 00103$
;./exsoccer.c:810: g_MatchStatus=MATCH_BEFORE_KICK_OFF;
	ld	hl, #_g_MatchStatus
	ld	(hl), #0x01
;./exsoccer.c:811: for(u8 i=0;i<15;i++){
	ld	c, #0x00
00186$:
	ld	a, c
	sub	a, #0x0f
	jr	NC, 00101$
;./exsoccer.c:812: SetPlayerTarget(i);
	push	bc
	ld	a, c
	call	_SetPlayerTarget
	pop	bc
;./exsoccer.c:811: for(u8 i=0;i<15;i++){
	inc	c
	jp	00186$
00101$:
;./exsoccer.c:814: TickPlayerToOwnTarget();
	call	_TickPlayerToOwnTarget
00103$:
;./exsoccer.c:817: TickCornerKick(); // <<< Added Hook
	call	_TickCornerKick
;./exsoccer.c:818: TickGoalKick();
	call	_TickGoalKick
;./exsoccer.c:819: TickThrowIn();
	call	_TickThrowIn
;./exsoccer.c:820: TickPonPonGirlsAnimation();
	call	_TickPonPonGirlsAnimation
;./exsoccer.c:821: TickGoalCelebration();
	call	_TickGoalCelebration
;./exsoccer.c:822: TickPlayerToOwnTarget();
	call	_TickPlayerToOwnTarget
;./exsoccer.c:823: TickActiveFieldZone();
	call	_TickActiveFieldZone
;./exsoccer.c:824: if(g_FieldScrollingActionInProgress==NO_VALUE){
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00119$
;./exsoccer.c:826: if(g_MatchStatus == MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x0c
	jr	Z, 00115$
	sub	a, #0x0d
	jr	NZ, 00119$
00115$:
;./exsoccer.c:828: if(AiTickSpeed >= 2){ // Speed up AI cycle (was 5)
	ld	a, -1 (ix)
	sub	a, #0x02
	jr	C, 00119$
;./exsoccer.c:829: AiTickSpeed=0;
	ld	-1 (ix), #0x00
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0016
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:831: TickAI(REFEREE);
	ld	a, #0x0e
	call	_TickAI
;./exsoccer.c:832: TickAI(TickAiPlayerId);
	ld	a, -2 (ix)
	call	_TickAI
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:834: TickAiPlayerId++;
	inc	-2 (ix)
;./exsoccer.c:835: if(TickAiPlayerId==14){ // Only iterate 0-13 (Players)
	ld	a, -2 (ix)
	sub	a, #0x0e
	jr	NZ, 00107$
;./exsoccer.c:836: TickAiPlayerId=0;
	ld	-2 (ix), #0x00
00107$:
;./exsoccer.c:840: if (g_Ball.PossessionPlayerId != NO_VALUE && g_Ball.PossessionPlayerId < 14) {
	ld	bc, #_g_Ball+6
	ld	a, (bc)
	ld	e, a
	inc	a
	jr	Z, 00119$
	ld	a, e
	sub	a, #0x0e
	jr	NC, 00119$
;./exsoccer.c:842: if (g_Ball.PossessionPlayerId != TickAiPlayerId) {
	ld	a, -2 (ix)
	sub	a, e
	jr	Z, 00119$
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0016
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:844: TickAI(g_Ball.PossessionPlayerId);
	ld	a, (bc)
	call	_TickAI
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/rom_mapper.h:112: g_Bank0Segment[b] = s;
	ld	hl, #0x0001
	ld	((_g_Bank0Segment + 4)), hl
;E:/Dropbox/FAUSTO/SVILUPPI/MSX/CODE/C/MSXgl/engine/src/system.h:109: inline void Poke16(u16 addr, u16 val) { *(u16*)addr = val; }
	ld	(0x7000), hl
;./exsoccer.c:845: SET_BANK_SEGMENT(2,1);
00119$:
;./exsoccer.c:853: EnforcePenaltyBoxRestriction();
	call	_EnforcePenaltyBoxRestriction
;./exsoccer.c:855: UpdateSpritesPositions();
	call	_UpdateSpritesPositions
;./exsoccer.c:856: TickShotCursor();
	call	_TickShotCursor
;./exsoccer.c:857: TickUpdateTime();
	call	_TickUpdateTime
;./exsoccer.c:858: TickShowKickOff();
	call	_TickShowKickOff
;./exsoccer.c:859: if(g_FieldScrollingActionInProgress==NO_VALUE){
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	NZ, 00121$
;./exsoccer.c:860: TickBallCollision();
	call	_TickBallCollision
;./exsoccer.c:861: TickBallFlying();
	call	_TickBallFlying
;./exsoccer.c:862: UpdatePassTarget();
	call	_UpdatePassTarget
;./exsoccer.c:863: TickGoalkeeperAnimation();
	call	_TickGoalkeeperAnimation
00121$:
;./exsoccer.c:866: TickCheckBallBoundaries();
	call	_TickCheckBallBoundaries
;./exsoccer.c:867: TickTeamJoystick(TEAM_1,GetJoystick1Direction());
	call	_GetJoystick1Direction
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x01
	call	_TickTeamJoystick
;./exsoccer.c:868: if(g_GameWith2Players){
	ld	a, (_g_GameWith2Players+0)
	or	a, a
	jr	Z, 00123$
;./exsoccer.c:869: TickTeamJoystick(TEAM_2,GetJoystick2Direction());
	call	_GetJoystick2Direction
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_TickTeamJoystick
00123$:
;./exsoccer.c:872: AiTickSpeed++;
	inc	-1 (ix)
;./exsoccer.c:874: if (g_ActionCooldown > 0) {
	ld	a, (_g_ActionCooldown+0)
	or	a, a
	jr	Z, 00132$
;./exsoccer.c:875: g_ActionCooldown--;
	ld	hl, #_g_ActionCooldown
	dec	(hl)
	jp	00133$
00132$:
;./exsoccer.c:878: if (g_Team1ActivePlayer != NO_VALUE && g_Players[g_Team1ActivePlayer].Status == PLAYER_STATUS_POSITIONED) 
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
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	bc, #0x0012
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	sub	a, #0x04
;./exsoccer.c:879: g_Players[g_Team1ActivePlayer].Status = PLAYER_STATUS_NONE;
	or	a,b
	jr	NZ, 00125$
	ld	(hl), a
	inc	hl
	ld	(hl), a
00125$:
;./exsoccer.c:880: if (g_GameWith2Players && g_Team2ActivePlayer != NO_VALUE && g_Players[g_Team2ActivePlayer].Status == PLAYER_STATUS_POSITIONED)
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
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_g_Players
	add	hl, de
	ld	bc, #0x0012
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	sub	a, #0x04
;./exsoccer.c:881: g_Players[g_Team2ActivePlayer].Status = PLAYER_STATUS_NONE;
	or	a,b
	jr	NZ, 00133$
	ld	(hl), a
	inc	hl
	ld	(hl), a
00133$:
;./exsoccer.c:884: if (g_ShootCooldown > 0) {
	ld	a, (_g_ShootCooldown+0)
	or	a, a
	jp	Z, 00188$
;./exsoccer.c:885: g_ShootCooldown--;
	ld	hl, #_g_ShootCooldown
	dec	(hl)
;./exsoccer.c:888: }
	jp	00188$
;./exsoccer.c:892: void UpdatePlayerPatternByDirection(u8 playerId){
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
;./exsoccer.c:893: if(g_Players[playerId].Status==PLAYER_STATUS_POSITIONED){
	ld	bc, #_g_Players+0
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
	add	hl, bc
	ex	de, hl
	ld	c, e
	ld	b, d
	ld	hl, #18
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, c
	sub	a, #0x04
	or	a, b
	jp	Z,00122$
;./exsoccer.c:894: return;
	jp	00102$
00102$:
;./exsoccer.c:898: if(g_Players[playerId].Direction!=g_Players[playerId].PreviousDirection){
	ld	hl, #0x000a
	add	hl, de
	ex	(sp), hl
	pop	hl
	push	hl
	ld	c, (hl)
	ld	hl, #0x000b
	add	hl, de
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	b, (hl)
;./exsoccer.c:899: if(g_Players[playerId].Direction==DIRECTION_NONE){
	ld	a,c
	cp	a,b
	jr	Z, 00112$
	or	a, a
	jr	NZ, 00104$
;./exsoccer.c:900: g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
	ld	hl, #0x0008
	add	hl, de
	push	hl
	push	de
	ld	a, b
	call	_GetNoMovingPlayerPatternId
	pop	de
	pop	hl
	ld	(hl), a
;./exsoccer.c:901: g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
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
;./exsoccer.c:904: g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), c
;./exsoccer.c:905: g_Players[playerId].LastPose=0;
	ld	hl, #0x000c
	add	hl, de
	ld	(hl), #0x00
	jp	00113$
00112$:
;./exsoccer.c:911: if(g_Players[playerId].Direction!=DIRECTION_NONE){
	ld	a, c
	or	a, a
	jr	Z, 00113$
;./exsoccer.c:912: if(g_Players[playerId].LastPose==1){
	ld	hl, #0x000c
	add	hl, de
	ld	a, (hl)
;./exsoccer.c:913: g_Players[playerId].LastPose=0;
	dec	a
	jr	NZ, 00107$
	ld	(hl),a
	jp	00113$
00107$:
;./exsoccer.c:916: g_Players[playerId].LastPose=1;
	ld	(hl), #0x01
00113$:
;./exsoccer.c:922: if(g_Players[playerId].TeamId==REFEREE && g_MatchStatus==MATCH_BEFORE_KICK_OFF ){
	ld	c, e
	ld	b, d
	ld	hl, #9
	add	hl, bc
	ld	a, (hl)
;./exsoccer.c:898: if(g_Players[playerId].Direction!=g_Players[playerId].PreviousDirection){
	pop	hl
	push	hl
	ld	c, (hl)
;./exsoccer.c:922: if(g_Players[playerId].TeamId==REFEREE && g_MatchStatus==MATCH_BEFORE_KICK_OFF ){
	sub	a, #0x0e
	jr	NZ, 00119$
	ld	a, (_g_MatchStatus+0)
	dec	a
	jr	NZ, 00119$
;./exsoccer.c:925: if(g_Players[playerId].Direction!=DIRECTION_NONE){
	ld	a, c
	or	a, a
	jr	Z, 00122$
;./exsoccer.c:926: g_Players[playerId].PatternId=GetPatternIdByPoseAndDirection(playerId);
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, -1 (ix)
	call	_GetPatternIdByPoseAndDirection
	pop	de
	ld	(de), a
	jp	00122$
00119$:
;./exsoccer.c:930: if(g_Players[playerId].Direction!=DIRECTION_NONE){
	ld	a, c
	or	a, a
	jr	Z, 00122$
;./exsoccer.c:931: g_Players[playerId].PatternId=GetPatternIdByPoseAndDirection(playerId);
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, -1 (ix)
	call	_GetPatternIdByPoseAndDirection
	pop	hl
	ld	(hl), a
00122$:
;./exsoccer.c:934: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:937: u8 GetNoMovingPlayerPatternId(u8 direction){
;	---------------------------------
; Function GetNoMovingPlayerPatternId
; ---------------------------------
_GetNoMovingPlayerPatternId::
	ld	e, a
;./exsoccer.c:938: u8 patternId=PLAYER_POSE_FRONT_PLAYING; // Default fallback
	ld	c, #0x13
;./exsoccer.c:939: switch (direction){
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
;./exsoccer.c:940: case DIRECTION_DOWN:
00101$:
;./exsoccer.c:941: patternId=PLAYER_POSE_FRONT_PLAYING;
	ld	c, #0x13
;./exsoccer.c:942: break;
	jp	00110$
;./exsoccer.c:943: case DIRECTION_UP:
00102$:
;./exsoccer.c:944: patternId=PLAYER_POSE_BACK_PLAYING;
	ld	c, #0x16
;./exsoccer.c:945: break;
	jp	00110$
;./exsoccer.c:946: case DIRECTION_LEFT:
00103$:
;./exsoccer.c:947: patternId=PLAYER_POSE_LEFT;
	ld	c, #0x12
;./exsoccer.c:948: break;
	jp	00110$
;./exsoccer.c:949: case DIRECTION_RIGHT:
00104$:
;./exsoccer.c:950: patternId=PLAYER_POSE_RIGHT;
	ld	c, #0x9d
;./exsoccer.c:951: break;
	jp	00110$
;./exsoccer.c:952: case DIRECTION_UP_LEFT:
00105$:
;./exsoccer.c:953: patternId=PLAYER_POSE_MOVE_UP_LEFT_2;
	ld	c, #0x82
;./exsoccer.c:954: break;
	jp	00110$
;./exsoccer.c:955: case DIRECTION_UP_RIGHT:
00106$:
;./exsoccer.c:956: patternId=PLAYER_POSE_MOVE_UP_RIGHT_1;
	ld	c, #0x0d
;./exsoccer.c:957: break;
	jp	00110$
;./exsoccer.c:958: case DIRECTION_DOWN_LEFT:
00107$:
;./exsoccer.c:959: patternId=PLAYER_POSE_MOVE_DOWN_LEFT_1;
	ld	c, #0x09
;./exsoccer.c:960: break;
	jp	00110$
;./exsoccer.c:961: case DIRECTION_DOWN_RIGHT:
00108$:
;./exsoccer.c:962: patternId=PLAYER_POSE_MOVE_DOWN_RIGHT_2;
	ld	c, #0x86
;./exsoccer.c:963: break;
	jp	00110$
;./exsoccer.c:964: case DIRECTION_NONE:
00109$:
;./exsoccer.c:967: patternId=PLAYER_POSE_FRONT_PLAYING;
	ld	c, #0x13
;./exsoccer.c:969: }
00110$:
;./exsoccer.c:970: return patternId;
	ld	a, c
;./exsoccer.c:971: }
	ret
;./exsoccer.c:973: u8 GetNewPoseByDirection(u8 direction){
;	---------------------------------
; Function GetNewPoseByDirection
; ---------------------------------
_GetNewPoseByDirection::
	ld	e, a
;./exsoccer.c:974: u8 pose=NO_VALUE;
	ld	c, #0xff
;./exsoccer.c:975: switch (direction)
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
;./exsoccer.c:977: case DIRECTION_DOWN:
00101$:
;./exsoccer.c:978: pose=PLAYER_POSE_MOVE_DOWN_1;
	ld	c, #0x00
;./exsoccer.c:979: break;
	jp	00109$
;./exsoccer.c:980: case DIRECTION_UP:
00102$:
;./exsoccer.c:981: pose=PLAYER_POSE_MOVE_UP_1;
	ld	c, #0x02
;./exsoccer.c:982: break;
	jp	00109$
;./exsoccer.c:983: case DIRECTION_LEFT:
00103$:
;./exsoccer.c:984: pose=PLAYER_POSE_MOVE_LEFT_1;
	ld	c, #0x05
;./exsoccer.c:985: break;	
	jp	00109$
;./exsoccer.c:986: case DIRECTION_RIGHT:
00104$:
;./exsoccer.c:987: pose=PLAYER_POSE_MOVE_RIGHT_1;
	ld	c, #0x89
;./exsoccer.c:988: break;	
	jp	00109$
;./exsoccer.c:989: case DIRECTION_UP_RIGHT:
00105$:
;./exsoccer.c:990: pose=PLAYER_POSE_MOVE_UP_RIGHT_1;
	ld	c, #0x0d
;./exsoccer.c:991: break;	
	jp	00109$
;./exsoccer.c:992: case DIRECTION_DOWN_RIGHT:
00106$:
;./exsoccer.c:993: pose=PLAYER_POSE_MOVE_DOWN_RIGHT_1;
	ld	c, #0x85
;./exsoccer.c:994: break;	
	jp	00109$
;./exsoccer.c:995: case DIRECTION_UP_LEFT:
00107$:
;./exsoccer.c:996: pose=PLAYER_POSE_MOVE_UP_LEFT_1;
	ld	c, #0x83
;./exsoccer.c:997: break;	
	jp	00109$
;./exsoccer.c:998: case DIRECTION_DOWN_LEFT:
00108$:
;./exsoccer.c:999: pose=PLAYER_POSE_MOVE_DOWN_LEFT_1;
	ld	c, #0x09
;./exsoccer.c:1001: }
00109$:
;./exsoccer.c:1002: return pose;
	ld	a, c
;./exsoccer.c:1003: }
	ret
;./exsoccer.c:1005: u8 GetPatternIdByPoseAndDirection(u8 playerId){
;	---------------------------------
; Function GetPatternIdByPoseAndDirection
; ---------------------------------
_GetPatternIdByPoseAndDirection::
	ld	e, a
;./exsoccer.c:1006: u8 pose = g_Players[playerId].LastPose;
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
	ex	de, hl
	push	de
	pop	iy
	ld	c, 12 (iy)
;./exsoccer.c:1007: u8 dir = g_Players[playerId].Direction;
	ld	hl, #10
	add	hl, de
	ld	e, (hl)
;./exsoccer.c:1010: if (dir > 8) dir = DIRECTION_NONE;
	ld	a, #0x08
	sub	a, e
	jr	NC, 00102$
	ld	e, #0x00
00102$:
;./exsoccer.c:1012: if (dir == DIRECTION_NONE) {
	ld	a, e
	or	a, a
	jr	NZ, 00104$
;./exsoccer.c:1013: return GetNoMovingPlayerPatternId(dir); // Assuming logic for NONE inside
	ld	a, e
	jp	_GetNoMovingPlayerPatternId
00104$:
;./exsoccer.c:1031: return k_MovePats[dir * 2 + (pose ? 1 : 0)];
	sla	e
	ld	a, c
	or	a, a
	jr	Z, 00107$
	ld	hl, #0x0001
	jp	00108$
00107$:
	ld	hl, #0x0000
00108$:
	add	hl, de
	ld	a, l
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	de, #_GetPatternIdByPoseAndDirection_k_MovePats_65537_1693
	add	hl, de
	ld	a, (hl)
;./exsoccer.c:1032: }
	ret
_GetPatternIdByPoseAndDirection_k_MovePats_65537_1693:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x89	; 137
	.db #0x8a	; 138
	.db #0x85	; 133
	.db #0x86	; 134
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x83	; 131
	.db #0x82	; 130
;./exsoccer.c:1033: void SetPlayerTarget(u8 playerId){
;	---------------------------------
; Function SetPlayerTarget
; ---------------------------------
_SetPlayerTarget::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-15
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;./exsoccer.c:1034: if(g_FieldScrollingActionInProgress!=NO_VALUE && g_MatchStatus!=MATCH_BEFORE_KICK_OFF){
	ld	a, (_g_MatchStatus+0)
	dec	a
	ld	a, #0x01
	jr	Z, 00188$
	xor	a, a
00188$:
	ld	-2 (ix), a
	ld	a, (_g_FieldScrollingActionInProgress+0)
	inc	a
	jr	Z, 00102$
	bit	0, -2 (ix)
;./exsoccer.c:1035: return;
	jp	Z,00121$
00102$:
;./exsoccer.c:1037: switch(g_MatchStatus){
	ld	a, -2 (ix)
	or	a, a
	jp	Z, 00121$
;./exsoccer.c:1059: if(g_Players[playerId].TeamId==REFEREE){
	ld	bc, #_g_Players+0
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
	add	hl, bc
	ex	de, hl
	push	de
	pop	iy
	ld	a, 9 (iy)
	ld	-13 (ix), a
;./exsoccer.c:1061: g_Players[playerId].TargetX=FIELD_POS_X_CENTER - 30; 
	ld	hl, #0x0010
	add	hl, de
	ld	-12 (ix), l
	ld	-11 (ix), h
;./exsoccer.c:1062: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER - 40; 
	ld	hl, #0x000e
	add	hl, de
	ld	-10 (ix), l
	ld	-9 (ix), h
;./exsoccer.c:1059: if(g_Players[playerId].TeamId==REFEREE){
	ld	a, -13 (ix)
	sub	a, #0x0e
	jr	NZ, 00118$
;./exsoccer.c:1061: g_Players[playerId].TargetX=FIELD_POS_X_CENTER - 30; 
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	(hl), #0x5a
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:1062: g_Players[playerId].TargetY=FIELD_POS_Y_CENTER - 40; 
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	(hl), #0xcb
	inc	hl
	ld	(hl), #0x00
	jp	00121$
00118$:
;./exsoccer.c:1065: u8 role = g_Players[playerId].Role;
	ld	hl, #13
	add	hl, de
	ld	a, (hl)
	ld	-8 (ix), a
;./exsoccer.c:1066: if (role > 6) role = 0; // Safety
	ld	a, #0x06
	sub	a, -8 (ix)
	jr	NC, 00106$
	ld	-8 (ix), #0x00
00106$:
;./exsoccer.c:1068: bool isTeam1 = (g_Players[playerId].TeamId == TEAM_1);
	ld	a, -13 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00193$
	xor	a, a
00193$:
	ld	-7 (ix), a
;./exsoccer.c:1071: u16 tx = k_KO_X[role];
	ld	bc, #_SetPlayerTarget_k_KO_X_196608_1698+0
	ld	l, -8 (ix)
	ld	h, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	-2 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), #0x00
;./exsoccer.c:1072: u16 ty = isTeam1 ? k_KO_Y_T1[role] : k_KO_Y_T2[role];
	ld	a, -8 (ix)
	ld	-3 (ix), a
	ld	-2 (ix), #0x00
	sla	-3 (ix)
	rl	-2 (ix)
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00123$
	ld	bc, #_SetPlayerTarget_k_KO_Y_T1_196608_1698+0
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	add	hl, bc
	ld	a, (hl)
	ld	-15 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-14 (ix), a
	jp	00124$
00123$:
	ld	a, -3 (ix)
	add	a, #<(_SetPlayerTarget_k_KO_Y_T2_196608_1698)
	ld	c, a
	ld	a, -2 (ix)
	adc	a, #>(_SetPlayerTarget_k_KO_Y_T2_196608_1698)
	ld	b, a
	ld	a, (bc)
	ld	-15 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-14 (ix), a
00124$:
	ld	a, -15 (ix)
	ld	-4 (ix), a
	ld	a, -14 (ix)
	ld	-3 (ix), a
;./exsoccer.c:1075: if (!isTeam1 && role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
	ld	a, -7 (ix)
	or	a, a
	jr	NZ, 00108$
	ld	a, -8 (ix)
	sub	a, #0x04
	jr	NZ, 00108$
;./exsoccer.c:1076: tx = FIELD_POS_X_RIGHT - 116; 
	ld	-6 (ix), #0x52
	ld	-5 (ix), #0
00108$:
;./exsoccer.c:1080: if ((role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) &&
	ld	a, -8 (ix)
	sub	a, #0x03
	ld	a, #0x01
	jr	Z, 00198$
	xor	a, a
00198$:
	ld	-2 (ix), a
	or	a, a
	jr	NZ, 00116$
	ld	a, -8 (ix)
	sub	a, #0x04
	jr	NZ, 00114$
00116$:
;./exsoccer.c:1081: g_RestartKickTeamId == g_Players[playerId].TeamId) 
	ld	a, (_g_RestartKickTeamId+0)
	sub	a, -13 (ix)
	jr	NZ, 00114$
;./exsoccer.c:1083: ty = isTeam1 ? FIELD_POS_Y_CENTER : (FIELD_POS_Y_CENTER - 10);
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00125$
	ld	-4 (ix), #0xf3
	ld	-3 (ix), #0
	jp	00126$
00125$:
	ld	-4 (ix), #0xe9
	ld	-3 (ix), #0
00126$:
;./exsoccer.c:1084: if (role == PLAYER_ROLE_LEFT_HALFFIELDER) tx = FIELD_POS_X_CENTER - 7;
	ld	a, -2 (ix)
	or	a, a
	jr	Z, 00111$
	ld	-6 (ix), #0x71
	ld	-5 (ix), #0
	jp	00114$
00111$:
;./exsoccer.c:1085: else tx = FIELD_POS_X_CENTER + 7;
	ld	-6 (ix), #0x7f
	ld	-5 (ix), #0
00114$:
;./exsoccer.c:1088: g_Players[playerId].TargetX = tx;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, -6 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -5 (ix)
	ld	(hl), a
;./exsoccer.c:1089: g_Players[playerId].TargetY = ty;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	ld	a, -4 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -3 (ix)
	ld	(hl), a
;./exsoccer.c:1093: }
00121$:
;./exsoccer.c:1094: }
	ld	sp, ix
	pop	ix
	ret
_SetPlayerTarget_k_KO_X_196608_1698:
	.db #0x78	; 120	'x'
	.db #0x28	; 40
	.db #0xc6	; 198
	.db #0x8c	; 140
	.db #0x62	; 98	'b'
	.db #0x28	; 40
	.db #0xc6	; 198
_SetPlayerTarget_k_KO_Y_T1_196608_1698:
	.dw #0x01a8
	.dw #0x0176
	.dw #0x0176
	.dw #0x0144
	.dw #0x0144
	.dw #0x011c
	.dw #0x011c
_SetPlayerTarget_k_KO_Y_T2_196608_1698:
	.dw #0x0032
	.dw #0x0082
	.dw #0x0082
	.dw #0x00b4
	.dw #0x00b4
	.dw #0x00dc
	.dw #0x00dc
;./exsoccer.c:1095: const TeamStats* GetTeamStats(u8 teamId) {
;	---------------------------------
; Function GetTeamStats
; ---------------------------------
_GetTeamStats::
	ld	c, a
;./exsoccer.c:1096: if (teamId > 5) return &g_TeamStats[0];
	ld	a, #0x05
	sub	a, c
	jr	NC, 00102$
	ld	de, #_g_TeamStats
	ret
00102$:
;./exsoccer.c:1097: return &g_TeamStats[teamId];
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_g_TeamStats
	add	hl, de
	ex	de, hl
;./exsoccer.c:1098: }
	ret
;./exsoccer.c:1099: bool IsOffside(u8 playerId) {
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
;./exsoccer.c:1100: u8 teamId = g_Players[playerId].TeamId;
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
	ld	-7 (ix), a
;./exsoccer.c:1101: u16 playerY = g_Players[playerId].Y;
	ld	a, (de)
	ld	-6 (ix), a
	inc	de
	ld	a, (de)
	ld	-5 (ix), a
;./exsoccer.c:1102: u8 opponentCount = 0;
	ld	-1 (ix), #0x00
;./exsoccer.c:1106: if (teamId == TEAM_1) {
	ld	a, -7 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00198$
	xor	a, a
00198$:
	ld	-4 (ix), a
;./exsoccer.c:1107: if (playerY >= FIELD_POS_Y_CENTER) return FALSE; // Own half
	ld	a, -6 (ix)
	ld	-3 (ix), a
	ld	a, -5 (ix)
	ld	-2 (ix), a
;./exsoccer.c:1106: if (teamId == TEAM_1) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00106$
;./exsoccer.c:1107: if (playerY >= FIELD_POS_Y_CENTER) return FALSE; // Own half
	ld	a, -3 (ix)
	sub	a, #0xf3
	ld	a, -2 (ix)
	sbc	a, #0x00
	jr	C, 00107$
	xor	a, a
	jp	00129$
00106$:
;./exsoccer.c:1109: if (playerY <= FIELD_POS_Y_CENTER) return FALSE; // Own half
	ld	a, #0xf3
	cp	a, -3 (ix)
	ld	a, #0x00
	sbc	a, -2 (ix)
	jr	C, 00107$
	xor	a, a
	jp	00129$
00107$:
;./exsoccer.c:1114: if (teamId == TEAM_1) {
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00113$
;./exsoccer.c:1115: if (playerY >= g_Ball.Y) return FALSE; 
	ld	hl, (#_g_Ball + 0)
	ld	a, -6 (ix)
	sub	a, l
	ld	a, -5 (ix)
	sbc	a, h
	jr	C, 00141$
	xor	a, a
	jp	00129$
00113$:
;./exsoccer.c:1117: if (playerY <= g_Ball.Y) return FALSE;
	ld	hl, (#_g_Ball + 0)
	ld	a, l
	sub	a, -6 (ix)
	ld	a, h
	sbc	a, -5 (ix)
	jr	C, 00141$
	xor	a, a
	jp	00129$
;./exsoccer.c:1121: for (i = 0; i < 14; i++) {
00141$:
	ld	c, #0x00
00128$:
;./exsoccer.c:1122: if (g_Players[i].TeamId == teamId) continue;
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
	ld	a,-7 (ix)
	sub	a,(hl)
	jr	Z, 00124$
;./exsoccer.c:1126: if (g_Players[i].Y <= playerY) opponentCount++;
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;./exsoccer.c:1125: if (teamId == TEAM_1) { // Attacking UP
	ld	a, -4 (ix)
	or	a, a
	jr	Z, 00122$
;./exsoccer.c:1126: if (g_Players[i].Y <= playerY) opponentCount++;
	ld	a, -6 (ix)
	sub	a, e
	ld	a, -5 (ix)
	sbc	a, d
	jr	C, 00124$
	inc	-1 (ix)
	jp	00124$
00122$:
;./exsoccer.c:1128: if (g_Players[i].Y >= playerY) opponentCount++;
	ld	a, e
	sub	a, -6 (ix)
	ld	a, d
	sbc	a, -5 (ix)
	jr	C, 00124$
	inc	-1 (ix)
00124$:
;./exsoccer.c:1121: for (i = 0; i < 14; i++) {
	inc	c
	ld	a, c
	sub	a, #0x0e
	jr	C, 00128$
;./exsoccer.c:1132: if (opponentCount < 2) return TRUE;
	ld	a, -1 (ix)
	sub	a, #0x02
	jr	NC, 00127$
	ld	a, #0x01
	jp	00129$
00127$:
;./exsoccer.c:1133: return FALSE;
	xor	a, a
00129$:
;./exsoccer.c:1134: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:1135: void PerformPass(u8 toPlayerId) {
;	---------------------------------
; Function PerformPass
; ---------------------------------
_PerformPass::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-21
	add	hl, sp
	ld	sp, hl
	ld	-1 (ix), a
;./exsoccer.c:1137: u8 fromId = g_Ball.PossessionPlayerId;
	ld	a, (#(_g_Ball + 6) + 0)
;./exsoccer.c:1141: if (fromId == NO_VALUE) return;
	ld	-2 (ix), a
	inc	a
	jp	Z,00155$
	jp	00102$
00102$:
;./exsoccer.c:1142: if (toPlayerId == NO_VALUE) return;
	ld	a, -1 (ix)
	inc	a
	jp	Z,00155$
	jp	00104$
00104$:
;./exsoccer.c:1145: if (g_Players[toPlayerId].Role == PLAYER_ROLE_GOALKEEPER) return;
	ld	bc, #_g_Players+0
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
	add	hl, bc
	ex	(sp), hl
	pop	de
	push	de
	ld	hl, #13
	add	hl, de
	ld	a, (hl)
	or	a, a
	jp	Z,00155$
;./exsoccer.c:1149: if (g_Players[fromId].Role != PLAYER_ROLE_GOALKEEPER) {
	ld	e, -2 (ix)
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
	ld	-19 (ix), l
	ld	-18 (ix), h
	ld	a, -19 (ix)
	add	a, #0x0d
	ld	-17 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-16 (ix), a
	ld	l, -17 (ix)
	ld	h, -16 (ix)
	ld	a, (hl)
	or	a, a
	jr	Z, 00110$
;./exsoccer.c:1150: if (IsOffside(toPlayerId)) {
	ld	a, -1 (ix)
	call	_IsOffside
	or	a, a
;./exsoccer.c:1152: return;
	jp	NZ,00155$
00110$:
;./exsoccer.c:1157: dx = (i16)g_Players[toPlayerId].X - (i16)g_Players[fromId].X;
	ld	a, -21 (ix)
	add	a, #0x02
	ld	-15 (ix), a
	ld	a, -20 (ix)
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
;./exsoccer.c:1158: dy = (i16)g_Players[toPlayerId].Y - (i16)g_Players[fromId].Y;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	-11 (ix), a
	ld	a, b
	sbc	a, d
	ld	-10 (ix), a
;./exsoccer.c:1159: adx = (dx < 0) ? -dx : dx;
	ld	a, -5 (ix)
	ld	-9 (ix), a
	ld	a, -4 (ix)
	ld	-8 (ix), a
	bit	7, -8 (ix)
	jr	Z, 00157$
	xor	a, a
	sub	a, -5 (ix)
	ld	-3 (ix), a
	sbc	a, a
	sub	a, -4 (ix)
	ld	-2 (ix), a
	jp	00158$
00157$:
	ld	a, -5 (ix)
	ld	-3 (ix), a
	ld	a, -4 (ix)
	ld	-2 (ix), a
00158$:
	ld	a, -3 (ix)
	ld	-7 (ix), a
	ld	a, -2 (ix)
	ld	-6 (ix), a
;./exsoccer.c:1160: ady = (dy < 0) ? -dy : dy;
	ld	a, -11 (ix)
	ld	-5 (ix), a
	ld	a, -10 (ix)
	ld	-4 (ix), a
	bit	7, -4 (ix)
	jr	Z, 00159$
	xor	a, a
	sub	a, -11 (ix)
	ld	-3 (ix), a
	sbc	a, a
	sub	a, -10 (ix)
	ld	-2 (ix), a
	jp	00160$
00159$:
	ld	a, -11 (ix)
	ld	-3 (ix), a
	ld	a, -10 (ix)
	ld	-2 (ix), a
00160$:
	ld	c, -3 (ix)
	ld	b, -2 (ix)
;./exsoccer.c:1162: if (adx > ady * 2) {
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	e, -7 (ix)
	ld	d, -6 (ix)
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, d
	jp	PO, 00322$
	xor	a, #0x80
00322$:
	jp	P, 00118$
;./exsoccer.c:1163: newDir = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 00323$
	xor	a, #0x80
00323$:
	jp	P, 00161$
	ld	bc, #0x0003
	jp	00162$
00161$:
	ld	bc, #0x0007
00162$:
	ld	-4 (ix), c
	jp	00119$
00118$:
;./exsoccer.c:1164: } else if (ady > adx * 2) {
	ex	de, hl
	add	hl, hl
	ex	de, hl
;./exsoccer.c:1165: newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
	xor	a, a
	cp	a, -5 (ix)
	sbc	a, -4 (ix)
	jp	PO, 00324$
	xor	a, #0x80
00324$:
	rlca
	and	a,#0x01
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;./exsoccer.c:1164: } else if (ady > adx * 2) {
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00325$
	xor	a, #0x80
00325$:
	jp	P, 00115$
;./exsoccer.c:1165: newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
	ld	a, l
	or	a, a
	jr	Z, 00163$
	ld	bc, #0x0005
	jp	00164$
00163$:
	ld	bc, #0x0001
00164$:
	ld	-4 (ix), c
	jp	00119$
00115$:
;./exsoccer.c:1167: if (dx > 0) newDir = (dy > 0) ? DIRECTION_DOWN_RIGHT : DIRECTION_UP_RIGHT;
	xor	a, a
	cp	a, -9 (ix)
	sbc	a, -8 (ix)
	jp	PO, 00326$
	xor	a, #0x80
00326$:
	jp	P, 00112$
	ld	a, l
	or	a, a
	jr	Z, 00165$
	ld	bc, #0x0004
	jp	00166$
00165$:
	ld	bc, #0x0002
00166$:
	ld	-4 (ix), c
	jp	00119$
00112$:
;./exsoccer.c:1168: else newDir = (dy > 0) ? DIRECTION_DOWN_LEFT : DIRECTION_UP_LEFT;
	ld	a, l
	or	a, a
	jr	Z, 00167$
	ld	bc, #0x0006
	jp	00168$
00167$:
	ld	bc, #0x0008
00168$:
	ld	-4 (ix), c
00119$:
;./exsoccer.c:1170: g_Players[fromId].Direction = newDir;
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	de, #0x000a
	add	hl, de
	ld	a, -4 (ix)
	ld	(hl), a
;./exsoccer.c:1173: if (newDir == DIRECTION_UP || newDir == DIRECTION_UP_LEFT || newDir == DIRECTION_UP_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_FRONT;
	ld	a, -4 (ix)
	dec	a
	jr	Z, 00130$
	ld	a, -4 (ix)
	sub	a, #0x08
	jr	Z, 00130$
	ld	a, -4 (ix)
	sub	a, #0x02
	jr	NZ, 00131$
00130$:
	ld	a, -19 (ix)
	add	a, #0x08
	ld	-3 (ix), a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), #0x18
	jp	00132$
00131$:
;./exsoccer.c:1174: else if (newDir == DIRECTION_DOWN || newDir == DIRECTION_DOWN_LEFT || newDir == DIRECTION_DOWN_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_BACK;
	ld	a, -4 (ix)
	sub	a, #0x05
	jr	Z, 00125$
	ld	a, -4 (ix)
	sub	a, #0x06
	jr	Z, 00125$
	ld	a, -4 (ix)
	sub	a, #0x04
	jr	NZ, 00126$
00125$:
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0x15
	jp	00132$
00126$:
;./exsoccer.c:1175: else if (newDir == DIRECTION_LEFT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_LEFT;
	ld	a, -4 (ix)
	sub	a, #0x07
	jr	NZ, 00123$
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0xa4
	jp	00132$
00123$:
;./exsoccer.c:1176: else if (newDir == DIRECTION_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_RIGHT;
	ld	a, -4 (ix)
	sub	a, #0x03
	jr	NZ, 00132$
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0x1b
00132$:
;./exsoccer.c:1178: g_Players[fromId].Status = PLAYER_STATUS_POSITIONED; // Lock pose for this frame
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	de, #0x0012
	add	hl, de
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;./exsoccer.c:1181: g_Players[fromId].TargetX = g_Players[fromId].X;
	ld	a, -19 (ix)
	add	a, #0x10
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
;./exsoccer.c:1182: g_Players[fromId].TargetY = g_Players[fromId].Y;
	ld	a, -19 (ix)
	add	a, #0x0e
	ld	c, a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	b, a
	ld	l, -19 (ix)
	ld	h, -18 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;./exsoccer.c:1185: SetPlayerBallPossession(NO_VALUE); 
	ld	a, #0xff
	call	_SetPlayerBallPossession
;./exsoccer.c:1186: g_Ball.PossessionPlayerId = NO_VALUE; 
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:1188: g_Ball.PassTargetPlayerId = toPlayerId;
	ld	hl, #(_g_Ball + 16)
	ld	a, -1 (ix)
	ld	(hl), a
;./exsoccer.c:1189: g_Ball.ShotActive = 0; // Not a shot
	ld	hl, #(_g_Ball + 27)
	ld	(hl), #0x00
;./exsoccer.c:1192: if (g_Players[fromId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	l, -17 (ix)
	ld	h, -16 (ix)
;./exsoccer.c:1204: g_Ball.X = g_Ball.X; 
;./exsoccer.c:1192: if (g_Players[fromId].Role == PLAYER_ROLE_GOALKEEPER) {
	ld	a, (hl)
	or	a, a
	jp	NZ, 00154$
;./exsoccer.c:1195: bool applyOffset = true;
	ld	c, #0x01
;./exsoccer.c:1197: if (g_GkIsGroundKick) {
	ld	a, (_g_GkIsGroundKick+0)
	or	a, a
	jr	Z, 00136$
;./exsoccer.c:1198: applyOffset = false;
	ld	c, #0x00
;./exsoccer.c:1204: g_Ball.X = g_Ball.X; 
	ld	de, (#(_g_Ball + 2) + 0)
	ld	((_g_Ball + 2)), de
;./exsoccer.c:1205: g_Ball.Y = g_Ball.Y;
	ld	de, (#_g_Ball + 0)
	ld	(_g_Ball), de
00136$:
;./exsoccer.c:1209: if (g_MatchStatus == MATCH_CORNER_KICK || g_MatchStatus == MATCH_BEFORE_CORNER_KICK ||
	ld	a,(_g_MatchStatus+0)
	cp	a,#0x09
	jr	Z, 00137$
;./exsoccer.c:1210: g_MatchStatus == MATCH_GOAL_KICK || g_MatchStatus == MATCH_BEFORE_GOAL_KICK) {
	cp	a,#0x02
	jr	Z, 00137$
	cp	a,#0x0a
	jr	Z, 00137$
	sub	a, #0x05
	jr	NZ, 00138$
00137$:
;./exsoccer.c:1211: applyOffset = false;
	ld	c, #0x00
00138$:
;./exsoccer.c:1216: if (applyOffset) {
	ld	a, c
	or	a, a
	jr	Z, 00154$
;./exsoccer.c:1217: i8 offX = 0; i8 offY = 0;
	ld	bc, #0x0
;./exsoccer.c:1218: switch (newDir) {
	ld	a, #0x08
	sub	a, -4 (ix)
	jr	C, 00150$
	ld	e, -4 (ix)
	ld	d, #0x00
	ld	hl, #00344$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00344$:
	jp	00150$
	jp	00142$
	jp	00147$
	jp	00145$
	jp	00149$
	jp	00143$
	jp	00148$
	jp	00144$
	jp	00146$
;./exsoccer.c:1219: case DIRECTION_UP:        offY = -30; break;
00142$:
	ld	b, #0xe2
	jp	00150$
;./exsoccer.c:1220: case DIRECTION_DOWN:      offY = 30; break;
00143$:
	ld	b, #0x1e
	jp	00150$
;./exsoccer.c:1221: case DIRECTION_LEFT:      offX = -30; break;
00144$:
	ld	c, #0xe2
	jp	00150$
;./exsoccer.c:1222: case DIRECTION_RIGHT:     offX = 30; break;
00145$:
	ld	c, #0x1e
	jp	00150$
;./exsoccer.c:1223: case DIRECTION_UP_LEFT:   offX = -21; offY = -21; break;
00146$:
	ld	bc, #0xebeb
	jp	00150$
;./exsoccer.c:1224: case DIRECTION_UP_RIGHT:  offX = 21; offY = -21; break;
00147$:
	ld	bc, #0xeb15
	jp	00150$
;./exsoccer.c:1225: case DIRECTION_DOWN_LEFT: offX = -21; offY = 21; break;
00148$:
	ld	bc, #0x15eb
	jp	00150$
;./exsoccer.c:1226: case DIRECTION_DOWN_RIGHT:offX = 21; offY = 21; break;
00149$:
	ld	bc, #0x1515
;./exsoccer.c:1227: }
00150$:
;./exsoccer.c:1228: g_Ball.X += offX;
	ld	hl, (#(_g_Ball + 2) + 0)
	ld	a, c
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	add	hl, de
	ex	de, hl
	ld	((_g_Ball + 2)), de
;./exsoccer.c:1229: g_Ball.Y += offY;
	ld	hl, (#_g_Ball + 0)
	ld	a, b
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	add	hl, bc
	ex	de, hl
	ld	(_g_Ball), de
00154$:
;./exsoccer.c:1235: g_Ball.PassStartX = g_Ball.X;
	ld	bc, (#(_g_Ball + 2) + 0)
	ld	((_g_Ball + 17)), bc
;./exsoccer.c:1236: g_Ball.PassStartY = g_Ball.Y;
	ld	bc, (#_g_Ball + 0)
	ld	((_g_Ball + 19)), bc
;./exsoccer.c:1238: dx = (i16)g_Players[toPlayerId].X - (i16)g_Ball.X;
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
;./exsoccer.c:1239: dy = (i16)g_Players[toPlayerId].Y - (i16)g_Ball.Y;
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
;./exsoccer.c:1240: g_Ball.PassTotalDist = (u16)((dx<0?-dx:dx) + (dy<0?-dy:dy)); 
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	Z, 00169$
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
00169$:
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	bit	7, h
	jr	Z, 00171$
	ld	hl, #0x0000
	cp	a, a
	sbc	hl, de
	jp	00172$
00171$:
	ex	de, hl
00172$:
	add	hl, bc
	ex	de, hl
	ld	((_g_Ball + 21)), de
00155$:
;./exsoccer.c:1241: }
	ld	sp, ix
	pop	ix
	ret
;./exsoccer.c:1242: void SetPlayerBallPossession(u8 playerId){
;	---------------------------------
; Function SetPlayerBallPossession
; ---------------------------------
_SetPlayerBallPossession::
;./exsoccer.c:1243: if (playerId == NO_VALUE) {
	ld	c, a
	inc	a
	ret	Z
;./exsoccer.c:1248: return;
	jp	00102$
00102$:
;./exsoccer.c:1251: if(g_Players[playerId].TeamId==TEAM_1){
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
	push	bc
	ld	bc, #0x0009
	add	hl, bc
	pop	bc
	ld	a, (hl)
;./exsoccer.c:1252: if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team1ActivePlayer=playerId;
	ld	hl, #13
	add	hl, de
	ld	b, (hl)
;./exsoccer.c:1251: if(g_Players[playerId].TeamId==TEAM_1){
	dec	a
	jr	NZ, 00108$
;./exsoccer.c:1252: if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team1ActivePlayer=playerId;
	ld	a, b
	or	a, a
	jr	Z, 00109$
	ld	hl, #_g_Team1ActivePlayer
	ld	(hl), c
	jp	00109$
00108$:
;./exsoccer.c:1255: if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team2ActivePlayer=playerId;
	ld	a, b
	or	a, a
	jr	Z, 00109$
	ld	hl, #_g_Team2ActivePlayer
	ld	(hl), c
00109$:
;./exsoccer.c:1258: g_Ball.PossessionTimer = 0; // Reset hold timer
	ld	hl, #(_g_Ball + 28)
	ld	(hl), #0x00
;./exsoccer.c:1259: }
	ret
;./exsoccer.c:1261: void TickGoalKick() {
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
;./exsoccer.c:1262: if (g_MatchStatus != MATCH_BEFORE_GOAL_KICK) return;
	ld	a, (_g_MatchStatus+0)
	sub	a, #0x05
	jp	NZ,00197$
;./exsoccer.c:1266: if (g_RestartKickTeamId == TEAM_1) gkId = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_GOALKEEPER);
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
;./exsoccer.c:1267: else gkId = GetPlayerIdByRole(TEAM_2, PLAYER_ROLE_GOALKEEPER);
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x02
	call	_GetPlayerIdByRole
	ld	-10 (ix), a
00105$:
;./exsoccer.c:1269: if (gkId == NO_VALUE) return; 
	ld	a, -10 (ix)
	inc	a
	jp	Z,00197$
	jp	00107$
00107$:
;./exsoccer.c:1272: if (g_Timer < 60) {
	ld	a, (_g_Timer+0)
	sub	a, #0x3c
	jr	NC, 00109$
;./exsoccer.c:1273: g_Timer++;
	ld	hl, #_g_Timer
	inc	(hl)
;./exsoccer.c:1274: return;
	jp	00197$
00109$:
;./exsoccer.c:1276: g_Ball.Size = 1;
	ld	hl, #(_g_Ball + 4)
	ld	(hl), #0x01
;./exsoccer.c:1278: if (g_Timer == 60) {
	ld	a, (_g_Timer+0)
	sub	a, #0x3c
	jp	NZ,00175$
;./exsoccer.c:1281: if (g_GoalKickSide == CORNER_SIDE_LEFT) targetX = GK_BOX_X_MIN;
	ld	a, (_g_GoalKickSide+0)
	or	a, a
	jr	NZ, 00111$
	ld	bc, #0x0050
	jp	00112$
00111$:
;./exsoccer.c:1282: else targetX = GK_BOX_X_MAX;
	ld	bc, #0x00a0
00112$:
;./exsoccer.c:1285: if (g_RestartKickTeamId == TEAM_1) { // Bottom Goal
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00114$
;./exsoccer.c:1286: ballY = GK_BOX_Y_BOTTOM_MIN; 
	ld	de, #0x0195
	jp	00115$
00114$:
;./exsoccer.c:1288: ballY = GK_BOX_Y_TOP_MAX; 
	ld	de, #0x004b
00115$:
;./exsoccer.c:1292: g_Ball.X = targetX;
	ld	((_g_Ball + 2)), bc
;./exsoccer.c:1293: g_Ball.Y = ballY;
	ld	(_g_Ball), de
;./exsoccer.c:1294: g_Ball.PossessionPlayerId = NO_VALUE;
	ld	hl, #(_g_Ball + 6)
	ld	(hl), #0xff
;./exsoccer.c:1299: runStartY = ballY + 32; 
;./exsoccer.c:1298: if (g_RestartKickTeamId == TEAM_1) {
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00121$
;./exsoccer.c:1299: runStartY = ballY + 32; 
	ld	hl, #0x0020
	add	hl, de
;./exsoccer.c:1300: if(runStartY > FIELD_BOUND_Y_BOTTOM) runStartY = FIELD_BOUND_Y_BOTTOM;
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
;./exsoccer.c:1302: runStartY = ballY - 32;
	ld	a, e
	add	a, #0xe0
	ld	e, a
	ld	a, d
	adc	a, #0xff
;./exsoccer.c:1303: if(runStartY < FIELD_BOUND_Y_TOP) runStartY = FIELD_BOUND_Y_TOP;
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
;./exsoccer.c:1306: g_Players[gkId].TargetX = targetX;
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
;./exsoccer.c:1307: g_Players[gkId].TargetY = runStartY;
	ld	hl, #0x000e
	add	hl, de
	ld	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -1 (ix)
	ld	(hl), a
;./exsoccer.c:1308: g_Players[gkId].Status = PLAYER_STATUS_NONE; 
	ld	hl, #0x0012
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;./exsoccer.c:1310: if (g_RestartKickTeamId == TEAM_1) g_Players[gkId].Direction = DIRECTION_UP;
	ld	hl, #0x000a
	add	hl, de
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00124$
	ld	(hl), #0x01
	jp	00125$
00124$:
;./exsoccer.c:1311: else g_Players[gkId].Direction = DIRECTION_DOWN;
	ld	(hl), #0x05
00125$:
;./exsoccer.c:1313: if (g_RestartKickTeamId == TEAM_1) ShowFieldZone(FIELD_SOUTH_ZONE);
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00127$
	ld	a, #0x02
	call	_ShowFieldZone
	jp	00239$
00127$:
;./exsoccer.c:1314: else ShowFieldZone(FIELD_NORTH_ZONE);
	xor	a, a
	call	_ShowFieldZone
;./exsoccer.c:1317: for(u8 i=0; i<14; i++){
00239$:
	ld	-1 (ix), #0x00
00196$:
	ld	a, -1 (ix)
	sub	a, #0x0e
	jp	NC, 00175$
;./exsoccer.c:1318: if(i == gkId) continue;
	ld	a, -10 (ix)
	sub	a, -1 (ix)
	jp	Z,00172$
;./exsoccer.c:1319: if(g_Players[i].TeamId == REFEREE) continue;
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
;./exsoccer.c:1320: if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	a, -9 (ix)
	add	a, #0x0d
	ld	e, a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	or	a, a
	jp	Z, 00172$
;./exsoccer.c:1323: g_Players[i].Status = PLAYER_STATUS_NONE;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	bc, #0x0012
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;./exsoccer.c:1326: u16 targetX = g_Players[i].X;
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
;./exsoccer.c:1319: if(g_Players[i].TeamId == REFEREE) continue;
	ld	c, 0 (iy)
;./exsoccer.c:1320: if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
	ld	a, (de)
;./exsoccer.c:1333: if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 200;
	ld	-5 (ix), a
	sub	a, #0x05
	ld	a, #0x01
	jr	Z, 00432$
	xor	a, a
00432$:
	ld	e, a
;./exsoccer.c:1334: if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 350; // Defenders move out of box
	ld	a, -5 (ix)
	dec	a
	ld	a, #0x01
	jr	Z, 00434$
	xor	a, a
00434$:
	ld	-4 (ix), a
;./exsoccer.c:1328: if (g_RestartKickTeamId == TEAM_1) {
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00166$
;./exsoccer.c:1330: if(g_Players[i].TeamId == TEAM_1) {
	dec	c
	jr	NZ, 00148$
;./exsoccer.c:1332: targetY = 300; // Midfielders
	ld	-3 (ix), #0x2c
	ld	-2 (ix), #0x01
;./exsoccer.c:1333: if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 200;
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
;./exsoccer.c:1334: if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 350; // Defenders move out of box
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
;./exsoccer.c:1336: targetY = 250;
	ld	-3 (ix), #0xfa
	ld	-2 (ix), #0
;./exsoccer.c:1337: if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 320; // Pressing High (but not too close)
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
;./exsoccer.c:1338: if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 150;
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
;./exsoccer.c:1342: if(g_Players[i].TeamId == TEAM_2) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00163$
;./exsoccer.c:1344: targetY = 150; 
	ld	-3 (ix), #0x96
	ld	-2 (ix), #0
;./exsoccer.c:1345: if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 250;
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
;./exsoccer.c:1346: if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 120; // Defenders move out of box
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
;./exsoccer.c:1348: targetY = 200;
	ld	-3 (ix), #0xc8
	ld	-2 (ix), #0
;./exsoccer.c:1349: if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 160; // Pressing High (but not too close)
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
;./exsoccer.c:1350: if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 300;
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
;./exsoccer.c:1355: if (targetX < 30) targetX = 30;
	ld	a, -7 (ix)
	ld	b, -6 (ix)
	sub	a, #0x1e
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00169$
	ld	-7 (ix), #0x1e
	ld	-6 (ix), #0
00169$:
;./exsoccer.c:1356: if (targetX > 220) targetX = 220;
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
;./exsoccer.c:1358: g_Players[i].TargetX = targetX;
	ld	l, -9 (ix)
	ld	h, -8 (ix)
	ld	de, #0x0010
	add	hl, de
	ld	a, -7 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -6 (ix)
	ld	(hl), a
;./exsoccer.c:1359: g_Players[i].TargetY = targetY;
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
;./exsoccer.c:1317: for(u8 i=0; i<14; i++){
	inc	-1 (ix)
	jp	00196$
00175$:
;./exsoccer.c:1364: i16 dx = (i16)g_Players[gkId].X - (i16)g_Players[gkId].TargetX;
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
;./exsoccer.c:1365: i16 dy = (i16)g_Players[gkId].Y - (i16)g_Players[gkId].TargetY;
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
;./exsoccer.c:1367: bool arrived = (dx >= -4 && dx <= 4 && dy >= -4 && dy <= 4);
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
;./exsoccer.c:1369: if (arrived) {
	or	a, a
	jp	Z, 00193$
;./exsoccer.c:1370: g_Players[gkId].X = g_Players[gkId].TargetX;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, -12 (ix)
	ld	(hl), a
	inc	hl
	ld	a, -11 (ix)
	ld	(hl), a
;./exsoccer.c:1371: g_Players[gkId].Y = g_Players[gkId].TargetY;
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
;./exsoccer.c:1373: if (g_RestartKickTeamId == TEAM_1) g_Players[gkId].Direction = DIRECTION_UP;
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
;./exsoccer.c:1374: else g_Players[gkId].Direction = DIRECTION_DOWN;
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	(hl), #0x05
00178$:
;./exsoccer.c:1375: g_Players[gkId].PatternId = GetNoMovingPlayerPatternId(g_Players[gkId].Direction);
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
;./exsoccer.c:1376: g_Players[gkId].Status = PLAYER_STATUS_POSITIONED;
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
;./exsoccer.c:1365: i16 dy = (i16)g_Players[gkId].Y - (i16)g_Players[gkId].TargetY;
	pop	hl
	push	hl
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;./exsoccer.c:1379: u16 distY = (g_Players[gkId].Y > g_Ball.Y) ? (g_Players[gkId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[gkId].Y);
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
;./exsoccer.c:1381: if (distY > 16) {
	ld	b, a
;./exsoccer.c:1273: g_Timer++;
	ld	a, (_g_Timer+0)
	inc	a
	ld	-3 (ix), a
;./exsoccer.c:1381: if (distY > 16) {
	ld	a, #0x10
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jr	NC, 00187$
;./exsoccer.c:1383: g_Timer++;
	ld	a, -3 (ix)
	ld	(_g_Timer+0), a
;./exsoccer.c:1384: if (g_Timer > 100) {
	ld	a, #0x64
	ld	hl, #_g_Timer
	sub	a, (hl)
	jr	NC, 00197$
;./exsoccer.c:1379: u16 distY = (g_Players[gkId].Y > g_Ball.Y) ? (g_Players[gkId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[gkId].Y);
	ld	hl, (#_g_Ball + 0)
;./exsoccer.c:1387: if (g_RestartKickTeamId == TEAM_1) kickY = g_Ball.Y + 6; 
	ld	a, (_g_RestartKickTeamId+0)
	dec	a
	jr	NZ, 00180$
	ld	bc, #0x0006
	add	hl, bc
	ld	c, l
	ld	b, h
	jp	00181$
00180$:
;./exsoccer.c:1388: else kickY = g_Ball.Y - 6;
	ld	bc, #0xfffa
	add	hl,bc
	ld	c, l
	ld	b, h
00181$:
;./exsoccer.c:1390: g_Players[gkId].TargetY = kickY;
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;./exsoccer.c:1391: g_Players[gkId].Status = PLAYER_STATUS_NONE;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	jp	00197$
00187$:
;./exsoccer.c:1395: g_Timer++;
	ld	a, -3 (ix)
	ld	(_g_Timer+0), a
;./exsoccer.c:1396: if (g_Timer > 110) {
	ld	a, #0x6e
	ld	hl, #_g_Timer
	sub	a, (hl)
	jr	NC, 00197$
;./exsoccer.c:1397: ClearTextFromLayerA(10, 18, 9); 
	ld	a, #0x09
	push	af
	inc	sp
	ld	l, #0x12
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x0a
	call	_ClearTextFromLayerA
;./exsoccer.c:1398: GoalkeeperWithBall(g_RestartKickTeamId, true); 
	ld	l, #0x01
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_g_RestartKickTeamId+0)
	call	_GoalkeeperWithBall
;./exsoccer.c:1399: g_GkRecoilY = 0;
	ld	hl, #_g_GkRecoilY
	ld	(hl), #0x00
	jp	00197$
00193$:
;./exsoccer.c:1404: if (g_Timer < 100) g_Timer = 61; // Hold at 61 while moving to start
	ld	a, (_g_Timer+0)
	sub	a, #0x64
	jr	NC, 00190$
	ld	hl, #_g_Timer
	ld	(hl), #0x3d
	jp	00197$
00190$:
;./exsoccer.c:1405: else g_Timer = 101; // Hold at 101 while moving to ball
	ld	hl, #_g_Timer
	ld	(hl), #0x65
00197$:
;./exsoccer.c:1407: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__g_History1:
	.ascii "PLY:      "
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__g_History2:
	.ascii "CPU:      "
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__g_FieldCurrentYPosition:
	.dw #0x0000
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
__xinit__g_ShootCooldown:
	.db #0x00	; 0
__xinit__g_ShotCursorX:
	.dw #0x0078
__xinit__g_ShotCursorDir:
	.db #0x02	;  2
__xinit__g_GoalScorerId:
	.db #0xff	; 255
__xinit__g_CornerKickSide:
	.db #0x00	; 0
__xinit__g_GoalKickSide:
	.db #0x00	; 0
__xinit__g_CornerKickTargetId:
	.db #0xff	; 255
__xinit__g_ThrowInPlayerId:
	.db #0xff	; 255
__xinit__g_VSynch:
	.db #0x00	; 0
__xinit__g_GkRecoilY:
	.db #0x00	;  0
__xinit__g_GkIsGroundKick:
	.db #0x00	; 0
	.area _CABS (ABS)
