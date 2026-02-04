// ─────────────────────────────────────────────────────────────────────────────
//  EXSOCCER - 2026 Fausto Pracek (fpracek@gmail.com)
// ─────────────────────────────────────────────────────────────────────────────

#include "msxgl.h"
#include "v9990.h"
#include "print.h"
#include "exsoccer.h"
#include "debug.h"
#include "input.h"
//#include "ayfx/ayfx_player.h"

extern u16 				g_FrameCounter;
extern PonPonGirlInfo   g_PonPonGirls[];					
extern int  			g_FieldCurrentYPosition;			
extern u8       		g_ActiveFieldZone;					
extern u8               g_ponPonPatternIndex;
extern u8               g_PonPonGrilsPoseCounter;
extern bool             g_peopleState;
extern u8               g_ponPonGirlsInitailized;
extern u8               g_MatchStatus;
extern u8 				g_PonPonGirlsPos[6];
extern u8 			    g_GirlPatterns[];
extern PlayerInfo  		g_Players[15];						// Bank 1 = Segment 0
extern BallInfo    		g_Ball;								// Bank 1 = Segment 0
extern u8          		g_Team1ActivePlayer;				// Bank 1 = Segment 0
extern u8          		g_Team2ActivePlayer;				// Bank 1 = Segment 0
extern bool 			g_GameWith2Players;
extern u8 				g_FieldScrollingActionInProgress; 	// Bank 1 = Segment 0
extern u8 				g_FieldScrollSpeed;					// Bank 1 = Segment 0
extern u8       		g_Timer;							// Bank 1 = Segment 0


void TickPlayerToOwnTarget(){
    //if(g_MatchStatus == MATCH_AFTER_IN_GOAL) return; // FIX: Referee moves during celebration
	if(g_MatchStatus!=MATCH_NOT_STARTED){
		bool allPlayersInPosition = true;
		
		static u8 s_GkMoveTick = 0;
		s_GkMoveTick++;
		for(u8 i=0;i<15;i++){
			// --- Portieri seguono la X della palla SOLO in MATCH_IN_ACTION ---
			if (g_MatchStatus == MATCH_IN_ACTION && g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
                // Stop tracking if ball is being shot (prevent magnetic save)
                if (g_Ball.ShotActive) continue; 

				// Movimento mitigato (ogni 2 tick) per evitare tremolio e scatti
				if ((s_GkMoveTick & 1) == 0) { 
					u16 minX = GOAL_X_MIN;
					u16 maxX = GOAL_X_MAX;
					u16 desiredX = g_Ball.X;

                    // Strong GK Center Bias (Stay closer to center to cover both sides)
                    const TeamStats* stats = GetTeamStats(g_Players[i].TeamId);
                    if (stats->GkSkill >= 15) {
                         desiredX = (g_Ball.X + FIELD_POS_X_CENTER) / 2;
                    }
					
					if (desiredX < minX) desiredX = minX;
					if (desiredX > maxX) desiredX = maxX;
					
					i16 diff = (i16)desiredX - (i16)g_Players[i].X;
					
					// Deadzone di 2px per evitare micro-aggiustamenti continui
					if (diff > 2) g_Players[i].X++;
					else if (diff < -2) g_Players[i].X--;
				}
				// Sincronizza TargetX per evitare conflitti con la logica di movimento generica
				g_Players[i].TargetX = g_Players[i].X;
			}
			
			if(g_MatchStatus == MATCH_AFTER_IN_GOAL) {
				if(i != REFEREE) continue;
				// Force Referee Target to KickOff Position immediately
				g_Players[i].TargetX=FIELD_POS_X_CENTER - 30; 
				g_Players[i].TargetY=FIELD_POS_Y_CENTER - 40; 
			}

			if (i == REFEREE && (g_MatchStatus == MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER)) continue;
			
			// SKIP ACTIVE PLAYERS (Controlled by Joystick) - UNLESS performing a set piece setup
			bool isSetPieceSetup = (g_MatchStatus == MATCH_BEFORE_CORNER_KICK || g_MatchStatus == MATCH_BEFORE_GOAL_KICK || g_MatchStatus == MATCH_BEFORE_OFFSIDE || g_MatchStatus == MATCH_BEFORE_THROW_IN);
			bool isGkRestart = (g_MatchStatus == MATCH_BALL_ON_GOALKEEPER);
			
			if (!isSetPieceSetup && !isGkRestart) {
				if (g_Team1ActivePlayer != NO_VALUE && i == g_Team1ActivePlayer) continue;
				if (g_GameWith2Players && g_Team2ActivePlayer != NO_VALUE && i == g_Team2ActivePlayer) continue;
			}
			
			// Check if this specific player is in position
			bool playerInPosition = (g_Players[i].X == g_Players[i].TargetX && g_Players[i].Y == g_Players[i].TargetY);
            
            // Only care about "in position" for KickOff logic if we are in that phase
            if (g_MatchStatus == MATCH_BEFORE_KICK_OFF && !playerInPosition) {
                 allPlayersInPosition = false;
            }

			if(g_MatchStatus==MATCH_IN_ACTION){
                const TeamStats* stats = GetTeamStats(g_Players[i].TeamId);
                u8 speed = stats->Speed;
                
                // Speed Logic (Frame Skipping)
                // Human is 1/3 (20fps)
                // Speed 0: 1/4 (15fps) -> Run on 0
                // Speed 1: 1/3 (20fps) -> Run on 0
                // Speed 2: 1/2 (30fps) -> Run on 0, 2
                // Speed 3: 2/3 (40fps) -> Run on 0, 1 (Standard AI)
                // Speed 4: 3/4 (45fps) -> Run on 0, 1, 2
                // Speed 5: 1/1 (60fps) -> Run always
                
                u8 tick = g_FrameCounter % 12; // Common multiple
                bool move = false;
                if (speed == 0) { if ((tick % 4) == 0) move = true; }
                else if (speed == 1) { if ((tick % 3) == 0) move = true; }
                else if (speed == 2) { if ((tick % 2) == 0) move = true; }
                else if (speed == 3) { if ((tick % 3) != 2) move = true; } // 0, 1, 3, 4...
                else if (speed == 4) { if ((tick % 4) != 3) move = true; }
                else move = true;
                
                if (!move) continue;
			} else {
				g_Players[i].AiTickCounter=0;
			}
			
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
			}
            
            // PutBall Logic (Moved outside to ensure it runs even when stopped)
            if (g_MatchStatus == MATCH_IN_ACTION || (isSetPieceSetup && g_Ball.PossessionPlayerId == i)) {
                if (g_Ball.PossessionPlayerId == i) {
                    // Only animate dribble if actually moving (not in position)
                    if (!playerInPosition && g_MatchStatus == MATCH_IN_ACTION) {
                        if (g_Ball.KickMoveState == NO_VALUE) g_Ball.KickMoveState = 0;
                        g_Ball.KickMoveState++;
                        if (g_Ball.KickMoveState > 3) g_Ball.KickMoveState = 0;
                    } else {
                        g_Ball.KickMoveState = 0;
                    }
                    PutBallOnPlayerFeet(i);
                }
            }

			if (playerInPosition) {
                // Stop animation when in position (Fix Moonwalking)
				if (g_MatchStatus == MATCH_BEFORE_CORNER_KICK || g_MatchStatus == MATCH_BEFORE_GOAL_KICK || 
                    g_MatchStatus == MATCH_BEFORE_OFFSIDE || g_MatchStatus == MATCH_BEFORE_THROW_IN) {
					if (g_Players[i].Status != PLAYER_STATUS_POSITIONED) {
                        g_Players[i].Status = PLAYER_STATUS_POSITIONED;
						g_Players[i].Direction = DIRECTION_NONE;
                        u8 useDir = g_Players[i].PreviousDirection;
                        if (useDir == DIRECTION_NONE) {
                             // Fallback direction
                             if(g_MatchStatus == MATCH_BEFORE_THROW_IN) {
                                  // Look at field center
                                  if(g_Ball.X < 128) useDir = DIRECTION_RIGHT; else useDir = DIRECTION_LEFT;
                             } else {
                                  useDir = DIRECTION_DOWN; 
                             }
                        }
						g_Players[i].PatternId = GetNoMovingPlayerPatternId(useDir);
					}
				}
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
void InitPonPonGirls(){
	g_ponPonPatternIndex=0;
	
	for(u8 i=0;i<6;i++){
		g_PonPonGirls[i].X=g_PonPonGirlsPos[i];
		g_PonPonGirls[i].Y=42;
		g_PonPonGirls[i].PatternId=SPRITE_GIRL_1;
        PutPonPonGirlSprite(i);
        
	}
}
void TickPonPonGirlsAnimation(){
	if(g_MatchStatus!=MATCH_AFTER_IN_GOAL){
		if(!g_ponPonGirlsInitailized){
			InitPonPonGirls();
			g_ponPonGirlsInitailized=true;
		
		}
		return;
	}
	g_ponPonGirlsInitailized=false;
	if(g_PonPonGrilsPoseCounter==PON_PON_GIRLS_POSE_SPEED){
		g_PonPonGrilsPoseCounter=0;
	}
	else{
		g_PonPonGrilsPoseCounter++;
		return;
	}
	


	g_ponPonPatternIndex++;
	if(g_ponPonPatternIndex >= 9) g_ponPonPatternIndex = 0;

	u8 pat = g_GirlPatterns[g_ponPonPatternIndex];

	for(u8 i=0; i<6; i++){
		g_PonPonGirls[i].PatternId = pat;
		PutPonPonGirlSprite(i);
	}
	g_peopleState=!g_peopleState;
	PeopleMoving(g_peopleState);
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