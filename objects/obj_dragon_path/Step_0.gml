//Passage # includes zero (zero is first)
with (obj_battle){

if (monster == "DRAGON") {
	//We only want to begin rolling is the option is unlocked while the roll option menu is up
	//and we select it with "Z"
	if (show_roll_options) && (keyboard_check_pressed(ord("Z"))) && (!ds_options_lock[| roll_option]) {
			//Roll mechanic here
			//Only if spend_ready is false
			//aka if we're not spending points, no need to roll
			if (!spend_ready){ 		
				roll = scr_roll_mechanic();
				roll_success = scr_roll_success(scr_dice_range_array_access(monster, current_passage, roll_option), roll);
			
			} else {
				spend = scr_spend_calculate(scr_dice_range_array_access(monster, current_passage, roll_option), scr_monster_array_access(monster, current_passage, 5));
				spend_ok = scr_spend_ok(dice_points, spend);	
			}
			
			
			
			
			if (roll_success) || (spend_ok) {
				switch (current_passage) {
					//Start
					case 0: {
							switch (roll_option) {
								//interact 1
								case 0: {
										next_passage = 1;
										break;
	
								}
								//talking 1
								case 1: {
										next_passage = 2;
										break;
								
								}
							}
							break;
						}
					//interact 1
					case 1: {
						switch (roll_option) {
							//talking 1
							case 0: {
								next_passage = 2;
								break; 
							}
							//interact 2
							case 1: {
								next_passage = 3;
								break;
							}
						}
						break;
					}
					
					//talking 1
					case 2: {
						switch (roll_option) {
							//interact 2
							case 0: {
								next_passage = 3;
								break; 
							}
							//layer 1
							case 1: {
								next_passage = 9;
								break;
							}
							//talking 2
							case 2: {
								next_passage = 4;
								break;
							}
						}
						break;
					}
					//interact 2
					case 3: {
						switch (roll_option) {
							//talking 2
							case 0: {
								next_passage = 4;
								break; 
							}
							//layer 2
							case 1: {
								next_passage = 10;
								break;
							}
							//interact 3
							case 2: {
								next_passage = 5;
								break;
							}
						}
						break;
					}
					
					//talking 2
					case 4: {
						switch (roll_option) {
							//interact 3
							case 0: {
								next_passage = 5;
								break; 
							}
							//layer 3
							case 1: {
								next_passage = 11;
								break;
							}
							//talking 3
							case 2: {
								next_passage = 6;
								break;
							}
						}
						break;
					}
					
					//interact 3
					case 5: {
						switch (roll_option) {
							//talking 3
							case 0: {
								next_passage = 6;
								break; 
							}
							//interact 4
							case 1: {
								next_passage = 7;
								break;
							}
						}
						break;
					}
					
					//talking 3
					case 6: {
						switch (roll_option) {
							//interact 4
							case 0: {
								next_passage = 7;
								break; 
							}
							//start
							case 1: {
								next_passage = 0;
								break;
							}
						}
						break;
					}
					
					//interact 4
					case 7: {
						switch (roll_option) {
							//start
							case 0: {
								next_passage = 0;
								break; 
							}
							//layer 0
							case 1: {
								next_passage = 8;
								break;
							}
							//interact 1
							case 2: {
								next_passage = 1;
								break;
							}
						}
						break;
					}
					//INNER LAYER
					//layer 0
					case 8: {
						switch (roll_option) {
							//layer 1
							case 0: {
								next_passage = 9;
								break; 
							}
							//layer 2
							case 1: {
								next_passage = 10;
								break;
							}
						}
						break;
					}
					
					//layer 1
					case 9: {
						switch (roll_option) {
							//layer 2
							case 0: {
								next_passage = 10;
								break; 
							}
							//layer 3
							case 1: {
								next_passage = 11;
								break;
							}
						}
						break;
					}
					
					//layer 2
					case 10: {
						switch (roll_option) {
							//layer 1
							case 0: {
								next_passage = 11;
								break; 
							}
							//layer 2
							case 1: {
								next_passage = 12;
								break;
							}
						}
						break;
					}
					
					//layer 3
					case 11: {
						switch (roll_option) {
							//layer 4
							case 0: {
								next_passage = 12;
								break; 
							}
							//layer 0
							case 1: {
								next_passage = 8;
								break;
							}
						}
						break;
					}
					//layer 4
					case 12: {
						switch (roll_option) {
							//layer 0
							case 0: {
								next_passage = 8;
								break; 
							}
							//ending
							case 1: {
								next_passage = 13;
								ending = true;
								break;
							}
						}
						break;
					}
					

				}
		passage_text = global.battle_dragon[current_passage, 0];
		current_passage = next_passage;
		last_lock_boolean = false;
		lock_counter = 0;

		if (ds_exists(ds_options_lock, ds_type_list)){
			ds_list_destroy(ds_options_lock);
		}
	}
		
	}	
}
}
