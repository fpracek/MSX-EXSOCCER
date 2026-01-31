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
extern const unsigned char 	g_GameFieldLayerBTiles_part5[16384]; // Bank 1 = Segment 11
extern const unsigned char 	g_GameFieldLayerATiles[16384]; // Bank 1 = Segment 8
extern const unsigned char 	g_Sprites1[16384]; // Bank 1 = Segment 9
extern const unsigned char 	g_Sprites2[16384]; // Bank 1 = Segment 10
extern const unsigned char  g_Presentation_palette[];
extern const unsigned char  g_Teams_part1[16384];
extern const unsigned char  g_Teams_part2[4096];

// VARIABLES
char                g_History1[20] = "PLY:      ";
char                g_History2[20] = "CPU:      ";
u16 		        g_FrameCounter;
int  		        g_FieldCurrentYPosition=0;
u8   		        g_FieldScrollingActionInProgress;
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
bool                g_GkIsGroundKick = false;           // Bank 1 = Segment 0
const TeamStats g_TeamStats[] = {
    { 3, 12, 5, 5, 14 }, // AUS (Standard)
    { 4, 12, 8, 7, 14 }, // BRA (Fast, Shoot+, Pass+)
    { 3, 16, 4, 5, 16 }, // ITA (Aggressive+, GK+)
    { 3, 12, 6, 8, 14 }, // FRA (Pass++)
    { 3, 15, 6, 5, 14 }, // GBR (Aggressive+)
    { 4, 14, 7, 6, 15 }  // GER (Fast, Strong)
};



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
    SET_BANK_SEGMENT(2, 16); 
	V9_WriteVRAM(V9_P1_PGT_A + 8192L, g_Teams_part1, sizeof(g_Teams_part1));
    SET_BANK_SEGMENT(2, 17); 
	V9_WriteVRAM(V9_P1_PGT_A + 8192L + 16384L, g_Teams_part2, sizeof(g_Teams_part2));
	// Pattern name table
	V9_FillVRAM16(V9_P1_PNT_A, 0x0000, 64*64); // Init layer A
	SET_BANK_SEGMENT(2, 1);
	// draw layer A

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
	SET_BANK_SEGMENT(2, 11); 
	V9_WriteVRAM(V9_P1_PGT_B + 16384L*4, g_GameFieldLayerBTiles_part5, sizeof(g_GameFieldLayerBTiles_part5)); // Load tiles (part 4)
	SET_BANK_SEGMENT(2, 1); 
	// V9_FillVRAM16(V9_P1_PNT_B, 0x0000, 64*64); // REDUNDANT: Overwritten below

}
void ShowField(){
    u16 tileId=0;

    for (u8 y=0;y<64;y++){
		for (u8 x=0;x<32;x++){
			V9_PutLayerBTileAtPos(x,y,tileId++);
		}
	}
    
    for (u8 y=0;y<64;y++){
		for (u8 x=0;x<32;x++){
			V9_PutLayerATileAtPos(x,y,0);
		}
	}
    for (u8 x=0;x<64;x++){
		V9_PutLayerATileAtPos(x,0,32);
	}
}
void PeopleMoving(bool isBasicMoving){
    u16 tileId=PUBLIC_TILE_1;
    u8  yPosition=0;
    if(!g_ActiveFieldZone==FIELD_NORTH_ZONE){
        yPosition=62;
    }


    if(!isBasicMoving){
        tileId=PUBLIC_TILE_2;
    }
    for (u8 y=yPosition;y<yPosition+2;y++){
		for (u8 x=0;x<32;x++){
			V9_PutLayerBTileAtPos(x,y,tileId);
		}
	}
}
//-----------------------------------------------------------------------------
void V9_InterruptHBlank(){

}
void V9_InterruptVBlank(){
    if(g_MatchStatus==MATCH_PRESENTATION){
        g_Timer++;
        return;
    }

	
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
// V9990 Command end interrupt
void V9_InterruptCommand()
{
	
}

//-----------------------------------------------------------------------------
void GameStart(){
    
    g_PassTargetPlayer=NO_VALUE;
    g_Team1ActivePlayer=NO_VALUE;
	g_FioBre=false;
	V9_SetDisplayEnable(FALSE);
    g_SecondsToEndOfMatch=MATCH_DURATION;
	g_RestartKickTeamId=TEAM_1;
	g_FieldScrollSpeed=FIELD_SCROLL_PRESENTATION_SPEED;
	g_FieldScrollingActionInProgress=NO_VALUE;
	g_FieldCurrentYPosition=FIELD_TOP_Y;
	g_Team1Score=1;
	g_Team2Score=0;
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
    V9_SetInterrupt(V9_INT_NONE);
    LoadPresentation();
  


    InitPalette();
	V9_SetScreenMode(V9_MODE_P1);
	
	
	V9_SetBackgroundColor(1);
    V9_SetDisplayEnable(FALSE);
	//V9_SetSpriteEnable(TRUE);



	
	
	LoadP1LayerA();
	
    ShowMenu();


}
void TickShotCursor() {
    // 1. Update Position
    g_ShotCursorX += g_ShotCursorDir;
    if (g_ShotCursorX < (GOAL_X_MIN - 30)) {
        g_ShotCursorX = (GOAL_X_MIN - 30);
        g_ShotCursorDir = -g_ShotCursorDir;
    }
    if (g_ShotCursorX > (GOAL_X_MAX + 30)) {
        g_ShotCursorX = (GOAL_X_MAX + 30);
        g_ShotCursorDir = -g_ShotCursorDir;
    }

    // 2. Draw Sprite
    bool show = false;
    if (g_MatchStatus == MATCH_IN_ACTION && g_ActiveFieldZone == FIELD_NORTH_ZONE) {
        if (g_Ball.PossessionPlayerId != NO_VALUE) {
            if (g_Players[g_Ball.PossessionPlayerId].TeamId == TEAM_1) {
                show = true;
            }
        }
    }

    struct V9_Sprite attr;
    if (show) {
        // Calculate Screen Y
        int screenY = (FIELD_BOUND_Y_TOP - 30) - g_FieldCurrentYPosition;
        
        // Hide if scrolled off
        if (screenY < -16 || screenY > 212) {
             attr.Y = 216; 
        } else {
             attr.Y = (u8)screenY;
        }
        
        attr.X = (u8)g_ShotCursorX;
        attr.Pattern = SPRITE_DOWN_ARROW;
        attr.P = 1; 
        attr.SC = 0; 
        
        V9_SetSpriteP1(16, &attr);
    } else {
        // Hide
        attr.Y = 216;
        V9_SetSpriteP1(16, &attr);
    }
}
//-----------------------------------------------------------------------------
// Load sprites
void LoadSprites(){
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
    

	//GameStart();
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
                    SET_BANK_SEGMENT(2,22);
					TickAI(REFEREE);
					TickAI(TickAiPlayerId);
                    SET_BANK_SEGMENT(2,1);
					TickAiPlayerId++;
					if(TickAiPlayerId==14){ // Only iterate 0-13 (Players)
						TickAiPlayerId=0;
					}
					
					// PRIORITY: Always run AI for Ball Carrier every cycle (if CPU)
					if (g_Ball.PossessionPlayerId != NO_VALUE && g_Ball.PossessionPlayerId < 14) {
						// Don't run twice if we just ran it in the loop
						if (g_Ball.PossessionPlayerId != TickAiPlayerId) {
                            SET_BANK_SEGMENT(2,22);
							TickAI(g_Ball.PossessionPlayerId);
                            SET_BANK_SEGMENT(2,1);
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
const TeamStats* GetTeamStats(u8 teamId) {
    if (teamId > 5) return &g_TeamStats[0];
    return &g_TeamStats[teamId];
}
bool IsOffside(u8 playerId) {
    u8 teamId = g_Players[playerId].TeamId;
    u16 playerY = g_Players[playerId].Y;
    u8 opponentCount = 0;
    u8 i;

    // 1. Halfway Line Check
    if (teamId == TEAM_1) {
        if (playerY >= FIELD_POS_Y_CENTER) return FALSE; // Own half
    } else {
        if (playerY <= FIELD_POS_Y_CENTER) return FALSE; // Own half
    }

    // 2. Ball Position Check (Nearer to goal than ball?)
    // Team 1 attacks UP (Small Y). Nearer means Y < Ball.Y
    if (teamId == TEAM_1) {
        if (playerY >= g_Ball.Y) return FALSE; 
    } else {
        if (playerY <= g_Ball.Y) return FALSE;
    }

    // 3. Second Last Opponent Check
    for (i = 0; i < 14; i++) {
        if (g_Players[i].TeamId == teamId) continue;
        
        // Check if opponent is nearer/equal to goal line than player
        if (teamId == TEAM_1) { // Attacking UP
             if (g_Players[i].Y <= playerY) opponentCount++;
        } else { // Attacking DOWN
             if (g_Players[i].Y >= playerY) opponentCount++;
        }
    }

    if (opponentCount < 2) return TRUE;
    return FALSE;
}
void PerformPass(u8 toPlayerId) {
	
	u8 fromId = g_Ball.PossessionPlayerId;
    i16 dx, dy, adx, ady; 
    u8 newDir;

    if (fromId == NO_VALUE) return;
    if (toPlayerId == NO_VALUE) return;

    // Prevent passing TO Goalkeeper
    if (g_Players[toPlayerId].Role == PLAYER_ROLE_GOALKEEPER) return;

    // OFFSIDE CHECK (Prevent Pass)
    // Ignore offside if passer is Goalkeeper
    if (g_Players[fromId].Role != PLAYER_ROLE_GOALKEEPER) {
        if (IsOffside(toPlayerId)) {
            // Prevent pass to offside player
            return;
        }
    }
    
    // TURN PLAYER TOWARDS TARGET
    dx = (i16)g_Players[toPlayerId].X - (i16)g_Players[fromId].X;
    dy = (i16)g_Players[toPlayerId].Y - (i16)g_Players[fromId].Y;
    adx = (dx < 0) ? -dx : dx;
    ady = (dy < 0) ? -dy : dy;

    if (adx > ady * 2) {
        newDir = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
    } else if (ady > adx * 2) {
        newDir = (dy > 0) ? DIRECTION_DOWN : DIRECTION_UP;
    } else {
        if (dx > 0) newDir = (dy > 0) ? DIRECTION_DOWN_RIGHT : DIRECTION_UP_RIGHT;
        else newDir = (dy > 0) ? DIRECTION_DOWN_LEFT : DIRECTION_UP_LEFT;
    }
    g_Players[fromId].Direction = newDir;

	// Set Shot Pose
	if (newDir == DIRECTION_UP || newDir == DIRECTION_UP_LEFT || newDir == DIRECTION_UP_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_FRONT;
	else if (newDir == DIRECTION_DOWN || newDir == DIRECTION_DOWN_LEFT || newDir == DIRECTION_DOWN_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_BACK;
	else if (newDir == DIRECTION_LEFT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_LEFT;
	else if (newDir == DIRECTION_RIGHT) g_Players[fromId].PatternId = PLAYER_POSE_SHOT_RIGHT;

    g_Players[fromId].Status = PLAYER_STATUS_POSITIONED; // Lock pose for this frame
    
    // Stop Player Movement (to preserve pose)
    g_Players[fromId].TargetX = g_Players[fromId].X;
    g_Players[fromId].TargetY = g_Players[fromId].Y;

    // Setup Ball for Pass
	SetPlayerBallPossession(NO_VALUE); 
    g_Ball.PossessionPlayerId = NO_VALUE; 
    
	g_Ball.PassTargetPlayerId = toPlayerId;
	g_Ball.ShotActive = 0; // Not a shot

    // GK Pass Fix: Offset ball start to avoid immediate self-collision
    if (g_Players[fromId].Role == PLAYER_ROLE_GOALKEEPER) {
   

        bool applyOffset = true;
        // Disable offset for Goal Kicks / Steals (Ground kicks where RecoilY is 0)
        if (g_GkIsGroundKick) {
            applyOffset = false;
            
            // FORCE RESET BALL POSITION for ground kicks to prevent "dribble" offsets
            // This ensures the ball starts exactly where the GK is holding it (or at feet)
            // without the 30px jump, and without any left/right shift from previous frames.
            // We use the current ball position which is already aligned by PutBallOnPlayerFeet.
            g_Ball.X = g_Ball.X; 
            g_Ball.Y = g_Ball.Y;
        }
        
        // Explicit User Request: Disable offset for Corner/Goal Kicks setup phases
        if (g_MatchStatus == MATCH_CORNER_KICK || g_MatchStatus == MATCH_BEFORE_CORNER_KICK ||
            g_MatchStatus == MATCH_GOAL_KICK || g_MatchStatus == MATCH_BEFORE_GOAL_KICK) {
             applyOffset = false;
        }

       

        if (applyOffset) {
            i8 offX = 0; i8 offY = 0;
            switch (newDir) {
                case DIRECTION_UP:        offY = -30; break;
                case DIRECTION_DOWN:      offY = 30; break;
                case DIRECTION_LEFT:      offX = -30; break;
                case DIRECTION_RIGHT:     offX = 30; break;
                case DIRECTION_UP_LEFT:   offX = -21; offY = -21; break;
                case DIRECTION_UP_RIGHT:  offX = 21; offY = -21; break;
                case DIRECTION_DOWN_LEFT: offX = -21; offY = 21; break;
                case DIRECTION_DOWN_RIGHT:offX = 21; offY = 21; break;
            }
            g_Ball.X += offX;
            g_Ball.Y += offY;

        }
      
    }

    g_Ball.PassStartX = g_Ball.X;
    g_Ball.PassStartY = g_Ball.Y;
    
    dx = (i16)g_Players[toPlayerId].X - (i16)g_Ball.X;
    dy = (i16)g_Players[toPlayerId].Y - (i16)g_Ball.Y;
    g_Ball.PassTotalDist = (u16)((dx<0?-dx:dx) + (dy<0?-dy:dy)); 
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


