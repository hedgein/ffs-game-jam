//Passage # includes zero (zero is first)
with (obj_battle){
if (monster == "CULTIST") {
	//We only want to begin rolling fs the option is unlocked while the roll option menu is up
	//and we select it with "Z"
	if ((show_roll_options) && (keyboard_check_pressed(ord("Z")))) {
			//Roll mechanic
			//Only if spend_ready is false
			//aka if we're not spending points, no need to roll
			if (!spend_ready){ 		
				roll = scr_roll_mechanic();
				roll_success = scr_roll_success(scr_dice_range_array_access(monster, current_passage, roll_option), roll);
			
			} else {
				spend = scr_spend_calculate(scr_dice_range_array_access(monster, current_passage, roll_option), scr_monster_array_access(monster, current_passage, 5));
				spend_ok = scr_spend_ok(dice_points, spend);	
			}
			
			
			
			
			if (roll_success) || (spend_ok){
				switch (current_passage) {
					//Start
					case 0: {
							switch (roll_option) {
								//ignores you further
								case 0: {
										next_passage = 1;
										break;
	
								}
								//cultist snaps
								case 1: {
										next_passage = 2;
										break;
								
								}
							}
							break;
						}
					//2nd level		
					//ignores you further
					case 1: {
						switch(roll_option) {
							//start
							case 0: {
								next_passage = 0;
								break;
							}
							//inspect
							case 1 : {
								next_passage = 3;
								break;
							}
						}
						break;
					}
				
					//cultist snaps
					case 2: {
						switch(roll_option) {
							//inqusitive
							case 0: {
								next_passage = 4; 
								break;
							}
							//start
							case 1 : {
								next_passage = 0;
								break;
							}
						}
						break;
					}
					//3RD LEVEL
					//inspect
					case 3: {
						switch(roll_option) {
							//ignores you further
							case 0: {
								next_passage = 1;
								break;
							}
							//riled up 1
							case 1 : {
								next_passage = 5;
								break;
							}
							//riled up 2
							case 2: {
								next_passage = 6;
								break;
							}
						}	
						break;
					}
					
					//inquisitive
					case 4: {
						switch(roll_option) {
							//riled up 3
							case 0: {
								next_passage = 7;
								break;
							}
							//riled up 4
							case 1 : {
								next_passage = 8;
								break;
							}
							//cultist snaps
							case 2: {
								next_passage = 2;
								break;
							}
						}	
						break;
					}
					//4TH LEVEL
					//riled up 1
					case 5: {
						switch(roll_option) {
							//you slowly pull back...
							case 0: {
								next_passage = 3;
								break;
							}
							//distaction 1
							case 1 : {
								next_passage = 9;
								break;
							}
						}	
						break;
					}
					//riled up 2
					case 6: {
						switch(roll_option) {
							//distraction 1
							case 0: {
								next_passage = 9;
								break;
							}
							//cauldron
							case 1 : {
								next_passage = 10;
								break;
							}
						}	
						break;
					}
					//riled up 3
					case 7: {
						switch(roll_option) {
							//Cauldron
							case 0: {
								next_passage = 10;
								break;
							}
							//distraction 2
							case 1 : {
								next_passage = 11;
								break;
							}
						}	
						break;
					}
					//riled up 4
					case 8: {
						switch(roll_option) {
							//distraction 2
							case 0: {
								next_passage = 11;
								break;
							}
							//inquisitive
							case 1 : {
								next_passage = 4;
								break;
							}
						}	
						break;
					}
					//5TH LEVEL
					//distraction 1
					case 9: {
						switch(roll_option) {
							//riled up 1
							case 0: {
								next_passage = 5;
								break;
							}
							//prelude fallen
							case 1 : {
								next_passage = 12;
								break;
							}
						}	
						break;
					}
					
					//cauldron
					case 10: {
						switch(roll_option) {
							//prelude fallen
							case 0: {
								next_passage = 12;
								break;
							}
							//prelude accident
							case 1 : {
								next_passage = 13;
								break;
							}
						}	
						break;
					}
					
					//distraction 2
					case 11: {
						switch(roll_option) {
							//prelude accident
							case 0: {
								next_passage = 13;
								break;
							}
							//riled up 4
							case 1 : {
								next_passage = 8;
								break;
							}
						}	
						break;
					}
					//6TH LEVEL
					//prelude fallen
					case 12: {
						switch(roll_option) {
							//distraction 1
							case 0: {
								next_passage = 9;
								break;
							}
							//ending
							case 1 : {
								next_passage = 14;
								ending = true;
								break;
							}
						}	
						break;
					}
					//prelude accident
					case 13: {
						switch(roll_option) {
							//ending
							case 0: {
								next_passage = 14;
								ending = true;
								break;
							}
							//distraction 2
							case 1 : {
								next_passage = 11;
								break;
							}
						}	
						break;
					}
			
				}
				
		passage_text = global.battle_cultist[current_passage, 0];	
		current_passage = next_passage;
	}
		
	}	
}
}