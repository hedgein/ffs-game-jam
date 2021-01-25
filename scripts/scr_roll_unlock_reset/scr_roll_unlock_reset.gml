// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_roll_unlock_reset(){
		for (var reset_index = 0; reset_index < array_height_2d(global.ga_dice_lock); reset_index++){
			global.ga_dice_lock[reset_index, 1] = "UNLOCKED"
	
		}
	
}
	