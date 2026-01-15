// ─────────────────────────────────────────────────────────────────────────────
//  EXSOCCER - 2026 Fausto Pracek (fpracek@gmail.com)
// ─────────────────────────────────────────────────────────────────────────────

// INCLUDES

#include "msxgl.h"
#include "v9990.h"
#include "print.h"
#include "exsoccer.h"
#include "debug.h"


// CONSTANTS
extern const unsigned 		g_Font_MGL_Sample6[]; // Bank 1 = Segment 2
extern const unsigned char 	g_GameFieldLayerATiles_part1[16384]; // Bank 1 = Segment 4
extern const unsigned char 	g_GameFieldLayerATiles_part2[16384]; // Bank 1 = Segment 5
extern const unsigned char 	g_GameFieldLayerATiles_part3[16384]; // Bank 1 = Segment 6
extern const unsigned char 	g_GameFieldLayerATiles_part4[14336]; // Bank 1 = Segment 7
extern const unsigned char 	g_GameFieldLayerATiles[16384]; // Bank 1 = Segment 8
extern const unsigned char 	g_Sprites1[16384]; // Bank 1 = Segment 9
extern const unsigned char 	g_Sprites2[16384]; // Bank 1 = Segment 10


// VARIABLES
u16 		g_FrameCounter;
bool 		g_VSynch = FALSE;
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

//-----------------------------------------------------------------------------
// V9990 V-blank interrupt
void V9_InterruptVBlank()
{
	g_VSynch = TRUE;
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
void InterruptHook()
{
__asm
	// Flush VDP interruption signal
	in		a, (P_VDP_STAT)

	// Call VDP interruption handler
	in		a, (V9_P06)
	out		(V9_P06), a
	// V-Blank interruption
	rra
	call	c, _V9_InterruptVBlank
	// H-Blank interruption
	rra
	call	c, _V9_InterruptHBlank
	// Command end interruption
	rra
	call	c, _V9_InterruptCommand
__endasm;
}
//-----------------------------------------------------------------------------
// Load Layer A
void LoadP1LayerA(){
	V9_FillVRAM(V9_P1_PGT_A, 0x00, 128*212); // Clean layer A pattern
	SET_BANK_SEGMENT(1, 8); // Bank 1 = Segment 8
	V9_WriteVRAM(V9_P1_PGT_A, g_GameFieldLayerATiles, sizeof(g_GameFieldLayerATiles)); // Load fonts

	// Pattern name table
	V9_FillVRAM16(V9_P1_PNT_A, 0x0000, 64*64); // Init layer A
	SET_BANK_SEGMENT(1, 3); // Bank 1 = Segment 3
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
	SET_BANK_SEGMENT(1, 4); // Bank 1 = Segment 4
	V9_WriteVRAM(V9_P1_PGT_B, g_GameFieldLayerATiles_part1, sizeof(g_GameFieldLayerATiles_part1)); // Load tiles (part 1)
	SET_BANK_SEGMENT(1, 5); // Bank 1 = Segment 5
	V9_WriteVRAM(V9_P1_PGT_B + 16384, g_GameFieldLayerATiles_part2, sizeof(g_GameFieldLayerATiles_part2)); // Load tiles (part 2)
	SET_BANK_SEGMENT(1, 6); // Bank 1 = Segment 6
	V9_WriteVRAM(V9_P1_PGT_B + 16384L*2, g_GameFieldLayerATiles_part3, sizeof(g_GameFieldLayerATiles_part3)); // Load tiles (part 3)
	SET_BANK_SEGMENT(1, 7); // Bank 1 = Segment 7
	V9_WriteVRAM(V9_P1_PGT_B + 16384L*3, g_GameFieldLayerATiles_part4, sizeof(g_GameFieldLayerATiles_part4)); // Load tiles (part 4)
	SET_BANK_SEGMENT(1, 3); // Bank 1 = Segment 3
	V9_FillVRAM16(V9_P1_PNT_B, 0x0000, 64*64); // Init layer
	SET_BANK_SEGMENT(1, 3); // Bank 1 = Segment 3
	u16 tileId=0;
	for (u8 y=0;y<64;y++){
		for (u8 x=0;x<32;x++){
			V9_PutLayerBTileAtPos(x,y,tileId);
			tileId++;
		}
	}
}
//-----------------------------------------------------------------------------
void GameStart(){
	V9_SetDisplayEnable(FALSE);
    g_SecondsToEndOfMatch=MATCH_DURATION;
	g_RestartKickTeamId=TEAM_1;
	g_FieldScrollSpeed=FIELD_SCROLL_PRESENTATION_SPEED;
	g_FieldScrollingActionInProgress=NO_VALUE;
	g_FieldCurrentYPosition=FIELD_TOP_Y;
	g_Team1Score=0;
	g_Team2Score=0;
	g_Team1PaletteId=TEAM_FRA;
	g_Team2PaletteId=TEAM_BRA;
	V9_SetScrollingY(0);
	V9_SetScrollingBY(1);
	SET_BANK_SEGMENT(1, 3); // Bank 1 = Segment 3
	SetTeam1Palette();
	SetTeam2Palette();
	SetTeamsPresentationSpritesPosition();
	ShowFieldZone(FIELD_CENTRAL_ZONE);
	ShowHeaderInfo();
	V9_SetDisplayEnable(TRUE);
}
//-----------------------------------------------------------------------------
// Init V9990
void InitializeV9990()
{
	SET_BANK_SEGMENT(1, 3); // Bank 1 = Segment 3
	V9_SetScreenMode(V9_MODE_P1);
	V9_SetDisplayEnable(FALSE);
	V9_SetInterrupt(V9_INT_NONE);
	V9_SetBackgroundColor(1);
	V9_SetSpriteEnable(TRUE);

	V9_SetDisplayEnable(TRUE);
	
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
	SET_BANK_SEGMENT(1, 9); // Bank 1 = Segment 9
	V9_SetSpritePatternAddr(V9_P1_SGT_08000);
	V9_WriteVRAM(0x08000, g_Sprites1, sizeof(g_Sprites1));	
	SET_BANK_SEGMENT(1, 10); // Bank 1 = Segment 10
	V9_WriteVRAM(0x08000+sizeof(g_Sprites1), g_Sprites2, sizeof(g_Sprites2));	
	SET_BANK_SEGMENT(1, 3); // Bank 1 = Segment 3
}
//-----------------------------------------------------------------------------
// Program entry point
void main()
{
	DEBUG_INIT();
	SET_BANK_SEGMENT(1, 3); // Bank 1 = Segment 3
	InitVariables();

	V9_SetPort(V9_P15, 0);

	VDP_SetMode(VDP_MODE_SCREEN0);
	VDP_EnableVBlank(FALSE);
	VDP_ClearVRAM();
	
	
	Bios_SetHookDirectCallback(H_KEYI, InterruptHook);
	Bios_ClearHook(H_TIMI);
	

	Print_SetTextFont(g_Font_MGL_Sample6, 1);
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
	LoadSprites();
	V9_SetPort(V9_P15, 0x10);

	GameStart();
	for(;;){
		UpdateV9990();
		TickPlayerToOwnTarget();
		TickActiveFieldZone();
		UpdateSpritesPositions();
		TickUpdateTime();
		TickShowKickOff();
		//if(g_FieldScrollingActionInProgress==NO_VALUE){
		//	
		//	if(GetJoystick1Direction()==JOYSTICK_DOWN){
		//		ShowFieldZone(FIELD_SOUTH_ZONE);
		//	}
		//	if(GetJoystick1Direction()==JOYSTICK_UP){
		//		ShowFieldZone(FIELD_CENTRAL_ZONE);
		//	}
		//}

		if(g_FieldScrollingActionInProgress==NO_VALUE){
			g_Ball.PreviousY=g_Ball.Y;
			if(GetJoystick1Direction()==JOYSTICK_DOWN){
				g_Ball.Y++;
			}
			if(GetJoystick1Direction()==JOYSTICK_UP){
				g_Ball.Y--;
			}
		}
	}

	Bios_Exit(0);
}
