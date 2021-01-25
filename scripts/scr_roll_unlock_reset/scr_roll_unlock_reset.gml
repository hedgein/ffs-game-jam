// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_roll_unlock_reset(option_name){
	
	if (option_name == "SPECIAL") {
		for (var reset_index = 0; reset_index < array_height_2d(global.ga_special_lock); reset_index++){
			global.ga_special_lock[reset_index, 1] = "UNLOCKED"
		}
	}
	if (option_name == "ATTACK") {
		for (var reset_index = 0; reset_index < array_height_2d(global.ga_attack_lock); reset_index++){
				global.ga_attack_lock[reset_index, 1] = "UNLOCKED"
		}
	}
	
	if (option_name == "HEAL") {
		for (var reset_index = 0; reset_index < array_height_2d(global.ga_heal_lock); reset_index++){
				global.ga_heal_lock[reset_index, 1] = "UNLOCKED"
		}
	}
	if (option_name == "DEFENSE") {
		for (var reset_index = 0; reset_index < array_height_2d(global.ga_defense_lock); reset_index++){
				global.ga_defense_lock[reset_index, 1] = "UNLOCKED"
		}		
	}
	
}
	