// ─────────────────────────────────────────────────────────────────────────────
//  EXSOCCER - 2026 Fausto Pracek (fpracek@gmail.com)
// ─────────────────────────────────────────────────────────────────────────────

// INCLUDES

#include "msxgl.h"
#include "v9990.h"
#include "print.h"
#include "exsoccer.h"
#include "debug.h"
#include "input.h"

// CONSTANTS
extern const unsigned 		g_Font_MGL_Sample6[]; // Bank 1 = Segment 2
extern const unsigned char 	g_GameFieldLayerBTiles_part1[16384]; // Bank 1 = Segment 4
extern const unsigned char 	g_GameFieldLayerBTiles_part2[16384]; // Bank 1 = Segment 5
extern const unsigned char 	g_GameFieldLayerBTiles_part3[16384]; // Bank 1 = Segment 6
extern const unsigned char 	g_GameFieldLayerBTiles_part4[14336]; // Bank 1 = Segment 7
extern const unsigned char 	g_GameFieldLayerATiles[16384]; // Bank 1 = Segment 8
extern const unsigned char 	g_Sprites1[16384]; // Bank 1 = Segment 9
extern const unsigned char 	g_Sprites2[16384]; // Bank 1 = Segment 10



// VARIABLES
u16 		        g_FrameCounter;
int  		        g_FieldCurrentYPosition=0;
u8   		        g_FieldScrollingActionInProgress=0;
u8      	        g_Team1PaletteId;
u8      	        g_Team2PaletteId;
u8      	        g_Team1Score;
u8      	        g_Team2Score;
PlayerInfo          g_Players[15];
PonPonGirlInfo      g_PonPonGirls[6];
BallInfo            g_Ball;
u8                  g_PlayersPositioningPhaseCount=NO_VALUE;
u8                  g_MatchStatus=MATCH_NOT_STARTED;
u8 			        g_FieldScrollSpeed=FIELD_SCROLL_PRESENTATION_SPEED;
u8                  g_ActiveFieldZone;
u8                  g_RestartKickTeamId;
u8                  g_SecondsToEndOfMatch;
u8                  g_Timer=NO_VALUE;
u8                  g_Team1ActivePlayer=NO_VALUE;
u8                  g_Team2ActivePlayer=NO_VALUE;
u8                  g_PassTargetPlayer=NO_VALUE;
bool		        g_GameWith2Players=false;
u8                  g_GameLevel=1;
u8                  g_ActionCooldown=0; // Debounce for steal/pass
u8                  g_ShootCooldown=0;  // Cooldown specifically for shooting after restart
u16                 g_ShotCursorX = 120;
i8                  g_ShotCursorDir = 2;
bool                g_FioBre=false;
u8                  g_GoalScorerId = NO_VALUE;
u8                  g_CornerKickSide = CORNER_SIDE_LEFT;
u8                  g_GoalKickSide = CORNER_SIDE_LEFT;
u8                  g_CornerKickTargetId = NO_VALUE;
u8                  g_ThrowInPlayerId = NO_VALUE;
bool 		        g_VSynch = FALSE;
i8                  g_GkRecoilY = 0;

void UpdateV9990()
{
	WaitV9990Synch();
}
void InitVariables(){
	// Initialize Ball State
	g_Ball.PossessionPlayerId = NO_VALUE;
	g_Ball.PassTargetPlayerId = NO_VALUE;
	g_Ball.ShotActive = 0;
	g_Ball.LastTouchTeamId = NO_VALUE;
	g_Ball.ComingFromRestart = 0;
	// Initialize other game variables if needed
}
// *** ISR ***
void WaitV9990Synch()
{
	while(!g_VSynch) {}
	g_VSynch = FALSE;
	g_FrameCounter++;
	if(g_FrameCounter==60){
		g_FrameCounter=0;
	}
}

//-----------------------------------------------------------------------------
// Load Layer A
void LoadP1LayerA(){
	V9_FillVRAM(V9_P1_PGT_A, 0x00, 128*212); // Clean layer A pattern
	SET_BANK_SEGMENT(2, 7); 
	V9_WriteVRAM(V9_P1_PGT_A, g_GameFieldLayerATiles, sizeof(g_GameFieldLayerATiles)); // Load fonts

	// Pattern name table
	V9_FillVRAM16(V9_P1_PNT_A, 0x0000, 64*64); // Init layer A
	SET_BANK_SEGMENT(2, 1);
	// draw layer A
	for (u8 x=0;x<64;x++){
		V9_PutLayerATileAtPos(x,0,32);
	}
}
//-----------------------------------------------------------------------------
// Load Layer B
void LoadP1LayerB(){
	V9_FillVRAM(V9_P1_PGT_B, 0x00, 128*212); // Clean layer B pattern
	SET_BANK_SEGMENT(2, 3); 
	V9_WriteVRAM(V9_P1_PGT_B, g_GameFieldLayerBTiles_part1, sizeof(g_GameFieldLayerBTiles_part1)); // Load tiles (part 1)
	SET_BANK_SEGMENT(2, 4); 
	V9_WriteVRAM(V9_P1_PGT_B + 16384, g_GameFieldLayerBTiles_part2, sizeof(g_GameFieldLayerBTiles_part2)); // Load tiles (part 2)
	SET_BANK_SEGMENT(2, 5); 
	V9_WriteVRAM(V9_P1_PGT_B + 16384L*2, g_GameFieldLayerBTiles_part3, sizeof(g_GameFieldLayerBTiles_part3)); // Load tiles (part 3)
	SET_BANK_SEGMENT(2, 6); 
	V9_WriteVRAM(V9_P1_PGT_B + 16384L*3, g_GameFieldLayerBTiles_part4, sizeof(g_GameFieldLayerBTiles_part4)); // Load tiles (part 4)
	SET_BANK_SEGMENT(2, 1); 
	// V9_FillVRAM16(V9_P1_PNT_B, 0x0000, 64*64); // REDUNDANT: Overwritten below
	u16 tileId=0;
	// Fill 32x64 area (2048 tiles)
    for (u8 y=0;y<64;y++){
		for (u8 x=0;x<32;x++){
			V9_PutLayerBTileAtPos(x,y,tileId++);
		}
	}
}
//-----------------------------------------------------------------------------
// V9990 V-blank interrupt
void V9_InterruptVBlank()
{
	g_VSynch = TRUE;
	if (g_FieldScrollingActionInProgress != NO_VALUE) {

		switch (g_FieldScrollingActionInProgress) {
		case FIELD_NORTH_ZONE:
			g_FieldCurrentYPosition = g_FieldCurrentYPosition - g_FieldScrollSpeed;
			if (g_FieldCurrentYPosition < 0) {
				g_FieldCurrentYPosition = 1;
				g_FieldScrollingActionInProgress = NO_VALUE;
				g_ActiveFieldZone = FIELD_NORTH_ZONE;
			}
			break;
		case FIELD_CENTRAL_ZONE:
			if (g_FieldCurrentYPosition != 136) {
				if (g_FieldCurrentYPosition > FIELD_CENTRAL_Y) {
					g_FieldCurrentYPosition = g_FieldCurrentYPosition - g_FieldScrollSpeed;
					if(g_FieldCurrentYPosition < 136) g_FieldCurrentYPosition = 136;
				}
				else {
					g_FieldCurrentYPosition = g_FieldCurrentYPosition + g_FieldScrollSpeed;
					if(g_FieldCurrentYPosition > 136) g_FieldCurrentYPosition = 136;
				}

			}
			else {
				g_FieldScrollingActionInProgress = NO_VALUE;
				g_ActiveFieldZone = FIELD_CENTRAL_ZONE;
			}
			break;
		case FIELD_SOUTH_ZONE:
			g_FieldCurrentYPosition = g_FieldCurrentYPosition + g_FieldScrollSpeed;
			if (g_FieldCurrentYPosition >= FIELD_BOTTOM_Y) {
				g_ActiveFieldZone = FIELD_SOUTH_ZONE;
				g_FieldScrollingActionInProgress = NO_VALUE;
			}
			break;
		}
		V9_SetScrollingBY(g_FieldCurrentYPosition);
        for(u8 i=0;i<6;i++){
            PutPonPonGirlSprite(i);
        }
	}
}
//-----------------------------------------------------------------------------
// V9990 H-blank interrupt
void V9_InterruptHBlank()
{

}
//-----------------------------------------------------------------------------
// V9990 Command end interrupt
void V9_InterruptCommand()
{
	
}
//void InterruptHook()
//{
//__asm
//	// Flush VDP interruption signal
//	in		a, (P_VDP_STAT)
//
//	// Call VDP interruption handler
//	in		a, (V9_P06)
//	out		(V9_P06), a
//	// V-Blank interruption
//	rra
//	call	c, _V9_InterruptVBlank
//	// H-Blank interruption
//	rra
//	call	c, _V9_InterruptHBlank
//	// Command end interruption
//	rra
//	call	c, _V9_InterruptCommand
//__endasm;
//}
//-----------------------------------------------------------------------------
void GameStart(){
	g_FioBre=true;
	V9_SetDisplayEnable(FALSE);
    g_SecondsToEndOfMatch=MATCH_DURATION;
	g_RestartKickTeamId=TEAM_1;
	g_FieldScrollSpeed=FIELD_SCROLL_PRESENTATION_SPEED;
	g_FieldScrollingActionInProgress=NO_VALUE;
	g_FieldCurrentYPosition=FIELD_TOP_Y;
	g_Team1Score=0;
	g_Team2Score=0;
	g_Team1PaletteId=TEAM_ITA;
	g_Team2PaletteId=TEAM_AUS;
	V9_SetScrollingY(0);
	V9_SetScrollingBY(1);
	SetTeam1Palette();
	SetTeam2Palette();
	SetTeamsPresentationSpritesPosition();
	ShowFieldZone(FIELD_CENTRAL_ZONE);
	ShowHeaderInfo();
    InitPonPonGirls();
	V9_SetDisplayEnable(TRUE);
}
void SetTeamsPresentationSpritesPosition(){
	g_MatchStatus=MATCH_NOT_STARTED;
	for(u8 i=0;i<7;i++){
		g_Players[i].Y=230;
		g_Players[i].X=72+i*20;
		g_Players[i].PatternId=PLAYER_POSE_FRONT;
		g_Players[i].TeamId=TEAM_2;

	}
	for(u8 i=7;i<14;i++){
		g_Players[i].Y=250;
		g_Players[i].X=72+(i-7)*20;
		g_Players[i].PatternId=PLAYER_POSE_BACK;
		g_Players[i].TeamId=TEAM_1;
	}
	g_Players[REFEREE].Y=FIELD_POS_Y_CENTER;
	g_Players[REFEREE].X=30;
	g_Players[REFEREE].PatternId=PLAYER_POSE_RIGHT;
	g_Players[REFEREE].TeamId=REFEREE;
	g_Players[REFEREE].LastPose=0;
	g_Players[REFEREE].Direction=DIRECTION_RIGHT;
	g_Players[REFEREE].Role=NO_VALUE;
	g_Players[REFEREE].Status=PLAYER_STATUS_NONE;
	ResetPlayersInfo();
	SetPlayerTarget(REFEREE); 

    static const u8 k_PlayerRoles[] = { 
        PLAYER_ROLE_GOALKEEPER, PLAYER_ROLE_LEFT_DEFENDER, PLAYER_ROLE_RIGHT_HALFFIELDER, 
        PLAYER_ROLE_LEFT_HALFFIELDER, PLAYER_ROLE_RIGHT_DEFENDER, PLAYER_ROLE_LEFT_STRIKER, 
        PLAYER_ROLE_RIGHT_STRIKER 
    };

	for(u8 i=0;i<14;i++){
		g_Players[i].AiTickCounter=0;
        g_Players[i].Role = k_PlayerRoles[i % 7];
	}
	g_Ball.X=FIELD_POS_X_CENTER;
	g_Ball.Y=FIELD_POS_Y_CENTER;
	g_Ball.PreviousY=g_Ball.Y;
	ResetBallInfo(true);

}
//-----------------------------------------------------------------------------
// Active field zone management
void TickActiveFieldZone(){

	// Disable auto-camera zone switching during presentation/cutscenes
	if (g_MatchStatus != MATCH_IN_ACTION) return;

    if (g_ActiveFieldZone == FIELD_CENTRAL_ZONE) {
        if (g_Ball.Y < 170) ShowFieldZone(FIELD_NORTH_ZONE);
        else if (g_Ball.Y > 320) ShowFieldZone(FIELD_SOUTH_ZONE);
    } 
    else if (g_ActiveFieldZone == FIELD_NORTH_ZONE) {
        if (g_Ball.Y > 190) ShowFieldZone(FIELD_CENTRAL_ZONE);
    }
    else { // SOUTH
        if (g_Ball.Y < 300) ShowFieldZone(FIELD_CENTRAL_ZONE);
    }
	g_Ball.PreviousY=g_Ball.Y;
}
void TickUpdateTime(){
	if(g_MatchStatus==MATCH_IN_ACTION){
		
		if(g_FrameCounter==58){
			g_SecondsToEndOfMatch--;
			ShowHeaderInfo();
			if(g_SecondsToEndOfMatch==0){
				TimeUp();
			}
		}
	}
	if(g_Timer!=NO_VALUE){
		if(g_FrameCounter==58){
			g_Timer++;
		}
	}
	
}
u16 GetOffsideLineY(u8 attackingTeamId) {
    u8 defendingTeamId = (attackingTeamId == TEAM_1) ? TEAM_2 : TEAM_1;
    bool findMin = (attackingTeamId == TEAM_1);
    
    // Initialize with worst possible values
    u16 val1 = findMin ? 0xFFFF : 0;
    u16 val2 = val1;

    for(u8 i=0; i<14; i++){
        if(g_Players[i].TeamId != defendingTeamId) continue;
        u16 y = g_Players[i].Y;

        if (findMin) {
            if (y < val1) { val2 = val1; val1 = y; }
            else if (y < val2) { val2 = y; }
        } else {
            if (y > val1) { val2 = val1; val1 = y; }
            else if (y > val2) { val2 = y; }
        }
    }

    if (findMin) return (val2 == 0xFFFF) ? FIELD_BOUND_Y_TOP : val2;
    return (val2 == 0) ? FIELD_BOUND_Y_BOTTOM : val2;
}
void BallInGoal(u8 teamScored){
	// Placeholder for Goal Logic
	V9_PrintLayerAStringAtPos(12,18,"IN  GOAL");

    g_GoalScorerId = g_Ball.PossessionPlayerId;
    
    // Better heuristic: if possession is NO_VALUE, use closest player of scoring team
    if (g_GoalScorerId == NO_VALUE) {
        g_GoalScorerId = GetClosestPlayerToBall(teamScored, NO_VALUE);
    }
    
	if(teamScored==TEAM_1){
		// Scored UP (North)
		g_Ball.Y = FIELD_BOUND_Y_TOP - 12;
		g_Team1Score++;
	}
	else{
		// Scored DOWN (South)
		g_Ball.Y = FIELD_BOUND_Y_BOTTOM + 12L;
		g_Team2Score++;
	}
	ShowHeaderInfo();

	g_MatchStatus=MATCH_AFTER_IN_GOAL;
	g_RestartKickTeamId = (teamScored == TEAM_1) ? TEAM_2 : TEAM_1;
	g_Timer = 0; // Start timer for celebration/reset
    g_Ball.ShotActive = 0;
    g_Ball.PassTargetPlayerId = NO_VALUE;
    g_Ball.PossessionPlayerId = NO_VALUE;
}
void BallThrowIn(u8 teamId){
	u8 i; // C89 declaration
	// Placeholder for Throw-in Logic
	V9_PrintLayerAStringAtPos(10,18,"THROW IN");
	g_MatchStatus=MATCH_BEFORE_THROW_IN;
	g_RestartKickTeamId = teamId;
	g_Timer = 0;
	
	// STOP ALL BALL PHYSICS
	g_Ball.ShotActive = 0;
	g_Ball.PassTargetPlayerId = NO_VALUE;
	g_Ball.PossessionPlayerId = NO_VALUE;
	
	// FIX: Freeze all players at current positions to prevent walking to old targets
	for(i=0; i<14; i++) {
		g_Players[i].TargetX = g_Players[i].X;
		g_Players[i].TargetY = g_Players[i].Y;
		// If outside bounds, clamp targets so they move to the line and stop
		if (g_Players[i].TargetX < FIELD_BOUND_X_LEFT) g_Players[i].TargetX = FIELD_BOUND_X_LEFT;
		if (g_Players[i].TargetX > FIELD_BOUND_X_RIGHT) g_Players[i].TargetX = FIELD_BOUND_X_RIGHT;
		if (g_Players[i].TargetY < FIELD_BOUND_Y_TOP) g_Players[i].TargetY = FIELD_BOUND_Y_TOP;
		if (g_Players[i].TargetY > FIELD_BOUND_Y_BOTTOM) g_Players[i].TargetY = FIELD_BOUND_Y_BOTTOM;
		
		g_Players[i].Status = PLAYER_STATUS_NONE;
	}
}
void GoalKick(u8 teamId){
	// Placeholder for Goal Kick Logic
	V9_PrintLayerAStringAtPos(10,18,"GOAL KICK");
	g_MatchStatus=MATCH_BEFORE_GOAL_KICK;
	g_RestartKickTeamId = teamId;
	g_Timer = 0;

    // Detect Side based on Ball Position
    if (g_Ball.X < FIELD_POS_X_CENTER) g_GoalKickSide = CORNER_SIDE_LEFT;
    else g_GoalKickSide = CORNER_SIDE_RIGHT;
}
void CornerKick(u8 teamId){
	// Placeholder for Corner Kick Logic
	V9_PrintLayerAStringAtPos(10,12,"CORNER KICK");
	g_MatchStatus=MATCH_BEFORE_CORNER_KICK;
	g_RestartKickTeamId = teamId;
	g_CornerKickTargetId = NO_VALUE;
	g_Timer = 0;
	
    // Detect side based on Ball X
    if (g_Ball.X < FIELD_POS_X_CENTER) g_CornerKickSide = CORNER_SIDE_LEFT;
    else g_CornerKickSide = CORNER_SIDE_RIGHT;
    
    // Position Players
    u8 kickerId = NO_VALUE;
    // Find kick spot
    u16 kickX = (g_CornerKickSide == CORNER_SIDE_LEFT) ? FIELD_BOUND_X_LEFT : FIELD_BOUND_X_RIGHT;
    u16 kickY = (teamId == TEAM_1) ? FIELD_BOUND_Y_TOP : FIELD_BOUND_Y_BOTTOM;

    // Force Camera Scroll to the Corner Zone
    if (teamId == TEAM_1) ShowFieldZone(FIELD_NORTH_ZONE);
    else ShowFieldZone(FIELD_SOUTH_ZONE);
    
    // Pick Kicker (Attacking Striker on the Ball Side)
    // NOTE: If Left Corner, we pick Left Striker to kick.
    if (g_CornerKickSide == CORNER_SIDE_LEFT) kickerId = GetPlayerIdByRole(teamId, PLAYER_ROLE_LEFT_STRIKER);
    else kickerId = GetPlayerIdByRole(teamId, PLAYER_ROLE_RIGHT_STRIKER);
    
    // Reset Possession (Ball sits at flag until player arrives)
    g_Ball.PossessionPlayerId = NO_VALUE; 
    SetPlayerBallPossession(NO_VALUE);
    if(teamId == TEAM_1) g_Team1ActivePlayer = kickerId; // Ensure kicker is selected active
    else g_Team2ActivePlayer = kickerId;
    
    // Position Ball with Offsets for visibility
    // Index: 0=T1_L, 1=T1_R, 2=T2_L, 3=T2_R
    // u8 cornerIdx = (teamId == TEAM_1 ? 0 : 2) + g_CornerKickSide;
    // const i8 ballOffsetX[4] = { 0, 0, 0, -30 };
    // const i8 ballOffsetY[4] = { 0, 0, 0, -5 };
    
    i8 offX = 0; i8 offY = 0;
    if (teamId == TEAM_2 && g_CornerKickSide == CORNER_SIDE_RIGHT) {
         offX = -30;
         offY = -5;
    }

    g_Ball.X = kickX + offX;
    g_Ball.Y = kickY + offY;
    g_Ball.PreviousY = g_Ball.Y;
    
    // DEFINE COORDINATES RELATIVE TO ATTACK DIRECTION
    // Team 1 attacks UP (Goal Y ~ 50). Team 2 attacks DOWN (Goal Y ~ 430).
    bool attackingUp = (teamId == TEAM_1);
    
    // Y Coordinates for Positioning
    u16 yGoalLine      = (attackingUp) ? FIELD_BOUND_Y_TOP : FIELD_BOUND_Y_BOTTOM;
    u16 yBoxInside     = (attackingUp) ? (FIELD_BOUND_Y_TOP + 40) : (FIELD_BOUND_Y_BOTTOM - 40);
    u16 yBoxOutside    = (attackingUp) ? (FIELD_BOUND_Y_TOP + 90) : (FIELD_BOUND_Y_BOTTOM - 90);
    u16 yMidfieldAdv   = (attackingUp) ? (FIELD_BOUND_Y_TOP + 160) : (FIELD_BOUND_Y_BOTTOM - 160);
    u16 yMidfield      = FIELD_POS_Y_CENTER;
    u16 ySafety        = (attackingUp) ? (FIELD_BOUND_Y_BOTTOM - 100) : (FIELD_BOUND_Y_TOP + 100);

    for(u8 i=0; i<14; i++) {
        g_Players[i].Status = PLAYER_STATUS_NONE;
        g_Players[i].TargetX = g_Players[i].X;
        g_Players[i].TargetY = g_Players[i].Y;
        
        u8 role = g_Players[i].Role;
        bool isAttacker = (g_Players[i].TeamId == teamId);
        
        // Kicker
        if (i == kickerId) {
             g_Players[i].TargetX = kickX;
             g_Players[i].TargetY = kickY;
             continue;
        } 
        
        if (isAttacker) {
             // --- ATTACKING TEAM ---
             if (role == PLAYER_ROLE_GOALKEEPER) {
                  // Own GK stays back
                  g_Players[i].TargetX = FIELD_POS_X_CENTER;
                  g_Players[i].TargetY = (attackingUp) ? FIELD_BOUND_Y_BOTTOM - 20 : FIELD_BOUND_Y_TOP + 20;
             }
             else if (role == PLAYER_ROLE_LEFT_DEFENDER || role == PLAYER_ROLE_RIGHT_DEFENDER) {
                  if (role == PLAYER_ROLE_LEFT_DEFENDER) {
                      // Defender 1: Advanced Midfield
                       g_Players[i].TargetX = FIELD_POS_X_CENTER - 30;
                       g_Players[i].TargetY = yMidfieldAdv;
                  } else {
                       // Defender 2: Safety / Defense
                       g_Players[i].TargetX = FIELD_POS_X_CENTER;
                       g_Players[i].TargetY = ySafety;
                  }
             }
             else if (role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
                  if (role == PLAYER_ROLE_LEFT_HALFFIELDER) {
                       // Halffielder 1: Outside Box (Vertex Left/Center)
                       g_Players[i].TargetX = FIELD_POS_X_CENTER - 50; 
                       g_Players[i].TargetY = yBoxOutside;
                  } else {
                       // Halffielder 2: Advanced Midfield (Center/Right)
                       g_Players[i].TargetX = FIELD_POS_X_CENTER + 30;
                       g_Players[i].TargetY = yMidfieldAdv;
                  }
             }
             else { 
                  // Strikers (The one not kicking)
                  // "Outside Box (Vertex)"
                  g_Players[i].TargetX = FIELD_POS_X_CENTER + 50;
                  g_Players[i].TargetY = yBoxOutside;
             }
        } 
        else {
             // --- DEFENDING TEAM ---
             if (role == PLAYER_ROLE_GOALKEEPER) {
                  // Defending GK in goal
                  g_Players[i].TargetX = FIELD_POS_X_CENTER;
                  g_Players[i].TargetY = (attackingUp) ? FIELD_POS_Y_TEAM2_GOALKEEPER : FIELD_POS_Y_TEAM1_GOALKEEPER;
             }
             else if (role == PLAYER_ROLE_LEFT_DEFENDER || role == PLAYER_ROLE_RIGHT_DEFENDER) {
                  // Defenders: INSIDE BOX
                  g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_DEFENDER) ? FIELD_POS_X_CENTER - 20 : FIELD_POS_X_CENTER + 20;
                  g_Players[i].TargetY = yBoxInside;
             }
             else if (role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
                  // Halffielders: JUST OUTSIDE BOX (Marking distance)
                  g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_HALFFIELDER) ? FIELD_POS_X_CENTER - 40 : FIELD_POS_X_CENTER + 40;
                  g_Players[i].TargetY = yBoxOutside;
             }
             else {
                  // Strikers: NEAR MIDFIELD (Counter)
                  g_Players[i].TargetX = (role == PLAYER_ROLE_LEFT_STRIKER) ? FIELD_POS_X_LEFT + 20 : FIELD_POS_X_RIGHT - 20;
                  g_Players[i].TargetY = yMidfield;
             }
        }
    }
}
void InitializeV9990()
{
	SET_BANK_SEGMENT(2, 1); // Bank 1 = Segment 3
	V9_SetScreenMode(V9_MODE_P1);
	V9_SetDisplayEnable(FALSE);
	V9_SetInterrupt(V9_INT_NONE);
	V9_SetBackgroundColor(1);
	V9_SetSpriteEnable(TRUE);

	V9_SetDisplayEnable(TRUE);
	LoadSprites();
	InitPalette();
	LoadP1LayerA();
	LoadP1LayerB();
	V9_SetInterrupt(V9_INT_VBLANK | V9_INT_HBLANK);

	V9_SetInterruptLine(71);
	V9_SetDisplayEnable(TRUE);

}
//-----------------------------------------------------------------------------
// Load sprites
void LoadSprites(){
	//V9_FillVRAM(V9_P1_SGT, 0x00, 128*212); // Clean layer A pattern
	SET_BANK_SEGMENT(2, 8); 
	V9_SetSpritePatternAddr(V9_P1_SGT_08000);
	V9_WriteVRAM(0x08000, g_Sprites1, sizeof(g_Sprites1));	
	SET_BANK_SEGMENT(2, 9); 
	V9_WriteVRAM(0x08000+sizeof(g_Sprites1), g_Sprites2, sizeof(g_Sprites2));	
	SET_BANK_SEGMENT(2, 1); 
}

void TickGoalCelebration(){
    if(g_MatchStatus!=MATCH_AFTER_IN_GOAL) return;
    
    g_Timer++;
    // Blink effect
    if((g_Timer % 10) < 5){
        V9_SetBackgroundColor(8); // Cyan/Flash
    } else {
        V9_SetBackgroundColor(1); // Default Blue
    }

	// ------------------------------------
	// CELEBRATION PHASE (First 2 Seconds)
	// ------------------------------------
	if (g_Timer < 120) {
		u8 scoringTeamId = (g_RestartKickTeamId == TEAM_1) ? TEAM_2 : TEAM_1;
		
		// Determine visible boundaries based on Goal Location
		u16 limitY_Top = FIELD_BOUND_Y_TOP;
		u16 limitY_Bottom = FIELD_BOUND_Y_BOTTOM;
		
		if (g_Ball.Y < FIELD_CENTRAL_Y) { // Top Goal
			limitY_Bottom = FIELD_BOUND_Y_TOP + 160; 
		} else { // Bottom Goal
			limitY_Top = FIELD_BOUND_Y_BOTTOM - 160;
		}

		// Move/Anim Lookup Tables
        // Directions: NO, UP, UR, RI, DR, DO, DL, LE, UL
        static const i8 k_CelebDX[] = { 0, 0, 1, 1, 1, 0, -1, -1, -1 };
        static const i8 k_CelebDY[] = { 0, -1, -1, 0, 1, 1, 1, 0, -1 };

		for(u8 i=0; i<15; i++){
			if(i == REFEREE) continue;
             u8 dir = g_Players[i].Direction;
			
			// Decide behavior based on team
			if (g_Players[i].TeamId == scoringTeamId) {
				// --- SCORING TEAM: Random Movement & Celebration Poses ---

				// Change direction every 19 frames to be erratic (prime number avoids X/Y axis locking)
				if ((g_Timer % 19) == 0) {
					// Pseudo-random direction (1 to 8)
					u8 rnd = (g_Timer * 3) + (i * 37); 
					dir = (rnd % 8) + 1; 
                    g_Players[i].Direction = dir;
				}

                i8 dy = k_CelebDY[dir];
                i8 dx = k_CelebDX[dir];

                if (dy < 0 && g_Players[i].Y > limitY_Top) g_Players[i].Y--;
                else if (dy > 0 && g_Players[i].Y < limitY_Bottom) g_Players[i].Y++;
                
                if (dx < 0 && g_Players[i].X > FIELD_BOUND_X_LEFT) g_Players[i].X--;
                else if (dx > 0 && g_Players[i].X < FIELD_BOUND_X_RIGHT) g_Players[i].X++;

				// ANIMATION: Hands Up!
				bool animFrame1 = ((g_Timer / 8) % 2) == 0;
                bool isBack = (dy < 0);
				
                if (isBack) g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_BACK_1 : PLAYER_POSE_CELEBRATION_BACK_2;
                else g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_FRONT_1 : PLAYER_POSE_CELEBRATION_FRONT_2;

			} else {
				// --- LOSING TEAM: Stand Still ---
                bool isUp = (dir == DIRECTION_UP || dir == DIRECTION_UP_LEFT || dir == DIRECTION_UP_RIGHT);
                g_Players[i].PatternId = isUp ? PLAYER_POSE_BACK : PLAYER_POSE_FRONT;
			}
		}
	}
    
    if(g_Timer > 150){
        V9_SetBackgroundColor(1);
        ClearTextFromLayerA(12, 18, 8); // "IN  GOAL"
        
        g_MatchStatus = MATCH_BEFORE_KICK_OFF;
        g_Ball.PossessionPlayerId = NO_VALUE;
        g_Ball.KickMoveState = 0;
        g_Ball.ShotActive = 0;
        if(g_Team1ActivePlayer!=NO_VALUE) g_Players[g_Team1ActivePlayer].Status=PLAYER_STATUS_NONE;
        if(g_Team2ActivePlayer!=NO_VALUE) g_Players[g_Team2ActivePlayer].Status=PLAYER_STATUS_NONE;
        g_Team1ActivePlayer=NO_VALUE;
        g_Team2ActivePlayer=NO_VALUE;
        
        g_Ball.X = FIELD_POS_X_CENTER;
        g_Ball.Y = FIELD_POS_Y_CENTER;
        g_Ball.PreviousY = g_Ball.Y;
        PutBallSprite();
        
        for(u8 i=0; i<15; i++){
            if(i==REFEREE || g_Players[i].TeamId==TEAM_1 || g_Players[i].TeamId==TEAM_2){
                 // Force REFEREE Pose reset just in case
                 if (i==REFEREE) {
                     g_Players[i].Direction=DIRECTION_RIGHT;
                     g_Players[i].LastPose=0;
                 }
                 SetPlayerTarget(i); 
            }
        }
        
        // FORCE SCROLLING TO CENTER
        ShowFieldZone(FIELD_CENTRAL_ZONE);
    }
}
//-----------------------------------------------------------------------------
// Program entry point
void main()
{
	DEBUG_INIT();
	SET_BANK_SEGMENT(2, 1); 
	InitVariables();
	V9_SetPort(V9_P15, 0);

	VDP_SetMode(VDP_MODE_SCREEN0);
	VDP_EnableVBlank(FALSE);
	VDP_ClearVRAM();
	
	
	//Bios_SetHookDirectCallback(H_KEYI, InterruptHook);
	//Bios_ClearHook(H_TIMI);
	
	SET_BANK_SEGMENT(2, 10); 
	Print_SetTextFont(g_Font_MGL_Sample6, 1);
	SET_BANK_SEGMENT(2, 1); 
	Print_SetColor(15, 1);
	Print_SetPosition(0, 0);
	Print_DrawText("Soccer League - 2026 Fausto Pracek");
	Print_SetPosition(0, 1);
	Print_DrawText("fpracek@gmail.com");
	
	const c8* str = "V9990 not found!";
	bool v9990IsFound=V9_Detect();

	if (v9990IsFound){
		str = "V9990 found!";
		Print_SetPosition(0, 7);
		Print_DrawText("The game is running on V9990 monitor.");
	}
	Print_SetPosition(0, 3);
	Print_DrawText(str);
	if(!v9990IsFound){
		for(;;);
	}
	
	InitializeV9990();
	
	
	V9_SetPort(V9_P15, 0x10);
	
	GameStart();
	MainGameLoop();
	

	//Bios_Exit(0);
}
void MainGameLoop(){
	u8 TickAiPlayerId=0;
	u8 AiTickSpeed=0;
	for(;;){
		UpdateV9990();

		if(g_MatchStatus==MATCH_NOT_STARTED && g_FieldScrollingActionInProgress==NO_VALUE && g_ActiveFieldZone==FIELD_CENTRAL_ZONE){
			g_MatchStatus=MATCH_BEFORE_KICK_OFF;
			for(u8 i=0;i<15;i++){
				SetPlayerTarget(i);
			}
			TickPlayerToOwnTarget();
		}
		
        TickCornerKick(); // <<< Added Hook
        TickGoalKick();
        TickThrowIn();
        TickPonPonGirlsAnimation();
		TickGoalCelebration();
		TickPlayerToOwnTarget();
		TickActiveFieldZone();
		if(g_FieldScrollingActionInProgress==NO_VALUE){
            // AI runs during ACTION and GK_BALL
            if(g_MatchStatus == MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
                // Referee AI
                if(AiTickSpeed >= 2){ // Speed up AI cycle (was 5)
					AiTickSpeed=0;
					TickAI(REFEREE);
					TickAI(TickAiPlayerId);
					TickAiPlayerId++;
					if(TickAiPlayerId==14){ // Only iterate 0-13 (Players)
						TickAiPlayerId=0;
					}
					
					// PRIORITY: Always run AI for Ball Carrier every cycle (if CPU)
					if (g_Ball.PossessionPlayerId != NO_VALUE && g_Ball.PossessionPlayerId < 14) {
						// Don't run twice if we just ran it in the loop
						if (g_Ball.PossessionPlayerId != TickAiPlayerId) {
							TickAI(g_Ball.PossessionPlayerId);
						}
					}
				}
				
            }
		}
		
		EnforcePenaltyBoxRestriction();

		UpdateSpritesPositions();
		TickShotCursor();
		TickUpdateTime();
		TickShowKickOff();
		if(g_FieldScrollingActionInProgress==NO_VALUE){
			TickBallCollision();
			TickBallFlying();
			UpdatePassTarget();
            TickGoalkeeperAnimation();
		}
		
		TickCheckBallBoundaries();
		TickTeamJoystick(TEAM_1,GetJoystick1Direction());
		if(g_GameWith2Players){
			TickTeamJoystick(TEAM_2,GetJoystick2Direction());
		}
		
		AiTickSpeed++;
		// Decrement Cooldown
		if (g_ActionCooldown > 0) {
			g_ActionCooldown--;
		} else {
			// Unlock Human Players poses if cooldown expired
            if (g_Team1ActivePlayer != NO_VALUE && g_Players[g_Team1ActivePlayer].Status == PLAYER_STATUS_POSITIONED) 
                 g_Players[g_Team1ActivePlayer].Status = PLAYER_STATUS_NONE;
            if (g_GameWith2Players && g_Team2ActivePlayer != NO_VALUE && g_Players[g_Team2ActivePlayer].Status == PLAYER_STATUS_POSITIONED)
                 g_Players[g_Team2ActivePlayer].Status = PLAYER_STATUS_NONE;
		}
		
		if (g_ShootCooldown > 0) {
			g_ShootCooldown--;
		}
	}
}

// *******

void UpdatePlayerPatternByDirection(u8 playerId){
	if(g_Players[playerId].Status==PLAYER_STATUS_POSITIONED){
		return;
	}
	
	//u8 pose=g_Players[playerId].LastPose;
	if(g_Players[playerId].Direction!=g_Players[playerId].PreviousDirection){
		if(g_Players[playerId].Direction==DIRECTION_NONE){
			g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
			g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
		}
		else{
			g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
			g_Players[playerId].LastPose=0;
			//pose=GetNewPoseByDirection(g_Players[playerId].Direction);
		}

	}
	else{
		if(g_Players[playerId].Direction!=DIRECTION_NONE){
			if(g_Players[playerId].LastPose==1){
				g_Players[playerId].LastPose=0;
			}
			else{
				g_Players[playerId].LastPose=1;
			}
		}
		
	}

	if(g_Players[playerId].TeamId==REFEREE && g_MatchStatus==MATCH_BEFORE_KICK_OFF ){
		// DISABLED: Allow REFEREE to animate during return phase
		// g_Players[playerId].PatternId=PLAYER_POSE_RIGHT;
        if(g_Players[playerId].Direction!=DIRECTION_NONE){
			g_Players[playerId].PatternId=GetPatternIdByPoseAndDirection(playerId);
		}
	}
	else{
		if(g_Players[playerId].Direction!=DIRECTION_NONE){
			g_Players[playerId].PatternId=GetPatternIdByPoseAndDirection(playerId);
		}
	}
}


u8 GetNoMovingPlayerPatternId(u8 direction){
	u8 patternId=PLAYER_POSE_FRONT_PLAYING; // Default fallback
	switch (direction){
		case DIRECTION_DOWN:
			patternId=PLAYER_POSE_FRONT_PLAYING;
			break;
		case DIRECTION_UP:
			patternId=PLAYER_POSE_BACK_PLAYING;
			break;
		case DIRECTION_LEFT:
			patternId=PLAYER_POSE_LEFT;
			break;
		case DIRECTION_RIGHT:
			patternId=PLAYER_POSE_RIGHT;
			break;
		case DIRECTION_UP_LEFT:
			patternId=PLAYER_POSE_MOVE_UP_LEFT_2;
			break;
		case DIRECTION_UP_RIGHT:
			patternId=PLAYER_POSE_MOVE_UP_RIGHT_1;
			break;
		case DIRECTION_DOWN_LEFT:
			patternId=PLAYER_POSE_MOVE_DOWN_LEFT_1;
			break;
		case DIRECTION_DOWN_RIGHT:
			patternId=PLAYER_POSE_MOVE_DOWN_RIGHT_2;
			break;
        case DIRECTION_NONE:
            // Fallback for NONE - assume facing front or use existing pose if possible, 
            // but here we return a safe pattern (Front)
            patternId=PLAYER_POSE_FRONT_PLAYING;
            break;
	}
	return patternId;
}

u8 GetNewPoseByDirection(u8 direction){
	u8 pose=NO_VALUE;
	switch (direction)
	{
	case DIRECTION_DOWN:
		pose=PLAYER_POSE_MOVE_DOWN_1;
		break;
	case DIRECTION_UP:
		pose=PLAYER_POSE_MOVE_UP_1;
		break;
	case DIRECTION_LEFT:
		pose=PLAYER_POSE_MOVE_LEFT_1;
		break;	
	case DIRECTION_RIGHT:
		pose=PLAYER_POSE_MOVE_RIGHT_1;
		break;	
	case DIRECTION_UP_RIGHT:
		pose=PLAYER_POSE_MOVE_UP_RIGHT_1;
		break;	
	case DIRECTION_DOWN_RIGHT:
		pose=PLAYER_POSE_MOVE_DOWN_RIGHT_1;
		break;	
	case DIRECTION_UP_LEFT:
		pose=PLAYER_POSE_MOVE_UP_LEFT_1;
		break;	
	case DIRECTION_DOWN_LEFT:
		pose=PLAYER_POSE_MOVE_DOWN_LEFT_1;
		break;	
	}
	return pose;
}

u8 GetPatternIdByPoseAndDirection(u8 playerId){
	u8 pose = g_Players[playerId].LastPose;
	u8 dir = g_Players[playerId].Direction;
    
    // Safety
    if (dir > 8) dir = DIRECTION_NONE;

    if (dir == DIRECTION_NONE) {
        return GetNoMovingPlayerPatternId(dir); // Assuming logic for NONE inside
    }
    
    // Lookup table for moving patterns (Pose 0, Pose 1)
    // Indexes: NONE, UP, UR, RI, DR, DO, DL, LE, UL
    // Note: NONE is handled above or uses index 0 (if valid)
    static const u8 k_MovePats[] = { 
        0, 0, // NONE
        PLAYER_POSE_MOVE_UP_1,          PLAYER_POSE_MOVE_UP_2,
        PLAYER_POSE_MOVE_UP_RIGHT_1,    PLAYER_POSE_MOVE_UP_RIGHT_2,
        PLAYER_POSE_MOVE_RIGHT_1,       PLAYER_POSE_MOVE_RIGHT_2,
        PLAYER_POSE_MOVE_DOWN_RIGHT_1,  PLAYER_POSE_MOVE_DOWN_RIGHT_2,
        PLAYER_POSE_MOVE_DOWN_1,        PLAYER_POSE_MOVE_DOWN_2,
        PLAYER_POSE_MOVE_DOWN_LEFT_1,   PLAYER_POSE_MOVE_DOWN_LEFT_2,
        PLAYER_POSE_MOVE_LEFT_1,        PLAYER_POSE_MOVE_LEFT_2,
        PLAYER_POSE_MOVE_UP_LEFT_1,     PLAYER_POSE_MOVE_UP_LEFT_2
    };

    return k_MovePats[dir * 2 + (pose ? 1 : 0)];
}
void SetPlayerTarget(u8 playerId){
	if(g_FieldScrollingActionInProgress!=NO_VALUE && g_MatchStatus!=MATCH_BEFORE_KICK_OFF){
		return;
	}
	switch(g_MatchStatus){
		case MATCH_BEFORE_KICK_OFF:
        {
            static const u8 k_KO_X[] = { 
                FIELD_POS_X_CENTER, 
                FIELD_POS_X_LEFT, FIELD_POS_X_RIGHT,
                FIELD_POS_X_LEFT+100, FIELD_POS_X_RIGHT-100, 
                FIELD_POS_X_LEFT, FIELD_POS_X_RIGHT 
            };
            static const u16 k_KO_Y_T1[] = {
                FIELD_POS_Y_TEAM1_GOALKEEPER,
                FIELD_POS_Y_TEAM1_DEFENDERS, FIELD_POS_Y_TEAM1_DEFENDERS,
                FIELD_POS_Y_TEAM1_HALFFIELDERS+40, FIELD_POS_Y_TEAM1_HALFFIELDERS+40,
                FIELD_POS_Y_TEAM1_HALFFIELDERS, FIELD_POS_Y_TEAM1_HALFFIELDERS
            };
            static const u16 k_KO_Y_T2[] = {
                FIELD_POS_Y_TEAM2_GOALKEEPER,
                FIELD_POS_Y_TEAM2_DEFENDERS, FIELD_POS_Y_TEAM2_DEFENDERS,
                FIELD_POS_Y_TEAM2_HALFFIELDERS-40, FIELD_POS_Y_TEAM2_HALFFIELDERS-40,
                FIELD_POS_Y_TEAM2_HALFFIELDERS, FIELD_POS_Y_TEAM2_HALFFIELDERS
            };

			if(g_Players[playerId].TeamId==REFEREE){
				// Position near center but slightly offset to avoid overlapping ball/players
				g_Players[playerId].TargetX=FIELD_POS_X_CENTER - 30; 
				g_Players[playerId].TargetY=FIELD_POS_Y_CENTER - 40; 
			}
			else{
                u8 role = g_Players[playerId].Role;
                if (role > 6) role = 0; // Safety
                
                bool isTeam1 = (g_Players[playerId].TeamId == TEAM_1);
                
                // Base coordinates from tables
                u16 tx = k_KO_X[role];
                u16 ty = isTeam1 ? k_KO_Y_T1[role] : k_KO_Y_T2[role];

                // Special handling for Team 2 X mirroring if needed
                if (!isTeam1 && role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
                     tx = FIELD_POS_X_RIGHT - 116; 
                }

                // Special handling for Kickoff taking team Halffielders
                if ((role == PLAYER_ROLE_LEFT_HALFFIELDER || role == PLAYER_ROLE_RIGHT_HALFFIELDER) &&
                    g_RestartKickTeamId == g_Players[playerId].TeamId) 
                {
                     ty = isTeam1 ? FIELD_POS_Y_CENTER : (FIELD_POS_Y_CENTER - 10);
                     if (role == PLAYER_ROLE_LEFT_HALFFIELDER) tx = FIELD_POS_X_CENTER - 7;
                     else tx = FIELD_POS_X_CENTER + 7;
                }

                g_Players[playerId].TargetX = tx;
                g_Players[playerId].TargetY = ty;
			}
        }
			break;
	}
}
void SetPlayerBallPossession(u8 playerId){
	if (playerId == NO_VALUE) {
		// Do NOT clear active player cursor when ball is loose/passed!
		// We want to retain control of the last player (or let auto-switch handle it).
		// g_Team1ActivePlayer=NO_VALUE;
		// g_Team2ActivePlayer=NO_VALUE;
		return;
	}

	if(g_Players[playerId].TeamId==TEAM_1){
		if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team1ActivePlayer=playerId;
	}
	else{
		if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) g_Team2ActivePlayer=playerId;
	}

	g_Ball.PossessionTimer = 0; // Reset hold timer
}

void TickGoalKick() {
    if (g_MatchStatus != MATCH_BEFORE_GOAL_KICK) return;
    
    // Identify GK
    u8 gkId = NO_VALUE;
    if (g_RestartKickTeamId == TEAM_1) gkId = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_GOALKEEPER);
    else gkId = GetPlayerIdByRole(TEAM_2, PLAYER_ROLE_GOALKEEPER);
    
    if (gkId == NO_VALUE) return; 

    // WAITING PHASE (1 Second) to show ball out of bounds
    if (g_Timer < 60) {
        g_Timer++;
        return;
    }
    g_Ball.Size = 1;
    // Phase 1: Setup (First Frame of Action)
    if (g_Timer == 60) {
        // Coords
        u16 targetX;
        if (g_GoalKickSide == CORNER_SIDE_LEFT) targetX = GK_BOX_X_MIN;
        else targetX = GK_BOX_X_MAX;
        
        u16 ballY;
        if (g_RestartKickTeamId == TEAM_1) { // Bottom Goal
             ballY = GK_BOX_Y_BOTTOM_MIN; 
        } else { // Top Goal
             ballY = GK_BOX_Y_TOP_MAX; 
        }
        
        // Place Ball
        g_Ball.X = targetX;
        g_Ball.Y = ballY;
        g_Ball.PossessionPlayerId = NO_VALUE;
        
        // Set GK Target to RUN START POSITION (Further away for run-up)
        u16 runStartY;
        if (g_RestartKickTeamId == TEAM_1) {
             runStartY = ballY + 32; 
             if(runStartY > FIELD_BOUND_Y_BOTTOM) runStartY = FIELD_BOUND_Y_BOTTOM;
        } else {
             runStartY = ballY - 32;
             if(runStartY < FIELD_BOUND_Y_TOP) runStartY = FIELD_BOUND_Y_TOP;
        }

        g_Players[gkId].TargetX = targetX;
        g_Players[gkId].TargetY = runStartY;
        g_Players[gkId].Status = PLAYER_STATUS_NONE; 
        
        if (g_RestartKickTeamId == TEAM_1) g_Players[gkId].Direction = DIRECTION_UP;
        else g_Players[gkId].Direction = DIRECTION_DOWN;

        if (g_RestartKickTeamId == TEAM_1) ShowFieldZone(FIELD_SOUTH_ZONE);
        else ShowFieldZone(FIELD_NORTH_ZONE);
        
        // Position other players (Tactical Movement)
        for(u8 i=0; i<14; i++){
             if(i == gkId) continue;
             if(g_Players[i].TeamId == REFEREE) continue;
             if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
             
             // Unlock status to allow movement
             g_Players[i].Status = PLAYER_STATUS_NONE;
             
             u16 targetY = g_Players[i].Y;
             u16 targetX = g_Players[i].X;
             
             if (g_RestartKickTeamId == TEAM_1) {
                  // TEAM 1 Kicking (Bottom -> Up)
                  if(g_Players[i].TeamId == TEAM_1) {
                        // Move Upfield
                        targetY = 300; // Midfielders
                        if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 200;
                        if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 350; // Defenders move out of box
                  } else { // Team 2 Defending
                       targetY = 250;
                       if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 320; // Pressing High (but not too close)
                       if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 150;
                  }
             } else {
                  // TEAM 2 Kicking (Top -> Down)
                  if(g_Players[i].TeamId == TEAM_2) {
                        // Move Downfield
                        targetY = 150; 
                        if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 250;
                        if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 120; // Defenders move out of box
                  } else { // Team 1 Defending
                       targetY = 200;
                       if (g_Players[i].Role == PLAYER_ROLE_LEFT_STRIKER || g_Players[i].Role == PLAYER_ROLE_RIGHT_STRIKER) targetY = 160; // Pressing High (but not too close)
                       if (g_Players[i].Role == PLAYER_ROLE_LEFT_DEFENDER || g_Players[i].Role == PLAYER_ROLE_RIGHT_DEFENDER) targetY = 300;
                  }
             }
             
             // Keep X inside field
             if (targetX < 30) targetX = 30;
             if (targetX > 220) targetX = 220;
             
             g_Players[i].TargetX = targetX;
             g_Players[i].TargetY = targetY;
        }
    }
    
    // Check Arrival
    i16 dx = (i16)g_Players[gkId].X - (i16)g_Players[gkId].TargetX;
    i16 dy = (i16)g_Players[gkId].Y - (i16)g_Players[gkId].TargetY;
    
    bool arrived = (dx >= -4 && dx <= 4 && dy >= -4 && dy <= 4);
    
    if (arrived) {
        g_Players[gkId].X = g_Players[gkId].TargetX;
        g_Players[gkId].Y = g_Players[gkId].TargetY;
        
        if (g_RestartKickTeamId == TEAM_1) g_Players[gkId].Direction = DIRECTION_UP;
        else g_Players[gkId].Direction = DIRECTION_DOWN;
        g_Players[gkId].PatternId = GetNoMovingPlayerPatternId(g_Players[gkId].Direction);
        g_Players[gkId].Status = PLAYER_STATUS_POSITIONED;

        // Run-up Logic
        u16 distY = (g_Players[gkId].Y > g_Ball.Y) ? (g_Players[gkId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[gkId].Y);
        
        if (distY > 16) {
             // At Start Position
             g_Timer++;
             if (g_Timer > 100) {
                 // Start Run
                 u16 kickY;
                 if (g_RestartKickTeamId == TEAM_1) kickY = g_Ball.Y + 6; 
                 else kickY = g_Ball.Y - 6;
                 
                 g_Players[gkId].TargetY = kickY;
                 g_Players[gkId].Status = PLAYER_STATUS_NONE;
             }
        } else {
             // At Kick Position
             g_Timer++;
             if (g_Timer > 110) {
                  ClearTextFromLayerA(10, 18, 9); 
                  GoalkeeperWithBall(g_RestartKickTeamId, true); 
                  g_GkRecoilY = 0;
             }
        }
    } else {
         // Moving
         if (g_Timer < 100) g_Timer = 61; // Hold at 61 while moving to start
         else g_Timer = 101; // Hold at 101 while moving to ball
    }
}

#if 0
void TickThrowIn() {
    if (g_MatchStatus != MATCH_BEFORE_THROW_IN) return;

    if (g_Timer == 0) {
        // 1. Determine Side and Positions
        u16 ballX = (g_Ball.X < FIELD_POS_X_CENTER) ? FIELD_BOUND_X_LEFT - 4 : FIELD_BOUND_X_RIGHT + 4;
        g_Ball.X = ballX;
        
        // Clamp Y
        if (g_Ball.Y < FIELD_BOUND_Y_TOP) g_Ball.Y = FIELD_BOUND_Y_TOP;
        if (g_Ball.Y > FIELD_BOUND_Y_BOTTOM) g_Ball.Y = FIELD_BOUND_Y_BOTTOM;
        
        g_Ball.PossessionPlayerId = NO_VALUE;

        // 2. Identify Thrower (Closest)
        u8 bestId = NO_VALUE;
        u16 minDist = 65535;
        for(u8 i=0; i<14; i++) {
             // Exclude GK from throw-ins usually
             if(g_Players[i].TeamId == g_RestartKickTeamId && g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) {
                  // Manhattan Distance approx
                  u16 dist = 0;
                  if(g_Players[i].X > g_Ball.X) dist += (g_Players[i].X - g_Ball.X); else dist += (g_Ball.X - g_Players[i].X);
                  if(g_Players[i].Y > g_Ball.Y) dist += (g_Players[i].Y - g_Ball.Y); else dist += (g_Ball.Y - g_Players[i].Y);

                  if(dist < minDist) { minDist = dist; bestId = i; }
             }
        }
        g_ThrowInPlayerId = bestId;
        
        // 3. Set Targets
        if (g_ThrowInPlayerId != NO_VALUE) {
            // Thrower -> Ball
            g_Players[g_ThrowInPlayerId].TargetX = g_Ball.X;
            g_Players[g_ThrowInPlayerId].TargetY = g_Ball.Y;
            g_Players[g_ThrowInPlayerId].Status = PLAYER_STATUS_NONE;
            
            // Face the pitch
            if (g_Ball.X < FIELD_POS_X_CENTER) g_Players[g_ThrowInPlayerId].Direction = DIRECTION_RIGHT;
            else g_Players[g_ThrowInPlayerId].Direction = DIRECTION_LEFT;
        }
        
        // Others
        u8 teamMatesNear = 0;
        u8 opponentsNear = 0;
        
        // Pre-calculate zone center for crowding (approx 40px inside from ball)
        u16 crowdX = (ballX < FIELD_POS_X_CENTER) ? ballX + 40 : ballX - 40;
        u16 crowdY = g_Ball.Y;
        
        for(u8 i=0; i<14; i++) {
             if(i == g_ThrowInPlayerId || g_Players[i].Role == PLAYER_ROLE_GOALKEEPER || g_Players[i].TeamId == REFEREE) continue;
             
             g_Players[i].Status = PLAYER_STATUS_NONE;
             
             u16 targetX, targetY;
             u16 dist = 0;
             if(g_Players[i].X > g_Ball.X) dist += (g_Players[i].X - g_Ball.X); else dist += (g_Ball.X - g_Players[i].X);
             if(g_Players[i].Y > g_Ball.Y) dist += (g_Players[i].Y - g_Ball.Y); else dist += (g_Ball.Y - g_Players[i].Y);
             
             if (g_Players[i].TeamId == g_RestartKickTeamId) {
                  // Teammate
                  // Find 2 who are closest (excluding thrower) to be support
                  // Simple heuristic: just the first 2 we find in the loop? 
                  // Better: We should check distance, but for now let's just grab the first 2 valid ones or base on Role.
                  // Or, if distance < 100, move them closer.
                  
                  if (dist < 120 && teamMatesNear < 2) { 
                       // Force these 2 to be close support
                       targetX = crowdX + (teamMatesNear * 15) - 7;
                       targetY = crowdY + (teamMatesNear * 30) - 15;
                       teamMatesNear++;
                  } else {
                       // Maintain X but align Y towards ball slightly
                       targetX = g_Players[i].X; 
                       // Shift Y towards Ball Y to compress formation
                       if (g_Players[i].Y < g_Ball.Y) targetY = g_Players[i].Y + 20;
                       else targetY = g_Players[i].Y - 20;
                  }
             } else {
                  // Opponent
                  if (dist < 120 && opponentsNear < 2) {
                       // Force 2 to mark
                       targetX = crowdX + (opponentsNear * 15); 
                       targetY = crowdY + (opponentsNear * 30) - 15; 
                       opponentsNear++;
                  } else {
                       targetX = g_Players[i].X;
                        // Shift Y towards Ball Y
                       if (g_Players[i].Y < g_Ball.Y) targetY = g_Players[i].Y + 20;
                       else targetY = g_Players[i].Y - 20;
                  }
             }
             
             // Clamp inside Field
             if(targetX < 30) targetX = 30; if(targetX > 215) targetX = 215;
             if(targetY < FIELD_BOUND_Y_TOP) targetY = FIELD_BOUND_Y_TOP; 
             if(targetY > FIELD_BOUND_Y_BOTTOM) targetY = FIELD_BOUND_Y_BOTTOM;
             
             g_Players[i].TargetX = targetX;
             g_Players[i].TargetY = targetY;
        }

        // Show Zone
        if (g_Ball.Y < 140) ShowFieldZone(FIELD_NORTH_ZONE);
        else if (g_Ball.Y > 280) ShowFieldZone(FIELD_SOUTH_ZONE);
        else ShowFieldZone(FIELD_CENTRAL_ZONE);
    }
    
    // Check Thrower Arrival
    if (g_ThrowInPlayerId != NO_VALUE) {
        i16 dx = (i16)g_Players[g_ThrowInPlayerId].X - (i16)g_Players[g_ThrowInPlayerId].TargetX;
        i16 dy = (i16)g_Players[g_ThrowInPlayerId].Y - (i16)g_Players[g_ThrowInPlayerId].TargetY;
        
        if (dx >= -4 && dx <= 4 && dy >= -4 && dy <= 4) {
             g_Players[g_ThrowInPlayerId].X = g_Players[g_ThrowInPlayerId].TargetX;
             g_Players[g_ThrowInPlayerId].Y = g_Players[g_ThrowInPlayerId].TargetY;
             g_Players[g_ThrowInPlayerId].PatternId = GetNoMovingPlayerPatternId(g_Players[g_ThrowInPlayerId].Direction);
             g_Players[g_ThrowInPlayerId].Status = PLAYER_STATUS_POSITIONED;

             g_Timer++;
             if (g_Timer > 60) {
                  // Ready
                  ClearTextFromLayerA(10, 18, 9);
                  g_MatchStatus = MATCH_IN_ACTION;
                  SetPlayerBallPossession(g_ThrowInPlayerId); 
                  PutBallOnPlayerFeet(g_ThrowInPlayerId);
             }
        } else {
            g_Timer = 1; 
        }
    }
}

#endif
void TickCornerKick() {
    if (g_MatchStatus != MATCH_BEFORE_CORNER_KICK) return;

    static u16 s_ForceKickTimer = 0;
    if (g_Timer == 0) s_ForceKickTimer = 0;

    // -------------------------------------------------------------------------
    // 1. DETERMINE KICKER ID (Centralized)
    // -------------------------------------------------------------------------
    u8 kickerId = NO_VALUE;
    if (g_Ball.PossessionPlayerId != NO_VALUE) {
        kickerId = g_Ball.PossessionPlayerId;
    } else {
        if (g_CornerKickSide == CORNER_SIDE_LEFT) kickerId = GetPlayerIdByRole(g_RestartKickTeamId, PLAYER_ROLE_LEFT_STRIKER);
        else kickerId = GetPlayerIdByRole(g_RestartKickTeamId, PLAYER_ROLE_RIGHT_STRIKER);
    }
    
    // Safety check: if Kicker is still NO_VALUE (shouldn't happen), try closest to corner
    if (kickerId == NO_VALUE) {
         kickerId = GetClosestPlayerToBall(g_RestartKickTeamId, NO_VALUE);
    }

    // -------------------------------------------------------------------------
    // 2. SETUP PHASE (0-3 Seconds: Position Players)
    // -------------------------------------------------------------------------
    
    // Check arrival (Kicker)
    bool kickerArrived = false;
    if (kickerId != NO_VALUE) {
         i16 dx = (i16)g_Players[kickerId].X - (i16)g_Players[kickerId].TargetX;
         i16 dy = (i16)g_Players[kickerId].Y - (i16)g_Players[kickerId].TargetY;
         
         if (dx >= -2 && dx <= 2 && dy >= -2 && dy <= 2) {
             kickerArrived = true;
             g_Players[kickerId].X = g_Players[kickerId].TargetX;
             g_Players[kickerId].Y = g_Players[kickerId].TargetY;
             g_Players[kickerId].Status = PLAYER_STATUS_POSITIONED;
             
             if (g_Ball.PossessionPlayerId != kickerId) {
                 SetPlayerBallPossession(kickerId);
                 g_Ball.PossessionPlayerId = kickerId;
                 PutBallOnPlayerFeet(kickerId);
             }
         }
    }
    
    // Check arrival (Teammates)
    bool teammatesArrived = true;
    for(u8 i=0; i<14; i++) {
        if (g_Players[i].TeamId == g_RestartKickTeamId && i != kickerId && g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) {
             // If not positioned, check distance
             if (g_Players[i].Status != PLAYER_STATUS_POSITIONED) {
                 i16 dx = (i16)g_Players[i].X - (i16)g_Players[i].TargetX;
                 i16 dy = (i16)g_Players[i].Y - (i16)g_Players[i].TargetY;
                 if (dx < -6 || dx > 6 || dy < -6 || dy > 6) {
                     teammatesArrived = false; // Someone is still far away
                 } else {
                     // Force arrival if close
                     g_Players[i].X = g_Players[i].TargetX;
                     g_Players[i].Y = g_Players[i].TargetY;
                     g_Players[i].Status = PLAYER_STATUS_POSITIONED;
                 }
             }
        }
    }

    // Wait until timer finishes AND everyone has arrived
    if (g_Timer < 180 || (kickerId != NO_VALUE && !kickerArrived) || !teammatesArrived) {
        if (g_Timer < 180) g_Timer++;
        
        // ORIENTATION UPDATE
        for(u8 i=0; i<14; i++) {
             // Skip if player is not positioned (running to spot) - except kicker (handled above)
             if (i != kickerId && g_Players[i].Status != PLAYER_STATUS_POSITIONED && 
                 !(g_Players[i].X == g_Players[i].TargetX && g_Players[i].Y == g_Players[i].TargetY)) continue;
             
             u8 lookDir = DIRECTION_NONE;
             
             if (i == kickerId) {
                  // Kicker: Face Pitch
                  if (g_RestartKickTeamId == TEAM_1) lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_DOWN_RIGHT : DIRECTION_DOWN_LEFT;
                  else lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_UP_RIGHT : DIRECTION_UP_LEFT;
             }
             else if (g_Players[i].TeamId == g_RestartKickTeamId) {
                  // Attackers: Face Goal or Corner
                  if (g_RestartKickTeamId == TEAM_1 && i != kickerId) { 
                      // Team 1 Receivers: Face Corner
                      lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_UP_LEFT : DIRECTION_UP_RIGHT;
                  } else {
                      // Others: Face Goal
                      lookDir = (g_RestartKickTeamId == TEAM_1) ? DIRECTION_UP : DIRECTION_DOWN;
                  }
             } else {
                  // Defenders: Face Ball
                  i16 dx = (i16)g_Ball.X - (i16)g_Players[i].X;
                  i16 dy = (i16)g_Ball.Y - (i16)g_Players[i].Y;
                  // Simple logic
                  if (dy < -20) lookDir = (dx > 20) ? DIRECTION_UP_RIGHT : ((dx < -20) ? DIRECTION_UP_LEFT : DIRECTION_UP);
                  else if (dy > 20) lookDir = (dx > 20) ? DIRECTION_DOWN_RIGHT : ((dx < -20) ? DIRECTION_DOWN_LEFT : DIRECTION_DOWN);
                  else lookDir = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
             }
             
             if (lookDir != DIRECTION_NONE) {
                  g_Players[i].Direction = lookDir;
                  g_Players[i].PatternId = GetNoMovingPlayerPatternId(lookDir);
             }
        }
        return; // END SETUP PHASE
    }

    // Move Text Clearing to here: When actually starting the action
    ClearTextFromLayerA(10, 12, 11);

    // -------------------------------------------------------------------------
    // 3. ACTION PHASE (Movement/Kick)
    // -------------------------------------------------------------------------
    
    // Safety Force Kicker Position (Again)
    if (kickerId != NO_VALUE) {
         g_Players[kickerId].X = g_Players[kickerId].TargetX;
         g_Players[kickerId].Y = g_Players[kickerId].TargetY;
    }
    
    bool isHuman = (g_RestartKickTeamId == TEAM_1 || (g_GameWith2Players && g_RestartKickTeamId == TEAM_2));
    
    // Timeout Logic (4 seconds = 240 frames)
    if (isHuman) s_ForceKickTimer++;

    if (isHuman) {
        if (g_RestartKickTeamId == TEAM_1) {
            // --- TEAM 1 HUMAN (North) ---
            u8 candLeft = NO_VALUE;
            u8 candRight = NO_VALUE;
            
            for(u8 c=0; c<14; c++) {
                 if (g_Players[c].TeamId == TEAM_1 && c != kickerId && g_Players[c].Role != PLAYER_ROLE_GOALKEEPER) {
                      u8 tx = g_Players[c].TargetX;
                      // Widened ranges to ensure we catch the players even if they are slightly off
                      if (tx >= 40 && tx <= 110) candLeft = c;
                      if (tx >= 130 && tx <= 220) candRight = c;
                 }
            }
            if (candLeft == NO_VALUE) candLeft = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_LEFT_HALFFIELDER);
            if (candRight == NO_VALUE) candRight = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_RIGHT_HALFFIELDER);

            // Default
            if (g_CornerKickTargetId == NO_VALUE) {
                 if (candLeft != NO_VALUE) g_CornerKickTargetId = candLeft;
                 else if (candRight != NO_VALUE) g_CornerKickTargetId = candRight; 
            }
            
            // Input
            u8 joyDir = GetJoystick1Direction();
            static bool joyMoved = false;
            
            if (joyDir == DIRECTION_LEFT && !joyMoved && candLeft != NO_VALUE) {
                g_CornerKickTargetId = candLeft; joyMoved = true;
            } else if (joyDir == DIRECTION_RIGHT && !joyMoved && candRight != NO_VALUE) {
                g_CornerKickTargetId = candRight; joyMoved = true;
            } else if (joyDir == DIRECTION_NONE) {
                joyMoved = false;
            }
            
            // Correction removed to avoid instability. We trust the selection.
            
            // --- KICKER LOCK RE-ENFORCE ---
            // Re-apply kicker lock here to prevent Input from rotating him
            if (kickerId != NO_VALUE) {
                u8 kDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_DOWN_RIGHT : DIRECTION_DOWN_LEFT;
                g_Players[kickerId].Direction = kDir;
                g_Players[kickerId].PatternId = GetNoMovingPlayerPatternId(kDir);
                g_Players[kickerId].X = g_Players[kickerId].TargetX;
                g_Players[kickerId].Y = g_Players[kickerId].TargetY;
                // Override status so MovePlayer might skip him if he has ball
                g_Players[kickerId].Status = PLAYER_STATUS_POSITIONED; 
            }

            // Trigger
            bool t1Trigger = IsTeamJoystickTriggerPressed(TEAM_1);
            static bool t1Latched = false;
            if (g_Timer == 180) t1Latched = true;
            if (!t1Trigger) t1Latched = false;
            
            // Highlight
            if (g_CornerKickTargetId != NO_VALUE) {
                g_Ball.PassTargetPlayerId = g_CornerKickTargetId;
                g_PassTargetPlayer = g_CornerKickTargetId;
            }

            if ((t1Trigger && !t1Latched || s_ForceKickTimer > 240) && g_CornerKickTargetId != NO_VALUE) {
                PerformPass(g_CornerKickTargetId);
                g_MatchStatus = MATCH_IN_ACTION;
                g_CornerKickTargetId = NO_VALUE;
            }
        } 
        else {
            // --- TEAM 2 HUMAN (South - 2 Player) ---
            u8 joyDir = GetJoystick2Direction();
            bool trigger = IsTeamJoystickTriggerPressed(TEAM_2);
            static bool joyMoved = false;

            if (g_CornerKickTargetId == NO_VALUE) g_CornerKickTargetId = GetPlayerIdByRole(TEAM_2, PLAYER_ROLE_LEFT_STRIKER);
             
            if ((joyDir == DIRECTION_LEFT || joyDir == DIRECTION_RIGHT) && !joyMoved) {
                u8 curr = g_CornerKickTargetId;
                u8 loop = 0;
                do {
                    curr = (joyDir==DIRECTION_RIGHT) ? curr+1 : curr-1;
                    if (curr > 13) curr = 0;
                    if (g_Players[curr].TeamId == TEAM_2 && g_Players[curr].Role != PLAYER_ROLE_GOALKEEPER && curr != kickerId) {
                        g_CornerKickTargetId = curr; break;
                    }
                    loop++;
                } while (loop < 15);
                joyMoved = true;
            } else if (joyDir == DIRECTION_NONE) joyMoved = false;

            if (g_CornerKickTargetId != NO_VALUE) {
                g_Ball.PassTargetPlayerId = g_CornerKickTargetId;
                g_PassTargetPlayer = g_CornerKickTargetId;
            }

            if ((trigger || s_ForceKickTimer > 240) && g_CornerKickTargetId != NO_VALUE) {
                PerformPass(g_CornerKickTargetId);
                g_MatchStatus = MATCH_IN_ACTION;
                g_CornerKickTargetId = NO_VALUE;
            }
        }
    } 
    else {
        // --- CPU LOGIC (Team 2 Standard) ---
        if (g_CornerKickTargetId == NO_VALUE) {
             u8 randomRole = ((g_Timer & 1) == 0) ? PLAYER_ROLE_LEFT_STRIKER : PLAYER_ROLE_RIGHT_STRIKER;
             u8 strikerId = GetPlayerIdByRole(g_RestartKickTeamId, randomRole);
             
             // Ensure we don't pick kicker or invalid
             if (strikerId != NO_VALUE && strikerId != kickerId) {
                 g_CornerKickTargetId = strikerId;
             } else {
                 g_CornerKickTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, kickerId);
             }
        }
        
        if (g_Timer > 200) {
             if (g_CornerKickTargetId == NO_VALUE) g_CornerKickTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, kickerId);
             
             PerformPass(g_CornerKickTargetId);
             g_MatchStatus = MATCH_IN_ACTION; 
             g_CornerKickTargetId = NO_VALUE;
        } else {
            g_Timer++;
        }
    }
}