//Passage # includes zero (zero is first)
with (obj_battle){

	//We only want to begin rolling is the option is unlocked while the roll option menu is up
	//and we select it with "Z"
	if ((show_roll_options) && (keyboard_check_pressed(ord("Z"))) && (!ds_options_lock[| roll_option])) {
		
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
		
			
			if ((roll_success) || (spend_ok))  {
				switch (current_passage) {
					//Start
					case 0: {
						switch (roll_option) {
							//knock knock
							case 0: {
									next_passage = 1;
									break;
							}
							//grab the hammer
							case 1: {
									next_passage = 2;
									break;
							}
						}
						break;
					}
					//2ND LEVEL
					//knock knock	
					case 1: {
						switch (roll_option) {
							//shell not cracked 1
							case 0: {
								next_passage = 3;
								break;
							}
							//shell not cracked 2
							case 1: {
								next_passage = 4;
								break
							}
							//switch to grab the hammer
							case 2: {
								next_passage = 2;
								break;
							}
						}
						break;
					}
					//grab the hammer
					case 2: {
						switch (roll_option) {
							//shell cracked 1
							case 0: {
								next_passage = 5;
								break;
							}
							//shell cracked 2
							case 1: {
								next_passage = 6;
								break
							}
							//switch to knock knock
							case 2: {
								next_passage = 1;
								break;
							}
						}
						break;
					}
					//3RD LEVEL
					//shell not cracked 2
					case 3: {
						switch (roll_option) {
							//snail lets you crack it
							case 0: {
								next_passage = 7;
								break
							}
							//middle point 2
							case 1: {
								next_passage = 9;
								break;
							}
						}
						break;
					}
					
					//shell not cracked 2;
					case 4: {
						switch (roll_option) {
							//middle point
							case 0: {
								next_passage = 10;
								break
							}
							//PRELUDE (or loop back) lets you crack it
							case 1: {
								next_passage = 8;
								break;
							}
						}
						break;
					}
					
					//shell cracked!
					case 5: {
						switch (roll_option) {
							//middle point 2
							case 0: {
								next_passage = 9;
								break
							}
							//you crack it (NOT "lets you crack it")
							case 1: {
								next_passage = 11;
								break;
							}
						}
						break;
					}
					
					//shell cracked 2!
					case 6: {
						switch (roll_option) {
							//middle point
							case 0: {
								next_passage = 10;
								break;
							}
							// you crack it (NOT "lets you crack it (loopback/prelude)"
							case 1: {
								next_passage = 11;
								break;
							}
						}
						break;
					}
					
					//LOOPBACKS
					//lets you crack it
					case 7: {
						switch (roll_option) {
							//prelude snail lets you crack it  1 2
							case 0: {
								next_passage = 8;
								break
							}
							//shell not cracked 2
							case 1: {
								next_passage = 4;
								break;
							}
						}
						break;
					}
					
					//prelude snail lets you crack it 1 2
					case 8: {
						switch (roll_option) {
							//shell not cracked 2
							case 0: {
								next_passage = 6;
								break
							}
							//you crack it 
							case 1: {
								next_passage = 11;
								break;
							}
						}
						break;
					}
					//MIDDLE SECTION
					//middle point 2
					case 9: {
						switch (roll_option) {
							//prelude middle end
							case 0: {
								next_passage = 12;
								break
							}
							//prelude snail lets you crack it end 1 2
							case 1: {
								next_passage = 8;
								break;
							}
						}
						break;
					}
					
					//middle point
					case 10: {
						switch (roll_option) {
							//prelude middle end
							case 0: {
								next_passage = 12;
								break
							}
							//prelude you crack it
							case 1: {
								next_passage = 13;
								break;
							}
						}
						break;
					}
					
					//you crack it
					case 11: {
						switch (roll_option) {
							//prelude you crack it
							case 0: {
								next_passage = 13;
								break
							}
							//prelude you crack it 2
							case 1: {
								next_passage = 14;
								break;
							}
						}
						break;
					}
					
					//PRELUDE LEVEL
					//prelude middle end
					case 12: {
						switch (roll_option) {
							//middle end
							case 0: {
								next_passage = 15;
								obj_snail.animation_state = "CRACKED";
								break
							}
							//shell not cracked 1
							case 1: {
								next_passage = 3;
								break;
							}
							//prelude you crack it
							case 2: {
								next_passage = 13;	
								obj_snail.animation_state = "CRACKED";
								break;
							}
						}
						ending = true;
						break;
					}
					
					//prelude you crack it
					case 13: {
						switch (roll_option) {
							//you crack it end 1
							case 0: {
								next_passage = 16;
								
								break
							}
							//you crack it end 2
							case 1: {
								next_passage = 17;
								
								break;
							}
						}
						ending = true;
						break;
					}
					
					//prelude you crack it 2
					case 14: {
						switch (roll_option) {
							//you crack it end 2
							case 0: {
								next_passage = 17;
								
								break
							}
							//you crack it end 1
							case 1: {
								next_passage = 16;
								
								break;
							}
						}
						ending = true;
						break;
					}
				
				//ENDING LEVEL
				//middle end
				//	case 15: {
				//		s
						
				//	break;
				//}
				
				////you  crack it end 1
				//case 16: {
				//	state = "INIT";
				//	break;
				//}
				
				////you crack it end 2
				//case 17: {

				//	state = "INIT";
				//	break;
				//}
		
		}
		passage_text = global.battle_snail[current_passage, 0];
		current_passage = next_passage;
		last_lock_boolean = false;
		lock_counter = 0;
		if (ds_exists(ds_options_lock, ds_type_list)){
			ds_list_destroy(ds_options_lock);
		}
		
	}	
}
}