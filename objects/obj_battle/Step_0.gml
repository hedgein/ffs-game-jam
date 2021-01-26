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

	if (!show_roll_options) {
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
			message_counter = 0;
			if (!ds_exists(ds_messages, ds_type_list)){
				ds_messages = ds_list_create();
			}
			
			switch (selected_option) {
				case 0: {
					show_roll_options = true;
					break;
				}
				
				case 1: {
					show_roll_options = true;
					break;
				}
				
				case 2: {
					//Display dice locks here
					show_roll_options = false;
					stay_player_turn_boolean = true;
					show_battle_text = true;
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
			}
			if (keyboard_check_pressed(vk_down)){
				//Need new system do track which passage your on
				
				//If not the last option, go down (to next option)
				if (roll_option+ 1) <= option_total_count - 1 {
					roll_option++;
				//Else go back to first option
				} else {
				 roll_option = 0; 
				}
				audio_play_sound(tap, 1, false);
			}

			if (keyboard_check_pressed(vk_up)) {
				//If not at top most option, go up 1 (to before option)
				if (roll_option - 1) >= 0 {
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
					for (var i = 0; i < array_length_1d(roll_ranges_text) - 1; i++) {
						ds_options_lock[| i] = false;
					}
				}
				
				
				
				if (ds_options_lock[| roll_option]) {
					ds_messages[|0] = "This is locked! ====>" + string(lock_counter);
					
					show_roll_options = false;
					stay_player_turn_boolean = true;
					
					show_battle_text = true;
				//Only roll on false options_lock
				} else {
					
					
						if (!roll_success) && (!last_lock_boolean){
							ds_options_lock[| roll_option] = true;
							lock_counter++;
							
						}
					
					if (lock_counter + 1 >= array_length_1d(roll_ranges_text)) {
						last_lock_boolean = true;
					}
					
					
					
					
					ds_messages[| 0] = "Shake the dice!  -->" + string(lock_counter);
				
					
					show_roll_options = false;
					//Continue Battle
					show_battle_text = true;
					current_passage = next_passage; 
				
				}
				
				
				
				
			}
			
				
		}
				
	}
	
}


#endregion

#region MESSAGES

	//Cycle through messages
	if (show_battle_text) {
		message_timer++;
		
		if (message_timer >= time_before_button_accepted){
			if (keyboard_check_pressed(ord("Z"))) {
				//Go to next message if there is one
				if (message_counter + 1) <= (ds_list_size(ds_messages) - 1) {
					message_counter++;
				//Otherwise next actor take their turn
				} else {
					//We've shown all the messages
						if  (victory){
							battle = false; 
							//room_goto(rm_overworld????);
							state = "INIT";
							show_battle_text = false;
						
						} else {
							if (stay_player_turn_boolean) {
								player_turn = true; 
								stay_player_turn_boolean = false;
							} else {
								player_turn = !player_turn;

							}
							show_battle_text = false;
							message_counter = 0;
							if (ds_exists(ds_messages, ds_type_list)) {
								ds_list_destroy(ds_messages);
							}
							
						}			
				}
				message_timer = 0; 
				
				//Play Victory Sound
				if (victory) {
					if (message_counter == 2) && (!victory_sound_played) {
						audio_play_sound(snd_victory, 1 , false);
						victory_sound_played = true;
					}
				}
			}
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
		show_battle_text = true;
		message_counter = 0
	
		
		
		enemy_timer = 0;
		var status_text = "";
		if (roll_success) {
			status_text = "SUCCESS!";
		} else {
			status_text = "FAIL!";
		}
		
		ds_messages[| 0] = "You felt the luck at the touch of your fingers!";
		ds_messages[| 1] = "And rolled a " + string(roll) + "! " + status_text;
		
		//Implement new DDR minigame here
		
		
		//After every roll, check if all locks are used then reset dice and dice pts
		if (ds_list_size(ds_roll_input) == 0) {
			scr_roll_reset();
			scr_roll_unlock_reset();
			dice_points = 0;
			ds_messages[| 2] = "Dice reset! Dice points back to 0!"
		} else {
			ds_messages[| 2] = "You got 1 dice point!";
		}
		

		
		audio_play_sound(enemy_action, 1, false);
		}		
}

#endregion

}