// ─────────────────────────────────────────────────────────────────────────────
//  EXSOCCER - 2026 Fausto Pracek (fpracek@gmail.com)
// ─────────────────────────────────────────────────────────────────────────────

#include "msxgl.h"
#include "v9990.h"
#include "print.h"
#include "exsoccer.h"
#include "debug.h"


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
// ===============
// *** PALETTE ***
// ===============
const unsigned char g_GameFieldLayerATilesPalette[] =
{
  	0x00, 0x00, 0x00, // [0] Transparent (treat as color-key / background)
  	0x01, 0x01, 0x01, // [1] #010101 
 	0x01, 0x01, 0x01, // [2] #010101 (SHOES)
	0x01, 0x01, 0x01, // [3] #010101
	0xFF, 0xFF, 0xFF, // [4] #F7D647 (MOUTH)
  	0x1E, 0x1A, 0x08, // [5] #F7D647 (FACE)
  	0x01, 0x01, 0x01, // [6] #010101 (T-SHIRT_BORDERS)
  	0x14, 0x09, 0x14, // [7] #A349A4 (T-SHIRT)
  	0x1B, 0x13, 0x09, // [8] #DE9747 (SHORTS)
  	0x01, 0x01, 0x01, // [9] #010101
  	0x01, 0x01, 0x01, // [A] #010101
  	0x01, 0x01, 0x01, // [B] #010101
  	0x01, 0x01, 0x01, // [C] #010101
  	0x01, 0x01, 0x01, // [D] #010101
  	0x01, 0x01, 0x01, // [E] #010101
  	0xFF, 0xFF, 0xFF, // [F] #FFFFFF
};
const unsigned char g_GameFieldLayerBTilesPalette[] =
{
	0x00, 0x00, 0x00, // [0] Transparent (treat as color-key / background)
	0x08, 0x17, 0x1B, // [1] #47B8DE
	0x01, 0x01, 0x01, // [2] #010101 (SHOES)
	0x01, 0x01, 0x01, // [3] #0B0B0B 
	0x01, 0x01, 0x01, // [4] #010101 
	0x1E, 0x1A, 0x08, // [5] #F7D647 (FACE)
	0x01, 0x01, 0x01, // [6] #010101 (T-SHIRT_BORDERS)
  	0x01, 0x01, 0x01, // [7] #0B0B0B (T-SHIRT)
	0x01, 0x01, 0x01, // [8] #0B0B0B (SHORTS)
	0x1F, 0x00, 0x00, // [9] #FF0000
	0x1B, 0x1B, 0x1B, // [A] #DEDEDE
	0x04, 0x04, 0x1B, // [B] #2121DE
	0x00, 0x00, 0x00, // [C] #000000
	0x1B, 0x1B, 0x1B, // [D] #DEDEDE
	0x00, 0x17, 0x00, // [E] #00B800
	0x1B, 0x13, 0x09, // [F] #DE9747
};
const unsigned char g_Sprites1_palette_ita[] =
{
	0x00, 0x00, 0x00, // [0] Transparent (treat as color-key / background)
	0x14, 0x09, 0x14, // [1] #A349A4
	0x01, 0x01, 0x01, // [2] #010101 (SHOES)
	0x05, 0x03, 0x01, // [3] #2F1F0D 
	0x1B, 0x1A, 0x1B, // [4] #DCD7D9 
	0x1E, 0x1A, 0x08, // [5] #F7D647 (FACE)
	0x1B, 0x1A, 0x1B, // [6] #DCD7D9 (T-SHIRT_BORDERS)
	0x09, 0x16, 0x1B, // [7] #4CB7DA (T-SHIRT)
	0x1B, 0x1A, 0x1B, // [8] #DCD7D9 (SHORTS)
	0x1B, 0x13, 0x09, // [9] #DD9C48
	0x1F, 0x1E, 0x01, // [A] #FAF60F
	0x1D, 0x03, 0x02, // [B] #EB1A12
	0x05, 0x03, 0x01, // [C] #2F1F0E
	0x01, 0x01, 0x01, // [D] #0C0C0C
	0x01, 0x01, 0x01, // [E] #0D0D0D
	0x01, 0x01, 0x01, // [F] #0E0E0E
};
const unsigned char g_Sprites1_palette_aus[] =
{
	0x00, 0x00, 0x00, // [0] Transparent (treat as color-key / background)
	0x14, 0x09, 0x14, // [1] #A349A4
	0x01, 0x01, 0x01, // [2] #010101 (SHOES)
	0x05, 0x03, 0x01, // [3] #2F1F0D 
	0x1B, 0x1A, 0x1B, // [4] #DCD7D9 
	0x1E, 0x1A, 0x08, // [5] #F7D647 (FACE)
	0x1B, 0x1A, 0x1B, // [6] #DCD7D9 (T-SHIRT_BORDERS)
	0x05, 0x03, 0x01, // [7] #2F1F0D (T-SHIRT)
	0x1B, 0x1A, 0x1B, // [8] #DCD7D9 (SHORTS)
	0x1B, 0x13, 0x09, // [9] #DD9C48
	0x1F, 0x1E, 0x01, // [A] #FAF60F
	0x1D, 0x03, 0x02, // [B] #EB1A12
	0x05, 0x03, 0x01, // [C] #2F1F0E
	0x01, 0x01, 0x01, // [D] #0C0C0C
	0x01, 0x01, 0x01, // [E] #0D0D0D
	0x01, 0x01, 0x01, // [F] #0E0E0E
};
const unsigned char g_Sprites1_palette_fra[] =
{
	0x00, 0x00, 0x00, // [0] Transparent (treat as color-key / background)
	0x14, 0x09, 0x14, // [1] #A349A4
	0x01, 0x01, 0x01, // [2] #010101 (SHOES)
	0x05, 0x03, 0x01, // [3] #2F1F0D 
	0x1B, 0x1A, 0x1B, // [4] #DCD7D9 
	0x1E, 0x1A, 0x08, // [5] #F7D647 (FACE)
	0x1B, 0x1A, 0x1B, // [6] #DCD7D9 (T-SHIRT BORDERS)
	0x04, 0x04, 0x1B, // [7] #2121DE (T-SHIRT)
	0x1B, 0x1A, 0x1B, // [8] #DCD7D9 (SHORTS)
	0x1B, 0x13, 0x09, // [9] #DD9C48
	0x1F, 0x1E, 0x01, // [A] #FAF60F
	0x1D, 0x03, 0x02, // [B] #EB1A12
	0x05, 0x03, 0x01, // [C] #2F1F0E
	0x01, 0x01, 0x01, // [D] #0C0C0C
	0x01, 0x01, 0x01, // [E] #0D0D0D
	0x01, 0x01, 0x01, // [F] #0E0E0E
};
const unsigned char g_Sprites1_palette_ger[] =
{
	0x00, 0x00, 0x00, // [0] Transparent (treat as color-key / background)
	0x14, 0x09, 0x14, // [1] #A349A4
	0x01, 0x01, 0x01, // [2] #010101 (SHOES)
	0x05, 0x03, 0x01, // [3] #2F1F0D 
	0x1B, 0x1A, 0x1B, // [4] #DCD7D9 
	0x1E, 0x1A, 0x08, // [5] #F7D647 (FACE)
	0x05, 0x03, 0x01, // [6] #2F1F0D (T-SHIRT_BORDERS)
	0x1B, 0x1A, 0x1B, // [7] #DCD7D9 (T-SHIRT)
	0x1F, 0x00, 0x00, // [8] #FF0000 (SHORTS)
	0x1B, 0x13, 0x09, // [9] #DD9C48
	0x1F, 0x1E, 0x01, // [A] #FAF60F
	0x1D, 0x03, 0x02, // [B] #EB1A12
	0x05, 0x03, 0x01, // [C] #2F1F0E
	0x01, 0x01, 0x01, // [D] #0C0C0C
	0x01, 0x01, 0x01, // [E] #0D0D0D
	0x01, 0x01, 0x01, // [F] #0E0E0E
};
const unsigned char g_Sprites1_palette_gbr[] =
{
	0x00, 0x00, 0x00, // [0] Transparent (treat as color-key / background)
	0x14, 0x09, 0x14, // [1] #A349A4
	0x01, 0x01, 0x01, // [2] #010101 (SHOES)
	0x05, 0x03, 0x01, // [3] #2F1F0D 
	0x1B, 0x1A, 0x1B, // [4] #DCD7D9 
	0x1E, 0x1A, 0x08, // [5] #F7D647 (FACE)
	0x01, 0x01, 0x01, // [6] #0C0C0C (T-SHIRT BORDERS)
	0x1B, 0x1A, 0x1B, // [7] #DCD7D9 (T-SHIRT)
	0x01, 0x01, 0x01, // [8] #0C0C0C (SHORTS)
	0x1B, 0x13, 0x09, // [9] #DD9C48
	0x1F, 0x1E, 0x01, // [A] #FAF60F
	0x1D, 0x03, 0x02, // [B] #EB1A12
	0x05, 0x03, 0x01, // [C] #2F1F0E
	0x01, 0x01, 0x01, // [D] #0C0C0C
	0x01, 0x01, 0x01, // [E] #0D0D0D
	0x01, 0x01, 0x01, // [F] #0E0E0E
};
const unsigned char g_Sprites1_palette_bra[] =
{
	0x00, 0x00, 0x00, // [0] Transparent (treat as color-key / background)
	0x14, 0x09, 0x14, // [1] #A349A4
	0x01, 0x01, 0x01, // [2] #010101 (SHOES)
	0x05, 0x03, 0x01, // [3] #2F1F0D 
	0x1B, 0x1A, 0x1B, // [4] #DCD7D9 
	0x1E, 0x1A, 0x08, // [5] #F7D647 (FACE)
	0x1B, 0x13, 0x09, // [6] #DD9C48 (T-SHIRT BORDERS)
	0x00, 0x0A, 0x03, // [7] #04521b (T-SHIRT)
	0x1B, 0x13, 0x09, // [8] #DD9C48 (SHORTS)
	0x1B, 0x13, 0x09, // [9] #DD9C48
	0x1F, 0x1E, 0x01, // [A] #FAF60F
	0x1D, 0x03, 0x02, // [B] #EB1A12
	0x05, 0x03, 0x01, // [C] #2F1F0E
	0x01, 0x01, 0x01, // [D] #0C0C0C
	0x01, 0x01, 0x01, // [E] #0D0D0D
	0x01, 0x01, 0x01, // [F] #0E0E0E
};

// VARIABLES
extern u16 	g_FrameCounter; // Bank 1 = Segment 0
extern bool g_VSynch; // Bank 1 = Segment 0

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

// *** INIT FUNCTIONS ***

void InitPalette()
{
	V9_SetPalette(0, 16, g_GameFieldLayerATilesPalette);
	V9_SetPalette(16, 16, g_GameFieldLayerBTilesPalette);
	V9_SelectPaletteP1(0,1);
}
void UpdateV9990()
{
	WaitV9990Synch();
	TickP1();
}
void InitVariables(){
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

// *** TICK ***
//-----------------------------------------------------------------------------
// Game tick
void TickP1(){
	TickFieldScrollingAction();
}
//-----------------------------------------------------------------------------
// Active field zone management
void TickActiveFieldZone(){
	if(g_Ball.PreviousY!=g_Ball.Y){
		if(g_ActiveFieldZone==FIELD_CENTRAL_ZONE){
			if(g_Ball.Y<=195 && g_Ball.PreviousY>g_Ball.Y){
				ShowFieldZone(FIELD_NORTH_ZONE);
			}
			if(g_Ball.Y>=300 && g_Ball.PreviousY<g_Ball.Y){
				ShowFieldZone(FIELD_SOUTH_ZONE);
			}
		}
		else{
			if(g_ActiveFieldZone==FIELD_NORTH_ZONE){
				if(g_Ball.Y>165 && g_Ball.PreviousY<g_Ball.Y){
					ShowFieldZone(FIELD_CENTRAL_ZONE);
				}
			}
			else{
				if(g_Ball.Y<330 && g_Ball.PreviousY>g_Ball.Y){
					ShowFieldZone(FIELD_CENTRAL_ZONE);
				}
			}
		}
		g_Ball.PreviousY=g_Ball.Y;
	}
	
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
void TickFieldScrollingAction(){
	if(g_FieldScrollingActionInProgress!=NO_VALUE){
		
		switch (g_FieldScrollingActionInProgress){
			case FIELD_NORTH_ZONE:
				g_FieldCurrentYPosition=g_FieldCurrentYPosition-g_FieldScrollSpeed;
				if(g_FieldCurrentYPosition<0){
					g_FieldCurrentYPosition=1;
					g_FieldScrollingActionInProgress=NO_VALUE;
					g_ActiveFieldZone=FIELD_NORTH_ZONE;
				}
				break;
			case FIELD_CENTRAL_ZONE:
				if(g_FieldCurrentYPosition!=136){
					if(g_FieldCurrentYPosition>FIELD_CENTRAL_Y){
						g_FieldCurrentYPosition=g_FieldCurrentYPosition-g_FieldScrollSpeed;
					}
					else{
						g_FieldCurrentYPosition=g_FieldCurrentYPosition+g_FieldScrollSpeed;
					}

				}
				else{
					g_FieldScrollingActionInProgress=NO_VALUE;
					g_ActiveFieldZone=FIELD_CENTRAL_ZONE;
					if(g_MatchStatus==MATCH_NOT_STARTED){
						g_MatchStatus=MATCH_BEFORE_KICK_OFF;
						for(u8 i=0;i<15;i++){
							SetPlayerTarget(i);
						}
						TickPlayerToOwnTarget();
						
					}
				}
				break;
			case FIELD_SOUTH_ZONE:
				g_FieldCurrentYPosition=g_FieldCurrentYPosition+g_FieldScrollSpeed;
				if(g_FieldCurrentYPosition>=FIELD_BOTTOM_Y){
					g_ActiveFieldZone=FIELD_SOUTH_ZONE;
					g_FieldScrollingActionInProgress=NO_VALUE;
				}
				break;
		}
		V9_SetScrollingBY(g_FieldCurrentYPosition);
	}
}
void TickShowKickOff(){
	if(g_MatchStatus==MATCH_KICK_OFF){
		if(g_Timer==1){
			V9_PrintLayerAStringAtPos(12,18,"KICK OFF");
			g_Timer=2;
		}
		if(g_Timer==3){
			ClearTextFromLayerA(12,18,9);
			g_Timer=NO_VALUE;
			//for(u8 i=0;i<14;i++){
			//	g_Players[i].Status=PLAYER_STATUS_NONE;
			//}
			u8 playerId=NO_VALUE;
			if(g_RestartKickTeamId==TEAM_1){
				playerId=GetPlayerIdByRole(TEAM_1,PLAYER_ROLE_RIGHT_HALFFIELDER);
			}
			else{
				playerId=GetPlayerIdByRole(TEAM_2,PLAYER_ROLE_LEFT_HALFFIELDER);
			}
			PutBallOnPlayerFeet(playerId);
			//g_Players[playerId].PatternId=GetPatternIdByPoseAndDirection(g_Players[playerId].Direction,g_Players[playerId].LastPose);

		}
	}
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
void PutBallOnPlayerFeet(u8 playerId){
	g_Ball.PossessionPlayerId=playerId;
	switch (g_Players[playerId].Direction){
		case SPRITE_DIRECTION_UP:
			g_Ball.X=g_Players[playerId].X;
			g_Ball.Y=g_Players[playerId].Y-5;
			g_Ball.PreviousY=g_Ball.Y;
			g_Ball.Direction=g_Players[playerId].Direction;
			break;
		case SPRITE_DIRECTION_DOWN:
			g_Ball.X=g_Players[playerId].X;
			g_Ball.Y=g_Players[playerId].Y+5;
			g_Ball.PreviousY=g_Ball.Y;
			g_Ball.Direction=g_Players[playerId].Direction;
			break;
		case SPRITE_DIRECTION_LEFT:
			g_Ball.X=g_Players[playerId].X-5;
			g_Ball.Y=g_Players[playerId].Y;
			g_Ball.PreviousY=g_Ball.Y;
			g_Ball.Direction=g_Players[playerId].Direction;
			break;
		case SPRITE_DIRECTION_RIGHT:
			g_Ball.X=g_Players[playerId].X;
			g_Ball.Y=g_Players[playerId].Y+5;
			g_Ball.PreviousY=g_Ball.Y;
			g_Ball.Direction=g_Players[playerId].Direction;
			break;
		case SPRITE_DIRECTION_UP_LEFT:
			g_Ball.X=g_Players[playerId].X-5;
			g_Ball.Y=g_Players[playerId].Y-5;
			g_Ball.PreviousY=g_Ball.Y;
			g_Ball.Direction=g_Players[playerId].Direction;
			break;
		case SPRITE_DIRECTION_UP_RIGHT:
			g_Ball.X=g_Players[playerId].X+5;
			g_Ball.Y=g_Players[playerId].Y-5;
			g_Ball.PreviousY=g_Ball.Y;
			g_Ball.Direction=g_Players[playerId].Direction;
			break;
		case SPRITE_DIRECTION_DOWN_LEFT:
			g_Ball.X=g_Players[playerId].X-5;
			g_Ball.Y=g_Players[playerId].Y+5;
			g_Ball.PreviousY=g_Ball.Y;
			g_Ball.Direction=g_Players[playerId].Direction;
			break;
		case SPRITE_DIRECTION_DOWN_RIGHT:
			g_Ball.X=g_Players[playerId].X+5;
			g_Ball.Y=g_Players[playerId].Y-5;
			g_Ball.PreviousY=g_Ball.Y;
			g_Ball.Direction=g_Players[playerId].Direction;
			break;
	}
}
void SetPlayerTarget(u8 playerId){
	switch(g_MatchStatus){
		case MATCH_BEFORE_KICK_OFF:
			if(g_Players[playerId].TeamId==REFEREE){
				g_Players[playerId].TargetX=g_Players[playerId].X;
				g_Players[playerId].TargetY=g_Players[playerId].Y;
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
void UpdateSpritesPositions(){
	SET_BANK_SEGMENT(1, 3); // Bank 1 = Segment 8
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
	switch (g_Ball.Size){
		case 1:
			attr.Pattern=BALL_SIZE_1;
			break;
		case 2:
			attr.Pattern=BALL_SIZE_2;
			break;
		case 3:
			attr.Pattern=BALL_SIZE_3;
			break;
		case 4:
			attr.Pattern=BALL_SIZE_4;
			break;
		case 5:
			attr.Pattern=BALL_SIZE_5;
			break;
		case 6:
			attr.Pattern=BALL_SIZE_6;
			break;
		case 7:
			attr.Pattern=BALL_SIZE_7;
			break;
		case 8:
			attr.Pattern=BALL_SIZE_8;
			break;
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
			V9_PrintLayerAStringAtPos(0,0,"AUS");
			break; 
		case TEAM_BRA:
			V9_PrintLayerAStringAtPos(0,0,"BRA");
			break;
		case TEAM_ITA:
			V9_PrintLayerAStringAtPos(0,0,"ITA");
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
			V9_PrintLayerAStringAtPos(12,0,"AUS");
			break; 
		case TEAM_BRA:
			V9_PrintLayerAStringAtPos(12,0,"BRA");
			break;
		case TEAM_ITA:
			V9_PrintLayerAStringAtPos(12,0,"ITA");
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
void SetTeam1Palette(){
	V9_SetPalette(32, 16, GetTeamPaletteById(g_Team1PaletteId));
}
void SetTeam2Palette(){
	V9_SetPalette(48, 16, GetTeamPaletteById(g_Team2PaletteId));
}
const u16* GetTeamPaletteById(u8 id){
	const u16* palette=g_Sprites1_palette_ita;
	switch (id){
		case TEAM_AUS:
			palette=g_Sprites1_palette_aus;
			break; 
		case TEAM_BRA:
			palette=g_Sprites1_palette_bra;
			break;
		case TEAM_ITA:
			palette=g_Sprites1_palette_ita;
			break;
		case TEAM_GBR:
			palette=g_Sprites1_palette_gbr;
			break;
		case TEAM_GER:
			palette=g_Sprites1_palette_ger;
			break;
		case TEAM_FRA:
			palette=g_Sprites1_palette_fra;
			break;
	}
	return palette;
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
	if(playerId==g_Ball.PossessionPlayerId){
		attr.Pattern=attr.Pattern+64;
	}
	attr.X = g_Players[playerId].X;
	attr.P = 1;
	
	V9_SetSpriteP1(playerId, &attr);

}
void UpdatePlayerPatternByDirection(u8 id){
	if(g_Players[id].Status==PLAYER_STATUS_POSITIONED){
		return;
	}
	u8 pose=g_Players[id].LastPose;
	if(g_Players[id].Direction!=g_Players[id].PreviousDirection){
		g_Players[id].PreviousDirection!=g_Players[id].Direction;
		pose=GetNewPoseByDirection(g_Players[id].Direction);
	}
	else{
		if(g_Players[id].LastPose==1){
			g_Players[id].LastPose=0;
		}
		else{
			g_Players[id].LastPose=1;
		}
	}

	if(g_Players[id].TeamId==REFEREE && g_MatchStatus==MATCH_BEFORE_KICK_OFF ){
		g_Players[id].PatternId=PLAYER_POSE_RIGHT;
	}
	else{
		g_Players[id].PatternId=GetPatternIdByPoseAndDirection(g_Players[id].Direction,g_Players[id].LastPose);
	}

	
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
	g_Players[REFEREE].Role=NO_VALUE;
	g_Players[REFEREE].Status=PLAYER_STATUS_NONE;
	ResetPlayersInfo();
	SetPlayerTarget(REFEREE);

	for(u8 i=0;i<14;i++){
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
	g_Ball.Size=1;
	g_Ball.Direction=SPRITE_DIRECTION_NONE;
	g_Ball.PossessionPlayerId=NO_VALUE;
}
void ResetPlayersInfo(){
	for(u8 i=0;i<14;i++){
		g_Players[i].Direction=SPRITE_DIRECTION_NONE;
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
	if(g_MatchStatus!=MATCH_NOT_STARTED){
		for(u8 i=0;i<15;i++){
			
			if(g_Players[i].X!=g_Players[i].TargetX || g_Players[i].Y!=g_Players[i].TargetY){
				if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
					g_Players[i].Direction=SPRITE_DIRECTION_UP_RIGHT;
					g_Players[i].X++;
					g_Players[i].Y--;
				}
				if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
					g_Players[i].Direction=SPRITE_DIRECTION_UP_LEFT;
					g_Players[i].X--;
					g_Players[i].Y--;
				}
				if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
					g_Players[i].Direction=SPRITE_DIRECTION_DOWN_LEFT;
					g_Players[i].X--;
					g_Players[i].Y++;
				}

				if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
					g_Players[i].Direction=SPRITE_DIRECTION_DOWN_RIGHT;
					g_Players[i].X++;
					g_Players[i].Y++;
				}
				
				if(g_Players[i].X<g_Players[i].TargetX && g_Players[i].Y==g_Players[i].TargetY){
					g_Players[i].Direction=SPRITE_DIRECTION_RIGHT;
					g_Players[i].X++;
				}
				if(g_Players[i].X>g_Players[i].TargetX && g_Players[i].Y==g_Players[i].TargetY){
							g_Players[i].Direction=SPRITE_DIRECTION_LEFT;
					g_Players[i].X--;
				}
				if(g_Players[i].X==g_Players[i].TargetX && g_Players[i].Y>g_Players[i].TargetY){
					g_Players[i].Direction=SPRITE_DIRECTION_UP;
					g_Players[i].Y--;
				}
				if(g_Players[i].X==g_Players[i].TargetX && g_Players[i].Y<g_Players[i].TargetY){
					g_Players[i].Direction=SPRITE_DIRECTION_DOWN;
					g_Players[i].Y++;
				}
				if(g_Players[i].LastPose==0){
					g_Players[i].LastPose=1;
				}
				else{
					g_Players[i].LastPose=0;
				}
			}
			else{
				//DEBUG_LOGNUM("TEST",g_MatchStatus);
				if(g_MatchStatus==MATCH_BEFORE_KICK_OFF){
					
					if(g_Players[i].PatternId!=PLAYER_POSE_BACK && g_Players[i].PatternId!=PLAYER_POSE_FRONT){
						g_Players[i].Status=PLAYER_STATUS_POSITIONED;
						if(g_Players[i].TeamId==TEAM_1){
							g_Players[i].PatternId=PLAYER_POSE_BACK;
							g_Players[i].Direction=SPRITE_DIRECTION_UP;
						}
						else{
							g_Players[i].PatternId=PLAYER_POSE_FRONT;
							g_Players[i].Direction=SPRITE_DIRECTION_DOWN;
						}
						PutPlayerSprite(i);
					}
					
					if(i==0){
						g_FieldScrollSpeed=FIELD_SCROLL_GAME_SPEED;
						g_MatchStatus=MATCH_KICK_OFF;
						g_Timer=0;
					}
				}
			}
			
		}
		//DEBUG_BREAK();
	}
}
u8 GetNewPoseByDirection(u8 direction){
	u8 pose=NO_VALUE;
	switch (direction)
	{
	case SPRITE_DIRECTION_DOWN:
		pose=PLAYER_POSE_MOVE_DOWN_1;
		break;
	case SPRITE_DIRECTION_UP:
		pose=PLAYER_POSE_MOVE_UP_1;
		break;
	case SPRITE_DIRECTION_LEFT:
		pose=PLAYER_POSE_MOVE_LEFT_1;
		break;	
	case SPRITE_DIRECTION_RIGHT:
		pose=PLAYER_POSE_MOVE_RIGHT_1;
		break;	
	case SPRITE_DIRECTION_UP_RIGHT:
		pose=PLAYER_POSE_MOVE_UP_RIGHT_1;
		break;	
	case SPRITE_DIRECTION_DOWN_RIGHT:
		pose=PLAYER_POSE_MOVE_DOWN_RIGHT_1;
		break;	
	case SPRITE_DIRECTION_UP_LEFT:
		pose=PLAYER_POSE_MOVE_UP_LEFT_1;
		break;	
	case SPRITE_DIRECTION_DOWN_LEFT:
		pose=PLAYER_POSE_MOVE_DOWN_LEFT_1;
		break;	
	}
	return pose;
}
u8 GetPatternIdByPoseAndDirection(u8 direction, u8 pose){
	u8 patternId=NO_VALUE;
	switch(direction){
		case SPRITE_DIRECTION_UP:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_UP_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_UP_2;
			}
			break;
		case SPRITE_DIRECTION_DOWN:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_DOWN_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_DOWN_2;
			}
			break;
		case SPRITE_DIRECTION_LEFT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_LEFT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_LEFT_2;
			}
			break;
		case SPRITE_DIRECTION_RIGHT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_RIGHT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_RIGHT_2;
			}
			break;
		case SPRITE_DIRECTION_UP_LEFT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_UP_LEFT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_UP_LEFT_2;
			}
			break;
		case SPRITE_DIRECTION_DOWN_LEFT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_DOWN_LEFT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_DOWN_LEFT_2;
			}
			break;
		case SPRITE_DIRECTION_UP_RIGHT:
			if(pose==0){
				patternId=PLAYER_POSE_MOVE_UP_RIGHT_1;
			}
			else{
				patternId=PLAYER_POSE_MOVE_UP_RIGHT_2;
			}
			break;
		case SPRITE_DIRECTION_DOWN_RIGHT:
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
u8 CheckJoystickTriggerButtonPressed(){
	if(Bios_GetJoystickTrigger(0)||Bios_GetJoystickTrigger(1)){
		return 1;
	}
	if(Bios_GetJoystickTrigger(2)){
		return 2;
	}
	return NO_VALUE;
}
u8 GetJoystick1Direction(){
	u8 inputControllerDirection=Bios_GetJoystickDirection(0);
	if(inputControllerDirection==0){
		inputControllerDirection=Bios_GetJoystickDirection(1);
	}
	return inputControllerDirection;
}
u8 GetJoystick2Direction(){
	return Bios_GetJoystickDirection(2);
}
// *** GAME MANAGEMENT ***
void ShowFieldZone(u8 zone){
	g_FieldScrollingActionInProgress=zone;
}
void TimeUp(){

}