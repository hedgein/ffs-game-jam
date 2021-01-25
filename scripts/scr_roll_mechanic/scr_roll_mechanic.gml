// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_roll_mechanic(option_name){
	with (obj_battle){
		
		random_index = irandom(ds_list_size(ds_roll_input) - 1)
		new_lock = ds_roll_input[| random_index]
		for (var new_lock_index = 1; new_lock_index < 7; new_lock_index++){
			if (new_lock == new_lock_index){
				if (option_name == "ATTACK") {
					scr_roll_attack_lock(new_lock_index - 1); 
				}
				if (option_name == "SPECIAL") {
					global.ga_special_lock[new_lock_index - 1 , 1] = "LOCKED";
					global.ga_special_lock[6, 1] = "LOCKED"
				}
				if (option_name == "DEFENSE") {
					global.ga_defense_lock[new_lock_index - 1, 1] = "LOCKED";
					global.ga_defense_lock[6, 1] = "LOCKED";
				}
				if (option_name == "HEAL") {
					global.ga_heal_lock[new_lock_index - 1, 1] = "LOCKED";
					global.ga_heal_lock[6, 1] = "LOCKED";
				}
				if (option_name == "SNAIL") {
					global.ga_snail_lock[new_lock_index - 1, 1] = "LOCKED";
					global.ga_snail_lock[6, 1] = "LOCKED";
				}
			}
		}
		ds_list_delete(ds_roll_input, random_index);
		return new_lock
	}
}