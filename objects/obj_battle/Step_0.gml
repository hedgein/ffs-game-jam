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
	
	enemy_turn_counter = 0;
	enemy_timer = 0;
	battle_option = 0; //which option has been selected by either monster or player

	player_dead = false;
	battle = false; 
	victory = false;

	//Roll mechanic
	show_roll_options = false; //Show lock menu or not
	roll_option = 0;

	//Attack mechanic
	show_attack_options = false;
	attack_option = 0; 

	//Heal Mechanic
	show_heal_options = false;
	heal_option = 0; 
	
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

	if (!show_roll_options) && (!show_attack_options) && (!show_heal_options) && (!show_defense_options) {
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
			
			//Roll
			if(selected_option == 0) {
				show_attack_options = true;
			}
		
			//SPEND
			if (selected_option == 1) {
				show_defense_options = true;
			}

			//CHECK
			if (selected_option == 2) {
				check_boolean = true;
			}
			//Fourth menu option not needed, add later?
			//if (selected_option ==3) {
			//	show_heal_options = true;
			//}
		
			if (selected_option != 2) && (selected_option != 0) && (selected_option != 1) && (selected_option != 3){
				show_battle_text = true;
			}
			
	
			audio_play_sound(player_action, 1, false);
		}
	} else {
		//Show roll menu
		if (show_roll_options) {
			if (keyboard_check_pressed(ord("X"))) {
				show_roll_options = false;
			}
			if (keyboard_check_pressed(vk_down)){
				//If not the last option, go down (to next option)
				if (roll_option + 1) <= (array_length_1d(a_roll_text) -1) {
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
					roll_option = (array_length_1d(a_roll_text) - 1);
				}
				audio_play_sound(tap, 1, false);
			} 
			
			if (keyboard_check_pressed(ord("Z"))) {
				message_counter = 0;
				//Make sure message lists still exist - sometimes it can be lost
				if (!ds_exists(ds_messages, ds_type_list)){
					ds_messages = ds_list_create();
				}
				//Roll dice
				if (roll_option == 0){
					//Roll Special Mechanic here
					roll = scr_roll_mechanic("SPECIAL");
					ds_messages[| 0] = "PLAYER rolled SPECIAL dice!";
					ds_messages[| 1] = "They rolled a " + string(roll) + "!";
					ds_messages[| 2] = global.ga_special_lock[roll-1, 0];
					if (roll==1) {
						ds_messages[| 3] = "Lost 1 ATK permanently!";
						global.player_base_atk -= 1;
					}
					if (roll == 2) {
						if ((player_HP - 2) < 0) {
							player_HP = 0;
						} else {
							player_HP -= 2;
						}
					}
					// NO ROLL 3 BECAUSE IT SKIPS YOUR TURN
					if (roll == 4) {
						ds_messages[| 3] = "SNAIL lost 3 ATK permanently!";
						global.monster_base_atk -= 3;
				
						
					}
					if (roll == 5) {
						ds_messages[| 3] = "SNAIL lost half its defense!";
						global.monster_base_atk = global.monster_base_atk / 2;
					
						
					}
					if (roll == 6) {
						ds_messages[| 3] = "Seasoned the SNAIL for 10 damage!";
						if ((monster_HP - 10) < 0) {
							monster_HP = 0;
						} else {
							monster_HP -= 10;
						}
						
						if (monster_HP == 0 ) {
						victory = true;
						ds_messages[| 4] = "SNAIL dies...";
						}
						
					}
					if (ds_list_size(ds_roll_input) == 0) {
						scr_roll_reset();
						scr_roll_unlock_reset("SPECIAL");
					}
				}
				//Check what's locked
				if (roll_option == 1) {
					//Show in messages what's locked
					if (global.ga_special_lock[6, 1] == "UNLOCKED") {
						ds_messages[| 0] = "Your dice has no locks!";
						ds_messages[| 1] = "Every roll is available!";
					} else {
						for (var dice_index = 0; dice_index < array_height_2d(global.ga_special_lock) - 1; dice_index++) {
							if (global.ga_special_lock[dice_index,1] == "UNLOCKED") {
								ds_messages[| dice_index] = "Roll " + string(dice_index + 1) + " is UNLOCKED!";
							} else {
								ds_messages[| dice_index] = "Roll " + string(dice_index + 1) + " is LOCKED!";
							}
						}
					}
					
					check_boolean = true; 
				}
				//Continue Battle
				show_battle_text = true;
				show_roll_options = false;
				roll_defend_boolean = false;
				
			}
			

			}
			
	//Show attack menu
	if (show_attack_options){
		if (keyboard_check_pressed(ord("X"))) {
				show_attack_options = false;
			}
		if (keyboard_check_pressed(vk_down)){
				//If not the last option, go down (to next option)
				if (attack_option + 1) <= (array_length_1d(an_attack_text) - 1) {
					attack_option++;
				//Else go back to first option
				} else {
				 attack_option = 0; 
				}
				audio_play_sound(tap, 1, false);
			}

			if (keyboard_check_pressed(vk_up)) {
				//If not at top most option, go up 1 (to before option)
				if (attack_option - 1) >= 0 {
					attack_option--;
					//Else go to bottom
				} else {
					attack_option = (array_length_1d(an_attack_text) - 1);
				}
				audio_play_sound(tap, 1, false);
			} 
		if (keyboard_check_pressed(ord("Z"))) {
				message_counter = 0;
				//Make sure message lists still exist - sometimes it can be lost
				if (!ds_exists(ds_messages, ds_type_list)){
					ds_messages = ds_list_create();
				}
				
				//Roll an attack
				if (attack_option == 0) {
					//Roll attack here
					roll = scr_roll_mechanic("ATTACK");
					ds_messages[| 0] = "PLAYER rolled ATTACK dice!";
					ds_messages[| 1] = "They rolled a " + string(roll) + "!";
					
					//Show damage message
					ds_messages[| 2] = "Player hit for " +  string(roll) + " damage!";
					
					
					if (ds_list_size(ds_roll_input) == 0) {
						scr_roll_reset();
						scr_roll_unlock_reset("ATTACK");
					}
					
				}
				//Second option guaranteed attack
				if (attack_option == 1) {
					ds_messages[| 0] = "Player ATTACKS with their bare fists!";
			
					 
					damage = scr_damage(); //Calculates damage
					
					
					
					//Show first damage message 
					ds_messages[| 1] = "And hits for " + string(damage) + " damage!";
					
					
				
				}
				
				if (attack_option == 2) {
					if (global.ga_attack_lock[6, 1] == "UNLOCKED") {
							ds_messages[| 0] = "Your dice has no locks!";
							ds_messages[| 1] = "Every roll is available!";
						} else {
							for (var dice_index = 0; dice_index < array_height_2d(global.ga_attack_lock) - 1; dice_index++) {
								if (global.ga_attack_lock[dice_index,1] == "UNLOCKED") {
									ds_messages[| dice_index] = "Roll " + string(dice_index + 1) + " is UNLOCKED!";
								} else {
									ds_messages[| dice_index] = "Roll " + string(dice_index + 1) + " is LOCKED!";
								}
							}
						}
					
						check_boolean = true; 
				}
					
				//Continue Battle
				battle_option = 0 //???
				show_battle_text = true;
				show_attack_options = false;
				roll_defend_boolean = false;
			
				}
			
		
	}
	//DEFENSE MENU HERE
	if (show_defense_options) {
			if (keyboard_check_pressed(ord("X"))) {
				show_defense_options = false;
			}
			if (keyboard_check_pressed(vk_down)){
				//If not the last option, go down (to next option)
				if (roll_option + 1) <= (array_length_1d(a_roll_text) -1) {
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
					roll_option = (array_length_1d(a_roll_text) - 1);
				}
				audio_play_sound(tap, 1, false);
			} 
			
			if (keyboard_check_pressed(ord("Z"))) {
				message_counter = 0;
				//Make sure message lists still exist - sometimes it can be lost
				if (!ds_exists(ds_messages, ds_type_list)){
					ds_messages = ds_list_create();
				}
				
				// Roll defense
				if (roll_option == 0) {
					//Roll mechanice here
					roll = scr_roll_mechanic("DEFENSE");
					ds_messages[| 0] = "Player rolls DEFENSE dice!";
					ds_messages[| 1] = "They rolled a " + string(roll) + "!";
					ds_messages[| 2] = "Player DEFENDS with a bonus of " + string(roll) + "!";
					
					defend_damage = scr_defend(roll);
					roll_defend_boolean = true;
					
					if (ds_list_size(ds_roll_input) == 0) {
						scr_roll_reset();
						scr_roll_unlock_reset("DEFENSE");
					}
					
				}
				//Check locks
				if (roll_option == 1) {
						if (global.ga_defense_lock[6, 1] == "UNLOCKED") {
						ds_messages[| 0] = "Your dice has no locks!";
						ds_messages[| 1] = "Every roll is available!";
						} else {
							for (var dice_index = 0; dice_index < array_height_2d(global.ga_defense_lock) - 1; dice_index++) {
								if (global.ga_defense_lock[dice_index,1] == "UNLOCKED") {
									ds_messages[| dice_index] = "Roll " + string(dice_index + 1) + " is UNLOCKED!";
								} else {
									ds_messages[| dice_index] = "Roll " + string(dice_index + 1) + " is LOCKED!";
								}
							}
						}
					
						check_boolean = true; 
				}
				//Continue Battle
				battle_option = 1 //???
				show_battle_text = true;
				show_attack_options = false;
				roll_defend_boolean = false;	
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
							//room_goto(rm_died);
							state = "INIT";
							show_battle_text = false;
						
						} else {
							if (check_boolean) {
								player_turn = true; 
								check_boolean = false;
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
				
				//If this is an attack
				if (battle_option == 0) {
					if (!player_turn) {
						//Set screen_shake to true on condition that ds_messages is a specific messgae
						//(may not need screen shake?)
					}
				}
				
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


#region ENEMY TURN

if (!player_turn) && (!show_battle_text){
	enemy_timer++;
	
	if (enemy_timer >= time_til_enemy_attacks) {
		if (!ds_exists(ds_messages, ds_type_list)) {
			ds_messages = ds_list_create();
		}
		message_counter = 0
		show_battle_text = true;
		enemy_timer = 0;
		
		//Implement new system here
		ds_messages[| 0] = "Monster ATTACKS!";
		battle_option = 0;
		
	
		audio_play_sound(enemy_action, 1, false);
		}
		

}

#endregion

}