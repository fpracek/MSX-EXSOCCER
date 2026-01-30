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
extern PonPonGirlInfo   g_PonPonGirls[6];					// Bank 1 = Segment 0
extern u16 				g_FrameCounter;
extern u16              g_ShotCursorX;
extern i8               g_ShotCursorDir;
extern bool 			g_GameWith2Players;


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
        const TeamStats* stats = GetTeamStats(playerTeamId);

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

                            // ANGLE CONSTRAINT (Prevent shots from tight angles near goal line)
                            if (playerTeamId == TEAM_1) {
                                if (g_Players[playerId].Y < (FIELD_BOUND_Y_TOP + 20)) {
                                    if (g_Players[playerId].X < (GOAL_X_MIN - 5) || g_Players[playerId].X > (GOAL_X_MAX + 5)) clearShot = false;
                                }
                            } else {
                                if (g_Players[playerId].Y > (FIELD_BOUND_Y_BOTTOM - 20)) {
                                    if (g_Players[playerId].X < (GOAL_X_MIN - 5) || g_Players[playerId].X > (GOAL_X_MAX + 5)) clearShot = false;
                                }
                            }

							// Aggressive Mode: In dangerous zone, shoot even if blocked if not TOO close?
							// For now, rely on clear path but check often.
							if (clearShot) {
                                // Check Shot Frequency Stat
                                if ((g_FrameCounter % 10) > stats->ShotFreq) return;

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
					if ((g_FrameCounter % 10) < stats->PassFreq) checkPassing = true;
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
            
            // SPECIAL CASE: GK HAS BALL (Restart) -> Move to Attack Formation
            if (g_MatchStatus == MATCH_BALL_ON_GOALKEEPER) {
                 // Override targets for teammates
                 if (playerTeamId == TEAM_1) { // Moving UP
                      if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = 160;
                      else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetY = 240;
                      else g_Players[playerId].TargetY = 350;
                 } else { // Moving DOWN
                      if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetY = 320;
                      else if (g_Players[playerId].Role >= PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetY = 240;
                      else g_Players[playerId].TargetY = 130;
                 }
                 
                 // X Coords (Standard spread)
                 if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_STRIKER) g_Players[playerId].TargetX = 64;
                 else if (g_Players[playerId].Role == PLAYER_ROLE_RIGHT_STRIKER) g_Players[playerId].TargetX = 192;
                 else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_HALFFIELDER) g_Players[playerId].TargetX = 48;
                 else if (g_Players[playerId].Role == PLAYER_ROLE_RIGHT_HALFFIELDER) g_Players[playerId].TargetX = 208;
                 else if (g_Players[playerId].Role == PLAYER_ROLE_LEFT_DEFENDER) g_Players[playerId].TargetX = 80;
                 else if (g_Players[playerId].Role == PLAYER_ROLE_RIGHT_DEFENDER) g_Players[playerId].TargetX = 176;
                 
                 return;
            }

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
            // Stop GK from tracking ball during shot (Reaction delay)
            if (g_Ball.ShotActive) return;

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
                i16 range = stats->Aggression;
				if (dx > -range && dx < range && dy > -range && dy < range) {
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

            bool forceRetreat = (g_MatchStatus == MATCH_BALL_ON_GOALKEEPER);
			if (opponentHasBall && playerClosesestToBallId != NO_VALUE && !forceRetreat) {
				u16 chaserY = g_Players[playerClosesestToBallId].Y;
				if (playerTeamId == TEAM_1) { if (g_Ball.Y > chaserY) chaserBeaten = true; } 
				else { if (g_Ball.Y < chaserY) chaserBeaten = true; }
			}

			if (opponentHasBall && chaserBeaten && !forceRetreat) {
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

