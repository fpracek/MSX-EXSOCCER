// ─────────────────────────────────────────────────────────────────────────────
//  EXSOCCER - 2026 Fausto Pracek (fpracek@gmail.com)
// ─────────────────────────────────────────────────────────────────────────────

#include "msxgl.h"
#include "v9990.h"
#include "print.h"
#include "exsoccer.h"
#include "debug.h"
#include "input.h"
#include "pt3/pt3_player.h"
#include "ayfx/ayfx_player.h"

// *** CONSTANTS ***
extern u8 				g_FieldScrollingActionInProgress; 	// Bank 1 = Segment 0
extern int  			g_FieldCurrentYPosition;			// Bank 1 = Segment 0
extern u8       		g_Team1PaletteId;					// Bank 1 = Segment 0
extern u8       		g_Team2PaletteId;					// Bank 1 = Segment 0
extern u8      			g_Team1Score;						// Bank 1 = Segment 0
extern u8      			g_Team2Score;						// Bank 1 = Segment 0
extern u8       		g_MatchStatus;						// Bank 1 = Segment 0
extern u8 				g_FieldScrollSpeed;					// Bank 1 = Segment 0
extern u8       		g_ActiveFieldZone;					// Bank 1 = Segment 0
extern u8       		g_SecondsToEndOfMatch;				// Bank 1 = Segment 0
extern u8       		g_Timer;							// Bank 1 = Segment 0
extern PlayerInfo  		g_Players[15];						// Bank 1 = Segment 0
extern BallInfo    		g_Ball;								// Bank 1 = Segment 0
extern u8          		g_RestartKickTeamId;				// Bank 1 = Segment 0
extern u8          		g_Team1ActivePlayer;				// Bank 1 = Segment 0
extern u8          		g_Team2ActivePlayer;				// Bank 1 = Segment 0
extern u8				g_PassTargetPlayer;					// Bank 1 = Segment 0
extern bool         	g_FioBre;							// Bank 1 = Segment 0
extern i8 				g_GkRecoilY;					    // Bank 1 = Segment 0

extern bool           	g_GkIsGroundKick;            // Bank 1 = Segment 0
extern u16              g_ShotCursorX;
extern i8               g_ShotCursorDir;
extern const unsigned char  g_Presentation_part1[16384]; // Bank 1 = Segment 12
extern const unsigned char  g_Presentation_part2[16384]; // Bank 1 = Segment 13
extern const unsigned char  g_Presentation_part3[16384]; // Bank 1 = Segment 14
extern const unsigned char  g_Presentation_part4[5120];  // Bank 1 = Segment 15
extern const unsigned char  g_Teams_Gray_part1[16384];
extern const unsigned char  g_Teams_Gray_part2[4096];
extern const unsigned char  g_Teams_palette[];
extern const unsigned char  g_Teams_Gray_palette[];
extern const unsigned char  g_Buttons_part1[16384]; // Bank 1 = Segment 13
extern const unsigned char  g_Buttons_part2[16384]; // Bank 1 = Segment 14
extern const unsigned char g_Buttons_palette[];
extern char g_History1[20];
extern char g_History2[20];
extern bool g_SoundEffectLoopIsActive;
const unsigned char g_EffectBall[] = {
	0x6C, 0x00, 0x04, 0x18, 0x09, 0x06, 0x03, 0x01, 0xD0, 0x20, 
};
const unsigned char g_EffectStadium[] = {
	0x5A, 0x0C, 0x5B, 0x00, 0x1C, 0x1D, 0x1F, 0x1E, 0x1C, 0x1B, 0x19, 0x1A, 0x1C, 0x1E, 0x1F, 0x1D, 
	0x1B, 0x19, 0x1A, 0x1C, 0x1D, 0x1F, 0x1F, 0x1E, 0x1C, 0x1A, 0x19, 0x18, 0x1D, 0x1F, 0x1E, 0x1C, 
	0x1A, 0x18, 0xD0, 0x20, 
};

static const struct { u16 x; u16 y; } g_TeamPos[6] = {
    { 33, 109 }, { 114, 109 }, { 197, 109 },   // Row 1
    { 33, 192 }, { 114, 192 }, { 197, 192 } // Row 2
};
static const struct { u16 x; u16 y; } g_TeamGrayPos[6] = {
    { 1, 5 }, { 11, 5 }, { 21, 5 },   // Row 1
    { 1, 15}, { 11, 15 }, { 21, 15 } // Row 2
};
// VARIABLES
extern u16 	g_FrameCounter; // Bank 1 = Segment 0
extern bool g_VSynch; // Bank 1 = Segment 0
extern bool g_GameWith2Players;

bool g_ShowButtonsInfo=true;
char   g_FioBreText[6];


// CONSTANTS









// *** SPRITE FUNCTIONS ***

void EffectPlay(u8 id)
{
	ayFX_Mute();
	 
    ayFX_SetMode(AYFX_MODE_FIXED); 
	switch(id){
		case SOUND_BALL:
			ayFX_SetChannel(PSG_CHANNEL_C);
			ayFX_InitBank(g_EffectBall);
			break;
		case SOUND_STADIUM:

			PT3_Mute(PSG_CHANNEL_B, true);
			PT3_Mute(PSG_CHANNEL_C, true);
			g_SoundEffectLoopIsActive=true;
			ayFX_SetFinishCB(StadiumSoundEffectLoopFinished);
			ayFX_SetChannel(PSG_CHANNEL_A);
			ayFX_InitBank(g_EffectStadium);
			break;
	}
	ayFX_PlayBank(0, 0); 
}
void StopStadiumSound(){
	if(g_SoundEffectLoopIsActive){
		g_SoundEffectLoopIsActive=false;
		ayFX_Mute();
		PT3_Mute(PSG_CHANNEL_A, false);
		PT3_Mute(PSG_CHANNEL_B, false);
		PT3_Mute(PSG_CHANNEL_C, false);
	}
}
void StadiumSoundEffectLoopFinished(){
	if(g_SoundEffectLoopIsActive){
		EffectPlay(SOUND_STADIUM);
	}
}
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
	
    static const u8 k_BallPatterns[] = { 
        BALL_SIZE_1, BALL_SIZE_2, BALL_SIZE_3, BALL_SIZE_4, 
        BALL_SIZE_5, BALL_SIZE_6, BALL_SIZE_7, BALL_SIZE_8 
    };

    u8 idx = (logicalSize - 1) * 2 + (useAlt ? 1 : 0);
    attr.Pattern = k_BallPatterns[idx & 7];

	attr.X = g_Ball.X;
	attr.P = attr.D;
	V9_SetSpriteP1(15, &attr);
}

void PrintTeamName(u8 x, u8 teamPaletteId) {

    const char* pName = 0;
    //if (g_FioBre) {
	//	DEBUG_LOG("iii");
    //    if (teamPaletteId == TEAM_AUS) pName = "FIO";
    //    else if (teamPaletteId == TEAM_ITA) pName = "BRE";
    //}

    if (!pName) {
        switch (teamPaletteId) {

            case TEAM_AUS: pName = "AUS"; break;
            case TEAM_BRA: pName = "BRA"; break;
            case TEAM_ITA: pName = "ITA"; break;
            case TEAM_FRA: pName = "FRA"; break;
            case TEAM_GBR: pName = "GBR"; break;
            case TEAM_GER: pName = "GER"; break;
            default:       pName = "   "; break;
        }
    }
    V9_PrintLayerAStringAtPos(x, 0, pName);
	if(x==0){
		g_History1[0] = pName[0];
		g_History1[1] = pName[1];
		g_History1[2] = pName[2];
		g_History1[3] = ':';
		g_History1[4] = ' ';
		g_History1[5] = ' ';
		g_History1[6] = ' ';
		g_History1[7] = ' ';
		g_History1[8] = ' ';
		g_History1[9] = ' ';
		g_History1[10] = '\0';
	}
	else{
		g_History2[0] = pName[0];
		g_History2[1] = pName[1];
		g_History2[2] = pName[2];
		g_History2[3] = ':';
		g_History2[4] = ' ';
		g_History2[5] = ' ';
		g_History2[6] = ' ';
		g_History2[7] = ' ';
		g_History2[8] = ' ';
		g_History2[9] = ' ';
		g_History2[10] = '\0';
	}
}

void ShowHeaderInfo(){
	u8 pos1 = (g_Team1Score >= 10) ? 4 : 5;
	u8 pos2 = (g_Team2Score >= 10) ? 9 : 10;
    
    PrintTeamName(0, g_Team1PaletteId);

	V9_PrintLayerAStringAtPos(pos1, 0, GetNumberString(g_Team1Score));
	V9_PrintLayerAStringAtPos(7, 0, "-");
	V9_PrintLayerAStringAtPos(pos2, 0, GetNumberString(g_Team2Score));

    PrintTeamName(12, g_Team2PaletteId);
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
		if(g_Players[playerId].Role!=PLAYER_ROLE_GOALKEEPER){
			UpdatePlayerPatternByDirection(playerId);
		}
	}
	if(g_Players[playerId].Role==PLAYER_ROLE_GOALKEEPER){
			   attr.SC=0;
			// --- Goalkeeper horizontal movement animation logic ---
			// Only animate during match in action
			if (g_MatchStatus == MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
				g_Players[playerId].Status=PLAYER_STATUS_POSITIONED;
				u8 team = g_Players[playerId].TeamId;
				// Horizontal movement (right/left)
				if(g_Players[playerId].OldX!=g_Players[playerId].X || g_Players[playerId].OldY!=g_Players[playerId].Y){
					if(g_Players[playerId].LastPose==0){
						g_Players[playerId].PatternId = (team == TEAM_1) ? PLAYER_POSE_GK_H_MOVE_BACK_1 : PLAYER_POSE_GK_H_MOVE_FRONT_1;
						g_Players[playerId].LastPose=1;
					}
					else{
						g_Players[playerId].PatternId = (team == TEAM_1) ? PLAYER_POSE_GK_H_MOVE_BACK_2 : PLAYER_POSE_GK_H_MOVE_FRONT_2;
						g_Players[playerId].LastPose=0;
					}		
					g_Players[playerId].OldX=g_Players[playerId].X;
					g_Players[playerId].OldY=g_Players[playerId].Y;	
				}

			}
			else{
				UpdatePlayerPatternByDirection(playerId);
			}
	}
	attr.Pattern = g_Players[playerId].PatternId;
	
	// Highlight logic (Human Only)
	if(g_Players[playerId].TeamId != REFEREE && g_MatchStatus != MATCH_PENALTY_SHOOTOUT && g_MatchStatus != MATCH_PENALTY_SETUP && g_MatchStatus != MATCH_VICTORY_LAP)
	{
		bool isHumanTeam = (g_Players[playerId].TeamId == TEAM_1) || (g_GameWith2Players && g_Players[playerId].TeamId == TEAM_2);
		
		if (isHumanTeam) {
			// NEVER HIGHLIGHT GOALKEEPER
			if (g_Players[playerId].Role != PLAYER_ROLE_GOALKEEPER) {
				if (playerId==g_Team1ActivePlayer || (g_GameWith2Players && playerId==g_Team2ActivePlayer)) {
					// Ensure we are not highlighting REFEREE even if logic fails (safety check)
					attr.Pattern=(u8)(attr.Pattern+64);

				}
			}
			// Highlight Pass Target if team has ball
			if (playerId == g_PassTargetPlayer) {
				attr.Pattern=(u8)(attr.Pattern+64);

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
		if(Keyboard_IsKeyPressed(KEY_R)){
			g_FioBreText[0]='R';
		}
		if(Keyboard_IsKeyPressed(KEY_E)){
			g_FioBreText[1]='E';
		}
		if(Keyboard_IsKeyPressed(KEY_N)){
			g_FioBreText[2]='N';
		}
		if(Keyboard_IsKeyPressed(KEY_Z)){
			g_FioBreText[3]='Z';
		}
		if(Keyboard_IsKeyPressed(KEY_O)){
			g_FioBreText[4]='O';
		}
		g_FioBreText[5]='\0';
		
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
    
    // DEBUG: Force Team 2 Throw-in (User Request: "se la rimessa viene portata dal team 2 assegnale al team 2")
    // Note: If Team 1 takes it out, it goes to Team 2 normally.
    // If Team 2 takes it out, normally it goes to Team 1. We override this to Team 2.
    //if (teamId == TEAM_1) opponentTeamId = TEAM_1; //GP_USER

	// Check Side Lines (Throw-in)
	if(g_Ball.X < FIELD_BOUND_X_LEFT || g_Ball.X > FIELD_BOUND_X_RIGHT){
		BallThrowIn(opponentTeamId); //GP_USER
		//BallThrowIn(teamId); // GP_USER
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
    V9_SetBackgroundColor(1); // Ensure background is blue
    SET_BANK_SEGMENT(2, 22); // Switch to Segment 22 for Victory Logic
    if (g_Team1Score == g_Team2Score) {
        PenaltyShots();
    } else {
        u8 winner = (g_Team1Score > g_Team2Score) ? TEAM_1 : TEAM_2;
        TeamVictory(winner);
    }
    SET_BANK_SEGMENT(2, 1); // Restore Segment 1
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
i32 Math_Abs32(i32 v) { return (v < 0) ? -v : v; }











u8 SelectTeam(u8 cursorPatternId, u8 excludeIndex) {

    u8 currentIdx = 0;
    if (currentIdx == excludeIndex) currentIdx++;

    u8 dir = DIRECTION_NONE;
    u8 oldDir = DIRECTION_NONE;
    bool trigger = false;
    bool oldTrigger = true; // Force release first

    while (true) {
        UpdateV9990();

        dir = GetJoystick1Direction();
        trigger = IsTeamJoystickTriggerPressed(TEAM_1);

        if (dir != DIRECTION_NONE && dir != oldDir) {
            u8 nextIdx = currentIdx;

            if (dir == DIRECTION_RIGHT) {
                if ((currentIdx % 3) < 2) nextIdx++;
            } else if (dir == DIRECTION_LEFT) {
                if ((currentIdx % 3) > 0) nextIdx--;
            } else if (dir == DIRECTION_UP) {
                if (currentIdx >= 3) nextIdx -= 3;
            } else if (dir == DIRECTION_DOWN) {
                if (currentIdx < 3) nextIdx += 3;
            }

            if (nextIdx == excludeIndex) {
                // Skip logic
                if (dir == DIRECTION_RIGHT) {
                    if ((nextIdx % 3) < 2) nextIdx++; else nextIdx = currentIdx;
                } else if (dir == DIRECTION_LEFT) {
                    if ((nextIdx % 3) > 0) nextIdx--; else nextIdx = currentIdx;
                } else {
                    nextIdx = currentIdx; // Vertical skip blocked
                }
            }
            currentIdx = nextIdx;
        }
        oldDir = dir;

        if (trigger && !oldTrigger) {

            return currentIdx;
        }
        oldTrigger = trigger;

        struct V9_Sprite attr;
        attr.Y = g_TeamPos[currentIdx].y;
        attr.X = g_TeamPos[currentIdx].x;
        attr.Pattern = cursorPatternId;
        attr.P = 0; 
        attr.SC = 0;
		attr.D = 0;
        V9_SetSpriteP1(0, &attr);
    }
}
void ShowMenu(){
	////// V9_SetInterrupt(V9_INT_NONE); // Disable interrupts during loading

	SET_BANK_SEGMENT(2, 1); 
	for(u8 i=0;i<32;i++){
		struct V9_Sprite attr;
		attr.D = 1;
        V9_SetSpriteP1(i, &attr);
	}
	V9_SetScrollingBY(1);
	//V9_SetSpriteEnable(FALSE);
	V9_SetDisplayEnable(FALSE);
	V9_FillVRAM(V9_P1_PGT_B, 0x00, 128*212); // Clean layer A pattern
    SET_BANK_SEGMENT(2, 18); 
	V9_WriteVRAM(V9_P1_PGT_B + 8192L, g_Teams_Gray_part1, sizeof(g_Teams_Gray_part1));
    SET_BANK_SEGMENT(2, 19); 
	V9_WriteVRAM(V9_P1_PGT_B + 8192L + 16384L, g_Teams_Gray_part2, sizeof(g_Teams_Gray_part2));
	// Pattern name table
	V9_FillVRAM16(V9_P1_PNT_B, 0x0000, 64*64); // Init layer A
	V9_SetPalette(16, 16, g_Teams_Gray_palette);



	SET_BANK_SEGMENT(2, 17); 
	V9_SetPalette(0, 16, g_Teams_palette);
	SET_BANK_SEGMENT(2, 1); 
	V9_SelectPaletteP1(0,1);
	for (u8 y=0;y<64;y++){
		for (u8 x=0;x<64;x++){
			V9_PutLayerATileAtPos(x,y,32);
		}
	}
    for (u8 y=5;y<25;y++){
		u16 tileId=256+32*(y-5);
		for (u8 x=1;x<31;x++){
			V9_PutLayerATileAtPos(x,y,tileId);
			V9_PutLayerBTileAtPos(x,y,tileId);
			tileId++;
		}
	}
	LoadSprites();
	V9_SetInterrupt(V9_INT_VBLANK); // Enable VBlank for selection timing
	
	
	
	V9_SetDisplayEnable(TRUE);
	



    V9_PrintLayerAStringAtPos(4,0,"    PLAYER TEAM SELECT");
    g_Team1PaletteId = SelectTeam(SPRITE_PLAYER, NO_VALUE);
	
	
	for(u8 y=g_TeamGrayPos[g_Team1PaletteId].y;y<g_TeamGrayPos[g_Team1PaletteId].y+9;y++){
		for(u8 x=g_TeamGrayPos[g_Team1PaletteId].x;x<g_TeamGrayPos[g_Team1PaletteId].x+10;x++){
			V9_PutLayerATileAtPos(x,y,0);
		}
	}
	
	SpriteBlinking();

	

    V9_PrintLayerAStringAtPos(4,0,"     CPU TEAM SELECT   ");
	
    g_Team2PaletteId = SelectTeam(SPRITE_CPU, g_Team1PaletteId);


	for(u8 y=g_TeamGrayPos[g_Team2PaletteId].y;y<g_TeamGrayPos[g_Team2PaletteId].y+9;y++){
		for(u8 x=g_TeamGrayPos[g_Team2PaletteId].x;x<g_TeamGrayPos[g_Team2PaletteId].x+10;x++){
			V9_PutLayerATileAtPos(x,y,0);
		}
	}


	SpriteBlinking();
	struct V9_Sprite attr;
	attr.D = 1; 
	V9_SetSpriteP1(0, &attr);
	
	V9_SetSpriteEnable(true);

	V9_SetDisplayEnable(FALSE);
	//////// V9_SetInterrupt(V9_INT_NONE); // Disable interrupts for loading

	if(g_ShowButtonsInfo){
		g_ShowButtonsInfo=false;
		V9_FillVRAM(V9_P1_PGT_A, 0x00, 128*212); // Clean layer B pattern
		SET_BANK_SEGMENT(2, 20); 
		V9_WriteVRAM(V9_P1_PGT_A, g_Buttons_part1, sizeof(g_Buttons_part1)); // Load tiles (part 1)
		SET_BANK_SEGMENT(2, 21); 
		V9_WriteVRAM(V9_P1_PGT_A + 16384, g_Buttons_part2, sizeof(g_Buttons_part2)); // Load tiles (part 2)
		
		SET_BANK_SEGMENT(2, 1); 

		SET_BANK_SEGMENT(2, 19); 
		V9_SetPalette(0, 16, g_Buttons_palette);
		V9_SelectPaletteP1(0,1);
		u16 tileId=0;

		for (u8 y=0;y<64;y++){
			for (u8 x=0;x<32;x++){
				V9_PutLayerATileAtPos(x,y,tileId++);
			}
		}
		V9_SetInterrupt(V9_INT_VBLANK); // Enable for input check
		V9_SetDisplayEnable(TRUE);
		while(!IsTeamJoystickTriggerPressed(TEAM_1)){
			UpdateV9990();
		}
		//////// V9_SetInterrupt(V9_INT_NONE);
		V9_SetDisplayEnable(FALSE);
	}
	g_MatchStatus=MATCH_NOT_STARTED;
	LoadP1LayerA();
	LoadP1LayerB();

    InitPalette();

	if(g_FioBreText[0]=='R' && g_FioBreText[1]=='E' && g_FioBreText[2]=='N' && g_FioBreText[3]=='Z' && g_FioBreText[4]=='O'){
			g_FioBre=true;
		g_Team2PaletteId=TEAM_AUS;
		g_Team1PaletteId=TEAM_ITA;
	}
    ShowField();
	
	V9_SetDisplayEnable(TRUE);
	
    V9_SetInterrupt(V9_INT_VBLANK);
	GameStart();
}
void LoadPresentation(){
    V9_SetScreenMode(V9_MODE_B1);
    V9_SetDisplayEnable(FALSE);
    V9_SetColorMode(V9_COLOR_BD8);
	const u8 colorBlack[3] = { 0, 0, 0 };
	V9_SetPaletteEntry(0, colorBlack);    
	V9_SetBackgroundColor(0);
	SET_BANK_SEGMENT(2, 12); 
	V9_WriteVRAM(V9_BMP_PGT, g_Presentation_part1, sizeof(g_Presentation_part1)); 
    SET_BANK_SEGMENT(2, 13); 
	V9_WriteVRAM(V9_BMP_PGT + 16384L, g_Presentation_part2, sizeof(g_Presentation_part2)); 
    SET_BANK_SEGMENT(2, 14); 
	V9_WriteVRAM(V9_BMP_PGT + 16384L+16384L, g_Presentation_part3, sizeof(g_Presentation_part3)); 
    SET_BANK_SEGMENT(2, 15); 
	V9_WriteVRAM(V9_BMP_PGT + 16384L+16384L+16384L, g_Presentation_part4, sizeof(g_Presentation_part4)); 

	SET_BANK_SEGMENT(2, 1);
    g_MatchStatus=MATCH_PRESENTATION;
    g_Timer=0;
    V9_SetDisplayEnable(TRUE);
	
    V9_SetInterrupt(V9_INT_VBLANK);
    while (g_Timer!=200)
    {
        
    }

    g_MatchStatus=MATCH_NOT_STARTED;
   //////// V9_SetInterrupt(V9_INT_NONE);
    V9_SetDisplayEnable(FALSE);
    
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
    // Only process ball physics if match is active or during specific states where ball might resolve
    if(g_MatchStatus == MATCH_BEFORE_THROW_IN || g_MatchStatus == MATCH_THROW_IN || 
       g_MatchStatus == MATCH_BEFORE_GOAL_KICK || g_MatchStatus == MATCH_GOAL_KICK ||
       g_MatchStatus == MATCH_BEFORE_CORNER_KICK || g_MatchStatus == MATCH_CORNER_KICK ||
       g_MatchStatus == MATCH_BEFORE_KICK_OFF) {
           return;
    }

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
			g_Ball.KickMoveState = 3; // Force ball to snap to feet immediately (No visual lag)
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
	if (g_Ball.X == 0 || g_Ball.X > 255 || g_Ball.Y == 0 || g_Ball.Y > 211) {
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
void TickThrowIn() {
    if (g_MatchStatus != MATCH_BEFORE_THROW_IN) return;
    
    // Internal State vars
    static u8 s_ThrowTargetId = NO_VALUE;
    static bool s_JoyMoved = false;
    static u16 s_ForceThrowTimer = 0;

    if (g_Timer == 0) {
        s_ThrowTargetId = NO_VALUE;
        s_JoyMoved = false;
        s_ForceThrowTimer = 0;

		// 1. Clamp Ball Position to bounds (Leave it where it crossed, just ensure on line)
		if (g_Ball.X < FIELD_POS_X_CENTER) {
			g_Ball.X = FIELD_BOUND_X_LEFT;
		} else {
			g_Ball.X = FIELD_BOUND_X_RIGHT;
		}
		
		// Clamp Y
		if (g_Ball.Y < FIELD_BOUND_Y_TOP) g_Ball.Y = FIELD_BOUND_Y_TOP;
		if (g_Ball.Y > FIELD_BOUND_Y_BOTTOM) g_Ball.Y = FIELD_BOUND_Y_BOTTOM;
		
		g_Ball.PossessionPlayerId = NO_VALUE;

		// 2. Identify Thrower (Closest Teammate)
		u8 bestId = NO_VALUE;
		u16 minDist = 65535;
		
		// Helpers for crowd participants (2 nearest teammates, 2 nearest opponents)
		u8 t1=NO_VALUE, t2=NO_VALUE; u16 dt1=65535, dt2=65535;
		u8 o1=NO_VALUE, o2=NO_VALUE; u16 do1=65535, do2=65535;

		for(u8 i=0; i<14; i++) {
			 // Calculate Distance to Ball
			 u16 dist = 0;
			 if(g_Players[i].X > g_Ball.X) dist += (g_Players[i].X - g_Ball.X); else dist += (g_Ball.X - g_Players[i].X);
			 if(g_Players[i].Y > g_Ball.Y) dist += (g_Players[i].Y - g_Ball.Y); else dist += (g_Ball.Y - g_Players[i].Y);

			 // Thrower Logic (RestartTeam only, No GK)
			 if(g_Players[i].TeamId == g_RestartKickTeamId && g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) {
				  if(dist < minDist) { minDist = dist; bestId = i; }
			 }
		}
		g_ThrowInPlayerId = bestId;
		
		// 3. Find Crowd Participants (Excluding Thrower)
		for(u8 i=0; i<14; i++) {
			 if(i == g_ThrowInPlayerId || g_Players[i].Role == PLAYER_ROLE_GOALKEEPER || g_Players[i].TeamId == REFEREE) continue;

			 u16 dist = 0;
			 if(g_Players[i].X > g_Ball.X) dist += (g_Players[i].X - g_Ball.X); else dist += (g_Ball.X - g_Players[i].X);
			 if(g_Players[i].Y > g_Ball.Y) dist += (g_Players[i].Y - g_Ball.Y); else dist += (g_Ball.Y - g_Players[i].Y);

			 if (g_Players[i].TeamId == g_RestartKickTeamId) {
				  // Teammate
				  if (dist < dt1) { dt2=dt1; t2=t1; dt1=dist; t1=i; }
				  else if (dist < dt2) { dt2=dist; t2=i; }
			 } else {
				  // Opponent
				  if (dist < do1) { do2=do1; o2=o1; do1=dist; o1=i; }
				  else if (dist < do2) { do2=dist; o2=i; }
			 }
		}
		
		// 4. Set Targets
		if (g_ThrowInPlayerId != NO_VALUE) {
			g_Players[g_ThrowInPlayerId].TargetX = g_Ball.X;
			g_Players[g_ThrowInPlayerId].TargetY = g_Ball.Y;
			g_Players[g_ThrowInPlayerId].Status = PLAYER_STATUS_NONE;
			if (g_Ball.X < FIELD_POS_X_CENTER) g_Players[g_ThrowInPlayerId].Direction = DIRECTION_RIGHT;
			else g_Players[g_ThrowInPlayerId].Direction = DIRECTION_LEFT;
		}

		// Crowd Positioning: 50x100 Rect
		// Y Range: [BallY-50, BallY+50]. X Range: 50px inward.
		bool isLeft = (g_Ball.X < FIELD_POS_X_CENTER);
		u8 crowdIds[4] = {t1, t2, o1, o2};
		
		// Fixed offsets to distribute players in the 50x100 area
		i16 yOffsets[4] = {-30, 20, -15, 35}; 
		u16 xOffsets[4] = {15, 35, 25, 45}; 
		
		for(u8 k=0; k<4; k++) {
			u8 pid = crowdIds[k];
			if(pid != NO_VALUE) {
				g_Players[pid].Status = PLAYER_STATUS_NONE;
				
				// Y Position (BallY +/- 50 range)
				i16 ty = (i16)g_Ball.Y + yOffsets[k];
				// Clamp Y
				if(ty < FIELD_BOUND_Y_TOP) ty = FIELD_BOUND_Y_TOP;
				if(ty > FIELD_BOUND_Y_BOTTOM) ty = FIELD_BOUND_Y_BOTTOM;
				g_Players[pid].TargetY = (u16)ty;
				
				// X Position (50 px inward)
				if (isLeft) {
					g_Players[pid].TargetX = g_Ball.X + xOffsets[k];
					g_Players[pid].Direction = DIRECTION_LEFT; // Look at thrower
				} else {
					g_Players[pid].TargetX = g_Ball.X - xOffsets[k];
					g_Players[pid].Direction = DIRECTION_RIGHT; // Look at thrower
				}
			}
		}

        // --- NEW: Identify Backup Thrower IF the designated thrower was somehow part of the crowd 
        // (Logic above excludes Thrower from crowd search, so they are distinct)
        // But let's verify if user wants a CHANGE: "fai arrivare un altro giocatore (diverso da quelli che hai portato li)"
        
        // My code ALREADY picks Thrower FIRST (closest), and THEN picks crowd (closest remaining).
        // So they are distinct.
        // However, if the user means: "Pick a NEW thrower that is NOT the one currently closest"
        // I will assume the current logic is fine as long as they are distinct.
        // The user said: "arriva un altro giocatore (diverso da quelli che hai portato li)... sia targhetizzato sulla palla"
        
        // To be safe: Force Thrower target again here.
         if (g_ThrowInPlayerId != NO_VALUE) {
            g_Players[g_ThrowInPlayerId].TargetX = g_Ball.X;
            g_Players[g_ThrowInPlayerId].TargetY = g_Ball.Y;
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
             g_Players[g_ThrowInPlayerId].Status = PLAYER_STATUS_POSITIONED;

             // Set Sprite for Throw In
             if(g_Ball.X < FIELD_POS_X_CENTER) {
                 g_Players[g_ThrowInPlayerId].PatternId = PLAYER_POSE_THROWIN_LEFT_1;
                 g_Players[g_ThrowInPlayerId].Direction = DIRECTION_RIGHT;
             } else {
                 g_Players[g_ThrowInPlayerId].PatternId = PLAYER_POSE_THROWIN_RIGHT_1;
                 g_Players[g_ThrowInPlayerId].Direction = DIRECTION_LEFT;
             }
             
             // Set Ball Over Head
             g_Ball.X = g_Players[g_ThrowInPlayerId].X;
             // Adjust Height: Right side lower by 2 px (Y-12 instead of Y-14)
             if(g_Ball.X < FIELD_POS_X_CENTER) g_Ball.Y = g_Players[g_ThrowInPlayerId].Y - 14; 
             else g_Ball.Y = g_Players[g_ThrowInPlayerId].Y - 12;
             
             g_Ball.Size = 1;

             // Ensure Crowd is also ready (Wait for everyone near ball to stop moving)
             {
                 u8 crowdReady = 1;
                 u8 i; // Declare outside for-loop for C89/SDCC compat
                 for(i=0; i<14; i++) {
                     // Check if player target is near Ball (Crowd Zone approx 100px)
                     u16 tdx = (g_Players[i].TargetX > g_Ball.X) ? (g_Players[i].TargetX - g_Ball.X) : (g_Ball.X - g_Players[i].TargetX);
                     u16 tdy = (g_Players[i].TargetY > g_Ball.Y) ? (g_Players[i].TargetY - g_Ball.Y) : (g_Ball.Y - g_Players[i].TargetY);
                     
                     if (tdx < 100 && tdy < 100) {
                          // If target is in zone, are they there?
                          if (g_Players[i].Status != PLAYER_STATUS_POSITIONED) {
                               // SNAPPING LOGIC: If very close, force positioned
                               i16 pdx = (i16)g_Players[i].X - (i16)g_Players[i].TargetX;
                               i16 pdy = (i16)g_Players[i].Y - (i16)g_Players[i].TargetY;
                               if (pdx >= -4 && pdx <= 4 && pdy >= -4 && pdy <= 4) {
                                    g_Players[i].X = g_Players[i].TargetX;
                                    g_Players[i].Y = g_Players[i].TargetY;
                                    g_Players[i].Status = PLAYER_STATUS_POSITIONED;
                               } else {
                                    crowdReady = 0;
                                    break;
                               }
                          }
                     }
                 }

                 if (crowdReady) {
                     g_Timer++;
                 } else {
                     g_Timer = 1; // Wait
                 }
             }

             if (g_Timer > 60) {
                  // Ready for Action (Interactive / CPU Phase)

                  // 1. Identify Candidates (Teammates near ball - INCREASE SEARCH RANGE)
                  u8 c1=NO_VALUE, c2=NO_VALUE;
                  {
                      u8 t1=NO_VALUE, t2=NO_VALUE; u16 dt1=65535, dt2=65535;
                      u8 i;
                      for(i=0; i<14; i++) {
                         if(i == g_ThrowInPlayerId || g_Players[i].Role == PLAYER_ROLE_GOALKEEPER || g_Players[i].TeamId == REFEREE) continue;
                         
                         if (g_Players[i].TeamId == g_RestartKickTeamId) {
                              u16 dx = (g_Players[i].X > g_Ball.X) ? (g_Players[i].X - g_Ball.X) : (g_Ball.X - g_Players[i].X);
                              u16 dy = (g_Players[i].Y > g_Ball.Y) ? (g_Players[i].Y - g_Ball.Y) : (g_Ball.Y - g_Players[i].Y);
                              u16 d = dx+dy;
                              // Increased search range confirmation
                              if (d < 200) { // Safety check
                                  if (d < dt1) { dt2=dt1; t2=t1; dt1=d; t1=i; }
                                  else if (d < dt2) { dt2=d; t2=i; }
                              }
                         }
                      }
                      c1 = t1; c2 = t2;
                  }

                  // 2. Default Target
                  if (s_ThrowTargetId == NO_VALUE && c1 != NO_VALUE) s_ThrowTargetId = c1;
                  // FALLBACK: If still no target, pick ANY teammate (excluding GK/Thrower)
                  if (s_ThrowTargetId == NO_VALUE) {
                       s_ThrowTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, g_ThrowInPlayerId);
                  }
                  
                  // 3. Determine Control Type
                  bool isHuman = (g_RestartKickTeamId == TEAM_1);
                  if (g_GameWith2Players) isHuman = true; 
                  if (g_RestartKickTeamId == TEAM_2 && !g_GameWith2Players) isHuman = false;

                  if (isHuman) {
                       // --- HUMAN LOGIC ---
                       u8 joy = (g_RestartKickTeamId == TEAM_1) ? GetJoystick1Direction() : GetJoystick2Direction();
                       bool trig = IsTeamJoystickTriggerPressed(g_RestartKickTeamId);

                       // Toggle Target
                       if (joy != DIRECTION_NONE && !s_JoyMoved) {
                            // If we have both candidates
                            if (c1 != NO_VALUE && c2 != NO_VALUE) {
                                if (s_ThrowTargetId == c1) s_ThrowTargetId = c2;
                                else s_ThrowTargetId = c1;
                            }
                            s_JoyMoved = true;
                       } else if (joy == DIRECTION_NONE) {
                            s_JoyMoved = false;
                       }
                       
                       // Visualize Target
                       g_PassTargetPlayer = s_ThrowTargetId; 
                       
                       // Timeout Logic (4 seconds = 240 frames)
                       s_ForceThrowTimer++;

                       // Execute
                       if ((trig || s_ForceThrowTimer > 240) && s_ThrowTargetId != NO_VALUE) {
                            g_Ball.PossessionPlayerId = g_ThrowInPlayerId;
                            SetPlayerBallPossession(g_ThrowInPlayerId);
                            g_Ball.Y = g_Players[g_ThrowInPlayerId].Y; // Reset to feet
                            PerformPass(s_ThrowTargetId);
                            g_MatchStatus = MATCH_IN_ACTION;
                            ClearTextFromLayerA(10, 18, 9); // Correct coords: 10, 18 (len 9 is enough for "THROW IN")
                            g_Ball.ShotActive = 1; // High Arc for throw
                            g_Ball.Size = 1;
                       }
                  } else {
                       // --- CPU LOGIC ---
                       if (g_Timer > 100) {
                            if (s_ThrowTargetId == NO_VALUE && c1 != NO_VALUE) s_ThrowTargetId = c1; 
                            if (s_ThrowTargetId == NO_VALUE) s_ThrowTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, g_ThrowInPlayerId);

                            // Throw after delay
                            if (g_Timer > 120) {
                                g_Ball.PossessionPlayerId = g_ThrowInPlayerId;
                                SetPlayerBallPossession(g_ThrowInPlayerId);
                                g_Ball.Y = g_Players[g_ThrowInPlayerId].Y; // Reset to feet
                                PerformPass(s_ThrowTargetId);
                                g_MatchStatus = MATCH_IN_ACTION; 
                                ClearTextFromLayerA(10, 18, 9); // Correct coords
                                g_Ball.ShotActive = 1; 
                                g_Ball.Size = 1;
                            } else {
                                g_Timer++;
                            }
                       } else {
                            g_Timer++;
                       }
                  }
             }
        } else {
            g_Timer = 1; 
        }
    }
}
