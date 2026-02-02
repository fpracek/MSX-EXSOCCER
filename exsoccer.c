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
#include "pt3/pt3_player.h"
#include "pt3/pt3_notetable2.h"
#include "memory.h"

// CONSTANTS
extern const unsigned char 	g_Font_MGL_Sample6[]; // Bank 1 = Segment 2
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
extern const unsigned char  g_MusicMenu[3610];

// VARIABLES
u8                  g_RAM_MusicBuffer[4096];
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
bool                g_FioBre;
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

void StopPT3Music()
{
    PT3_Mute(PT3_STATE_MUTE_A, TRUE);
    PT3_Pause();
    PT3_UpdatePSG();
}
void PlayPT3Music(u8 id){

	PT3_Init();                
    PT3_SetNoteTable(PT3_NT2); 
    PT3_SetLoop(TRUE);
	switch(id){
		case PT3_MENU:
            SET_BANK_SEGMENT(2, 15);
			Mem_Copy(g_MusicMenu, g_RAM_MusicBuffer, sizeof(g_MusicMenu));
            SET_BANK_SEGMENT(2, 1);
			break;
	}
    PT3_InitSong(g_RAM_MusicBuffer);
}

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

    //if(PT3_IsPlaying()){
    //    SET_BANK_SEGMENT(2,15);
    PT3_Decode();	 
    //    //ayFX_Update();
    PT3_UpdatePSG(); 
    //    SET_BANK_SEGMENT(2, 1);
    //}

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
	V9_SetDisplayEnable(FALSE);
    g_SecondsToEndOfMatch=MATCH_DURATION;
	g_RestartKickTeamId=TEAM_1;
	g_FieldScrollSpeed=FIELD_SCROLL_PRESENTATION_SPEED;
	g_FieldScrollingActionInProgress=NO_VALUE;
	g_FieldCurrentYPosition=FIELD_TOP_Y;
	g_Team1Score=0;
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
void V9_PrintLayerAStringAtPos(u8 x, u8 y, const c8* str)
{
	u8 pos=0;
	while (*str != 0){
		V9_PutLayerATileAtPos(x,y,*(str++));
		x++;
		pos++;
	}
		
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
void PutBallOnPlayerFeet(u8 playerId){
	
	if (g_Ball.PossessionPlayerId != playerId) {
		g_Ball.PossessionPlayerId=playerId;
		g_Ball.LastTouchTeamId=g_Players[playerId].TeamId;
		g_Ball.PassTargetPlayerId = NO_VALUE; // Clear any pending pass
		g_Ball.ShotActive = 0; // Clear any pending shot
		SetPlayerBallPossession(g_Ball.PossessionPlayerId);
        
        // Prevent immediate action (Shot/Pass) upon receiving - Reduced to 8 frames for responsiveness
        g_ActionCooldown = 8;
		
		if (g_Ball.ComingFromRestart) {
			g_ShootCooldown = 45; // 0.75s ban on shooting after restart
			g_Ball.ComingFromRestart = 0;
		}
	}

	// Offset di base per la palla (distanza "attaccata" ai piedi) per ogni direzione
	// Indicizzati: NONE, UP, UP_RIGHT, RIGHT, DOWN_RIGHT, DOWN, DOWN_LEFT, LEFT, UP_LEFT
	const u8 BallBaseDistX[] = { 0, 0, 4, 6, 4, 0, 4, 6, 4 };
	const u8 BallBaseDistY[] = { 0, 6, 4, 0, 4, 6, 4, 2, 4 };
	
	const u8 DribbleAnimOffsets[] = {5, 4, 2, 0};
	const u8 DribbleAnimOffsetsDiag[] = {3, 3, 1, 0};
	
	// Correzione fine posizione palla quando ferma (per allineamento perfetto ai piedi/sprite)
	// Indicizzati: NONE, UP, UP_RIGHT, RIGHT, DOWN_RIGHT, DOWN, DOWN_LEFT, LEFT, UP_LEFT
	const i8 BallAlignCorrectX[] = { 0, 0, 0, 0, 2, 0, -2, 0, 0 };
	const i8 BallAlignCorrectY[] = { 0, 0, 0, 4, 2, 4, 2, 4, 0 };

	u8 dir = g_Players[playerId].Direction;
	if(dir == DIRECTION_NONE) dir = g_Players[playerId].PreviousDirection; // Fallback se fermo

	// GK Logic: If moving sideways, treat ball position as Front (UP/DOWN)
	u8 calcDir = dir;
	bool isGkSideMove = false;
	if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER && (dir == DIRECTION_LEFT || dir == DIRECTION_RIGHT)) {
		isGkSideMove = true;
		if (g_Players[playerId].TeamId == TEAM_1) calcDir = DIRECTION_UP;
		else calcDir = DIRECTION_DOWN;
	}

	// Use KickMoveState for animation if set
	u8 animStep = g_Ball.KickMoveState;
	if (animStep > 3) animStep = 3; // Default/Reset to 3 (Close) if NO_VALUE (255)

	u8 currentOffset = DribbleAnimOffsets[animStep];
	u8 currentOffsetDiag = DribbleAnimOffsetsDiag[animStep];

	u8 distX = BallBaseDistX[calcDir] + ((calcDir==DIRECTION_UP || calcDir==DIRECTION_DOWN) ? 0 : (calcDir == DIRECTION_LEFT || calcDir == DIRECTION_RIGHT ? currentOffset : currentOffsetDiag));
	u8 distY = BallBaseDistY[calcDir] + ((calcDir==DIRECTION_LEFT || calcDir==DIRECTION_RIGHT) ? 0 : (calcDir == DIRECTION_UP || calcDir == DIRECTION_DOWN ? currentOffset : currentOffsetDiag));

	// Special adjustment: Goalkeepers closer to body (Both Teams)
	if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
		distY = (distY > 2) ? (distY - 2) : distY; // bring ball 2px closer vertically
	}

	i8 extraX = 0;

	switch (calcDir){
		case DIRECTION_UP:
			g_Ball.X=g_Players[playerId].X + BallAlignCorrectX[calcDir] + extraX;
			g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[calcDir];
			break;
		case DIRECTION_DOWN:
			g_Ball.X=g_Players[playerId].X + BallAlignCorrectX[calcDir];
			g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[calcDir];
			break;
		case DIRECTION_LEFT:
			g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[calcDir];
			g_Ball.Y=g_Players[playerId].Y + BallAlignCorrectY[calcDir];
			break;
		case DIRECTION_RIGHT:
			g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[calcDir];
			g_Ball.Y=g_Players[playerId].Y + BallAlignCorrectY[calcDir];
			break;
		case DIRECTION_UP_LEFT:
			g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[calcDir];
			g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[calcDir];
			break;
		case DIRECTION_UP_RIGHT:
			g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[calcDir];
			g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[calcDir];
			break;
		case DIRECTION_DOWN_LEFT:
			g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[calcDir];
			g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[calcDir];
			break;
		case DIRECTION_DOWN_RIGHT:
			g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[calcDir];
			g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[calcDir];
			break;
	}
	g_Ball.PreviousY=g_Ball.Y;
	g_Ball.Direction=dir;
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
	
    DEBUG_LOG("START MUSIC");
    PlayPT3Music(PT3_MENU);

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
        if(g_MatchStatus == MATCH_BEFORE_GOAL_KICK){
            TickGoalKick();
        }
        
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
