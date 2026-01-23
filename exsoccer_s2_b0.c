// ─────────────────────────────────────────────────────────────────────────────
//  EXSOCCER - 2026 Fausto Pracek (fpracek@gmail.com)
// ─────────────────────────────────────────────────────────────────────────────

#include "msxgl.h"
#include "v9990.h"
#include "print.h"
#include "exsoccer.h"
#include "debug.h"
#include "input.h"

// *** CONSTANTS ***
extern u8 			g_FieldScrollingActionInProgress; 	// Bank 1 = Segment 0
extern int  		g_FieldCurrentYPosition;			// Bank 1 = Segment 0
extern u8       	g_Team1PaletteId;					// Bank 1 = Segment 0
extern u8       	g_Team2PaletteId;					// Bank 1 = Segment 0
extern u8      		g_Team1Score;						// Bank 1 = Segment 0
extern u8      		g_Team2Score;						// Bank 1 = Segment 0
extern u8       	g_MatchStatus;						// Bank 1 = Segment 0
extern u8 			g_FieldScrollSpeed;					// Bank 1 = Segment 0
extern u8       	g_ActiveFieldZone;					// Bank 1 = Segment 0
extern u8       	g_SecondsToEndOfMatch;				// Bank 1 = Segment 0
extern u8       	g_Timer;							// Bank 1 = Segment 0
extern PlayerInfo  	g_Players[15];						// Bank 1 = Segment 0
extern BallInfo    	g_Ball;								// Bank 1 = Segment 0
extern u8          	g_RestartKickTeamId;				// Bank 1 = Segment 0
extern u8          	g_Team1ActivePlayer;				// Bank 1 = Segment 0
extern u8          	g_Team2ActivePlayer;				// Bank 1 = Segment 0
extern u8			g_PassTargetPlayer;					// Bank 1 = Segment 0
extern bool         g_FioBre;							// Bank 1 = Segment 0


// VARIABLES
extern u16 	g_FrameCounter; // Bank 1 = Segment 0
extern bool g_VSynch; // Bank 1 = Segment 0
extern bool g_GameWith2Players;

// CONSTANTS

// *** HELPER FUNCTIONS ***
void V9_PrintLayerAStringAtPos(u8 x, u8 y, const c8* str)
{
	u8 pos=0;
	while (*str != 0){
		V9_PutLayerATileAtPos(x,y,*(str++));
		x++;
		pos++;
	}
		
}





void TickP1(){
	TickFieldScrollingAction();
}

// *** SPRITE FUNCTIONS ***


u8 GetPlayerIdByRole(u8 teamId, u8 role){
	u8 playerId=NO_VALUE;
	for(u8 i=0;i<14;i++){
		if(g_Players[i].Role==role && g_Players[i].TeamId==teamId){
			playerId=i;
			break;
		}
	}
	return playerId;
}


void UpdateSpritesPositions(){
	for (u8 i=0;i<15;i++){
		PutPlayerSprite(i);
	}
	PutBallSprite();
}
void PutBallSprite(){
	struct V9_Sprite attr;
	attr.D=0;
	attr.SC=0;
	attr.Y = g_Ball.Y-g_FieldCurrentYPosition;

	// 1. Determine Logical Size
	u8 logicalSize = g_Ball.Size;
	// Keep ball small (Size 1) when held by player
	if (g_Ball.PossessionPlayerId != NO_VALUE) logicalSize = 1;

	if (logicalSize == 0) logicalSize = 1;
	if (logicalSize > 4) logicalSize = 4;

	// 2. Check Movement with Cooldown
	// Use a cooldown to prevent flickering when speed is low (sub-pixel movement)
	static u8 s_StopCooldown = 0;
	bool rawMovement = (g_Ball.OldX != g_Ball.X || g_Ball.OldY != g_Ball.Y);
	
	// Update Old Pos
	g_Ball.OldX = g_Ball.X;
	g_Ball.OldY = g_Ball.Y;

	if (rawMovement) {
		s_StopCooldown = 15; // Keep animation active for ~1/4 sec after last move
	} else {
		if (s_StopCooldown > 0) s_StopCooldown--;
	}
	
	bool isAnimating = (s_StopCooldown > 0);

	// 3. Determine Alternate Frame
	// Use Global Frame Counter (bit 3 = change every 8 frames)
	bool useAlt = isAnimating && ((g_FrameCounter & 8) != 0);
	
	switch (logicalSize){
		case 1:
			attr.Pattern = useAlt ? BALL_SIZE_2 : BALL_SIZE_1;
			break;
		case 2:
			attr.Pattern = useAlt ? BALL_SIZE_4 : BALL_SIZE_3;
			break;
		case 3:
			attr.Pattern = useAlt ? BALL_SIZE_6 : BALL_SIZE_5;
			break;
		case 4:
			attr.Pattern = useAlt ? BALL_SIZE_8 : BALL_SIZE_7;
			break;
		default:
			attr.Pattern = BALL_SIZE_1;
	}

	attr.X = g_Ball.X;
	attr.P = attr.D;
	V9_SetSpriteP1(15, &attr);
}
void ShowHeaderInfo(){
	u8 pos1=5;
	u8 pos2=10;
	if(g_Team1Score>=10){
		pos1--;
	}
	if(g_Team2Score>=10){
		pos2--;
	}
	switch (g_Team1PaletteId){
		case TEAM_AUS:
			if(g_FioBre){
				V9_PrintLayerAStringAtPos(0,0,"FIO");
			}
			else{
				V9_PrintLayerAStringAtPos(0,0,"AUS");
			}
			break; 
		case TEAM_BRA:
			V9_PrintLayerAStringAtPos(0,0,"BRA");
			break;
		case TEAM_ITA:
			if(g_FioBre){
				V9_PrintLayerAStringAtPos(0,0,"BRE");
			}
			else{
				V9_PrintLayerAStringAtPos(0,0,"AUS");
			}
			break;
		case TEAM_GBR:
			V9_PrintLayerAStringAtPos(0,0,"GBR");
			break;
		case TEAM_GER:
			V9_PrintLayerAStringAtPos(0,0,"GER");
			break;
		case TEAM_FRA:
			V9_PrintLayerAStringAtPos(0,0,"FRA");
			break;
	}
	V9_PrintLayerAStringAtPos(pos1,0,GetNumberString(g_Team1Score));
	V9_PrintLayerAStringAtPos(7,0,"-");
	V9_PrintLayerAStringAtPos(pos2,0,GetNumberString(g_Team2Score));
	switch (g_Team2PaletteId){
		case TEAM_AUS:
			if(g_FioBre){
				V9_PrintLayerAStringAtPos(12,0,"FIO");
			}
			else{
				V9_PrintLayerAStringAtPos(12,0,"AUS");
			}
			break; 
		case TEAM_BRA:
			V9_PrintLayerAStringAtPos(12,0,"BRA");
			break;
		case TEAM_ITA:
			if(g_FioBre){
				V9_PrintLayerAStringAtPos(12,0,"BRE");
			}
			else{
				V9_PrintLayerAStringAtPos(12,0,"AUS");
			}
			break;
		case TEAM_GBR:
			V9_PrintLayerAStringAtPos(12,0,"GBR");
			break;
		case TEAM_GER:
			V9_PrintLayerAStringAtPos(12,0,"GER");
			break;
		case TEAM_FRA:
			V9_PrintLayerAStringAtPos(12,0,"FRA");
			break;
	}
	u8 minutes=g_SecondsToEndOfMatch / 60;
	u8 seconds=g_SecondsToEndOfMatch - minutes*60;
	V9_PrintLayerAStringAtPos(28,0,GetNumberString(minutes));
	V9_PrintLayerAStringAtPos(29,0,":");
	if(seconds>=10){
		V9_PrintLayerAStringAtPos(30,0,GetNumberString(seconds));
	}
	else{
		V9_PrintLayerAStringAtPos(30,0,"0");
		V9_PrintLayerAStringAtPos(31,0,GetNumberString(seconds));
	}
}

// *** GENERIC HELPER FUNCTIONS ***
void V9_PutLayerATileAtPos(u8 x, u8 y, u16 tileId) {
    V9_Poke16(V9_CellAddrP1A(x,y), tileId);
}
void V9_PutLayerBTileAtPos(u8 x, u8 y, u16 tileId) {
    V9_Poke16(V9_CellAddrP1B(x,y), tileId);
}
void PutPlayerSprite(u8 playerId){
	struct V9_Sprite attr;
	attr.D=0;
	attr.SC=2;
	u16 minY=g_FieldCurrentYPosition+16;
	u16 maxY=g_FieldCurrentYPosition+235;

	attr.Y = g_Players[playerId].Y-g_FieldCurrentYPosition;
	if(g_Players[playerId].TeamId==TEAM_2){
		attr.SC=3;
	}
	if(g_Players[playerId].Role==PLAYER_ROLE_GOALKEEPER){
		attr.SC=0;
	}
	if(g_Players[playerId].TeamId==REFEREE){
		attr.SC=1;
	}
	
	if(g_Players[playerId].Y>maxY){
		attr.D=1;
	}
	if(g_Players[playerId].Y<minY){
		attr.D=1;
	}
	if(g_MatchStatus!=MATCH_NOT_STARTED && g_MatchStatus!=MATCH_KICK_OFF){
		UpdatePlayerPatternByDirection(playerId);
	}
	attr.Pattern = g_Players[playerId].PatternId;
	
	// Highlight logic (Human Only)
	if(g_Players[playerId].TeamId != REFEREE)
	{
		bool isHumanTeam = (g_Players[playerId].TeamId == TEAM_1) || (g_GameWith2Players && g_Players[playerId].TeamId == TEAM_2);
		
		if (isHumanTeam) {
			// NEVER HIGHLIGHT GOALKEEPER
			if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) {
				if (playerId==g_Team1ActivePlayer || (g_GameWith2Players && playerId==g_Team2ActivePlayer)) {
					// Ensure we are not highlighting REFEREE even if logic fails (safety check)
					attr.Pattern=attr.Pattern+64;

				}
			}
			// Highlight Pass Target if team has ball
			if (playerId == g_PassTargetPlayer) {
				attr.Pattern=attr.Pattern+64;

			}
		}
	}
	
	attr.X = g_Players[playerId].X;
	attr.P = 1;
	
	V9_SetSpriteP1(playerId, &attr);

}


void ResetPlayersInfo(){
	SetPlayerBallPossession(NO_VALUE);
	for(u8 i=0;i<14;i++){
		g_Players[i].Direction=DIRECTION_NONE;
		g_Players[i].PreviousDirection=g_Players[i].Direction;
		g_Players[i].LastPose=0;
		g_Players[i].Status=PLAYER_STATUS_NONE;
		g_Players[i].Status=PLAYER_STATUS_NONE;
	}
}
void ClearTextFromLayerA(u8 x, u8 y, u8 length){
	for(u8 i=0;i<length;i++){
		V9_PutLayerATileAtPos(x,y,0);
		x++;
	}
}
void TickPlayerToOwnTarget(){
    //if(g_MatchStatus == MATCH_AFTER_IN_GOAL) return; // FIX: Referee moves during celebration
	if(g_MatchStatus!=MATCH_NOT_STARTED){
		bool allPlayersInPosition = true;
		
		for(u8 i=0;i<15;i++){
			
			if(g_MatchStatus == MATCH_AFTER_IN_GOAL) {
				if(i != REFEREE) continue;
				// Force Referee Target to KickOff Position immediately
				g_Players[i].TargetX=FIELD_POS_X_CENTER - 30; 
				g_Players[i].TargetY=FIELD_POS_Y_CENTER - 40; 
			}

			if (i == REFEREE && (g_MatchStatus == MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER)) continue;
			
			// SKIP ACTIVE PLAYERS (Controlled by Joystick)
			if (g_Team1ActivePlayer != NO_VALUE && i == g_Team1ActivePlayer) continue;
			if (g_GameWith2Players && g_Team2ActivePlayer != NO_VALUE && i == g_Team2ActivePlayer) continue;
			if (g_GameWith2Players && i == g_Team2ActivePlayer) {
				continue;
			}
			
			// Check if this specific player is in position
			bool playerInPosition = (g_Players[i].X == g_Players[i].TargetX && g_Players[i].Y == g_Players[i].TargetY);
            
            // Only care about "in position" for KickOff logic if we are in that phase
            if (g_MatchStatus == MATCH_BEFORE_KICK_OFF && !playerInPosition) {
                 allPlayersInPosition = false;
            }

			if(g_MatchStatus==MATCH_IN_ACTION){
				// Don't force Positioned status to allow animation during skip frames
				if(g_Players[i].AiTickCounter<AI_TICK_SPEED){
					g_Players[i].AiTickCounter++;
					continue;
				}
			}
			
			g_Players[i].AiTickCounter=0;
			
			if(!playerInPosition){
				g_Players[i].Status=PLAYER_STATUS_NONE;
				if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
					g_Players[i].Direction=DIRECTION_UP_RIGHT;
					g_Players[i].X++;
					g_Players[i].Y--;
				}
				else if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
					g_Players[i].Direction=DIRECTION_UP_LEFT;
					g_Players[i].X--;
					g_Players[i].Y--;
				}
				else if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
					g_Players[i].Direction=DIRECTION_DOWN_LEFT;
					g_Players[i].X--;
					g_Players[i].Y++;
				}
				else if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
					g_Players[i].Direction=DIRECTION_DOWN_RIGHT;
					g_Players[i].X++;
					g_Players[i].Y++;
				}
				else if(g_Players[i].X==g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
					g_Players[i].Direction=DIRECTION_UP;
					g_Players[i].Y--;
				}
				else if(g_Players[i].X==g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
					g_Players[i].Direction=DIRECTION_DOWN;
					g_Players[i].Y++;
				}
				else if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y==g_Players[i].TargetY){
					g_Players[i].Direction=DIRECTION_RIGHT;
					g_Players[i].X++;
				}
				else if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y==g_Players[i].TargetY){
					g_Players[i].Direction=DIRECTION_LEFT;
					g_Players[i].X--;
				}
				
				// Boundaries
                if(g_Players[i].Y < FIELD_BOUND_Y_TOP) g_Players[i].Y = FIELD_BOUND_Y_TOP;
		        if(g_Players[i].Y > FIELD_BOUND_Y_BOTTOM) g_Players[i].Y = FIELD_BOUND_Y_BOTTOM;
                if(g_Players[i].X < FIELD_BOUND_X_LEFT) g_Players[i].X = FIELD_BOUND_X_LEFT;
		        if(g_Players[i].X > FIELD_BOUND_X_RIGHT) g_Players[i].X = FIELD_BOUND_X_RIGHT;

				if (g_MatchStatus == MATCH_IN_ACTION) {
                    if (g_Ball.PossessionPlayerId == i) {
						if (g_Ball.KickMoveState == NO_VALUE) g_Ball.KickMoveState = 0;
						g_Ball.KickMoveState++;
						if (g_Ball.KickMoveState > 3) g_Ball.KickMoveState = 0;
                        PutBallOnPlayerFeet(i);
					}
				}
                // REMOVED manual LastPose toggling here to avoid double-toggle cancellation
			} else {
                // Not Moving (In Position)
                if(g_MatchStatus==MATCH_IN_ACTION){
				    g_Players[i].Status=PLAYER_STATUS_POSITIONED;
                }

				if (g_Players[i].TeamId == REFEREE) {
                     if(g_MatchStatus == MATCH_BEFORE_KICK_OFF || g_MatchStatus == MATCH_AFTER_IN_GOAL) {
                          g_Players[i].Direction = DIRECTION_DOWN;
                          g_Players[i].PatternId = PLAYER_POSE_FRONT;
                          g_Players[i].Status = PLAYER_STATUS_POSITIONED;
                          PutPlayerSprite(i);
                     }
                }
				
				//DEBUG_LOGNUM("TEST",g_MatchStatus);


				if(g_MatchStatus==MATCH_BEFORE_KICK_OFF){
					
					if(g_Players[i].TeamId!=REFEREE && g_Players[i].PatternId!=PLAYER_POSE_BACK && g_Players[i].PatternId!=PLAYER_POSE_FRONT){
						g_Players[i].Status=PLAYER_STATUS_POSITIONED;
						// IF SCORING PLAYER, DON'T OVERRIDE PATTERN HERE (Handled in UpdatePlayerPatternByDirection)
						if (i != g_GoalScorerId) {
							if(g_Players[i].TeamId==TEAM_1){
								g_Players[i].PatternId=PLAYER_POSE_BACK;
								g_Players[i].Direction=DIRECTION_UP;
							}
							else{
								g_Players[i].PatternId=PLAYER_POSE_FRONT;
								g_Players[i].Direction=DIRECTION_DOWN;
							}
						} else {
							// Ensure scorer faces correct way eventually? 
							// Logic in UpdatePlayerPattern handles animation.
							// But when they STOP moving (reach target), we need to reset them to standard stance.
							if(g_Players[i].TeamId==TEAM_1) g_Players[i].Direction=DIRECTION_UP;
							else g_Players[i].Direction=DIRECTION_DOWN;
						}
						PutPlayerSprite(i);
					}
				}
			}
			
		}

		if(g_MatchStatus==MATCH_BEFORE_KICK_OFF && allPlayersInPosition && g_FieldScrollingActionInProgress==NO_VALUE){
			g_FieldScrollSpeed=FIELD_SCROLL_GAME_SPEED;
			g_MatchStatus=MATCH_KICK_OFF;
			g_Timer=0;
			g_GoalScorerId = NO_VALUE; // Reset scorer
		}
		
	}
}


char *GetNumberString(u16 value)
{
    static char str[5];

    if (value < 10) {
        str[0] = '0' + value;
        str[1] = '\0';
    } else {
        str[0] = '0' + (value / 10);
        str[1] = '0' + (value % 10);
        str[2] = '\0';
    }

    return str;
}
// *** JOYSTICKS ***
bool IsTeamJoystickTriggerPressed(u8 teamId){
	if(teamId==TEAM_1){
		
		u8 joyStat = Joystick_Read(JOY_PORT_1);
		if (IS_JOY_PRESSED(joyStat, JOY_INPUT_TRIGGER_A))
		{
			return true;
		}
		if(Keyboard_IsKeyPressed(KEY_SPACE))
		{
			return true;
		}
	}
	else{
		u8 joyStat = Joystick_Read(JOY_PORT_2);
		if (IS_JOY_PRESSED(joyStat, JOY_INPUT_TRIGGER_A))
		{
			return true;
		}
	}
	return FALSE;
}
u8 GetJoystick1Direction(){
	u8 dir = Joystick_GetDirection(JOY_PORT_1);
	u8 retValue=DIRECTION_NONE;
	switch (dir){
		case JOY_INPUT_DIR_UP:
			retValue=DIRECTION_UP;
			break;
		case JOY_INPUT_DIR_DOWN:
			retValue=DIRECTION_DOWN;
			break;
		case JOY_INPUT_DIR_LEFT:
			retValue=DIRECTION_LEFT;
			break;
		case JOY_INPUT_DIR_RIGHT:
			retValue=DIRECTION_RIGHT;
			break;
		case JOY_INPUT_DIR_UP_RIGHT:
			retValue=DIRECTION_UP_RIGHT;
			break;
		case JOY_INPUT_DIR_UP_LEFT:
			retValue=DIRECTION_UP_LEFT;
			break;
		case JOY_INPUT_DIR_DOWN_RIGHT:
			retValue=DIRECTION_DOWN_RIGHT;
			break;
		case JOY_INPUT_DIR_DOWN_LEFT:
			retValue=DIRECTION_DOWN_LEFT;
			break;
	}
	if(retValue==DIRECTION_NONE){
		if(Keyboard_IsKeyPressed(KEY_LEFT) && Keyboard_IsKeyPressed(KEY_UP))
		{
			retValue=DIRECTION_UP_LEFT;
		}
		if(Keyboard_IsKeyPressed(KEY_LEFT) && Keyboard_IsKeyPressed(KEY_DOWN))
		{
			retValue=DIRECTION_DOWN_LEFT;
		}
		if(Keyboard_IsKeyPressed(KEY_RIGHT) && Keyboard_IsKeyPressed(KEY_DOWN))
		{
			retValue=DIRECTION_DOWN_RIGHT;
		}
		if(Keyboard_IsKeyPressed(KEY_RIGHT) && Keyboard_IsKeyPressed(KEY_UP))
		{
			retValue=DIRECTION_UP_RIGHT;
		}		
		if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_LEFT))
		{
			retValue=DIRECTION_LEFT;
		}
		if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_RIGHT))
		{
			retValue=DIRECTION_RIGHT;
		}
		if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_UP))
		{
			retValue=DIRECTION_UP;
		}
		if(retValue==DIRECTION_NONE && Keyboard_IsKeyPressed(KEY_DOWN))
		{
			retValue=DIRECTION_DOWN;
		}
	}
	return retValue;
}
u8 GetJoystick2Direction(){
	return Bios_GetJoystickDirection(2);
}
// *** GAME MANAGEMENT ***
void ShowFieldZone(u8 zone){
	g_FieldScrollingActionInProgress=zone;
}
void TickCheckBallBoundaries(){
	if(g_MatchStatus!=MATCH_IN_ACTION){
		return;
	}
    // Prevent Goal/Corner checks if the ball is currently held by the Goalkeeper
    // (This state can sometimes overlap with boundary positions during recoil animation)
    if(g_MatchStatus == MATCH_BALL_ON_GOALKEEPER || g_Ball.PossessionPlayerId != NO_VALUE) {
        if(g_Ball.PossessionPlayerId != NO_VALUE) {
            if(g_Players[g_Ball.PossessionPlayerId].Role == PLAYER_ROLE_GOALKEEPER) return;
        }
    }
    
    // IGNORE BOUNDARIES IF BALL IS MOVING BACK INTO FIELD (e.g. GK Kick)
    if (g_Ball.ShotActive != 0 || g_Ball.PassTargetPlayerId != NO_VALUE) {
        
        u16 destY = g_Ball.TargetY;
        if (g_Ball.PassTargetPlayerId != NO_VALUE) {
            destY = g_Players[g_Ball.PassTargetPlayerId].Y;
        }
        
        // If Ball is ABOVE Top Line
        if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
             // If destination is below current position (moving Down), it is returning.
             if(destY > g_Ball.Y) return;
        }
        
        // If Ball is BELOW Bottom Line
        if (g_Ball.Y > FIELD_BOUND_Y_BOTTOM) {
             // If destination is above current position (moving Up), it is returning.
             if(destY < g_Ball.Y) return;
        }
    }
    // YES! That is the problem.
    // We need to ensure ball starts INSIDE the field when kicked by GK.
    
    // Let's fix it in PerformPass / PerformShot (or TickGoalkeeperAnimation) instead of here.
    // But as a failsafe here: If Ball is ShotActive and LastTouch was Goalkeeper?
    // We don't track who touched last beyond Team.
    
    // Valid Check: If ball is "Out" but moving INWARDS to the field, ignore it.
    
    i16 relY_Top = (i16)g_Ball.Y - FIELD_BOUND_Y_TOP;
    i16 relY_Bottom = (i16)g_Ball.Y - FIELD_BOUND_Y_BOTTOM;
    
    // If Ball is ABOVE Top Line (relY_Top < 0)
    if (g_Ball.Y < FIELD_BOUND_Y_TOP) {
         // If moving DOWN (Direction is DOWN, DOWN_LEFT, DOWN_RIGHT), it is returning to field.
         if (g_Ball.ShotActive && (g_Ball.Direction == DIRECTION_DOWN || g_Ball.Direction == DIRECTION_DOWN_LEFT || g_Ball.Direction == DIRECTION_DOWN_RIGHT)) {
             return; 
         }
    }
    
    // If Ball is BELOW Bottom Line
    if (g_Ball.Y > FIELD_BOUND_Y_BOTTOM) {
         // If moving UP, it is returning to field.
         if (g_Ball.ShotActive && (g_Ball.Direction == DIRECTION_UP || g_Ball.Direction == DIRECTION_UP_LEFT || g_Ball.Direction == DIRECTION_UP_RIGHT)) {
             return;
         }
    }

	u8 teamId = g_Ball.LastTouchTeamId;
	if(teamId==NO_VALUE){
		teamId=TEAM_1; // Default
	}
	u8 opponentTeamId = (teamId == TEAM_1) ? TEAM_2 : TEAM_1;

	// Check Side Lines (Throw-in)
	if(g_Ball.X < FIELD_BOUND_X_LEFT || g_Ball.X > FIELD_BOUND_X_RIGHT){
		BallThrowIn(opponentTeamId);
		return;
	}

	// Check Top Line (Goal of Team 2)
	if(g_Ball.Y < FIELD_BOUND_Y_TOP){
		// Check Goal (Significantly widened tolerance to prevent false negatives)
		// Tolerance +/- 8 pixels (approx ball width)
		if(g_Ball.X > (GOAL_X_MIN - 8) && g_Ball.X < (GOAL_X_MAX + 8)){
			BallInGoal(TEAM_1); // Team 1 attacked up and scored
		}
		else{
			if(teamId == TEAM_1){ // Attacker touched last
				GoalKick(TEAM_2);
			}
			else{ // Defender touched last
				CornerKick(TEAM_1);
			}
		}
		return;
	}

	// Check Bottom Line (Goal of Team 1)
	if(g_Ball.Y > FIELD_BOUND_Y_BOTTOM){
		// Check Goal
		if(g_Ball.X > (GOAL_X_MIN - 8) && g_Ball.X < (GOAL_X_MAX + 8)){
			BallInGoal(TEAM_2); // Team 2 attacked down and scored
		}
		else{
			if(teamId == TEAM_2){ // Attacker touched last (Team 2 attacking down)
				GoalKick(TEAM_1);
			}
			else{ // Defender touched last (Team 1 defending)
				CornerKick(TEAM_2);
			}
		}
		return;
	}
}



void TimeUp(){

}

u8 GetClosestPlayerToBall(u8 teamId, u8 excludePlayerId){
	u8 closestId = NO_VALUE;
	u16 minDist = 0xFFFF;
	
	for(u8 i=0;i<14;i++){
		if(g_Players[i].TeamId != teamId) continue;
		if(i == excludePlayerId) continue;

		u16 distX = (g_Players[i].X > g_Ball.X) ? (g_Players[i].X - g_Ball.X) : (g_Ball.X - g_Players[i].X);
		u16 distY = (g_Players[i].Y > g_Ball.Y) ? (g_Players[i].Y - g_Ball.Y) : (g_Ball.Y - g_Players[i].Y);
		
		// Use Manhattan distance for speed (dx + dy)
		u16 totalDist = distX + distY;
		
		if(totalDist < minDist){
			minDist = totalDist;
			closestId = i;
		}
	}
	return closestId;
}



// *** PASSING LOGIC ***

i32 Math_Abs32(i32 v) { return (v < 0) ? -v : v; }

u8 GetBestPassTarget(u8 passerId) {
	u8 bestTarget = NO_VALUE;
	i32 bestScore = -2100000000;
	u8 teamId = g_Players[passerId].TeamId;
	u8 dir = g_Players[passerId].Direction;
    i16 px = (i16)g_Players[passerId].X;
    i16 py = (i16)g_Players[passerId].Y;
    
	// Vector for direction
	i16 dirX = 0, dirY = 0;
	u8 i; 

	if (dir == DIRECTION_NONE) dir = g_Players[passerId].PreviousDirection;

    if (dir == DIRECTION_UP) dirY = -100;
    else if (dir == DIRECTION_DOWN) dirY = 100;
    else if (dir == DIRECTION_LEFT) dirX = -100;
    else if (dir == DIRECTION_RIGHT) dirX = 100;
    else if (dir == DIRECTION_UP_RIGHT) { dirX = 70; dirY = -70; }
    else if (dir == DIRECTION_UP_LEFT) { dirX = -70; dirY = -70; }
    else if (dir == DIRECTION_DOWN_RIGHT) { dirX = 70; dirY = 70; }
    else if (dir == DIRECTION_DOWN_LEFT) { dirX = -70; dirY = 70; }
    else {
        if (teamId == TEAM_1) dirY = -100; 
        else dirY = 100; 
    }

	for(i=0; i<14; i++) {
        // Optimized variables
        i16 dx, dy, adx, ady;
        i32 dot, score;

		if(g_Players[i].TeamId != teamId) continue;
		if(i == passerId) continue;
        // if(g_Players[i].Status == PLAYER_STATUS_NONE) continue; // Allow passing to moving players!
		if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue; 
		
        // VISIBILITY CHECK (Moved up for optimization)
        if (g_Players[i].Y < g_FieldCurrentYPosition || g_Players[i].Y > (g_FieldCurrentYPosition + 220)) {
            continue;
        }

		dx = (i16)g_Players[i].X - px;
		dy = (i16)g_Players[i].Y - py;
        
        // MINIMUM DISTANCE CHECK (Box check is lighter than distSq)
        // Reduced to ~30px to improve responsiveness for short passes
        adx = (dx < 0) ? -dx : dx;
        ady = (dy < 0) ? -dy : dy;
        if (adx < 32 && ady < 32) continue;

		// GK RESTRICTED KICK DISTANCE
		if (g_Players[passerId].Role == PLAYER_ROLE_GOALKEEPER) {
			// Limit to 200px (approx full screen height). 
			if (((i32)dx*(i32)dx + (i32)dy*(i32)dy) > 40000) continue;
		}

        dot = ((i32)dx * dirX) + ((i32)dy * dirY);
		
		// DIRECTION CHECK
		if (dot <= 0) {
            // RELAXED CHECK: Allow slight backward passes if very close?
            // Or just allow wider cone (dot > -0.2?)
            // Let's stick to 90 degrees but check if vector calculation is correct.
            // If stopped, dirX/dirY might be tricky.
            continue; 
        }

        // Heuristic
        // Simplified scoring: Dot Product (Alignment) - Linear Distance Penalty
        // Avoids expensive squares and divisions.
        score = dot - ((i32)(adx + ady) * 40); 
		
        if (score > bestScore) {
            bestScore = score;
            bestTarget = i;
        }
	}
    
    // --- FALLBACK ---
    // If no target found with strict direction, try finding ANY closest teammate
    // regardless of direction, but within reasonable distance (e.g. 80px)
    if (bestTarget == NO_VALUE) {
        for(i=0; i<14; i++) {
             if(g_Players[i].TeamId != teamId) continue;
             if(i == passerId) continue;
             // if(g_Players[i].Status == PLAYER_STATUS_NONE) continue; // Allow passing to moving players!
             if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
             
             // Visibility
             if (g_Players[i].Y < g_FieldCurrentYPosition || g_Players[i].Y > (g_FieldCurrentYPosition + 220)) continue;

             i16 dx = (i16)g_Players[i].X - px;
             i16 dy = (i16)g_Players[i].Y - py;
             
             // Ignore min distance check here?
             
             // Max Distance for fallback
             i16 adx = (dx < 0) ? -dx : dx;
             i16 ady = (dy < 0) ? -dy : dy;
             if (adx + ady > 100) continue; // Only close teammates
             
             // Simple closeness score
             i32 score = 1000 - (adx + ady);
             if (score > bestScore) {
                 bestScore = score;
                 bestTarget = i;
             }
        }
    }
    
	return bestTarget;
}

void UpdatePassTarget() {
	static u8 passUpdateTimer = 0;
	u8 carrier = g_Ball.PossessionPlayerId;
    
	if (g_Ball.PossessionPlayerId == NO_VALUE) {
		g_PassTargetPlayer = NO_VALUE;
		return;
	}

	// Performance Optimization: Only update every 8 frames
	passUpdateTimer++;
	if (passUpdateTimer < 8) return;
	passUpdateTimer = 0;

    if (carrier != NO_VALUE) {
        g_PassTargetPlayer = GetBestPassTarget(carrier);
    } else {
		if (g_Ball.PassTargetPlayerId == NO_VALUE) g_PassTargetPlayer = NO_VALUE;
    }
}




// Static vars for GK animation
static u8 s_GkAnimTimer = 0;
static u8 s_GkAnimPlayerId = NO_VALUE;
static i8 s_GkRecoilY = 0;

void GoalkeeperWithBall(u8 teamId, bool isSteal) {
    u8 gkId = GetPlayerIdByRole(teamId, PLAYER_ROLE_GOALKEEPER);
    if(gkId == NO_VALUE) return;

    s_GkAnimPlayerId = gkId;
    s_GkAnimTimer = 0;
    
    // Set Pose based on Team
    if (teamId == TEAM_1) {
        g_Players[gkId].PatternId = PLAYER_POSE_TEAM1_GK_BALL_FRONT;
        g_Players[gkId].Direction = DIRECTION_UP; // Face Up (Attack Direction)
    }
    else {
        g_Players[gkId].PatternId = PLAYER_POSE_FRONT; // Team 2 GK plays like a player (feet)
        g_Players[gkId].Direction = DIRECTION_DOWN; // Face Down (Attack Direction)
    }
    
    // Lock Pose
    g_Players[gkId].Status = PLAYER_STATUS_POSITIONED;
    
    // Determine Recoil Direction (Same as Shot)
    // Team 1 attacks UP (Shoots UP). Team 2 defends. GK 2 moves UP (-1).
    bool closeToLine = false;
    if (teamId == TEAM_2) { // GK 2 (Top)
        s_GkRecoilY = -1;
        if (g_Players[gkId].Y <= FIELD_BOUND_Y_TOP + 4) closeToLine = true;
    } else { // GK 1 (Bottom)
        s_GkRecoilY = 1;
        if (g_Players[gkId].Y >= FIELD_BOUND_Y_BOTTOM - 4) closeToLine = true;
    }

    if (closeToLine || isSteal) s_GkRecoilY = 0; // No recoil for Steals
    
    // Take Possession
    SetPlayerBallPossession(gkId);
    g_Ball.ShotActive = 0;
    
    g_MatchStatus = MATCH_BALL_ON_GOALKEEPER;

    // TACTICAL MOVEMENT: All players move while GK recoils
    for(u8 i=0; i<14; i++) {
        if(i == gkId) continue;
        if(g_Players[i].TeamId == REFEREE) continue;
        if(g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
        
        u16 tx, ty;
        // Reset current targets
        tx = g_Players[i].X;
        ty = g_Players[i].Y;

        if(g_Players[i].TeamId == teamId) {
             // TEAMMATE (Defending team) -> Advance (Counter-Attack)
             // Move towards center/opponent field
             if(teamId == TEAM_1) { // Moving UP
                  ty = (g_Players[i].Y > 50) ? (g_Players[i].Y - 40) : 50;
             } else { // Moving DOWN
                  ty = (g_Players[i].Y < 380) ? (g_Players[i].Y + 40) : 380;
             }
        } else {
             // OPPONENT (Attacking team) -> Retreat to defense
             // Move towards their own goal
             if(teamId == TEAM_1) { // Opponent is Team 2 (Top) -> Retreat UP? No, Team 2 Defends Top.
                  // Wait, if GK is Team 1 (Bottom Defending), Opponent IS Team 2 (Attack Down).
                  // Opponent (Team 2) retreats to Top.
                  ty = (g_Players[i].Y > 50) ? (g_Players[i].Y - 40) : 50;
             } else { // GK is Team 2 (Top Defending). Opponent is Team 1 (Attack Up).
                  // Opponent (Team 1) retreats to Bottom.
                  ty = (g_Players[i].Y < 380) ? (g_Players[i].Y + 40) : 380;
             }
        }

        // Apply Target
        g_Players[i].TargetX = tx;
        g_Players[i].TargetY = ty;
        g_Players[i].Status = PLAYER_STATUS_NONE; // Unlock movement
    }
}

void TickGoalkeeperAnimation() {
    if (g_MatchStatus != MATCH_BALL_ON_GOALKEEPER) return;
    if (s_GkAnimPlayerId == NO_VALUE) return;
	
	// Ensure status is locked so main loop doesn't override PatternId
	g_Players[s_GkAnimPlayerId].Status = PLAYER_STATUS_POSITIONED;
    
    s_GkAnimTimer++;
    
    u8 kickTime = 60; // 1 Second delay for all (was 30)

    // Recoil Animation (First 30 frames)
    if (s_GkAnimTimer < kickTime) {
        if (s_GkAnimTimer < 30 && (s_GkAnimTimer % 2) == 0 && s_GkRecoilY != 0) { // Faster movement (every 2 frames)
            g_Players[s_GkAnimPlayerId].Y += s_GkRecoilY;
            
            // Safety Clamp
           if(g_Players[s_GkAnimPlayerId].Y < FIELD_BOUND_Y_TOP) g_Players[s_GkAnimPlayerId].Y = FIELD_BOUND_Y_TOP;
           if(g_Players[s_GkAnimPlayerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[s_GkAnimPlayerId].Y = FIELD_BOUND_Y_BOTTOM;

            g_Players[s_GkAnimPlayerId].TargetY = g_Players[s_GkAnimPlayerId].Y; // Sync target
        }
        // Force Pose again
        if (g_Players[s_GkAnimPlayerId].TeamId == TEAM_1) g_Players[s_GkAnimPlayerId].PatternId = PLAYER_POSE_TEAM1_GK_BALL_FRONT;
        else g_Players[s_GkAnimPlayerId].PatternId = PLAYER_POSE_FRONT; // Team 2 GK plays like a player (feet)

        PutBallOnPlayerFeet(s_GkAnimPlayerId);
        
    } else if (s_GkAnimTimer == kickTime) {
        // KICK!
        u8 targetId = GetBestPassTarget(s_GkAnimPlayerId); 
        
        if (targetId != NO_VALUE) {
             PerformPass(targetId);
             
             // Update Sprite for Kick
             u8 dir = g_Players[s_GkAnimPlayerId].Direction;
             u8 team = g_Players[s_GkAnimPlayerId].TeamId;
             u8 pose;
             
             if (dir == DIRECTION_RIGHT || dir == DIRECTION_UP_RIGHT || dir == DIRECTION_DOWN_RIGHT) 
                pose = (team == TEAM_1) ? PLAYER_POSE_TEAM1_RESTART_RIGHT : PLAYER_POSE_TEAM2_RESTART_RIGHT;
             else if (dir == DIRECTION_LEFT || dir == DIRECTION_UP_LEFT || dir == DIRECTION_DOWN_LEFT)
                pose = (team == TEAM_1) ? PLAYER_POSE_TEAM1_RESTART_LEFT : PLAYER_POSE_TEAM2_RESTART_LEFT;
             else 
                pose = (team == TEAM_1) ? PLAYER_POSE_TEAM1_RESTART_FRONT : PLAYER_POSE_TEAM2_RESTART_FRONT;
             
             g_Players[s_GkAnimPlayerId].PatternId = pose;
             // Lock again
             g_Players[s_GkAnimPlayerId].Status = PLAYER_STATUS_POSITIONED;
             
             // UNLOCK GAME IMMEDIATELY
             g_MatchStatus = MATCH_IN_ACTION;

        } else {
             // Fallback if no target (should rarely happen)
             u8 team = g_Players[s_GkAnimPlayerId].TeamId;
             u8 pose = (team == TEAM_1) ? PLAYER_POSE_TEAM1_RESTART_FRONT : PLAYER_POSE_TEAM2_RESTART_FRONT;
             g_Players[s_GkAnimPlayerId].PatternId = pose;
             
             // Just shoot forward
             u16 tx = g_Players[s_GkAnimPlayerId].X;
			 u16 ty;
             if (team == TEAM_1) { // Shooting UP
				if (g_Players[s_GkAnimPlayerId].Y > (FIELD_BOUND_Y_TOP + 100)) ty = g_Players[s_GkAnimPlayerId].Y - 100;
				else ty = FIELD_BOUND_Y_TOP;
             } else { // Shooting DOWN
				if (g_Players[s_GkAnimPlayerId].Y < (FIELD_BOUND_Y_BOTTOM - 100)) ty = g_Players[s_GkAnimPlayerId].Y + 100;
				else ty = FIELD_BOUND_Y_BOTTOM;
             }

             PerformShot(tx, ty);
             
             // UNLOCK GAME IMMEDIATELY
             g_MatchStatus = MATCH_IN_ACTION;
        }
        
    } else if (s_GkAnimTimer > (kickTime + 15)) {
        // End Animation
        // g_MatchStatus = MATCH_IN_ACTION; // Moved earlier to ensure gameplay resumes while ball flies
        g_Players[s_GkAnimPlayerId].Status = PLAYER_STATUS_NONE;
    }
}

void PerformShot(u16 targetX, u16 targetY) {
    u8 fromId = g_Ball.PossessionPlayerId;
    if (fromId == NO_VALUE) return;

    i16 dx, dy, adx, ady;
    u8 newDir;

    // TURN PLAYER (Generic logic towards target point)
    dx = (i16)targetX - (i16)g_Players[fromId].X;
    dy = (i16)targetY - (i16)g_Players[fromId].Y;
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

    g_Players[fromId].Status = PLAYER_STATUS_POSITIONED; // Lock pose

    // Stop Player Movement
    g_Players[fromId].TargetX = g_Players[fromId].X;
    g_Players[fromId].TargetY = g_Players[fromId].Y;

    SetPlayerBallPossession(NO_VALUE);
    g_Ball.PossessionPlayerId = NO_VALUE;
    g_Ball.PassTargetPlayerId = NO_VALUE;
    g_Ball.ShotActive = 1;
    g_Ball.TargetX = targetX;
    g_Ball.TargetY = targetY;
    g_Ball.PassStartX = g_Ball.X;
    g_Ball.PassStartY = g_Ball.Y;
    
	// Calculate Arc Distance based on Goal Line (not target inside net) to ensure ball shrinks before entering
	i16 arcDy = dy;
	if (targetY < FIELD_BOUND_Y_TOP) { // Shooting UP
		arcDy = (i16)FIELD_BOUND_Y_TOP - (i16)g_Players[fromId].Y;
	} else if (targetY > FIELD_BOUND_Y_BOTTOM) { // Shooting DOWN
		arcDy = (i16)FIELD_BOUND_Y_BOTTOM - (i16)g_Players[fromId].Y;
	}
    g_Ball.PassTotalDist = (u16)(Math_Abs32(dx) + Math_Abs32(arcDy));
}

void TickBallFlying() {
	// If someone has the ball, it's not flying
	if (g_Ball.PossessionPlayerId != NO_VALUE) return;

	// Check if ball should be moving
	bool isMovingToPlayer = (g_Ball.PassTargetPlayerId != NO_VALUE);
	bool isFreeMoving = (g_Ball.ShotActive != 0);

	if (!isMovingToPlayer && !isFreeMoving) return;

	// 1. DETERMINE TARGET
	i16 tx, ty;
	if (isMovingToPlayer) {
		tx = g_Players[g_Ball.PassTargetPlayerId].X;
		ty = g_Players[g_Ball.PassTargetPlayerId].Y;
	} else {
		tx = g_Ball.TargetX;
		ty = g_Ball.TargetY;
	}

	// 2. MOVE BALL
	i16 dx = tx - (i16)g_Ball.X;
	i16 dy = ty - (i16)g_Ball.Y;
	
	// Speed Logic
	u8 speed = 3; 
	if (g_Ball.ShotActive == 1) speed = 5; // Fast High Shot/Kick
	else if (g_Ball.ShotActive == 2) speed = 3; // Slower Bounce
	else if (g_Ball.ShotActive == 3) speed = 2; // Rolling

	// Check Arrival
	if (dx > -speed && dx < speed && dy > -speed && dy < speed) {
		
		// --- ARRIVED AT TARGET ---

		if (isMovingToPlayer) {
			// Sticky Pass -> Magnet to player
			PutBallOnPlayerFeet(g_Ball.PassTargetPlayerId);
			g_Ball.PassTargetPlayerId = NO_VALUE;
			g_Ball.Size = 1;
			return;
		} 
		else {
			// Free Ball Event (Shot or Bounce End)
			
			// If it was a HIGH SHOT (State 1) -> Try to Bounce
			if (g_Ball.ShotActive == 1) {
				
				// Standard Bounce Logic
				// Valid field area for bounce?
				bool isInsideField = (ty >= FIELD_BOUND_Y_TOP && ty <= FIELD_BOUND_Y_BOTTOM);

				if (isInsideField) {
					// START BOUNCE (State 2)
					
					// Calculate Bounce Target (extend vector by 20%)
					i16 totalVectorX = (i16)g_Ball.TargetX - (i16)g_Ball.PassStartX;
					i16 totalVectorY = (i16)g_Ball.TargetY - (i16)g_Ball.PassStartY;

					// New start is current position
					g_Ball.PassStartX = g_Ball.X;
					g_Ball.PassStartY = g_Ball.Y;

					// New target
					i16 bounceDx = totalVectorX / 4; 
					i16 bounceDy = totalVectorY / 4; 
					
					// Don't bounce off screen
					i16 newTx = (i16)g_Ball.X + bounceDx;
					i16 newTy = (i16)g_Ball.Y + bounceDy;
					
					// Clamp Target
					if (newTx < FIELD_BOUND_X_LEFT) newTx = FIELD_BOUND_X_LEFT;
					else if (newTx > FIELD_BOUND_X_RIGHT) newTx = FIELD_BOUND_X_RIGHT;
					
					if (newTy < FIELD_BOUND_Y_TOP) newTy = FIELD_BOUND_Y_TOP;
					else if (newTy > FIELD_BOUND_Y_BOTTOM) newTy = FIELD_BOUND_Y_BOTTOM;

					g_Ball.TargetX = newTx;
					g_Ball.TargetY = newTy;
					
					// Recalculate Distance for the bounce phase
					g_Ball.PassTotalDist = (u16)(Math_Abs32(bounceDx) + Math_Abs32(bounceDy));
					
					if (g_Ball.PassTotalDist > 5) {
						g_Ball.ShotActive = 2; // Enter Bounce State
						return; 
					}
				}
			} else if (g_Ball.ShotActive == 2) {
				// TRANSITION TO ROLL (State 3)
				// Small forward movement on ground
				
				i16 vecX = (i16)g_Ball.TargetX - (i16)g_Ball.PassStartX;
				i16 vecY = (i16)g_Ball.TargetY - (i16)g_Ball.PassStartY;
				
				g_Ball.PassStartX = g_Ball.X;
				g_Ball.PassStartY = g_Ball.Y;
				
				// Roll distance = approx 1/4 of bounce distance (which was 1/4 of shot)
				i16 rollDx = vecX / 4; 
				i16 rollDy = vecY / 4; 
				
				// Ensure minimum roll if it was moving fast? 
				// Just let it die purely if very slow.
				
				i16 rollTx = (i16)g_Ball.X + rollDx;
				i16 rollTy = (i16)g_Ball.Y + rollDy;
				
				// Bounds Check
				if (rollTx < FIELD_BOUND_X_LEFT) rollTx = FIELD_BOUND_X_LEFT;
				else if (rollTx > FIELD_BOUND_X_RIGHT) rollTx = FIELD_BOUND_X_RIGHT;
				if (rollTy < FIELD_BOUND_Y_TOP) rollTy = FIELD_BOUND_Y_TOP;
				else if (rollTy > FIELD_BOUND_Y_BOTTOM) rollTy = FIELD_BOUND_Y_BOTTOM;

				g_Ball.TargetX = rollTx;
				g_Ball.TargetY = rollTy;
				g_Ball.PassTotalDist = (u16)(Math_Abs32(rollDx) + Math_Abs32(rollDy));
				
				if (g_Ball.PassTotalDist > 2) {
					g_Ball.ShotActive = 3; // ROLLING
					return;
				}
			}

			// STOP BALL (End of Bounce/Roll or Out of Bounds or blocked)
			g_Ball.ShotActive = 0;
			g_Ball.PassTargetPlayerId = NO_VALUE;
			g_Ball.PossessionPlayerId = NO_VALUE;
			g_Ball.Size = 1;
			
			return;
		}
	}

	// 3. UPDATE POSITION
	if (Math_Abs32(dx) > Math_Abs32(dy)) {
		g_Ball.X += (dx > 0 ? speed : -speed);
		if (dx != 0) g_Ball.Y += (dy * speed) / Math_Abs32(dx);
	} else {
		g_Ball.Y += (dy > 0 ? speed : -speed);
		if (dy != 0) g_Ball.X += (dx * speed) / Math_Abs32(dy);
	}

	// 4. UPDATE SIZE (HEIGHT ARC)
	i16 diffStartX = (i16)g_Ball.X - (i16)g_Ball.PassStartX;
	i16 diffStartY = (i16)g_Ball.Y - (i16)g_Ball.PassStartY;
	u16 distCovered = (u16)(Math_Abs32(diffStartX) + Math_Abs32(diffStartY));
	
	u16 totalDist = g_Ball.PassTotalDist;
	if (totalDist == 0) totalDist = 1; // Safety

	// Check out of bounds safety (Ball disappears fix)
	if (g_Ball.X < 0 || g_Ball.X > 255 || g_Ball.Y < 0 || g_Ball.Y > 211) {
		// Reset if widely out of bounds
        // But only if really far, to allow goal-line cross
        if(g_Ball.Y > 230 || g_Ball.Y < 20) {
             // Let CheckBallBoundaries handle goal/out logic, 
             // but if it's crazy values, clamp or stop.
        }
	}

	if (g_Ball.ShotActive == 2) {
		// BOUNCE ARC (Low)
		u16 ratio = (distCovered * 100) / totalDist;
		if (ratio < 20 || ratio > 80) g_Ball.Size = 2;
		else g_Ball.Size = 3;
	} 
	else if (g_Ball.ShotActive == 3) {
		// ROLLING (Ground)
		g_Ball.Size = 1;
	}
	else if (g_Ball.ShotActive == 1) {
		// SHOT ARC (High)
		// User Request: Cap at Size 2 for shots
		g_Ball.Size = 2;
		/*
		u16 ratio = (distCovered * 100) / totalDist;
		if (ratio < 10 || ratio > 90) g_Ball.Size = 2;
		else if (ratio < 25 || ratio > 75) g_Ball.Size = 3;
		else g_Ball.Size = 4; // High
		*/
	}
	else {
		// PASS ARC (Medium)
		if (totalDist > 40) {
			u16 ratio = (distCovered * 100) / totalDist;
			if (ratio < 15 || ratio > 85) g_Ball.Size = 2;
			else g_Ball.Size = 3;
		} else {
			g_Ball.Size = 2;
		}
	}
	
	g_Ball.PreviousY = g_Ball.Y;
}