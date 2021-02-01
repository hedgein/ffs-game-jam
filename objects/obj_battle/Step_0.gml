if (state == "INIT") {
	if (ds_exists(ds_messages,ds_type_list)) {
		ds_list_destroy(ds_messages);
	}
	
	if (ds_exists(ds_roll_input, ds_type_list)) {
	ds_list_destroy(ds_roll_input);
	}
	

	selected_option = 0; //which option is the arrow on
	player_turn = true;
	ds_messages = ds_list_create();
	message_counter = 0 ;//Tracks which message we're on
	show_battle_text = false; //Display battle text or not

	message_timer = 0;

	enemy_timer = 0;
	
	player_dead = false;
	battle = false; 
	victory = false;

	//Roll mechanic
	show_roll_options = false; //Show inner box text roll options or not
	roll_option = 0;
	
	//Dice points
	dice_points = 0;
	dice_points_earned = 0;
	ddr_steps = 0;
	spend_ok = 0;

	
	ds_roll_input = ds_list_create();
	ds_roll_input[| 0] = 1;
	ds_roll_input[| 1] = 2;
	ds_roll_input[| 2] = 3;
	ds_roll_input[| 3] = 4;
	ds_roll_input[| 4] = 5;
	ds_roll_input[| 5] = 6;

	//Screenshake

	shake_timer = 0;

	state = "READY";
}


if (battle == true) && (state == "READY"){

	

#region SELECT OPTION

if (player_turn) && (!show_battle_text)  {


	if (!show_roll_options) && (!check_boolean) {
		if (keyboard_check_pressed(vk_down)){
			//If not the last option, go down (to next option)
			if (selected_option + 1) <= (array_length_1d(a_text) -1) {
				selected_option++;
			//Else go back to first option
			} else {
			 selected_option = 0; 
			}
			audio_play_sound(tap, 1, false);
		}

		if (keyboard_check_pressed(vk_up)) {
			//If not at top most option, go up 1 (to before option)
			if (selected_option - 1) >= 0 {
				selected_option--;
				//Else go to bottom
			} else {
				selected_option = (array_length_1d(a_text) - 1);
			}
			audio_play_sound(tap, 1, false);
		} 
				//If option is pressed
		if keyboard_check_pressed(ord("Z")) {
			if (ending) { 
				 battle = false;
				 state = "INIT";
				 //rm goto
				}
			message_counter = 0;
			if (!ds_exists(ds_messages, ds_type_list)){
				ds_messages = ds_list_create();
			}
			
			switch (selected_option) {
				case 0: {
					show_roll_options = true;
					roll_success = false;
					break;
				}
				
				case 1: {
					show_roll_options = true;
					spend_ready = true; 
					break;
				}
				
				case 2: {
					//Display dice locks here
					check_boolean = true;
					spend_ready = false;
					break;
				}
			}
			

			//if fourth menu option not needed, add later?
		
			if (selected_option != 2) && (selected_option != 0) && (selected_option != 1){
				show_battle_text = true;
			}
			
			audio_play_sound(player_action, 1, false);
		}
	} else {
		//Show which options you can roll for
		if (show_roll_options) {
			option_total_count = scr_monster_array_access(monster, current_passage, 4);
			if (keyboard_check_pressed(ord("X"))) {
				show_roll_options = false;
				spend_ready = false;
				roll_option = 0;
			}
			if (keyboard_check_pressed(vk_down)){
				//Need new system do track which passage your on
				
				//If not the last option, go down (to next option)
				if (roll_option + 1 <= option_total_count - 1) {
					roll_option++;
				//Else go back to first option
				} else {
				 roll_option = 0; 
				}
				audio_play_sound(tap, 1, false);
			}

			if (keyboard_check_pressed(vk_up)) {
				//If not at top most option, go up 1 (to before option)
				if (roll_option - 1 >= 0) {
					roll_option--;
					//Else go to bottom
				} else {
					roll_option = option_total_count - 1;
				}
				audio_play_sound(tap, 1, false);
			} 
			
			if (keyboard_check_pressed(ord("Z"))) {
				message_counter = 0;
				//Make sure message lists still exist - sometimes it can be lost
				if (!ds_exists(ds_messages, ds_type_list)){
					ds_messages = ds_list_create();
				}
				
				if (!ds_exists(ds_options_lock, ds_type_list)){
					ds_options_lock = ds_list_create();
					for (var i = 0; i < scr_monster_array_access(monster, current_passage, 4); i++) {
						ds_options_lock[| i] = false;
					}
				}
				
				
			
				//If they are on the spend option, 
				if (spend_ready = true){
					//If user tries to spend a locked option
					if (ds_options_lock[| roll_option]) {
						ds_messages[|0] = "This is locked!";
					
							show_roll_options = false;
							stay_player_turn_boolean = true;
							show_battle_text = true;
					//If option they want to spend is unlocked
					} else {
						
						
						if(spend_ok){
						
							if ( dice_points - spend < 0 ){
								dice_points = 0;
							} else {
								dice_points -= spend;
							}
							ds_messages[| 0] = "You spent " + string(spend) + " dice points!";
							spend_ok = false;
						
						} else {
							ds_messages[| 0] = "You don't have enough dice points!";
							stay_player_turn_boolean = true;
							spend_ready = false;
						}	
					}
					
				//Else do a regular roll
				} else {	
					
						//If user tries to select locked roll_option
						if (ds_options_lock[| roll_option]) {
							ds_messages[|0] = "This is locked!";
					
							show_roll_options = false;
							stay_player_turn_boolean = true;
							show_battle_text = true;
						//Only roll on false options_lock
						} else {
							//Lock the option if the roll fails
							if (!roll_success) && (!last_lock_boolean){
								ds_options_lock[| roll_option] = true;
								lock_counter++;			
							}
					
							//If the number of locks is enough, turn on last lock boolean to keep
							//one option open
							if (lock_counter + 1 >= scr_monster_array_access(monster, current_passage, 4)) {
								last_lock_boolean = true;
							}


							//Start DDR after first message 
							scr_ddr_instance_start(monster);
							//Tell user to shake dice
							ds_messages[| 0] = "Shake the dice!";
							
						}
						
					
								
				}
				//Continue Battle
					check_boolean = false;
					show_roll_options = false;
					show_battle_text = true;
					roll_option = 0;
				
			}
			
				
		}
			if (check_boolean) {
			if (keyboard_check_pressed(ord("X"))) {
				check_boolean = false;
				spend_ready = false;
			}
			show_battle_text = false;
			roll_option = 0;
		}
				
	}

	
}


#endregion

#region MESSAGES

	//Cycle through messages
	if (show_battle_text) {
		message_timer++;
		
		
		if (message_timer >= time_before_button_accepted){
			if (keyboard_check_pressed(ord("Z"))) && (!ddr_start) &&(!instance_exists(obj_ddr_button)){
				
				//Go to next message if there is one
				if (message_counter + 1) <= (ds_list_size(ds_messages) - 1) {
					message_counter++;
				//Otherwise next actor take their turn
				//Because we've shown all the messages
				} else {
					
							if (stay_player_turn_boolean) {
								player_turn = true; 
								stay_player_turn_boolean = false;
							} else {
								
								player_turn = !player_turn;
							}
						
							//only if we're rolling
							if (!spend_ready) && (!instance_exists(obj_snail)) {
								//Calculate dice points based on percentage of steps correct
								dice_points_earned = scr_ddr_dice_pts(ddr_steps, 10);
								scr_ddr_instance_end(monster);	
							}
							
							
							 
							
							if (ds_exists(ds_messages, ds_type_list)) {
								ds_list_destroy(ds_messages);	
							}
							show_battle_text = false;
							message_counter = 0;
							
							
							
				}
				message_timer = 0; 
				
			}
		}
	} else {
		//change snail animation at end
		if (ending){
			obj_snail.animation_state = "CRACKED";
		}
	}

#endregion



#region SHAKE
if (screen_shake == true) {
	shake_timer++;
	
	shakeX = irandom_range(-max_shakeX, max_shakeX);
	shakeY = irandom_range(-max_shakeY, max_shakeY);
	
	if (shake_timer >= time_til_shake_ends) {
		screen_shake = false;
		shake_timer = 0;
		shakeX = 0;
		shakeY = 0;
	}
}

#endregion


#region DDR TURN

if (!player_turn) && (!show_battle_text){
	enemy_timer++;
	
	if (enemy_timer >= time_til_enemy_attacks) {
		if (!ds_exists(ds_messages, ds_type_list)) {
			ds_messages = ds_list_create();
		}
		enemy_timer = 0;
		var status_text = "";
		
		if (roll_success) {
			status_text = "SUCCESS!";
		} else {
			status_text = "FAIL!";
		}
		
	
		//No roll!
		if (spend_ready){
			ds_messages[| 0] = "You have " + string(dice_points) + " point(s) left!"
			
		//Roll!
		} else {
			ds_messages[| 0] = "You felt the luck at the touch of your fingers!";
			ds_messages[| 1] = "And rolled a " + string(roll) + "! " + status_text;
		
			
			
			//After every roll, check if all locks are used then reset dice and dice pts
			if (ds_list_size(ds_roll_input) == 0) && (!spend_ready){
				scr_roll_reset();
				scr_roll_unlock_reset();
				dice_points = 0;
				ds_messages[| 2] = "Dice reset! Lucky points back to 0!"
			} else {
				ds_messages[| 2] = "You got " + string(dice_points_earned) +" lucky point(s)!";
				
				//Add points
				dice_points += dice_points_earned;
				
			}
		}

		
		show_battle_text = true;
		message_counter = 0
		roll_option = 0;
		

		audio_play_sound(enemy_action, 1, false);
	}		
}

#endregion

}