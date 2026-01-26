// ─────────────────────────────────────────────────────────────────────────────
//  EXSOCCER - 2026 Fausto Pracek (fpracek@gmail.com)
// ─────────────────────────────────────────────────────────────────────────────


#include "msxgl.h"
#include "v9990.h"
#include "print.h"
#include "exsoccer.h"
#include "debug.h"

// Forward Declaration
bool IsOffside(u8 playerId);

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
extern u16          g_ShotCursorX;                      // Bank 1 = Segment 0
extern bool         g_FioBre;							// Bank 1 = Segment 0
extern u16 			g_FrameCounter; // Bank 1 = Segment 0
extern bool 		g_VSynch; // Bank 1 = Segment 0
extern bool 		g_GameWith2Players;
extern i8           g_GkRecoilY; // From exsoccer_s2_b0.c
extern bool         g_GkIsGroundKick; // From exsoccer_s2_b0.c

void TickTeamJoystick(u8 teamId, u8 direction){

	// Block input during non-interactive states (Presentation, Cutscenes, etc.)
	if (g_MatchStatus == MATCH_NOT_STARTED || 
		g_MatchStatus == MATCH_PLAYERS_PRESENTATION || 
		g_MatchStatus == MATCH_AFTER_IN_GOAL || 
        g_MatchStatus == MATCH_BEFORE_CORNER_KICK || 
        g_MatchStatus == MATCH_BEFORE_GOAL_KICK || 
        g_MatchStatus == MATCH_BEFORE_THROW_IN ||
        g_MatchStatus == MATCH_BEFORE_OFFSIDE) {
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
		// if (g_ActionCooldown > 0) return; // DISABLED: Blocking passes unintentionally

		if (frameTriggerPressed) {

			// 1. SHOOT CHECK
			// Only allow shots during actual gameplay
			if (g_MatchStatus == MATCH_IN_ACTION) {
				// Prevent shooting if cooldown is active
				if (g_ActionCooldown > 0) {
					// Do nothing (block shot)
				} else {
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
								PerformShot(g_ShotCursorX, FIELD_BOUND_Y_TOP - 40);
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
								PerformShot(g_ShotCursorX, FIELD_BOUND_Y_BOTTOM + 40);
							}
						}
					}
				}

				if (isShooting) {
					g_ActionCooldown = 20;
					return;
				}
                } // Close cooldown check else
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

		static const i8 k_MoveDX[] = { 0, 0, 2, 2, 2, 0, -2, -2, -2 };
		static const i8 k_MoveDY[] = { 0, -2, -2, 0, 2, 2, 2, 0, -2 };

		if (direction <= 8) {
			g_Players[playerId].X += k_MoveDX[direction];
			g_Players[playerId].Y += k_MoveDY[direction];
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
void TickAI(u8 playerId){
	if(g_MatchStatus==MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER){

        // *** REFEREE LOGIC ***
        if (playerId == REFEREE) {
            u16 ballX = g_Ball.X;
            u16 ballY = g_Ball.Y;
            u16 refX = g_Players[playerId].X;
            u16 refY = g_Players[playerId].Y;
            
            // 1. Follow Ball Y (Stay aligned horizontally mostly)
            // But prefer stay slightly above/below depending on play to avoid crossing
            u16 targetY = ballY;
            
            // Kick-Off avoidance: If ball is at center (Kickoff), stay higher
            if (ballY > 230 && ballY < 260 && ballX > 110 && ballX < 140) {
                 targetY = ballY - 40; 
            } else {
                // Determine bias based on possession
                if (g_Ball.PossessionPlayerId != NO_VALUE) {
                    if (g_Players[g_Ball.PossessionPlayerId].TeamId == TEAM_1) targetY = ballY - 20;
                    else targetY = ballY + 20;
                }
            }

            // 2. X-AXIS Logic (Follow ball but keep distance)
            u16 targetX = ballX;
            
            // Preferred side? Stay on the inner side (towards center) usually better?
            // Or just try to be at X=ballX +/- Distance.
            // Let's bias towards Center X (128).
            
            if (ballX < 128) targetX = ballX + 60; // Ball Left -> Ref Right
            else targetX = ballX - 60;             // Ball Right -> Ref Left
            
            // Clamp Target X
            if (targetX < FIELD_BOUND_X_LEFT + 10) targetX = FIELD_BOUND_X_LEFT + 10;
            if (targetX > FIELD_BOUND_X_RIGHT - 10) targetX = FIELD_BOUND_X_RIGHT - 10;
            
            // HYSTERESIS / SMOOTHING 
            // Only change direction if significantly far from target
            
            u8 moveDir = DIRECTION_NONE;
            i16 diffY = (i16)targetY - (i16)refY;
            i16 diffX = (i16)targetX - (i16)refX;
            
            // Y Threshold (Tight)
            if (diffY < -8) moveDir = DIRECTION_UP;
            else if (diffY > 8) moveDir = DIRECTION_DOWN;
            
            // X Threshold (Loose to avoid flicker)
            bool moveX = false;
            if (diffX < -16) moveX = true; // Need to go Left
            else if (diffX > 16) moveX = true; // Need to go Right
            
            if (moveX) {
                if (moveDir == DIRECTION_UP) {
                    if (diffX > 0) moveDir = DIRECTION_UP_RIGHT;
                    else moveDir = DIRECTION_UP_LEFT;
                } else if (moveDir == DIRECTION_DOWN) {
                    if (diffX > 0) moveDir = DIRECTION_DOWN_RIGHT;
                    else moveDir = DIRECTION_DOWN_LEFT;
                } else {
                    if (diffX > 0) moveDir = DIRECTION_RIGHT;
                    else moveDir = DIRECTION_LEFT;
                }
            }
            
            g_Players[playerId].Direction = moveDir;

            // Apply Movement
            if (g_Players[playerId].Direction == DIRECTION_UP ||
                g_Players[playerId].Direction == DIRECTION_UP_RIGHT ||
                g_Players[playerId].Direction == DIRECTION_UP_LEFT) {
                g_Players[playerId].Y--;
            }
            if (g_Players[playerId].Direction == DIRECTION_DOWN ||
                g_Players[playerId].Direction == DIRECTION_DOWN_RIGHT ||
                g_Players[playerId].Direction == DIRECTION_DOWN_LEFT) {
                 g_Players[playerId].Y++;
            }
            if (g_Players[playerId].Direction == DIRECTION_LEFT ||
                g_Players[playerId].Direction == DIRECTION_UP_LEFT ||
                g_Players[playerId].Direction == DIRECTION_DOWN_LEFT) {
                 g_Players[playerId].X--;
            }
            if (g_Players[playerId].Direction == DIRECTION_RIGHT ||
                g_Players[playerId].Direction == DIRECTION_UP_RIGHT ||
                g_Players[playerId].Direction == DIRECTION_DOWN_RIGHT) {
                 g_Players[playerId].X++;
            }
             
            // Boundaries
            if(g_Players[playerId].Y < FIELD_BOUND_Y_TOP) g_Players[playerId].Y = FIELD_BOUND_Y_TOP;
            if(g_Players[playerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[playerId].Y = FIELD_BOUND_Y_BOTTOM;
            if(g_Players[playerId].X < FIELD_BOUND_X_LEFT) g_Players[playerId].X = FIELD_BOUND_X_LEFT;
            if(g_Players[playerId].X > FIELD_BOUND_X_RIGHT) g_Players[playerId].X = FIELD_BOUND_X_RIGHT;

            // ANIMATION HANDLED BY STANDARD LOGIC (UpdatePlayerPatternByDirection)
            // No manual override here to allow standard inertia/facing logic.
            // Wait, we need to ensure PreviousDirection is updated if it was NONE, otherwise first step might fail
            if (moveDir != DIRECTION_NONE) {
                 g_Players[playerId].Status = PLAYER_STATUS_NONE; // Force not positioned
            } else {
                 g_Players[playerId].Status = PLAYER_STATUS_POSITIONED; // Allow rest
            }

            return;
        }
		
		u8 playerTeamId = g_Players[playerId].TeamId;
		bool ballPossessionByPlayerTeam = false;

        if (g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
            // Force possession logic based on which GK has the ball
            // Only way to know is to check who is the "owner" (GK with ball is possession holder)
            if (g_Ball.PossessionPlayerId != NO_VALUE) {
                 if (g_Players[g_Ball.PossessionPlayerId].TeamId == playerTeamId) ballPossessionByPlayerTeam = true;
            }
        } else {
            // Normal Logic
            if (g_Ball.PossessionPlayerId != NO_VALUE) {
                if (g_Players[g_Ball.PossessionPlayerId].TeamId == playerTeamId) {
                    ballPossessionByPlayerTeam = true;
                }
            } else {
                // STICKY POSSESSION
                if (g_Ball.LastTouchTeamId == playerTeamId) {
                    ballPossessionByPlayerTeam = true;
                }
            }
        }

		// ==========================================================================================
		// PHASE 1: ATTACK (MY TEAM HAS BALL)
		// ==========================================================================================
		if (ballPossessionByPlayerTeam) {
			
			// A: I AM THE BALL CARRIER ----------------------------------------
			if (g_Ball.PossessionPlayerId == playerId) {
				
				// GK SAFETY: Do not run attacking AI for GK (prevents leaving box)
				if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) return;

				u16 goalTopY = GK_BOX_Y_TOP_MAX; 
				u16 goalBottomY = GK_BOX_Y_BOTTOM_MIN;
				u16 targetY_Goal, targetX_Goal; 

				if (playerTeamId == TEAM_1) { 
					targetY_Goal = goalTopY - 20; 
				} else { 
					targetY_Goal = goalBottomY + 20;
				}
				
				// DYNAMIC LANES - SPREAD PLAY
				targetX_Goal = g_Players[playerId].X;
				if (targetX_Goal > 100 && targetX_Goal < 156) {
					if ((g_Players[playerId].Role % 2) != 0) targetX_Goal = 60; // Go Left
					else targetX_Goal = 190; // Go Right
				}
				
				if (targetX_Goal < FIELD_BOUND_X_LEFT + 20) targetX_Goal = FIELD_BOUND_X_LEFT + 20;
				if (targetX_Goal > FIELD_BOUND_X_RIGHT - 20) targetX_Goal = FIELD_BOUND_X_RIGHT - 20;

				// OBSTACLE AVOIDANCE & PASSING
				u8 obstacleDetDist = 32;
				bool obstacleRight = false;
				bool obstacleLeft = false;
				bool obstacleFront = false;
				bool obstacleFrontNonGK = false;
				bool dangerousOpponent = false;

				int i;
				for(i=0; i<14; i++) { 
					if (g_Players[i].TeamId == playerTeamId) continue;
					if (g_Players[i].Status == PLAYER_STATUS_NONE) continue;
					if (i == playerId) continue;

					i16 relX = (i16)g_Players[i].X - (i16)g_Players[playerId].X;
					i16 relY = (i16)g_Players[i].Y - (i16)g_Players[playerId].Y;
					
					// DANGEROUS OPPONENT LOGIC (RE-ENGINEERED)
					// Only panic if opponent is VERY close (tackle risk) OR blocking frontally.
					// Ignore opponents chasing from behind unless they are literally touching.
					
					bool isFront = false;
					bool isBehind = false;
					
					if (playerTeamId == TEAM_1) { // Moving UP (Y decreases)
						if (relY < 0 && relY > -obstacleDetDist) isFront = true;
						if (relY >= 0) isBehind = true;
					} else { // Moving DOWN (Y increases)
						if (relY > 0 && relY < obstacleDetDist) isFront = true;
						if (relY <= 0) isBehind = true;
					}

					// 1. TACKLE RISK (Proximity)
					// If behind, allow closer proximity before panicking (let them chase)
					u8 safeDist = isBehind ? 12 : 16; 
					if (relX > -safeDist && relX < safeDist && relY > -safeDist && relY < safeDist) {
						dangerousOpponent = true;
					}

					// 2. BLOCKING PATH (Navigation)
					if (isFront && relX > -10 && relX < 10) {
						obstacleFront = true;
						if (g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) obstacleFrontNonGK = true;
					}
					
					if (isFront || (relY < 18 && relY > -18)) { 
						if (relX >= 0 && relX < 24) obstacleRight = true; // Obstacle is to my right
						if (relX < 0 && relX > -24) obstacleLeft = true; // Obstacle is to my left
					}
				}

				bool inShootingRange = false;
				if (playerTeamId == TEAM_1) { if(g_Players[playerId].Y < FIELD_TOP_Y + 180) inShootingRange = true; }
				else { if(g_Players[playerId].Y > FIELD_BOTTOM_Y - 180) inShootingRange = true; }

				// CPU CONTROL CHECK
				bool isHumanControlled = false;
				if ((playerTeamId == TEAM_1 && g_Team1ActivePlayer == playerId) || 
					(playerTeamId == TEAM_2 && g_GameWith2Players && g_Team2ActivePlayer == playerId)) {
					isHumanControlled = true;
				}

				if (!isHumanControlled) {
					// 1. SHOOT CHECK
					bool inRealShootingRange = false;
					bool inDangerousZone = false;
					u16 goalTargetY = 0;
					
					if (playerTeamId == TEAM_1) {
                         // SHOOTING RANGE (Reduced to prevent midfield shots)
						 // Goal at 50. Box top around 120? 
						 // Original request was "last 100 pixels", so 50+100 = 150.
						if (g_Players[playerId].Y < (FIELD_BOUND_Y_TOP + 90)) inRealShootingRange = true;
						
						// DANGEROUS ZONE (Inside the box)
                        if (g_Players[playerId].Y < (FIELD_BOUND_Y_TOP + 60)) inDangerousZone = true; 
						goalTargetY = FIELD_BOUND_Y_TOP - 40; 
					} else {
                        // SHOOTING RANGE
						// Goal at 430. Range 430-90 = 340.
						if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 90)) inRealShootingRange = true;
						
						// DANGEROUS ZONE
                        if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 60)) inDangerousZone = true;
						goalTargetY = FIELD_BOUND_Y_BOTTOM + 40; 
					}
					
					// DISABLE SHOOTING FOR GOALKEEPER
					if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
						inRealShootingRange = false;
						inDangerousZone = false;
					}

					if (inRealShootingRange) {
						// FREQUENCY IS ALREADY LIMITTED BY TICKAI LOOP (Once every 15 frames).
						// So we check EVERY time this function is called if in dangerous zone/shooting range.
						
						bool shouldCheck = true;
						// If in normal range (not dangerous), maybe skip half the time to vary timing?
						// if (!inDangerousZone && (g_FrameCounter & 1)) shouldCheck = false; // DISABLED TO ENSURE SHOT

						if (shouldCheck) { 
							bool clearShot = !obstacleFrontNonGK;
							
							// Aggressive Mode: In dangerous zone, shoot even if blocked!
                            if (inDangerousZone) clearShot = true;

							// Aggressive Mode: In dangerous zone, shoot even if blocked if not TOO close?
							// For now, rely on clear path but check often.
							if (clearShot) {
								u16 shotX = 86 + ((g_FrameCounter + playerId * 13) % 68);
								PerformShot(shotX, goalTargetY);
								return;
							}
						}
					}
				}

				bool shouldPass = false;
				bool isPanicPass = false;
				
				// Strategic Passing Check: Allow checking for pass even if in shooting range, 
				// as long as we are not in the "Panic Zone" (Dangerous Zone close to goal).
				// We prioritize shooting in the dangerous zone, but outside allow passing.
				
				bool checkPassing = false;
				
				if (dangerousOpponent) {
					// Immediate threat? Pass.
					shouldPass = true;
					isPanicPass = true;
				}
				else if (obstacleFront) {
					// Blocked in front. Can I sidestep?
					// Check field boundaries for sidestep
					bool canGoRight = (g_Players[playerId].X < FIELD_BOUND_X_RIGHT - 20) && !obstacleRight;
					bool canGoLeft = (g_Players[playerId].X > FIELD_BOUND_X_LEFT + 20) && !obstacleLeft;
					
					if (canGoRight || canGoLeft) {
						// I can dribble around! DO NOT PASS. 
						shouldPass = false;
					} else {
						// Trapped front and sides? Pass.
						shouldPass = true;
						isPanicPass = true;
					}
				}
				else {
					// FREE ROAM (Not blocked, not threatened)
					// Use 50% chance to check for passes every tick (tick is every 15 frames)
					if ((g_FrameCounter & 1) == 0) checkPassing = true;
				}
				
				if (checkPassing) {
					// Logic: If I am in shooting range, only pass if I find a REALLY good target.
					// If I am outside shooting range, pass more freely to advance the ball.
					shouldPass = true; 
					isPanicPass = false;
				}

				if (shouldPass) {
					if (!isHumanControlled) {
						u8 bestT = NO_VALUE;
						i16 bestScore = -30000;
						int t;
						for(t=0; t<14; t++) {
							if(g_Players[t].TeamId != playerTeamId) continue;
							if(t == playerId) continue;
							if(g_Players[t].Status == PLAYER_STATUS_NONE) continue;
							if(g_Players[t].Role == PLAYER_ROLE_GOALKEEPER) continue;

                            // Prevent passing to offside players
                            if (IsOffside(t)) continue;

							i16 dx = (i16)g_Players[t].X - (i16)g_Players[playerId].X;
							i16 dy = (i16)g_Players[t].Y - (i16)g_Players[playerId].Y;
							u16 adx = (dx < 0) ? -dx : dx;
							u16 ady = (dy < 0) ? -dy : dy;
							if (adx < 40 && ady < 40) continue; // Minimum pass distance
							
							// Visibility Check (Expanded Margin to 300px)
							if (g_Players[t].Y < g_FieldCurrentYPosition - 40 || 
								g_Players[t].Y > (g_FieldCurrentYPosition + 252)) continue;

							i16 advanceScore = (playerTeamId == TEAM_1) ? -dy : dy;
							
							// If not in trouble, only pass forward!
							if (!isPanicPass) {
								if (advanceScore < 40) continue; // Must gain at least 40px ground
							} else {
								// Panic? Just don't pass into own goal if possible
								if (advanceScore < -150) continue;
							}
							
							i16 score = advanceScore - (adx/4); // Minimal lateral penalty
							
							if (score > bestScore) {
								bestScore = score;
								bestT = t;
							}
						}
						
						// Found a target?
						if (bestT != NO_VALUE) {
							// If panic, any open player is fine (-80).
							// If creative, must be a good forward pass (+10).
							i16 threshold = isPanicPass ? -80 : 10;
							
							if (bestScore > threshold) {
								if (g_Ball.PossessionTimer < 15) return; // Wait 15 frames before passing
								PerformPass(bestT);
								return; // End tick
							}
						}
					}
				}

				u16 finalTargetX = targetX_Goal;
				u16 finalTargetY = targetY_Goal;

				if (obstacleFront) {
					if (!obstacleRight) {
						finalTargetX = g_Players[playerId].X + 24;
						if (finalTargetX > FIELD_BOUND_X_RIGHT) finalTargetX = FIELD_BOUND_X_RIGHT;
					} else if (!obstacleLeft) {
						finalTargetX = g_Players[playerId].X - 24; 
						if (finalTargetX < FIELD_BOUND_X_LEFT) finalTargetX = FIELD_BOUND_X_LEFT;
					}
				}
				g_Players[playerId].TargetY = finalTargetY;
				g_Players[playerId].TargetX = finalTargetX;
				return; // IMPORTANT: Ball Carrier handled. Stop.
			}

			// B: LOOSE BALL RETRIEVAL (DURING ATTACK) -----------------------
			// If I just passed it, or lost it momentarily, I might be closest.
			// Sticky possession is ON, so we are here.
			if (g_Ball.PossessionPlayerId == NO_VALUE) {
				// If I am closest, go to ball
				if (GetClosestPlayerToBall(playerTeamId, NO_VALUE) == playerId) {
					g_Players[playerId].TargetX = g_Ball.X;
					g_Players[playerId].TargetY = g_Ball.Y;
					return;
				}
			}

			// C: ATTACKING SUPPORT (TEAMMATE HAS BALL) -----------------------
			// ----------------------------------------------------------------
			u16 midFieldY = (FIELD_BOUND_Y_TOP + FIELD_BOUND_Y_BOTTOM) / 2;
			
			// Base positioning based on Role
			if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER || 
				g_Players[playerId].Role == PLAYER_ROLE_RIGHT_STRIKER) {
				
				// STRIKERS: GO DEEP
				if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = GK_BOX_Y_TOP_MAX - 10;
				else g_Players[playerId].TargetY = GK_BOX_Y_BOTTOM_MIN + 10;
				
				if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetX = 64;
				else g_Players[playerId].TargetX = 192;
				
			} else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER || 
					   g_Players[playerId].Role == PLAYER_ROLE_RIGHT_HALFFIELDER) {
				
				// MIDFIELDERS: SUPPORT AHEAD (Limited to 3/4)
                u16 limitY;
				if (playerTeamId == TEAM_1) {
                    // Attack UP. 3/4 is ~106
                    limitY = 106;
                    g_Players[playerId].TargetY = g_Ball.Y - 40;
                    if (g_Players[playerId].TargetY < limitY) g_Players[playerId].TargetY = limitY;
                } else {
                    // Attack DOWN. 3/4 is ~318
                    limitY = 318;
                    g_Players[playerId].TargetY = g_Ball.Y + 40;
                    if (g_Players[playerId].TargetY > limitY) g_Players[playerId].TargetY = limitY;
                }
				
				if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetX = 48;
				else g_Players[playerId].TargetX = 208;
				
			} else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER || 
					   g_Players[playerId].Role == PLAYER_ROLE_RIGHT_DEFENDER) {
				
				// DEFENDERS: SUPPORT BEHIND
				if (playerTeamId == TEAM_1) { // Attacking UP
					g_Players[playerId].TargetY = g_Ball.Y + 30;
                    
                    if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) {
                        // STAY BACK: Limit at Half of Own Half (~318)
                        if (g_Players[playerId].TargetY < 318) g_Players[playerId].TargetY = 318;
                    } else {
                        // SUPPORT: Limit at Midfield + small push (~190)
                        if (g_Players[playerId].TargetY < 190) g_Players[playerId].TargetY = 190;
                    }

				} else { // Attacking DOWN
					g_Players[playerId].TargetY = g_Ball.Y - 30;
                    
                    if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) {
                        // STAY BACK: Limit at Half of Own Half (~106)
                        if (g_Players[playerId].TargetY > 106) g_Players[playerId].TargetY = 106;
                    } else {
                        // SUPPORT: Limit at Midfield + small push (~234)
                        if (g_Players[playerId].TargetY > 234) g_Players[playerId].TargetY = 234;
                    }
				}
				
                // Shift Defenders towards ball slightly (Center weighted)
                u16 defTargetX;
				if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) defTargetX = 80;
				else defTargetX = 176;

                // Influence by ball X (weight 0.5)
                defTargetX = (defTargetX + g_Ball.X) / 2;
                g_Players[playerId].TargetX = defTargetX;

			} else if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
				g_Players[playerId].TargetX = FIELD_POS_X_CENTER;
				if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = GK_BOX_Y_BOTTOM_MIN + 20;
				else g_Players[playerId].TargetY = GK_BOX_Y_TOP_MAX - 20;
				return; // GK Done
			}

			// SEPARATION LOGIC
			for(u8 i=0; i<14; i++) {
				if (i == playerId) continue;
				if (g_Players[i].Status == PLAYER_STATUS_NONE) continue;
				if (g_Players[i].TeamId != playerTeamId) continue;
				if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;

				i16 dx = (i16)g_Players[playerId].TargetX - (i16)g_Players[i].X;
				i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
				if (dx > -75 && dx < 75 && dy > -75 && dy < 75) {
					if (dx >= 0) g_Players[playerId].TargetX += 12; else g_Players[playerId].TargetX -= 12;
					if (dy >= 0) g_Players[playerId].TargetY += 12; else g_Players[playerId].TargetY -= 12;
				}
			}

			// OFFSIDE PREVENTION (Stay onside)
            u16 offsideY = GetOffsideLineY(playerTeamId);
            u16 effectiveLimit;

            if (playerTeamId == TEAM_1) { // Attacking UP (TargetY decreases)
                 // Limit is the maximum of (Ball.Y, OffsideLineY) because we want Y >= Limit
                 // ...
                 
                 effectiveLimit = (g_Ball.Y < offsideY) ? g_Ball.Y : offsideY;

                 if (g_Players[playerId].TargetY < (effectiveLimit + 10)) { 
                     g_Players[playerId].TargetY = effectiveLimit + 10;
                 }
            } else { // Attacking DOWN (TargetY increases)
                 
                 effectiveLimit = (g_Ball.Y > offsideY) ? g_Ball.Y : offsideY;

                 if (g_Players[playerId].TargetY > (effectiveLimit - 10)) {
                     g_Players[playerId].TargetY = effectiveLimit - 10;
                 }
            }

			// End of Attack Phase for Teammates
			return; 

		} // END ATTACK PHASE

		// ==========================================================================================
		// PHASE 2: DEFENSE (OPPONENT HAS BALL)
		// ==========================================================================================
			
		// A: GOALKEEPER LOGIC --------------------------------------------
		if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER) {
			u16 gkTargetX = FIELD_POS_X_CENTER;
			u16 gkTargetY;
			u16 boxXMin = GK_BOX_X_MIN; u16 boxXMax = GK_BOX_X_MAX; 
			u16 boxYMin, boxYMax;

			if (playerTeamId == TEAM_1) { 
				gkTargetY = FIELD_POS_Y_TEAM1_GOALKEEPER;
				boxYMin = GK_BOX_Y_BOTTOM_MIN; boxYMax = GK_BOX_Y_BOTTOM_MAX;
			} else { 
				gkTargetY = FIELD_POS_Y_TEAM2_GOALKEEPER;
				boxYMin = GK_BOX_Y_TOP_MIN; boxYMax = GK_BOX_Y_TOP_MAX;
			}

			u8 closestId = GetClosestPlayerToBall(playerTeamId, NO_VALUE);
			bool ballInBox = (g_Ball.X > (boxXMin-5) && g_Ball.X < (boxXMax+5) && 
							  g_Ball.Y > (boxYMin-5) && g_Ball.Y < (boxYMax+5));
			
			if (ballInBox && closestId == playerId) {
				gkTargetX = g_Ball.X;
				gkTargetY = g_Ball.Y;
			} else {
				if (g_Ball.X > gkTargetX + 24) gkTargetX += 16;
				else if (g_Ball.X < gkTargetX - 24) gkTargetX -= 16;
				else gkTargetX = g_Ball.X; 
			}

			if (gkTargetX < boxXMin) gkTargetX = boxXMin;
			if (gkTargetX > boxXMax) gkTargetX = boxXMax;
			if (gkTargetY < boxYMin) gkTargetY = boxYMin;
			if (gkTargetY > boxYMax) gkTargetY = boxYMax;
			
			g_Players[playerId].TargetX = gkTargetX;
			g_Players[playerId].TargetY = gkTargetY;
			return; 
		}

		// B: FIELD PLAYERS DEFENSE ---------------------------------------
		u8 playerClosesestToBallId = GetClosestPlayerToBall(playerTeamId, NO_VALUE);
		
		bool amIEffectiveChaser = (playerClosesestToBallId == playerId);
		
		if (g_Players[playerClosesestToBallId].Role == PLAYER_ROLE_GOALKEEPER) {
			u16 limitY = (playerTeamId == TEAM_1) ? GK_BOX_Y_BOTTOM_MIN : GK_BOX_Y_TOP_MAX;
			bool ballFar = false;
			if (playerTeamId == TEAM_1 && g_Ball.Y < limitY - 10) ballFar = true;
			if (playerTeamId == TEAM_2 && g_Ball.Y > limitY + 10) ballFar = true;
			
			if (ballFar) {
				u8 nextClosest = GetClosestPlayerToBall(playerTeamId, playerClosesestToBallId);
				if (nextClosest == playerId) amIEffectiveChaser = true;
			}
		}

		if (amIEffectiveChaser) {
			// EFFECTIVE CHASER: GO TO BALL
			if (g_Ball.PossessionPlayerId == NO_VALUE) {
				g_Players[playerId].TargetX = g_Ball.X;
				g_Players[playerId].TargetY = g_Ball.Y;
			} else {
				// OPPONENT POSSESSION: Contain or Tackle
				
				// CPU TACKLE CHECK
				// If we are close enough, attempt to steal.
				i16 dx = (i16)g_Players[playerId].X - (i16)g_Ball.X;
				i16 dy = (i16)g_Players[playerId].Y - (i16)g_Ball.Y;
				if (dx > -12 && dx < 12 && dy > -12 && dy < 12) {
					// Very Close! 
					// Human controlled players must press trigger (handled in exsoccer.c).
					// CPU controlled players do it automatically (with a probability check if needed).
					
					bool isHumanControlled = false;
					if ((playerTeamId == TEAM_1 && g_Team1ActivePlayer == playerId) || 
						(playerTeamId == TEAM_2 && g_GameWith2Players && g_Team2ActivePlayer == playerId)) {
						isHumanControlled = true;
					}
					
					if (!isHumanControlled) {
						// 25% chance per tick to steal if in range.
						// This simulates "reaction time" or "struggle".
						if ((g_FrameCounter % 4) == 0) {
							PutBallOnPlayerFeet(playerId);
							return;
						}
					}
				}
				
                // SMART AGGRESSIVE: Chase with prediction (less mechanical)
                // Aim slightly ahead of ball if it's moving
                i16 targetX = g_Ball.X;
                i16 targetY = g_Ball.Y;
                
                if (g_Ball.KickMoveState != 0) {
                     // Simple predictive lead
                     switch(g_Ball.Direction) {
                         case DIRECTION_UP: targetY -= 16; break;
                         case DIRECTION_DOWN: targetY += 16; break;
                         case DIRECTION_LEFT: targetX -= 16; break;
                         case DIRECTION_RIGHT: targetX += 16; break;
                         case DIRECTION_UP_RIGHT: targetY -= 12; targetX += 12; break;
                         case DIRECTION_UP_LEFT: targetY -= 12; targetX -= 12; break;
                         case DIRECTION_DOWN_RIGHT: targetY += 12; targetX += 12; break;
                         case DIRECTION_DOWN_LEFT: targetY += 12; targetX -= 12; break;
                     }
                }
                g_Players[playerId].TargetX = targetX;
                g_Players[playerId].TargetY = targetY;

			}
		} else {
			// DEFENSIVE SUPPORT / RETREAT
			u16 defGoalY = (playerTeamId == TEAM_1) ? FIELD_BOUND_Y_BOTTOM : FIELD_BOUND_Y_TOP;
			bool chaserBeaten = false;
			bool opponentHasBall = (g_Ball.PossessionPlayerId != NO_VALUE && g_Players[g_Ball.PossessionPlayerId].TeamId != playerTeamId);

			if (opponentHasBall && playerClosesestToBallId != NO_VALUE) {
				u16 chaserY = g_Players[playerClosesestToBallId].Y;
				if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
				else { if (g_Ball.Y < chaserY) chaserBeaten = true; }
			}

			if (opponentHasBall && chaserBeaten) {
				g_Players[playerId].TargetX = g_Ball.X;
				if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = g_Ball.Y + 15;
				else g_Players[playerId].TargetY = g_Ball.Y - 15;
			} else {
				// FORMATION RETREAT
				if (playerTeamId == TEAM_1) { // Defend Bottom (High Y)
					if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) {
                        // Strikers -> Midfield
                        g_Players[playerId].TargetY = FIELD_POS_Y_CENTER;
                    }
					else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) {
                        // Mids -> Half of Own Half
                        g_Players[playerId].TargetY = 318; 
                    }
					else {
                        // Defs -> Dynamic Defensive Line
                        // Default: Edge of penalty area context (~350)
                         u16 defenseLineY = 350;
                         
                         // Check if I am the last line of defense before GK
                         // Count teammates with Y < Me (closer to midfield)
                         u8 teammatesAhead = 0;
                         for(u8 k=0; k<14; k++) {
                             if (k==playerId) continue;
                             if (g_Players[k].TeamId == playerTeamId && g_Players[k].Role != PLAYER_ROLE_GOALKEEPER) {
                                  if (g_Players[k].Y < g_Players[playerId].Y) teammatesAhead++;
                             }
                         }
                         
                         // If few teammates ahead, or Ball is dangerously close, Step Up
                         if (teammatesAhead < 2 || g_Ball.Y > 280) {
                              // "Pronti ad andare verso la palla"
                              // If ball is within range, don't retreat blindly. Hold ground or engage.
                              if (g_Ball.Y < g_Players[playerId].Y) {
                                   defenseLineY = g_Ball.Y + 40; // Maintain gap
                                   if (defenseLineY > 380) defenseLineY = 380; // Cap
                              }
                         }
                         g_Players[playerId].TargetY = defenseLineY; 
                    } 
						
				} else { // Defend Top (Low Y)
					if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) {
                        // Strikers -> Midfield
                        g_Players[playerId].TargetY = FIELD_POS_Y_CENTER;
                    }
					else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) {
                        // Mids -> Half of Own Half
                        g_Players[playerId].TargetY = 106;
                    }
					else {
                        // Defs -> Dynamic Defensive Line
                         // Default: Edge of penalty area context (~130)
                         u16 defenseLineY = 130;
                         
                         // Count teammates with Y > Me (closer to midfield)
                         u8 teammatesAhead = 0;
                         for(u8 k=0; k<14; k++) {
                             if (k==playerId) continue;
                             if (g_Players[k].TeamId == playerTeamId && g_Players[k].Role != PLAYER_ROLE_GOALKEEPER) {
                                  if (g_Players[k].Y > g_Players[playerId].Y) teammatesAhead++;
                             }
                         }

                         if (teammatesAhead < 2 || g_Ball.Y < 200) {
                              if (g_Ball.Y > g_Players[playerId].Y) {
                                   defenseLineY = g_Ball.Y - 40;
                                   if (defenseLineY < 100) defenseLineY = 100;
                              }
                         }
                         g_Players[playerId].TargetY = defenseLineY;
                    }
				}

				if (g_Players[playerId].Role % 2 != 0) {
                     // LEFT SIDE PLAYER
                     // Ensure we don't drift too far Right
                     u16 intendedX = g_Ball.X - 40;
                     if (g_Ball.X > FIELD_POS_X_CENTER && intendedX > FIELD_POS_X_CENTER + 20) {
                          intendedX = FIELD_POS_X_CENTER + 20; // Stay central
                     }
                     g_Players[playerId].TargetX = intendedX; 
                } 
				else {
                     // RIGHT SIDE PLAYER
                     // Ensure we don't drift too far Left
                     u16 intendedX = g_Ball.X + 40;
                     if (g_Ball.X < FIELD_POS_X_CENTER && intendedX < FIELD_POS_X_CENTER - 20) {
                          intendedX = FIELD_POS_X_CENTER - 20; // Stay central
                     }
                     g_Players[playerId].TargetX = intendedX; 
                }
				
				if (g_Players[playerId].TargetX < FIELD_BOUND_X_LEFT + 20) g_Players[playerId].TargetX = FIELD_BOUND_X_LEFT + 20;
				if (g_Players[playerId].TargetX > FIELD_BOUND_X_RIGHT - 20) g_Players[playerId].TargetX = FIELD_BOUND_X_RIGHT - 20;
			}

            // SEPARATION (DEFENSE)
			for(u8 i=0; i<14; i++) {
                if (i == playerId) continue;
				if (g_Players[i].TeamId != playerTeamId) continue;
				if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) continue;
				i16 dx = (i16)g_Players[playerId].TargetX - (i16)g_Players[i].X;
                i16 dy = (i16)g_Players[playerId].TargetY - (i16)g_Players[i].Y;
                if (dx > -60 && dx < 60 && dy > -60 && dy < 60) {
					if (dx >= 0) g_Players[playerId].TargetX += 12; else g_Players[playerId].TargetX -= 12;
					if (dy >= 0) g_Players[playerId].TargetY += 12; else g_Players[playerId].TargetY -= 12;
				}
			}
		}
	}
}


void PutBallOnPlayerFeet(u8 playerId){
	
	if (g_Ball.PossessionPlayerId != playerId) {
		g_Ball.PossessionPlayerId=playerId;
		g_Ball.LastTouchTeamId=g_Players[playerId].TeamId;
		g_Ball.PassTargetPlayerId = NO_VALUE; // Clear any pending pass
		g_Ball.ShotActive = 0; // Clear any pending shot
		SetPlayerBallPossession(g_Ball.PossessionPlayerId);
        
        // Prevent immediate action (Shot/Pass) upon receiving - INCREASED to 30 frames (0.5s)
        g_ActionCooldown = 30;
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

	// Special adjustment: if TEAM_2 goalkeeper, bring ball closer to body
	if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER && g_Players[playerId].TeamId == TEAM_2) {
		distY = (distY > 2) ? (distY - 2) : distY; // bring ball 2px closer vertically
	}

	i8 extraX = 0;
	if (g_Players[playerId].Role == PLAYER_ROLE_GOALKEEPER && g_Players[playerId].TeamId == TEAM_1) {
		if (!isGkSideMove && !g_GkIsGroundKick) extraX = -15; // Only offset if NOT ground kick
	}

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
void TickBallCollision(){
	if(g_MatchStatus!=MATCH_IN_ACTION){
		return;
	}

	// Increment Hold Timer if someone has the ball
	if (g_Ball.PossessionPlayerId != NO_VALUE) {
		if (g_Ball.PossessionTimer < 255) g_Ball.PossessionTimer++;
	}
	
	// PASSING HEIGHT CHECK
    bool impossibleToReach = false;
	if (g_Ball.PossessionPlayerId == NO_VALUE) { // Ball in air
		if (g_Ball.Size >= 5) impossibleToReach = true;
        // If High Shot (Kick), prevent interception at strict launch
        if (g_Ball.ShotActive == 1) {
             i16 diffStart = (i16)g_Ball.X - (i16)g_Ball.PassStartX; 
             if (diffStart < 0) diffStart = -diffStart;
             if (diffStart < 20) impossibleToReach = true;
        }
	}
	
	for(u8 i=0; i<14; i++){
		if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
		if(g_Ball.PossessionPlayerId == i) continue; // Skip self

        // Determine effective hit distance
        // Normal players: 14px radius (20x20 box)
        // GK: 14px radius (28x28 box) -> INCREASED FOR DIVING
        u8 hitDist = 14;
        if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
             if (g_Ball.ShotActive) hitDist = 20; // 15px + tolerance
             else hitDist = 14; 
        }

        // Check proximity
		u16 diffX = (g_Ball.X > g_Players[i].X) ? (g_Ball.X - g_Players[i].X) : (g_Players[i].X - g_Ball.X);
		u16 diffY = (g_Ball.Y > g_Players[i].Y) ? (g_Ball.Y - g_Players[i].Y) : (g_Players[i].Y - g_Ball.Y);

		if(diffX < hitDist && diffY < hitDist){ 
			if (g_Ball.PossessionPlayerId == NO_VALUE) {
                // --- BALL IS FREE ---

      

                // 1. Check if unreachable (height or just kicked)
                // if (impossibleToReach) continue; // MOVED check inside specific blocks (GK ignores height on shots)
                
                // bool impossibleForPlayer = impossibleToReach;
                // if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER && g_Ball.ShotActive) impossibleForPlayer = false; // GK catches shots always
                
                // if (impossibleForPlayer) continue; 

                // if (g_Ball.Size >= 4 && g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) continue;

                // 2. Ignore Launcher (Double check distance from current shot start to prevent self-collision)
                // Only apply this check during INITIAL HIGH SHOT/PASS phase (ShotActive == 1 or Pass Active).
                // Once ball bounces or rolls (States 2, 3), the "Start" resets to the bounce point,
                // so we must NOT enforce distance checks there (otherwise ball is un-pickupable at bounce spots).
                if (g_Ball.ShotActive == 1 || g_Ball.PassTargetPlayerId != NO_VALUE) {
                    i16 dxStart = (i16)g_Ball.X - (i16)g_Ball.PassStartX;
                    i16 dyStart = (i16)g_Ball.Y - (i16)g_Ball.PassStartY;
                    if (dxStart < 0) dxStart = -dxStart;
                    if (dyStart < 0) dyStart = -dyStart;
                    if ((dxStart + dyStart) < 24) continue; 
                }

                // 3. GK Interception Logic
                if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
                     
                     bool wasShot = (g_Ball.ShotActive != 0);

                     // DIVING LOGIC
                     if (g_Ball.ShotActive) {
                          i16 signedDiffX = (i16)g_Ball.X - (i16)g_Players[i].X;
                          
                          // Central Save (tolerance 5px)
                          if (signedDiffX >= -5 && signedDiffX <= 5) {
                               // Standard Catch
                               // (Pose handles in GoalkeeperWithBall)
                          } 
                          else {
                               // Diving Save (6px to 15px+)
                               // Use Diving Poses
                               u8 team = g_Players[i].TeamId;
                               u8 divePose = 0;
                               
                               if (signedDiffX > 5) { // Ball to Right
                                   if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_RIGHT;
                                   else divePose = PLAYER_POSE_TEAM2_GK_DOWN_RIGHT;
                               } else { // Ball to Left
                                   if (team == TEAM_1) divePose = PLAYER_POSE_TEAM1_GK_DOWN_LEFT;
                                   else divePose = PLAYER_POSE_TEAM2_GK_DOWN_LEFT;
                               }
                               
                               g_Players[i].PatternId = divePose;
                               g_Players[i].Status = PLAYER_STATUS_POSITIONED; // Lock it
                          }
                     }

                     PutBallOnPlayerFeet(i);
                     GoalkeeperWithBall(g_Players[i].TeamId, !wasShot); 
                     
                     // Reset Ball State
                     g_Ball.PassTargetPlayerId = NO_VALUE;
                     g_Ball.ShotActive = 0;
                     g_Ball.Size = 2;
                     
                     return; // Stop checking
                }

                // 4. Normal Player Logic
				g_Ball.PassTargetPlayerId = NO_VALUE; 
                g_Ball.ShotActive = 0; 
                g_Ball.KickMoveState = 0;
				g_Ball.Size = 1; // On feet = small
				PutBallOnPlayerFeet(i);
				g_Players[i].Status = PLAYER_STATUS_HAS_BALL;
				return; // Stop checking

            } else {
                // --- BALL IS OWNED (STEAL) ---
				u8 currentOwner = g_Ball.PossessionPlayerId;

				// GK takes ball from anyone (Teammate or Opponent)
				if (g_Players[i].Role == PLAYER_ROLE_GOALKEEPER) {
					PutBallOnPlayerFeet(i);
					GoalkeeperWithBall(g_Players[i].TeamId, 1); // Treat as steal (no recoil)
					
					// Reset Ball State
					g_Ball.PassTargetPlayerId = NO_VALUE;
					g_Ball.ShotActive = 0;
					g_Ball.Size = 2;
					return;
				}

				if (g_Players[i].TeamId != g_Players[currentOwner].TeamId) {
					// Opponent detected close to ball carrier -> Steal!
					PutBallOnPlayerFeet(i);
                    // Reset ball state just in case
                    g_Ball.PassTargetPlayerId = NO_VALUE;
                    g_Ball.ShotActive = 0;
					return;
				}
            }
		}
	}
}
// *** OFFSIDE LOGIC ***
void HandleOffside(u8 offsidePlayerId) {
	V9_PrintLayerAStringAtPos(10,18,"OFFSIDE");
	g_MatchStatus=MATCH_BEFORE_OFFSIDE;
	u8 teamId = g_Players[offsidePlayerId].TeamId;
	g_RestartKickTeamId = (teamId == TEAM_1) ? TEAM_2 : TEAM_1;
	g_Timer = 0;
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
const unsigned char g_Sprites1_palette_fio[] =
{
	0x00, 0x00, 0x00, // [0] Transparent (treat as color-key / background)
	0x14, 0x09, 0x14, // [1] #A349A4
	0x01, 0x01, 0x01, // [2] #010101 (SHOES)
	0x05, 0x03, 0x01, // [3] #2F1F0D 
	0x1B, 0x1A, 0x1B, // [4] #DCD7D9 
	0x1E, 0x1A, 0x08, // [5] #F7D647 (FACE)
	0x1B, 0x13, 0x09, // [6] #DD9C48 (T-SHIRT BORDERS)
	0x1B, 0x02, 0x14, // [7] #df14a2 (T-SHIRT)
	0x1B, 0x13, 0x09, // [8] #DD9C48 (SHORTS)
	0x1B, 0x13, 0x09, // [9] #DD9C48
	0x1F, 0x1E, 0x01, // [A] #FAF60F
	0x1D, 0x03, 0x02, // [B] #EB1A12
	0x05, 0x03, 0x01, // [C] #2F1F0E
	0x01, 0x01, 0x01, // [D] #0C0C0C
	0x01, 0x01, 0x01, // [E] #0D0D0D
	0x01, 0x01, 0x01, // [F] #0E0E0E
};
void InitPalette()
{
	V9_SetPalette(0, 16, g_GameFieldLayerATilesPalette);
	V9_SetPalette(16, 16, g_GameFieldLayerBTilesPalette);
	V9_SelectPaletteP1(0,1);
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
			if(g_FioBre){
				palette=g_Sprites1_palette_fio;
			}
			else{
				palette=g_Sprites1_palette_aus;
			}
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
			u8 playerId=NO_VALUE;
			if(g_RestartKickTeamId==TEAM_1){
				playerId=GetPlayerIdByRole(TEAM_1,PLAYER_ROLE_RIGHT_HALFFIELDER);
			}
			else{
				playerId=GetPlayerIdByRole(TEAM_2,PLAYER_ROLE_LEFT_HALFFIELDER);
			}
			PutBallOnPlayerFeet(playerId);
			g_MatchStatus=MATCH_IN_ACTION;
		}
	}
    if(g_MatchStatus==MATCH_BEFORE_OFFSIDE){
         if(g_Timer >= 2) { 
             ClearTextFromLayerA(10,18,7);
             g_Timer = NO_VALUE;
             
             u8 team = g_RestartKickTeamId; 
             u8 newOwner = GetClosestPlayerToBall(team, NO_VALUE);
             if (newOwner != NO_VALUE) {
                 PutBallOnPlayerFeet(newOwner);
                 g_Ball.KickMoveState = NO_VALUE;
             }
             
             g_MatchStatus = MATCH_IN_ACTION;
         }
    }
}

void ResetBallInfo(bool resetPossessionPlayer){
	g_Ball.PreviousY=g_Ball.Y;
	g_Ball.KickMoveState=NO_VALUE;
	g_Ball.Size=1;
	g_Ball.Direction=DIRECTION_NONE;
	if(resetPossessionPlayer){
		g_Ball.PossessionPlayerId=NO_VALUE;
	}
}
