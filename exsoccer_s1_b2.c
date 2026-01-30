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
extern u8           g_ShootCooldown; // From exsoccer.c


void TickCornerKick() {
    if (g_MatchStatus != MATCH_BEFORE_CORNER_KICK) return;

    static u16 s_ForceKickTimer = 0;
    if (g_Timer == 0) s_ForceKickTimer = 0;

    // -------------------------------------------------------------------------
    // 1. DETERMINE KICKER ID (Centralized)
    // -------------------------------------------------------------------------
    u8 kickerId = NO_VALUE;
    if (g_Ball.PossessionPlayerId != NO_VALUE) {
        kickerId = g_Ball.PossessionPlayerId;
    } else {
        if (g_CornerKickSide == CORNER_SIDE_LEFT) kickerId = GetPlayerIdByRole(g_RestartKickTeamId, PLAYER_ROLE_LEFT_STRIKER);
        else kickerId = GetPlayerIdByRole(g_RestartKickTeamId, PLAYER_ROLE_RIGHT_STRIKER);
    }
    
    // Safety check: if Kicker is still NO_VALUE (shouldn't happen), try closest to corner
    if (kickerId == NO_VALUE) {
         kickerId = GetClosestPlayerToBall(g_RestartKickTeamId, NO_VALUE);
    }

    // -------------------------------------------------------------------------
    // 2. SETUP PHASE (0-3 Seconds: Position Players)
    // -------------------------------------------------------------------------
    
    // Check arrival (Kicker)
    bool kickerArrived = false;
    if (kickerId != NO_VALUE) {
         i16 dx = (i16)g_Players[kickerId].X - (i16)g_Players[kickerId].TargetX;
         i16 dy = (i16)g_Players[kickerId].Y - (i16)g_Players[kickerId].TargetY;
         
         if (dx >= -2 && dx <= 2 && dy >= -2 && dy <= 2) {
             kickerArrived = true;
             g_Players[kickerId].X = g_Players[kickerId].TargetX;
             g_Players[kickerId].Y = g_Players[kickerId].TargetY;
             g_Players[kickerId].Status = PLAYER_STATUS_POSITIONED;
             
             if (g_Ball.PossessionPlayerId != kickerId) {
                 SetPlayerBallPossession(kickerId);
                 g_Ball.PossessionPlayerId = kickerId;
                 PutBallOnPlayerFeet(kickerId);
             }
         }
    }
    
    // Check arrival (Teammates)
    bool teammatesArrived = true;
    for(u8 i=0; i<14; i++) {
        if (g_Players[i].TeamId == g_RestartKickTeamId && i != kickerId && g_Players[i].Role != PLAYER_ROLE_GOALKEEPER) {
             // If not positioned, check distance
             if (g_Players[i].Status != PLAYER_STATUS_POSITIONED) {
                 i16 dx = (i16)g_Players[i].X - (i16)g_Players[i].TargetX;
                 i16 dy = (i16)g_Players[i].Y - (i16)g_Players[i].TargetY;
                 if (dx < -6 || dx > 6 || dy < -6 || dy > 6) {
                     teammatesArrived = false; // Someone is still far away
                 } else {
                     // Force arrival if close
                     g_Players[i].X = g_Players[i].TargetX;
                     g_Players[i].Y = g_Players[i].TargetY;
                     g_Players[i].Status = PLAYER_STATUS_POSITIONED;
                 }
             }
        }
    }

    // Wait until timer finishes AND everyone has arrived
    if (g_Timer < 180 || (kickerId != NO_VALUE && !kickerArrived) || !teammatesArrived) {
        if (g_Timer < 180) g_Timer++;
        
        // ORIENTATION UPDATE
        for(u8 i=0; i<14; i++) {
             // Skip if player is not positioned (running to spot) - except kicker (handled above)
             if (i != kickerId && g_Players[i].Status != PLAYER_STATUS_POSITIONED && 
                 !(g_Players[i].X == g_Players[i].TargetX && g_Players[i].Y == g_Players[i].TargetY)) continue;
             
             u8 lookDir = DIRECTION_NONE;
             
             if (i == kickerId) {
                  // Kicker: Face Pitch
                  if (g_RestartKickTeamId == TEAM_1) lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_DOWN_RIGHT : DIRECTION_DOWN_LEFT;
                  else lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_UP_RIGHT : DIRECTION_UP_LEFT;
             }
             else if (g_Players[i].TeamId == g_RestartKickTeamId) {
                  // Attackers: Face Goal or Corner
                  if (g_RestartKickTeamId == TEAM_1 && i != kickerId) { 
                      // Team 1 Receivers: Face Corner
                      lookDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_UP_LEFT : DIRECTION_UP_RIGHT;
                  } else {
                      // Others: Face Goal
                      lookDir = (g_RestartKickTeamId == TEAM_1) ? DIRECTION_UP : DIRECTION_DOWN;
                  }
             } else {
                  // Defenders: Face Ball
                  i16 dx = (i16)g_Ball.X - (i16)g_Players[i].X;
                  i16 dy = (i16)g_Ball.Y - (i16)g_Players[i].Y;
                  // Simple logic
                  if (dy < -20) lookDir = (dx > 20) ? DIRECTION_UP_RIGHT : ((dx < -20) ? DIRECTION_UP_LEFT : DIRECTION_UP);
                  else if (dy > 20) lookDir = (dx > 20) ? DIRECTION_DOWN_RIGHT : ((dx < -20) ? DIRECTION_DOWN_LEFT : DIRECTION_DOWN);
                  else lookDir = (dx > 0) ? DIRECTION_RIGHT : DIRECTION_LEFT;
             }
             
             if (lookDir != DIRECTION_NONE) {
                  g_Players[i].Direction = lookDir;
                  g_Players[i].PatternId = GetNoMovingPlayerPatternId(lookDir);
             }
        }
        return; // END SETUP PHASE
    }

    // Move Text Clearing to here: When actually starting the action
    ClearTextFromLayerA(10, 12, 11);

    // -------------------------------------------------------------------------
    // 3. ACTION PHASE (Movement/Kick)
    // -------------------------------------------------------------------------
    
    // Safety Force Kicker Position (Again)
    if (kickerId != NO_VALUE) {
         g_Players[kickerId].X = g_Players[kickerId].TargetX;
         g_Players[kickerId].Y = g_Players[kickerId].TargetY;
    }
    
    bool isHuman = (g_RestartKickTeamId == TEAM_1 || (g_GameWith2Players && g_RestartKickTeamId == TEAM_2));
    
    // Timeout Logic (4 seconds = 240 frames)
    if (isHuman) s_ForceKickTimer++;

    if (isHuman) {
        if (g_RestartKickTeamId == TEAM_1) {
            // --- TEAM 1 HUMAN (North) ---
            u8 candLeft = NO_VALUE;
            u8 candRight = NO_VALUE;
            
            for(u8 c=0; c<14; c++) {
                 if (g_Players[c].TeamId == TEAM_1 && c != kickerId && g_Players[c].Role != PLAYER_ROLE_GOALKEEPER) {
                      u8 tx = g_Players[c].TargetX;
                      // Widened ranges to ensure we catch the players even if they are slightly off
                      if (tx >= 40 && tx <= 110) candLeft = c;
                      if (tx >= 130 && tx <= 220) candRight = c;
                 }
            }
            if (candLeft == NO_VALUE) candLeft = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_LEFT_HALFFIELDER);
            if (candRight == NO_VALUE) candRight = GetPlayerIdByRole(TEAM_1, PLAYER_ROLE_RIGHT_HALFFIELDER);

            // Default
            if (g_CornerKickTargetId == NO_VALUE) {
                 if (candLeft != NO_VALUE) g_CornerKickTargetId = candLeft;
                 else if (candRight != NO_VALUE) g_CornerKickTargetId = candRight; 
            }
            
            // Input
            u8 joyDir = GetJoystick1Direction();
            static bool joyMoved = false;
            
            if (joyDir == DIRECTION_LEFT && !joyMoved && candLeft != NO_VALUE) {
                g_CornerKickTargetId = candLeft; joyMoved = true;
            } else if (joyDir == DIRECTION_RIGHT && !joyMoved && candRight != NO_VALUE) {
                g_CornerKickTargetId = candRight; joyMoved = true;
            } else if (joyDir == DIRECTION_NONE) {
                joyMoved = false;
            }
            
            // Correction removed to avoid instability. We trust the selection.
            
            // --- KICKER LOCK RE-ENFORCE ---
            // Re-apply kicker lock here to prevent Input from rotating him
            if (kickerId != NO_VALUE) {
                u8 kDir = (g_CornerKickSide == CORNER_SIDE_LEFT) ? DIRECTION_DOWN_RIGHT : DIRECTION_DOWN_LEFT;
                g_Players[kickerId].Direction = kDir;
                g_Players[kickerId].PatternId = GetNoMovingPlayerPatternId(kDir);
                g_Players[kickerId].X = g_Players[kickerId].TargetX;
                g_Players[kickerId].Y = g_Players[kickerId].TargetY;
                // Override status so MovePlayer might skip him if he has ball
                g_Players[kickerId].Status = PLAYER_STATUS_POSITIONED; 
            }

            // Trigger
            bool t1Trigger = IsTeamJoystickTriggerPressed(TEAM_1);
            static bool t1Latched = false;
            if (g_Timer == 180) t1Latched = true;
            if (!t1Trigger) t1Latched = false;
            
            // Highlight
            if (g_CornerKickTargetId != NO_VALUE) {
                g_Ball.PassTargetPlayerId = g_CornerKickTargetId;
                g_PassTargetPlayer = g_CornerKickTargetId;
            }

            if ((t1Trigger && !t1Latched || s_ForceKickTimer > 240) && g_CornerKickTargetId != NO_VALUE) {
                PerformPass(g_CornerKickTargetId);
                g_MatchStatus = MATCH_IN_ACTION;
                g_CornerKickTargetId = NO_VALUE;
            }
        } 
        else {
            // --- TEAM 2 HUMAN (South - 2 Player) ---
            u8 joyDir = GetJoystick2Direction();
            bool trigger = IsTeamJoystickTriggerPressed(TEAM_2);
            static bool joyMoved = false;

            if (g_CornerKickTargetId == NO_VALUE) g_CornerKickTargetId = GetPlayerIdByRole(TEAM_2, PLAYER_ROLE_LEFT_STRIKER);
             
            if ((joyDir == DIRECTION_LEFT || joyDir == DIRECTION_RIGHT) && !joyMoved) {
                u8 curr = g_CornerKickTargetId;
                u8 loop = 0;
                do {
                    curr = (joyDir==DIRECTION_RIGHT) ? curr+1 : curr-1;
                    if (curr > 13) curr = 0;
                    if (g_Players[curr].TeamId == TEAM_2 && g_Players[curr].Role != PLAYER_ROLE_GOALKEEPER && curr != kickerId) {
                        g_CornerKickTargetId = curr; break;
                    }
                    loop++;
                } while (loop < 15);
                joyMoved = true;
            } else if (joyDir == DIRECTION_NONE) joyMoved = false;

            if (g_CornerKickTargetId != NO_VALUE) {
                g_Ball.PassTargetPlayerId = g_CornerKickTargetId;
                g_PassTargetPlayer = g_CornerKickTargetId;
            }

            if ((trigger || s_ForceKickTimer > 240) && g_CornerKickTargetId != NO_VALUE) {
                PerformPass(g_CornerKickTargetId);
                g_MatchStatus = MATCH_IN_ACTION;
                g_CornerKickTargetId = NO_VALUE;
            }
        }
    } 
    else {
        // --- CPU LOGIC (Team 2 Standard) ---
        if (g_CornerKickTargetId == NO_VALUE) {
             u8 randomRole = ((g_Timer & 1) == 0) ? PLAYER_ROLE_LEFT_STRIKER : PLAYER_ROLE_RIGHT_STRIKER;
             u8 strikerId = GetPlayerIdByRole(g_RestartKickTeamId, randomRole);
             
             // Ensure we don't pick kicker or invalid
             if (strikerId != NO_VALUE && strikerId != kickerId) {
                 g_CornerKickTargetId = strikerId;
             } else {
                 g_CornerKickTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, kickerId);
             }
        }
        
        if (g_Timer > 200) {
             if (g_CornerKickTargetId == NO_VALUE) g_CornerKickTargetId = GetClosestPlayerToBall(g_RestartKickTeamId, kickerId);
             
             PerformPass(g_CornerKickTargetId);
             g_MatchStatus = MATCH_IN_ACTION; 
             g_CornerKickTargetId = NO_VALUE;
        } else {
            g_Timer++;
        }
    }
}
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
								if (plX < (GOAL_X_MIN - 5) || plX > (GOAL_X_MAX + 5)) allowed = false;
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
								if (plX < (GOAL_X_MIN - 5) || plX > (GOAL_X_MAX + 5)) allowed = false;
							}

							if (allowed) {
								isShooting = true;
								PerformShot(g_ShotCursorX, FIELD_BOUND_Y_BOTTOM + 40);
							}
						}
					}
				}

				if (isShooting) {
					if (g_ShootCooldown > 0) return; // Prevent shooting if cooldown active
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

		if((g_FrameCounter % 3)!=0){ 
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
		
		if((g_FrameCounter % 3)!=0){ 
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
             const TeamStats* stats = GetTeamStats(g_Players[i].TeamId);
             if (g_Ball.ShotActive) hitDist = stats->GkSkill; 
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
                     if (!wasShot) g_GkIsGroundKick = false; // Force Slow/Hand mode for Steals
                     
                     // Reset Ball State
                     g_Ball.PassTargetPlayerId = NO_VALUE;
                     g_Ball.ShotActive = 0;
                     g_Ball.Size = 2;
                     
                     return; // Stop checking
                }

                // 4. Normal Player Logic
				g_Ball.PassTargetPlayerId = NO_VALUE; 
                g_Ball.ShotActive = 0; 
                g_Ball.KickMoveState = 3; // Force ball to snap to feet immediately (No visual lag)
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
                    g_GkIsGroundKick = false; // Force Slow/Hand mode for Steals
					
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





void EnforcePenaltyBoxRestriction() {
    if (g_MatchStatus != MATCH_BALL_ON_GOALKEEPER) {
        return;
    }

    u8 gkOwnerId = g_Ball.PossessionPlayerId;
    // Check if a goalkeeper actually has the ball
    if (gkOwnerId == NO_VALUE || g_Players[gkOwnerId].Role != PLAYER_ROLE_GOALKEEPER) {
        return;
    }

    u8 gkTeamId = g_Players[gkOwnerId].TeamId;
    
    // Loop through all field players
    for (u8 i = 0; i < 14; i++) { 
        if (i == gkOwnerId) continue; // Skip the GK himself

        if (gkTeamId == TEAM_1) { // Bottom GK has ball, players can't be in y > PENALTY_BOX_Y_BOTTOM
            if (g_Players[i].TargetY > PENALTY_BOX_Y_BOTTOM) {
                g_Players[i].TargetY = PENALTY_BOX_Y_BOTTOM;
                g_Players[i].Status = PLAYER_STATUS_NONE;
            }
        } else { // Top GK has ball, players can't be in y < PENALTY_BOX_Y_TOP
            if (g_Players[i].TargetY < PENALTY_BOX_Y_TOP) {
                g_Players[i].TargetY = PENALTY_BOX_Y_TOP;
                g_Players[i].Status = PLAYER_STATUS_NONE;
            }
        }
    }
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


void TickTeamSelection(){
	u8 direction= GetJoystick1Direction(); 
	if(direction!=DIRECTION_NONE){
		
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
