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
u16 		g_FrameCounter;
int  		g_FieldCurrentYPosition=0;
u8   		g_FieldScrollingActionInProgress=0;
u8      	g_Team1PaletteId;
u8      	g_Team2PaletteId;
u8      	g_Team1Score;
u8      	g_Team2Score;
PlayerInfo  g_Players[15];
BallInfo    g_Ball;
u8          g_PlayersPositioningPhaseCount=NO_VALUE;
u8          g_MatchStatus=MATCH_NOT_STARTED;
u8 			g_FieldScrollSpeed=FIELD_SCROLL_PRESENTATION_SPEED;
u8          g_ActiveFieldZone;
u8          g_RestartKickTeamId;
u8          g_SecondsToEndOfMatch;
u8          g_Timer=NO_VALUE;
u8          g_Team1ActivePlayer=NO_VALUE;
u8          g_Team2ActivePlayer=NO_VALUE;
u8          g_PassTargetPlayer=NO_VALUE;
bool		g_GameWith2Players=false;
u8          g_GameLevel=1;
u8          g_ActionCooldown=0; // Debounce for steal/pass
u16         g_ShotCursorX = 120;
i8          g_ShotCursorDir = 4;
bool        g_FioBre=false;
u8          g_GoalScorerId = NO_VALUE;
bool 		g_VSynch = FALSE;


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
	for (u8 y=1;y<64;y++){
		for (u8 x=0;x<64;x++){
			V9_PutLayerATileAtPos(x,y,0);
		}
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
	V9_FillVRAM16(V9_P1_PNT_B, 0x0000, 64*64); // Init layer
	u16 tileId=0;
	for (u8 y=0;y<64;y++){
		for (u8 x=0;x<32;x++){
			V9_PutLayerBTileAtPos(x,y,tileId);
			tileId++;
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

	for(u8 i=0;i<14;i++){
		g_Players[i].AiTickCounter=0;
		switch(i){
			case 0:
			case 7:
				g_Players[i].Role=PLAYER_ROLE_GOALKEEPER;
				break;
			case 1:
			case 8:
				g_Players[i].Role=PLAYER_ROLE_LEFT_DEFENDER;
				break;
			case 4:
			case 11:
				g_Players[i].Role=PLAYER_ROLE_RIGHT_DEFENDER;
				break;
			case 3:
			case 10:
				g_Players[i].Role=PLAYER_ROLE_LEFT_HALFFIELDER;
				break;
			case 2:
			case 9:
				g_Players[i].Role=PLAYER_ROLE_RIGHT_HALFFIELDER;
				break;
			case 5:
			case 12:
				g_Players[i].Role=PLAYER_ROLE_LEFT_STRIKER;
				break;
			case 6:
			case 13:
				g_Players[i].Role=PLAYER_ROLE_RIGHT_STRIKER;
				break;
		}
		
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

	if(g_ActiveFieldZone==FIELD_CENTRAL_ZONE){
		if(g_Ball.Y<170){
			ShowFieldZone(FIELD_NORTH_ZONE);
		}
		if(g_Ball.Y>320){
			ShowFieldZone(FIELD_SOUTH_ZONE);
		}
	}
	else{
		if(g_ActiveFieldZone==FIELD_NORTH_ZONE){
			if(g_Ball.Y>190){
				ShowFieldZone(FIELD_CENTRAL_ZONE);
			}
		}
		else{
			if(g_Ball.Y<300){
				ShowFieldZone(FIELD_CENTRAL_ZONE);
			}
		}
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
    u16 limitY;

    if (attackingTeamId == TEAM_1) {
        // Find 2nd smallest Y in Team 2 (Defenders)
        u16 min1 = 0xFFFF;
        u16 min2 = 0xFFFF;
        
        for(u8 i=0; i<14; i++){
            if(g_Players[i].TeamId != defendingTeamId) continue;
            if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
            
            if (g_Players[i].Y < min1) {
                min2 = min1;
                min1 = g_Players[i].Y;
            } else if (g_Players[i].Y < min2) {
                min2 = g_Players[i].Y;
            }
        }
        if (min2 == 0xFFFF) return FIELD_BOUND_Y_TOP; 
        limitY = min2;
        
    } else {
        // Find 2nd largest Y in Team 1 (Defenders)
        u16 max1 = 0;
        u16 max2 = 0;
         for(u8 i=0; i<14; i++){
            if(g_Players[i].TeamId != defendingTeamId) continue;
            if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
            
            if (g_Players[i].Y > max1) {
                max2 = max1;
                max1 = g_Players[i].Y;
            } else if (g_Players[i].Y > max2) {
                max2 = g_Players[i].Y;
            }
        }
        if (max2 == 0) return FIELD_BOUND_Y_BOTTOM;
        limitY = max2;
    }
    return limitY;
}
void BallInGoal(u8 teamScored){
	// Placeholder for Goal Logic
	V9_PrintLayerAStringAtPos(12,18,"IN  GOAL");

    g_GoalScorerId = g_Ball.PossessionPlayerId;
    if(g_GoalScorerId==NO_VALUE){
        for(u8 i=0;i<14;i++){
            if(g_Players[i].TeamId==teamScored){
                if(g_Ball.LastTouchTeamId==teamScored ){
                    // Just a heuristic: last known possession or closest
                    g_GoalScorerId=i; // This assumes index is consistent; probably player 0 or 7 (GK) shouldn't score often.
                    break;
                }
            }
        }
    }
    // If still no value, try logic based on team.
    if(g_GoalScorerId == NO_VALUE && g_Ball.LastTouchTeamId != NO_VALUE){
         // If we don't know the player, we can't animate the scorer.
    }
    // Better heuristic: if possession is NO_VALUE, use closest player of scoring team?
    if (g_GoalScorerId == NO_VALUE) {
        g_GoalScorerId = GetClosestPlayerToBall(teamScored, NO_VALUE);
    }
    
	if(teamScored==TEAM_1){
		// Scored UP (North)
		g_Ball.Y = FIELD_BOUND_Y_TOP - 20;
		g_Team1Score++;
	}
	else{
		// Scored DOWN (South)
		g_Ball.Y = FIELD_BOUND_Y_BOTTOM + 20;
		g_Team2Score++;
	}
	ShowHeaderInfo();

	g_MatchStatus=MATCH_AFTER_IN_GOAL;
	g_RestartKickTeamId = (teamScored == TEAM_1) ? TEAM_2 : TEAM_1;
	g_Timer = 0; // Start timer for celebration/reset
}
void BallThrowIn(u8 teamId){
	// Placeholder for Throw-in Logic
	V9_PrintLayerAStringAtPos(10,18,"THROW IN");
	g_MatchStatus=MATCH_BEFORE_THROW_IN;
	g_RestartKickTeamId = teamId;
	g_Timer = 0;
}
void GoalKick(u8 teamId){
	// Placeholder for Goal Kick Logic
	V9_PrintLayerAStringAtPos(10,18,"GOAL KICK");
	g_MatchStatus=MATCH_BEFORE_GOAL_KICK;
	g_RestartKickTeamId = teamId;
	g_Timer = 0;
}
void CornerKick(u8 teamId){
	// Placeholder for Corner Kick Logic
	V9_PrintLayerAStringAtPos(18,18,"CORNER KICK");
	g_MatchStatus=MATCH_BEFORE_CORNER_KICK;
	g_RestartKickTeamId = teamId;
	g_Timer = 0;
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
void TickTeamJoystick(u8 teamId, u8 direction){

	// Block input during non-interactive states (Presentation, Cutscenes, etc.)
	if (g_MatchStatus == MATCH_NOT_STARTED || 
		g_MatchStatus == MATCH_PLAYERS_PRESENTATION || 
		g_MatchStatus == MATCH_AFTER_IN_GOAL) {
		return;
	}

	u8 playerId=NO_VALUE;
	if(teamId==TEAM_1){
		if(g_Team1ActivePlayer==NO_VALUE){
			return;
		}
		else{
			playerId=g_Team1ActivePlayer;
		}
	}
	else{
		if(g_Team2ActivePlayer==NO_VALUE){
			return;
		}
		else{
			playerId=g_Team2ActivePlayer;
		}
	}
	
	// AUTO-SWITCH ACTIVE DEFENDER
	// Capture trigger state ONCE for the whole function to avoid consumption issues
	bool frameTriggerPressed = IsTeamJoystickTriggerPressed(teamId);

	// Case A: Opponent has ball OR Ball is Loose
	bool canSwitch = false;
	if (g_Ball.PossessionPlayerId == NO_VALUE) {
		canSwitch = true; // Always allow switch on loose ball
	} else {
		u8 ballOwner = g_Ball.PossessionPlayerId;
		if (g_Players[ballOwner].TeamId != teamId) {
			canSwitch = true;
		}
	}

	if (canSwitch) {
		
		// 1. Check FORCE SWITCH (Trigger)
		bool forceSwitch = frameTriggerPressed;

		// 2. Check INPUT LOCK (Stick movement)
		// Don't auto-switch if user is actively moving stick, UNLESS forcing it with trigger.
		bool inputActive = (direction != DIRECTION_NONE);

		if (!inputActive || forceSwitch) {
			
			u8 closestId = GetClosestPlayerToBall(teamId, NO_VALUE);
			
			// BLOCK GOALKEEPER SELECTION
			if (closestId != NO_VALUE && g_Players[closestId].Role == PLAYER_ROLE_GOALKEEPER) {
				// If closest is GK, find the next closest field player
				closestId = GetClosestPlayerToBall(teamId, closestId);
			}

			if (closestId != playerId && closestId != NO_VALUE) {
				
				if (forceSwitch) {
					// FORCE SWITCH: Ignore hysteresis
					if (teamId == TEAM_1) g_Team1ActivePlayer = closestId;
					else g_Team2ActivePlayer = closestId;
					playerId = closestId; 
					
					// CONSUME TRIGGER forces switch to prevent immediate tackle in the same frame
					frameTriggerPressed = false;
				} else {
					// HYSTERESIS: Only switch if new player is SIGNIFICANTLY closer
					
					// If ball is loose, use smaller hysteresis (easier to switch)
					u8 histThreshold = (g_Ball.PossessionPlayerId == NO_VALUE) ? 10 : 30;

					// Calculate distances (Manhattan)
					u16 distX_Curr = (g_Players[playerId].X > g_Ball.X) ? (g_Players[playerId].X - g_Ball.X) : (g_Ball.X - g_Players[playerId].X);
					u16 distY_Curr = (g_Players[playerId].Y > g_Ball.Y) ? (g_Players[playerId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[playerId].Y);
					u16 distCurr = distX_Curr + distY_Curr;

					u16 distX_New = (g_Players[closestId].X > g_Ball.X) ? (g_Players[closestId].X - g_Ball.X) : (g_Ball.X - g_Players[closestId].X);
					u16 distY_New = (g_Players[closestId].Y > g_Ball.Y) ? (g_Players[closestId].Y - g_Ball.Y) : (g_Ball.Y - g_Players[closestId].Y);
					u16 distNew = distX_New + distY_New;

					if (distNew < (distCurr - histThreshold)) {
						if (teamId == TEAM_1) g_Team1ActivePlayer = closestId;
						else g_Team2ActivePlayer = closestId;
						playerId = closestId;
					}
				}
			}
		}
	}
	
	if (g_Players[playerId].Status == PLAYER_STATUS_POSITIONED) return;

	// -------------------------------------------------------------
	// INPUT ACTION HANDLERS
	// -------------------------------------------------------------
	
	// Prevent accidental double-trigger (Steal -> Pass)
	if (g_ActionCooldown > 0) frameTriggerPressed = false;

    // AUTO-POSSESSION ON TRIGGER (For Loose Balls)
    if (frameTriggerPressed && g_Ball.PossessionPlayerId == NO_VALUE) {
        i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
        i16 dy = (i16)g_Players[playerId].Y - (i16)g_Ball.Y;
        if (dx > -16 && dx < 16 && dy > -16 && dy < 16) {
             PutBallOnPlayerFeet(playerId);
        }
    }

	if(g_Ball.PossessionPlayerId==playerId){
		
		// If recovering from tackle/action, do not update movement/animation
		if (g_ActionCooldown > 0) return;

		if (frameTriggerPressed) {

			// 1. SHOOT CHECK
			// Only allow shots during actual gameplay
			if (g_MatchStatus == MATCH_IN_ACTION) {
				bool isShooting = false;
				u8 checkDir = direction;
				
				// Fallback: If input is neutral (e.g. stopped), use player's current facing
				// However, since facing is cleared on stop, we rely on input primarily. 
				// If the user effectively pressed direction+trigger, 'direction' is valid.
				
				u16 plY = g_Players[playerId].Y;
				u16 plX = g_Players[playerId].X;

				if (teamId == TEAM_1) { // Attacking UP (Towards Top)
					// Shooting Zone: Up to 120 pixels from goal line
					if (plY >= FIELD_BOUND_Y_TOP && plY <= (FIELD_BOUND_Y_TOP + 120)) { 
						if (checkDir == DIRECTION_UP || checkDir == DIRECTION_UP_LEFT || checkDir == DIRECTION_UP_RIGHT) {
							
							// ANGLE CONSTRAINT (Near Goal Line < 20px)
							bool allowed = true;
							if (plY < (FIELD_BOUND_Y_TOP + 20)) {
								if (plX < (GOAL_X_MIN - 15) || plX > (GOAL_X_MAX + 15)) allowed = false;
							}
							
							if (allowed) {
								isShooting = true;
								PerformShot(g_ShotCursorX, FIELD_BOUND_Y_TOP - 10);
							}
						}
					}
				} else { // Attacking DOWN (Towards Bottom)
					// Shooting Zone: Up to 120 pixels from goal line
					if (plY <= FIELD_BOUND_Y_BOTTOM && plY >= (FIELD_BOUND_Y_BOTTOM - 120)) { 
						if (checkDir == DIRECTION_DOWN || checkDir == DIRECTION_DOWN_LEFT || checkDir == DIRECTION_DOWN_RIGHT) {
							
							// ANGLE CONSTRAINT
							bool allowed = true;
							if (plY > (FIELD_BOUND_Y_BOTTOM - 20)) {
								if (plX < (GOAL_X_MIN - 15) || plX > (GOAL_X_MAX + 15)) allowed = false;
							}

							if (allowed) {
								isShooting = true;
								PerformShot(g_ShotCursorX, FIELD_BOUND_Y_BOTTOM + 10);
							}
						}
					}
				}

				if (isShooting) {
					g_ActionCooldown = 20;
					return;
				}
			}
	
			// 2. PASS LOGIC
			// If not shooting, always try to pass if Trigger is pressed.
			
			// UPDATE DIRECTION FOR ACCURATE TARGETING
			// Ensure the targeting cone uses the current input direction, not the old facing
			if(direction != DIRECTION_NONE){
				g_Players[playerId].Direction = direction;
			}

			// Always recalculate best target when trigger is pressed
			g_PassTargetPlayer = GetBestPassTarget(playerId);
			
			if (g_PassTargetPlayer != NO_VALUE) {
				// Execute Pass
				PerformPass(g_PassTargetPlayer);
				// Consume trigger event to avoid repeated calls
				frameTriggerPressed = false;
				return; 
			}
		}

		if((g_FrameCounter % 4)!=0){ 
			return;
		}

		if(g_Ball.KickMoveState==NO_VALUE){
			g_Ball.KickMoveState=0;
		}

		u8 moveDir = direction;
		if(g_Ball.KickMoveState != 0){
			moveDir = g_Players[playerId].Direction;
		}

		if(moveDir==DIRECTION_NONE){
			g_Players[playerId].Status=PLAYER_STATUS_POSITIONED;
			PutBallOnPlayerFeet(playerId);
			if(g_Players[playerId].PreviousDirection!=DIRECTION_NONE){
				g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
			}
			g_Ball.KickMoveState=0;
		}
		else{
			// Offset di base per la palla (distanza "attaccata" ai piedi) per ogni direzione
			// Indicizzati: NONE, UP, UP_RIGHT, RIGHT, DOWN_RIGHT, DOWN, DOWN_LEFT, LEFT, UP_LEFT
			// Modifica questi valori per aggiustare la posizione "zero" della palla
			const u8 BallBaseDistX[] = { 0, 0, 4, 6, 4, 0, 4, 6, 4 };
			const u8 BallBaseDistY[] = { 0, 6, 4, 0, 4, 6, 4, 0, 4 };
			
			// Correzione fine posizione palla quando ferma (per allineamento perfetto ai piedi/sprite)
			// Queste correzioni vengono applicate anche durante il movimento per mantenere la palla all'altezza corretta
			// Indicizzati: NONE, UP, UP_RIGHT, RIGHT, DOWN_RIGHT, DOWN, DOWN_LEFT, LEFT, UP_LEFT
			
			// DOWN_RIGHT: index 4 -> X+2, Y+2 (laterale dx e basso)
			// DOWN_LEFT: index 6 -> X-2 (ma i valori sono di correzione assoluta per l'offset, quindi se voglio allontanare 
			//                       dal corpo in X, e la formula usa X - distX, devo AUMENTARE distX o modificare BallAlignCorrectX negativamente?)
			// 
			// Formula LEFT/DOWN_LEFT: X = PlayerX - distX + BallAlignCorrectX
			// Se voglio la palla pi? a sinistra (distante dal corpo), devo diminuire X, quindi BallAlignCorrectX negativo.
			//
			// Formula RIGHT/DOWN_RIGHT: X = PlayerX + distX + BallAlignCorrectX
			// Se voglio la palla pi? a destra (distante dal corpo), devo aumentare X, quindi BallAlignCorrectX positivo.
			//
			// DOWN_RIGHT (4): +2px X, +2px Y.  => BallAlignCorrectX[4] = 2, BallAlignCorrectY[4] = 2
			// DOWN_LEFT (6): -2px X, +2px Y. => BallAlignCorrectX[6] = -2, BallAlignCorrectY[6] = 2

			const i8 BallAlignCorrectX[] = { 0, 0, 0, 0, 2, 0, -2, 0, 0 };
			const i8 BallAlignCorrectY[] = { 0, 0, 0, 8, 2, -2, 2, 8, 0 };

			const u8 DribbleAnimOffsets[] = {5, 4, 2, 0};
			const u8 DribbleAnimOffsetsDiag[] = {3, 3, 1, 0};
			
			u8 animStep = g_Ball.KickMoveState;
			u8 diagStep = (animStep % 2) ? 1 : 2;

			u8 currentOffset = DribbleAnimOffsets[animStep];
			u8 currentOffsetDiag = DribbleAnimOffsetsDiag[animStep];

			u8 distX = BallBaseDistX[moveDir] + ((moveDir==DIRECTION_UP || moveDir==DIRECTION_DOWN) ? 0 : (moveDir == DIRECTION_LEFT || moveDir == DIRECTION_RIGHT ? currentOffset : currentOffsetDiag));
			u8 distY = BallBaseDistY[moveDir] + ((moveDir==DIRECTION_LEFT || moveDir==DIRECTION_RIGHT) ? 0 : (moveDir == DIRECTION_UP || moveDir == DIRECTION_DOWN ? currentOffset : currentOffsetDiag));

			switch(moveDir){
				case DIRECTION_UP:
					g_Players[playerId].Y -= 2;
					g_Ball.Y = g_Players[playerId].Y - distY + BallAlignCorrectY[moveDir];
					g_Ball.X = g_Players[playerId].X + BallAlignCorrectX[moveDir];
					break;
				case DIRECTION_DOWN:
					g_Players[playerId].Y += 2;
					g_Ball.Y = g_Players[playerId].Y + distY + BallAlignCorrectY[moveDir]+5;
					g_Ball.X = g_Players[playerId].X + BallAlignCorrectX[moveDir];
					break;
				case DIRECTION_LEFT:
					g_Players[playerId].X -= 2;
					g_Ball.X = g_Players[playerId].X - distX + BallAlignCorrectX[moveDir];
					g_Ball.Y = g_Players[playerId].Y + BallAlignCorrectY[moveDir]-4;
					break;
				case DIRECTION_RIGHT:
					g_Players[playerId].X += 2;
					g_Ball.X = g_Players[playerId].X + distX + BallAlignCorrectX[moveDir];
					g_Ball.Y = g_Players[playerId].Y + BallAlignCorrectY[moveDir]-4;
					break;
				case DIRECTION_UP_RIGHT:
					g_Players[playerId].Y -= diagStep;
					g_Players[playerId].X += diagStep;
					g_Ball.Y = g_Players[playerId].Y - distY + BallAlignCorrectY[moveDir];
					g_Ball.X = g_Players[playerId].X + distX + BallAlignCorrectX[moveDir];
					break;
				case DIRECTION_UP_LEFT:
					g_Players[playerId].Y -= diagStep;
					g_Players[playerId].X -= diagStep;
					g_Ball.Y = g_Players[playerId].Y - distY + BallAlignCorrectY[moveDir];
					g_Ball.X = g_Players[playerId].X - distX + BallAlignCorrectX[moveDir];
					break;
				case DIRECTION_DOWN_RIGHT:
					g_Players[playerId].Y += diagStep;
					g_Players[playerId].X += diagStep;
					g_Ball.Y = g_Players[playerId].Y + distY + BallAlignCorrectY[moveDir];
					g_Ball.X = g_Players[playerId].X + distX + BallAlignCorrectX[moveDir];
					break;
				case DIRECTION_DOWN_LEFT:
					g_Players[playerId].Y += diagStep;
					g_Players[playerId].X -= diagStep;
					g_Ball.Y = g_Players[playerId].Y + distY + BallAlignCorrectY[moveDir];
					g_Ball.X = g_Players[playerId].X - distX + BallAlignCorrectX[moveDir];
					break;
			}
			g_Players[playerId].TargetY=g_Players[playerId].Y;
			g_Players[playerId].TargetX=g_Players[playerId].X;
			g_Players[playerId].Status=PLAYER_STATUS_HAS_BALL; 
			g_Players[playerId].Direction=moveDir;
			
			g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
			g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
			
			g_Ball.Direction = moveDir;

			g_Ball.KickMoveState++;
			if(g_Ball.KickMoveState>3){
				g_Ball.KickMoveState=0;
			}
		}
	}
	else{
		// 2. DEFENSE ACTION: TACKLE / STEAL
		// If I don't have the ball, but I'm close to it (or the opponent who has it)
		if (frameTriggerPressed) {
			i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
			i16 dy = (i16)g_Players[playerId].Y - (i16)g_Ball.Y;
			
			// Hitbox for tackle: 16x16 pixels approx
			if (dx > -16 && dx < 16 && dy > -16 && dy < 16) {
				
				// SLIDE TACKLE 'ALWAYS' LOGIC
                // Select pose based on relative position (Quadrant)
                u8 slidePose = 0;
                
                // dx = Player.X - Ball.X
                // dy = Player.Y - Ball.Y
                
                if (dy < 0) {
                    // Player is ABOVE Ball (Up)
                    if (dx < 0) slidePose = PLAYER_POSE_TACKLE_FROM_UP_LEFT;    // UP-LEFT -> Slides towards Bottom-Right?
                    else        slidePose = PLAYER_POSE_TACKLE_FROM_UP_RIGHT;   // UP-RIGHT -> Slides towards Bottom-Left?
                } else {
                    // Player is BELOW Ball (Down)
                    if (dx < 0) slidePose = PLAYER_POSE_TACKLE_FROM_DOWN_LEFT;  // DOWN-LEFT -> Slides towards Top-Right?
                    else        slidePose = PLAYER_POSE_TACKLE_FROM_DOWN_RIGHT; // DOWN-RIGHT -> Slides towards Top-Left?
                }

                if (slidePose != 0) {
					g_Players[playerId].PatternId = slidePose;
				}

				// Steal the ball!
				PutBallOnPlayerFeet(playerId);
				
				if (slidePose != 0) {
					g_Players[playerId].Status = PLAYER_STATUS_POSITIONED; // Lock visual (Override HAS_BALL)
				}
				
				g_ActionCooldown = 15; // Set 15 frames cooldown to avoid immediate pass
				return;
			}
		}
		
		if((g_FrameCounter % 4)!=0){ 
			return;
		}

		switch(direction){
			case DIRECTION_UP:
				g_Players[playerId].Y=g_Players[playerId].Y-2;
				break;
			case DIRECTION_DOWN:
				g_Players[playerId].Y=g_Players[playerId].Y+2;
				break;
			case DIRECTION_LEFT:
				g_Players[playerId].X=g_Players[playerId].X-2;
				break;
			case DIRECTION_RIGHT:
				g_Players[playerId].X=g_Players[playerId].X+2;
				break;
			case DIRECTION_UP_RIGHT:
				g_Players[playerId].Y=g_Players[playerId].Y-2;
				g_Players[playerId].X=g_Players[playerId].X+2;
				break;
			case DIRECTION_UP_LEFT:
				g_Players[playerId].Y=g_Players[playerId].Y-2;
				g_Players[playerId].X=g_Players[playerId].X-2;
				break;
			case DIRECTION_DOWN_RIGHT:
				g_Players[playerId].Y=g_Players[playerId].Y+2;
				g_Players[playerId].X=g_Players[playerId].X+2;
				break;
			case DIRECTION_DOWN_LEFT:
				g_Players[playerId].Y=g_Players[playerId].Y+2;
				g_Players[playerId].X=g_Players[playerId].X-2;
				break;
		}

		// Field Boundaries Clamp
		if(g_Players[playerId].Y < FIELD_BOUND_Y_TOP) g_Players[playerId].Y = FIELD_BOUND_Y_TOP;
		if(g_Players[playerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[playerId].Y = FIELD_BOUND_Y_BOTTOM;
		
		g_Players[playerId].TargetY=g_Players[playerId].Y;
		g_Players[playerId].TargetX=g_Players[playerId].X;
		if(direction==DIRECTION_NONE){
			g_Players[playerId].Status=PLAYER_STATUS_POSITIONED;
			if(g_Players[playerId].PreviousDirection!=DIRECTION_NONE){
				g_Players[playerId].PatternId=GetNoMovingPlayerPatternId(g_Players[playerId].PreviousDirection);
			}
			
		}
		else{
			g_Players[playerId].Status=PLAYER_STATUS_NONE;
		}
		
		g_Players[playerId].Direction=direction;
		g_Players[playerId].PreviousDirection=g_Players[playerId].Direction;
	}

	
	
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

		for(u8 i=0; i<15; i++){
			if(i == REFEREE) continue;
			
			// Decide behavior based on team
			if (g_Players[i].TeamId == scoringTeamId) {
				// --- SCORING TEAM: Random Movement & Celebration Poses ---

				// Change direction every 19 frames to be erratic (prime number avoids X/Y axis locking)
				if ((g_Timer % 19) == 0) {
					// Pseudo-random direction (1 to 8)
					// Use i and timer to mix it up, avoid oscillation
					u8 rnd = (g_Timer * 3) + (i * 37); 
					g_Players[i].Direction = (rnd % 8) + 1; 
				}

				u8 dir = g_Players[i].Direction;
				
				// Move logic (Keep inside visible screen bounds)
				bool movedNorth = false;

				if (dir == DIRECTION_UP || dir == DIRECTION_UP_LEFT || dir == DIRECTION_UP_RIGHT) {
					if (g_Players[i].Y > limitY_Top) g_Players[i].Y--;
					movedNorth = true;
				}
				else if (dir == DIRECTION_DOWN || dir == DIRECTION_DOWN_LEFT || dir == DIRECTION_DOWN_RIGHT) {
					if (g_Players[i].Y < limitY_Bottom) g_Players[i].Y++;
				}
				else if (dir == DIRECTION_LEFT) {
					if (g_Players[i].X > FIELD_BOUND_X_LEFT) g_Players[i].X--;
				}
				else if (dir == DIRECTION_RIGHT) {
					if (g_Players[i].X < FIELD_BOUND_X_RIGHT) g_Players[i].X++;
				}
				
				// Handle Diagonal X movement
				if (dir == DIRECTION_UP_LEFT || dir == DIRECTION_DOWN_LEFT) {
					if (g_Players[i].X > FIELD_BOUND_X_LEFT) g_Players[i].X--;
				}
				if (dir == DIRECTION_UP_RIGHT || dir == DIRECTION_DOWN_RIGHT) {
					if (g_Players[i].X < FIELD_BOUND_X_RIGHT) g_Players[i].X++;
				}

				// ANIMATION: Hands Up!
				// Toggle frame every 8 ticks
				bool animFrame1 = ((g_Timer / 8) % 2) == 0;
				
				if (movedNorth) {
					// Back View
					g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_BACK_1 : PLAYER_POSE_CELEBRATION_BACK_2;
				} else {
					// Front View (South, Left, Right or None)
					g_Players[i].PatternId = (animFrame1) ? PLAYER_POSE_CELEBRATION_FRONT_1 : PLAYER_POSE_CELEBRATION_FRONT_2;
				}

			} else {
				// --- LOSING TEAM: Stand Still ---
				// Use Front/Back based on general direction logic
				// Default to Front unless they were facing Up-ish
				if (g_Players[i].Direction == DIRECTION_UP || 
					g_Players[i].Direction == DIRECTION_UP_LEFT || 
					g_Players[i].Direction == DIRECTION_UP_RIGHT) {
					g_Players[i].PatternId = PLAYER_POSE_BACK;
				} else {
					g_Players[i].PatternId = PLAYER_POSE_FRONT;
				}
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
	Print_DrawText("EX Soccer - 2026 Fausto Pracek");
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
		
		UpdateSpritesPositions();
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
//
		// Update Shot Cursor (Oscillate)
		g_ShotCursorX += g_ShotCursorDir;
		if (g_ShotCursorX < (GOAL_X_MIN - 20)) {
			g_ShotCursorX = (GOAL_X_MIN - 20);
			g_ShotCursorDir = -g_ShotCursorDir;
		}
		if (g_ShotCursorX > (GOAL_X_MAX + 20)) {
			g_ShotCursorX = (GOAL_X_MAX + 20);
			g_ShotCursorDir = -g_ShotCursorDir;
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
	u8 patternId=NO_VALUE;
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
	u8 pose=g_Players[playerId].LastPose;
	u8 direction=g_Players[playerId].Direction;
	u8 patternId=NO_VALUE;
	switch(direction){
		case DIRECTION_NONE:
			patternId=GetNoMovingPlayerPatternId(direction);
			break;
		case DIRECTION_UP:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_UP_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_UP_2;
			}
			break;
		case DIRECTION_DOWN:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_DOWN_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_DOWN_2;
			}
			break;
		case DIRECTION_LEFT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_LEFT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_LEFT_2;
			}
			break;
		case DIRECTION_RIGHT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_RIGHT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_RIGHT_2;
			}
			break;
		case DIRECTION_UP_LEFT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_UP_LEFT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_UP_LEFT_2;
			}
			break;
		case DIRECTION_DOWN_LEFT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_DOWN_LEFT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_DOWN_LEFT_2;
			}
			break;
		case DIRECTION_UP_RIGHT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_UP_RIGHT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_UP_RIGHT_2;
			}
			break;
		case DIRECTION_DOWN_RIGHT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_DOWN_RIGHT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_DOWN_RIGHT_2;
			}
			break;
	}
	return patternId;
}
void SetPlayerTarget(u8 playerId){
	if(g_FieldScrollingActionInProgress!=NO_VALUE && g_MatchStatus!=MATCH_BEFORE_KICK_OFF){
		return;
	}
	switch(g_MatchStatus){
		case MATCH_BEFORE_KICK_OFF:
			if(g_Players[playerId].TeamId==REFEREE){
				// Position near center but slightly offset to avoid overlapping ball/players
				g_Players[playerId].TargetX=FIELD_POS_X_CENTER - 30; 
				g_Players[playerId].TargetY=FIELD_POS_Y_CENTER - 40; 
			}
			else{
				if(g_Players[playerId].TeamId==TEAM_1){
					switch (g_Players[playerId].Role)
					{
						case PLAYER_ROLE_GOALKEEPER:
							g_Players[playerId].TargetX=FIELD_POS_X_CENTER;
							g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_GOALKEEPER;
							break;
						case PLAYER_ROLE_LEFT_DEFENDER:
							g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
							g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_DEFENDERS;
							break;
						case PLAYER_ROLE_RIGHT_DEFENDER:
							g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
							g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_DEFENDERS;
							break;
						case PLAYER_ROLE_LEFT_HALFFIELDER:
							if(g_RestartKickTeamId!=TEAM_1){
								g_Players[playerId].TargetX=FIELD_POS_X_LEFT+100;
								g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS+40;
							}
							else{
								g_Players[playerId].TargetX=FIELD_POS_X_CENTER-7;
								g_Players[playerId].TargetY=FIELD_POS_Y_CENTER;
							}
							break;
						case PLAYER_ROLE_RIGHT_HALFFIELDER:
							if(g_RestartKickTeamId!=TEAM_1){
								g_Players[playerId].TargetX=FIELD_POS_X_RIGHT-100;
								g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS+40;
							}
							else{
								g_Players[playerId].TargetX=FIELD_POS_X_CENTER+7;
								g_Players[playerId].TargetY=FIELD_POS_Y_CENTER;
							}
							break;
						case PLAYER_ROLE_LEFT_STRIKER:
							g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
							g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS;
							break;
						case PLAYER_ROLE_RIGHT_STRIKER:
							g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
							g_Players[playerId].TargetY=FIELD_POS_Y_TEAM1_HALFFIELDERS;
							break;
					}
				}
				else{
					switch (g_Players[playerId].Role)
					{
						case PLAYER_ROLE_GOALKEEPER:
							g_Players[playerId].TargetX=FIELD_POS_X_CENTER;
							g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_GOALKEEPER;
							break;
						case PLAYER_ROLE_LEFT_DEFENDER:
							g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
							g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_DEFENDERS;
							break;
						case PLAYER_ROLE_RIGHT_DEFENDER:
							g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
							g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_DEFENDERS;
							break;
						case PLAYER_ROLE_LEFT_HALFFIELDER:
							if(g_RestartKickTeamId!=TEAM_2){
								g_Players[playerId].TargetX=FIELD_POS_X_LEFT+100;
								g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS-40;
							}
							else{
								g_Players[playerId].TargetX=FIELD_POS_X_CENTER-7;
								g_Players[playerId].TargetY=FIELD_POS_Y_CENTER-10;
							}
							break;
						case PLAYER_ROLE_RIGHT_HALFFIELDER:
							if(g_RestartKickTeamId!=TEAM_2){
								g_Players[playerId].TargetX=FIELD_POS_X_RIGHT-116;
								g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS-40;
							}
							else{
								g_Players[playerId].TargetX=FIELD_POS_X_CENTER+7;
								g_Players[playerId].TargetY=FIELD_POS_Y_CENTER-10;
							}
							break;
						case PLAYER_ROLE_LEFT_STRIKER:
							g_Players[playerId].TargetX=FIELD_POS_X_LEFT;
							g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS;
							break;
						case PLAYER_ROLE_RIGHT_STRIKER:
							g_Players[playerId].TargetX=FIELD_POS_X_RIGHT;
							g_Players[playerId].TargetY=FIELD_POS_Y_TEAM2_HALFFIELDERS;
							break;
					}
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