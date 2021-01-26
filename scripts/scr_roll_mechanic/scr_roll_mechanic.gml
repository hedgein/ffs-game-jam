// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_roll_mechanic(){
	with (obj_battle){
		
		random_index = irandom(ds_list_size(ds_roll_input) - 1)
		new_lock = ds_roll_input[| random_index]
		
		for (var new_lock_index = 1; new_lock_index < 7; new_lock_index++){
			if (new_lock == new_lock_index){
					//Subtract one as array starts at zero
					global.ga_attack_lock[new_lock_index - 1 , 1] = "LOCKED";
					global.ga_attack_lock[6, 1] = "LOCKED"
	
			}
		}
		
		//Lock roll number
		ds_list_delete(ds_roll_input, random_index);
		return new_lock
	}
}