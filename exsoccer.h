// ─────────────────────────────────────────────────────────────────────────────
//  EXSOCCER - 2026 Fausto Pracek (fpracek@gmail.com)
// ─────────────────────────────────────────────────────────────────────────────



#ifndef STRUCTURES_DEFINITION
#define STRUCTURES_DEFINITION
// STRUCTURES
typedef struct PlayerInfo
{
	u16		Y;		
	u16     X;	
	u8      PatternId;
	u8      TeamId;
	u8      Direction;
	u8      PreviousDirection;
	u8      LastPose;
	u8      Role;
	u16     TargetY;
	u16     TargetX;
	u16     Status;   
} PlayerInfo;
typedef struct BallInfo
{
	u16		Y;		
	u16     X;	
	u8		Size;	
	u8      Direction;
	u8      PossessionPlayerId;
	u16     PreviousY;
} BallInfo;
#endif

// =======================
// *** GLOBAL DEFINES ***
// =======================

#define MATCH_DURATION                      120

#define PLAYER_STATUS_NONE                  0
#define PLAYER_STATUS_HAS_BALL              1
#define PLAYER_STATUS_BALL_CHASER           2
#define PLAYER_STATUS_PASS_RECIPIENT        3
#define PLAYER_STATUS_POSITIONED            4

#define FIELD_NORTH_ZONE                    0
#define FIELD_CENTRAL_ZONE                  1
#define FIELD_SOUTH_ZONE                    2

#define FIELD_SCROLL_GAME_SPEED             5
#define FIELD_SCROLL_PRESENTATION_SPEED     1

#define FIELD_TOP_Y                         1
#define FIELD_BOTTOM_Y                      280
#define FIELD_CENTRAL_Y                     140

#define JOYSTICK_NONE  			            0
#define JOYSTICK_UP    			            1
#define JOYSTICK_UP_RIGHT  		            2
#define JOYSTICK_RIGHT  		            3
#define JOYSTICK_DOWN_RIGHT  	            4
#define JOYSTICK_DOWN         	            5
#define JOYSTICK_DOWN_LEFT  	            6
#define JOYSTICK_LEFT  			            7
#define JOYSTICK_UP_LEFT  		            8

#define TEAM_1                              0
#define TEAM_2                              1
#define REFEREE                             14

#define TEAM_AUS                            0
#define TEAM_BRA                            1
#define TEAM_ITA                            2
#define TEAM_FRA                            3
#define TEAM_GBR                            4
#define TEAM_GER                            5

#define SPRITE_DIRECTION_NONE               0
#define SPRITE_DIRECTION_UP    			    1
#define SPRITE_DIRECTION_UP_RIGHT  		    2
#define SPRITE_DIRECTION_RIGHT  		    3
#define SPRITE_DIRECTION_DOWN_RIGHT  	    4
#define SPRITE_DIRECTION_DOWN         	    5
#define SPRITE_DIRECTION_DOWN_LEFT  	    6
#define SPRITE_DIRECTION_LEFT  			    7
#define SPRITE_DIRECTION_UP_LEFT  		    8

#define PLAYER_POSE_FRONT                   16
#define PLAYER_POSE_BACK                    17
#define PLAYER_POSE_RIGHT                   157
#define PLAYER_POSE_LEFT                    18
#define PLAYER_POSE_MOVE_UP_RIGHT_1         13
#define PLAYER_POSE_MOVE_UP_RIGHT_2         14
#define PLAYER_POSE_MOVE_DOWN_RIGHT_1       133
#define PLAYER_POSE_MOVE_DOWN_RIGHT_2       134
#define PLAYER_POSE_MOVE_DOWN_1             0
#define PLAYER_POSE_MOVE_DOWN_2             1
#define PLAYER_POSE_MOVE_UP_1               2
#define PLAYER_POSE_MOVE_UP_2               3
#define PLAYER_POSE_MOVE_LEFT_1             5
#define PLAYER_POSE_MOVE_LEFT_2             6
#define PLAYER_POSE_MOVE_RIGHT_1            137
#define PLAYER_POSE_MOVE_RIGHT_2            138
#define PLAYER_POSE_MOVE_UP_LEFT_1          131
#define PLAYER_POSE_MOVE_UP_LEFT_2          130
#define PLAYER_POSE_MOVE_DOWN_LEFT_1        9
#define PLAYER_POSE_MOVE_DOWN_LEFT_2        10

#define PLAYER_ROLE_GOALKEEPER              0
#define PLAYER_ROLE_LEFT_DEFENDER           1
#define PLAYER_ROLE_RIGHT_DEFENDER          2
#define PLAYER_ROLE_LEFT_HALFFIELDER        3
#define PLAYER_ROLE_RIGHT_HALFFIELDER       4 
#define PLAYER_ROLE_LEFT_STRIKER            5
#define PLAYER_ROLE_RIGHT_STRIKER           6

#define BALL_SIZE_1                         57
#define BALL_SIZE_2                         58
#define BALL_SIZE_3                         59
#define BALL_SIZE_4                         60
#define BALL_SIZE_5                         61
#define BALL_SIZE_6                         62
#define BALL_SIZE_7                         63
#define BALL_SIZE_8                         116

#define MATCH_NOT_STARTED                   0
#define MATCH_BEFORE_KICK_OFF               1
#define MATCH_BEFORE_CORNER_KICK            2
#define MATCH_BEFORE_THROW_IN               3
#define MATCH_BEFORE_GOALKEEPER_KICK        4
#define MATCH_BEFORE_GOAL_KICK              5
#define MATCH_AFTER_IN_GOAL                 6
#define MATCH_KICK_OFF                      7
#define MATCH_THROW_IN                      8
#define MATCH_CORNER_KICK                   9
#define MATCH_GOAL_KICK                     10
#define MATCH_PLAYERS_PRESENTATION          11
#define MATCH_IN_ACTION                     12

#define FIELD_POS_X_CENTER                  120
#define FIELD_POS_X_LEFT                    40
#define FIELD_POS_X_RIGHT                   198
#define FIELD_POS_Y_CENTER                  243
#define FIELD_POS_Y_TEAM1_GOALKEEPER        424
#define FIELD_POS_Y_TEAM1_DEFENDERS         374
#define FIELD_POS_Y_TEAM1_HALFFIELDERS      284
#define FIELD_POS_Y_TEAM1_STRIKERS          154
#define FIELD_POS_Y_TEAM2_GOALKEEPER        50
#define FIELD_POS_Y_TEAM2_DEFENDERS         130
#define FIELD_POS_Y_TEAM2_HALFFIELDERS      220
#define FIELD_POS_Y_TEAM2_STRIKERS          350

#define NO_VALUE                            255
// ===========================
// *** FUNCTION PROTOTYPES ***
// ===========================

void main();
void UpdateV9990();                                                     // Bank 1 = Segment 3
void InitializeV9990();                                                 // Bank 1 = Segment 3
void WaitV9990Synch();                                                  // Bank 1 = Segment 3
void V9_InterruptCommand();                                             // Bank 1 = Segment 0
void V9_InterruptHBlank();                                              // Bank 1 = Segment 0
void V9_InterruptVBlank();                                              // Bank 1 = Segment 0
void InitPalette();                                                     // Bank 1 = Segment 3
void TickP1();                                                          // Bank 1 = Segment 3
void V9_PutLayerATileAtPos(u8 x, u8 y, u16 tileId);                     // Bank 1 = Segment 3
void V9_PutLayerBTileAtPos(u8 x, u8 y, u16 tileId);                     // Bank 1 = Segment 3
void LoadP1LayerA();                                                    // Bank 1 = Segment 0
void LoadP1LayerB();                                                    // Bank 1 = Segment 0
void V9_PrintLayerAStringAtPos(u8 x, u8 y, const c8* str);              // Bank 1 = Segment 3
void LoadSprites();                                                     // Bank 1 = Segment 0
void PutPlayerSprite(u8 id);                                            // Bank 1 = Segment 3
void SetTeam1Palette();                                                 // Bank 1 = Segment 3
void SetTeam2Palette();                                                 // Bank 1 = Segment 3
void ShowFieldZone(u8 zone);                                            // Bank 1 = Segment 3
void InitVariables();                                                   // Bank 1 = Segment 3
void TickFieldScrollingAction();                                        // Bank 1 = Segment 3
void GameStart();                                                       // Bank 1 = Segment 0
const u16* GetTeamPaletteById(u8 id);                                   // Bank 1 = Segment 3
void ShowTeamsPresentation();                                           // Bank 1 = Segment 3
void ShowHeaderInfo();                                                  // Bank 1 = Segment 3
char *GetNumberString(u16 value);                                       // Bank 1 = Segment 3
void SetTeamsPresentationSpritesPosition();                             // Bank 1 = Segment 3
void UpdateSpritesPositions();                                          // Bank 1 = Segment 3
void PutBallSprite();                                                   // Bank 1 = Segment 3
void TickPlayerToOwnTarget();                                           // Bank 1 = Segment 3
void UpdatePlayerPatternByDirection(u8 id);                             // Bank 1 = Segment 3
u8 GetNewPoseByDirection(u8 direction);                                 // Bank 1 = Segment 3
u8 GetPatternIdByPoseAndDirection(u8 direction, u8 pose);               // Bank 1 = Segment 3
void SetPlayerTarget(u8 playerId);                                      // Bank 1 = Segment 3
u8 GetJoystick1Direction();                                             // Bank 1 = Segment 3
u8 GetJoystick2Direction();                                             // Bank 1 = Segment 3
u8 CheckJoystickTriggerButtonPressed();                                 // Bank 1 = Segment 3
void TickActiveFieldZone();                                             // Bank 1 = Segment 3
void ResetPlayersInfo();                                                // Bank 1 = Segment 3
void TickUpdateTime();                                                  // Bank 1 = Segment 3
void TimeUp();                                                          // Bank 1 = Segment 3
void TickShowKickOff();                                                 // Bank 1 = Segment 3
void ClearTextFromLayerA(u8 x, u8 y, u8 length);                        // Bank 1 = Segment 3
void PutBallOnPlayerFeet(u8 playerId);									// Bank 1 = Segment 3
u8 GetPlayerIdByRole(u8 teamId, u8 role);								// Bank 1 = Segment 3



