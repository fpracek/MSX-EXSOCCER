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

// *** INIT FUNCTIONS ***




// *** TICK ***
//-----------------------------------------------------------------------------


void TickAI(u8 playerId){
	if(g_MatchStatus==MATCH_IN_ACTION || g_MatchStatus == MATCH_BALL_ON_GOALKEEPER){

        // *** REFEREE LOGIC ***
        if (playerId == REFEREE) {
            u16 ballX = g_Ball.X;
            u16 ballY = g_Ball.Y;
            u16 refX = g_Players[playerId].X;
            u16 refY = g_Players[playerId].Y;
            
            // 1. Follow Ball Y (Stay aligned horizontally mostly)
            u16 targetY = ballY;

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
						goalTargetY = FIELD_BOUND_Y_TOP - 10; 
					} else {
                        // SHOOTING RANGE
						// Goal at 430. Range 430-90 = 340.
						if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 90)) inRealShootingRange = true;
						
						// DANGEROUS ZONE
                        if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 60)) inDangerousZone = true;
						goalTargetY = FIELD_BOUND_Y_BOTTOM + 10; 
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
						i32 bestScore = -2100000000;
						int t;
						for(t=0; t<14; t++) {
							if(g_Players[t].TeamId != playerTeamId) continue;
							if(t == playerId) continue;
							if(g_Players[t].Status == PLAYER_STATUS_NONE) continue;
							if(g_Players[t].Role == PLAYER_ROLE_GOALKEEPER) continue;

							i16 dx = (i16)g_Players[t].X - (i16)g_Players[playerId].X;
							i16 dy = (i16)g_Players[t].Y - (i16)g_Players[playerId].Y;
							u16 adx = (dx < 0) ? -dx : dx;
							u16 ady = (dy < 0) ? -dy : dy;
							if (adx < 40 && ady < 40) continue; // Minimum pass distance
							
							// Visibility Check (Expanded Margin to 300px)
							if (g_Players[t].Y < g_FieldCurrentYPosition - 40 || 
								g_Players[t].Y > (g_FieldCurrentYPosition + 252)) continue;

							i32 advanceScore = (playerTeamId == TEAM_1) ? -dy : dy;
							
							// If not in trouble, only pass forward!
							if (!isPanicPass) {
								if (advanceScore < 40) continue; // Must gain at least 40px ground
							} else {
								// Panic? Just don't pass into own goal if possible
								if (advanceScore < -150) continue;
							}
							
							i32 score = advanceScore - (adx/4); // Minimal lateral penalty
							
							if (score > bestScore) {
								bestScore = score;
								bestT = t;
							}
						}
						
						// Found a target?
						if (bestT != NO_VALUE) {
							// If panic, any open player is fine (-80).
							// If creative, must be a good forward pass (+10).
							i32 threshold = isPanicPass ? -80 : 10;
							
							if (bestScore > threshold) {
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
				
				// MIDFIELDERS: SUPPORT AHEAD
				if (playerTeamId == TEAM_1) g_Players[playerId].TargetY = g_Ball.Y - 60;
				else g_Players[playerId].TargetY = g_Ball.Y + 60;
				
				if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetX = 48;
				else g_Players[playerId].TargetX = 208;
				
			} else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER || 
					   g_Players[playerId].Role == PLAYER_ROLE_RIGHT_DEFENDER) {
				
				// DEFENDERS: SUPPORT BEHIND
				if (playerTeamId == TEAM_1) {
					g_Players[playerId].TargetY = g_Ball.Y + 30;
					// Clamp (Max 30px into opponent half)
					if (g_Players[playerId].TargetY < (midFieldY - 30)) g_Players[playerId].TargetY = (midFieldY - 30);
				} else {
					g_Players[playerId].TargetY = g_Ball.Y - 30;
					if (g_Players[playerId].TargetY > (midFieldY + 30)) g_Players[playerId].TargetY = (midFieldY + 30);
				}
				
				if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) g_Players[playerId].TargetX = 80;
				else g_Players[playerId].TargetX = 176;

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
					if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = FIELD_POS_Y_CENTER - 40;
					else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetY = (g_Ball.Y + defGoalY) / 2 - 50; 
					else g_Players[playerId].TargetY = g_Ball.Y + 40; 
					
					if (g_Players[playerId].Role <= PLAYER_ROLE_RIGHT_DEFENDER && g_Players[playerId].TargetY < 300) 
						g_Players[playerId].TargetY = 300;

                    // DEFENSIVE LINE HOLD (Don't hug goal line prematurely)
                    if (g_Players[playerId].TargetY > 380 && g_Ball.Y < 380) {
                        g_Players[playerId].TargetY = 380;
                    }
						
				} else { // Defend Top (Low Y)
					if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = FIELD_POS_Y_CENTER + 40;
					else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetY = (g_Ball.Y + defGoalY) / 2 + 50;
					else g_Players[playerId].TargetY = g_Ball.Y - 40;
					
					if (g_Players[playerId].Role <= PLAYER_ROLE_RIGHT_DEFENDER && g_Players[playerId].TargetY > 180) 
						g_Players[playerId].TargetY = 180;

                    // DEFENSIVE LINE HOLD (Don't hug goal line prematurely)
                     if (g_Players[playerId].TargetY < 100 && g_Ball.Y > 100) {
                        g_Players[playerId].TargetY = 100;
                    }
				}

				if (g_Players[playerId].Role % 2 != 0) g_Players[playerId].TargetX = g_Ball.X - 40; 
				else g_Players[playerId].TargetX = g_Ball.X + 40; 
				
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
void TickP1(){
	TickFieldScrollingAction();
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
	g_Ball.LastTouchTeamId=g_Players[playerId].TeamId;
	g_Ball.PassTargetPlayerId = NO_VALUE; // Clear any pending pass
	g_Ball.ShotActive = 0; // Clear any pending shot
	SetPlayerBallPossession(g_Ball.PossessionPlayerId);

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

    // Use KickMoveState for animation if set
    u8 animStep = g_Ball.KickMoveState;
    if (animStep > 3) animStep = 3; // Default/Reset to 3 (Close) if NO_VALUE (255)

	u8 currentOffset = DribbleAnimOffsets[animStep];
	u8 currentOffsetDiag = DribbleAnimOffsetsDiag[animStep];

	u8 distX = BallBaseDistX[dir] + ((dir==DIRECTION_UP || dir==DIRECTION_DOWN) ? 0 : (dir == DIRECTION_LEFT || dir == DIRECTION_RIGHT ? currentOffset : currentOffsetDiag));
	u8 distY = BallBaseDistY[dir] + ((dir==DIRECTION_LEFT || dir==DIRECTION_RIGHT) ? 0 : (dir == DIRECTION_UP || dir == DIRECTION_DOWN ? currentOffset : currentOffsetDiag));
	
	switch (dir){
		case DIRECTION_UP:
			g_Ball.X=g_Players[playerId].X + BallAlignCorrectX[dir];
			g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[dir];
			break;
		case DIRECTION_DOWN:
			g_Ball.X=g_Players[playerId].X + BallAlignCorrectX[dir];
			g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[dir];
			break;
		case DIRECTION_LEFT:
			g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[dir];
			g_Ball.Y=g_Players[playerId].Y + BallAlignCorrectY[dir];
			break;
		case DIRECTION_RIGHT:
			g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[dir];
			g_Ball.Y=g_Players[playerId].Y + BallAlignCorrectY[dir];
			break;
		case DIRECTION_UP_LEFT:
			g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[dir];
			g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[dir];
			break;
		case DIRECTION_UP_RIGHT:
			g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[dir];
			g_Ball.Y=g_Players[playerId].Y - distY + BallAlignCorrectY[dir];
			break;
		case DIRECTION_DOWN_LEFT:
			g_Ball.X=g_Players[playerId].X - distX + BallAlignCorrectX[dir];
			g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[dir];
			break;
		case DIRECTION_DOWN_RIGHT:
			g_Ball.X=g_Players[playerId].X + distX + BallAlignCorrectX[dir];
			g_Ball.Y=g_Players[playerId].Y + distY + BallAlignCorrectY[dir];
			break;
	}
	g_Ball.PreviousY=g_Ball.Y;
	g_Ball.Direction=dir;
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
			if (playerId==g_Team1ActivePlayer || (g_GameWith2Players && playerId==g_Team2ActivePlayer)) {
				// Ensure we are not highlighting REFEREE even if logic fails (safety check)
				attr.Pattern=attr.Pattern+64;

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
    if(g_MatchStatus == MATCH_AFTER_IN_GOAL) return; // FIX: Don't interfere with celebration
	if(g_MatchStatus!=MATCH_NOT_STARTED){
		bool allPlayersInPosition = true;
		
		for(u8 i=0;i<15;i++){
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
				
				//DEBUG_LOGNUM("TEST",g_MatchStatus);
				if(g_MatchStatus==MATCH_BEFORE_KICK_OFF){
					
					if(g_Players[i].PatternId!=PLAYER_POSE_BACK && g_Players[i].PatternId!=PLAYER_POSE_FRONT){
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
		//DEBUG_BREAK();
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
        if(g_Players[i].Status == PLAYER_STATUS_NONE) continue;
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
			// Limit to 120px. 
			if (((i32)dx*(i32)dx + (i32)dy*(i32)dy) > 14400) continue;
		}

        dot = ((i32)dx * dirX) + ((i32)dy * dirY);
		
		// DIRECTION CHECK
		if (dot <= 0) continue; 

        // Heuristic
        // Simplified scoring: Dot Product (Alignment) - Linear Distance Penalty
        // Avoids expensive squares and divisions.
        score = dot - ((i32)(adx + ady) * 40); 
		
        if (score > bestScore) {
            bestScore = score;
            bestTarget = i;
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
    if (teamId == TEAM_1) g_Players[gkId].PatternId = PLAYER_POSE_TEAM1_GK_BALL_FRONT;
    else g_Players[gkId].PatternId = PLAYER_POSE_TEAM2_GK_BALL_FRONT;
    
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
}

void TickGoalkeeperAnimation() {
    if (g_MatchStatus != MATCH_BALL_ON_GOALKEEPER) return;
    if (s_GkAnimPlayerId == NO_VALUE) return;
    
    s_GkAnimTimer++;
    
    u8 kickTime = 30; // Default kick time (Animation end)
    if (s_GkRecoilY == 0) kickTime = 60; // 1 Second delay for steals/no-recoil

    // Recoil Animation (First 30 frames)
    if (s_GkAnimTimer < kickTime) {
        if (s_GkAnimTimer < 30 && (s_GkAnimTimer % 8) == 0 && s_GkRecoilY != 0) { // Slow movement
            g_Players[s_GkAnimPlayerId].Y += s_GkRecoilY;
            
            // Safety Clamp
           if(g_Players[s_GkAnimPlayerId].Y < FIELD_BOUND_Y_TOP) g_Players[s_GkAnimPlayerId].Y = FIELD_BOUND_Y_TOP;
           if(g_Players[s_GkAnimPlayerId].Y > FIELD_BOUND_Y_BOTTOM) g_Players[s_GkAnimPlayerId].Y = FIELD_BOUND_Y_BOTTOM;

            g_Players[s_GkAnimPlayerId].TargetY = g_Players[s_GkAnimPlayerId].Y; // Sync target
        }
        // Force Pose again
        if (g_Players[s_GkAnimPlayerId].TeamId == TEAM_1) g_Players[s_GkAnimPlayerId].PatternId = PLAYER_POSE_TEAM1_GK_BALL_FRONT;
        else g_Players[s_GkAnimPlayerId].PatternId = PLAYER_POSE_TEAM2_GK_BALL_FRONT;

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
        }
        
    } else if (s_GkAnimTimer > (kickTime + 15)) {
        // End Animation
        g_MatchStatus = MATCH_IN_ACTION;
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
			}

			// STOP BALL (End of Bounce or Out of Bounds or blocked)
			g_Ball.ShotActive = 0;
			g_Ball.PassTargetPlayerId = NO_VALUE;
			g_Ball.PossessionPlayerId = NO_VALUE;
			g_Ball.Size = 2;
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
	else if (g_Ball.ShotActive == 1) {
		// SHOT ARC (High)
		u16 ratio = (distCovered * 100) / totalDist;
		if (ratio < 10 || ratio > 90) g_Ball.Size = 2;
		else if (ratio < 25 || ratio > 75) g_Ball.Size = 3;
		else g_Ball.Size = 4; // High
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