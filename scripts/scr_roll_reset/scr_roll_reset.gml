// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_roll_reset(){
	with (obj_battle) {
		ds_roll_input[| 0] = 1;
		ds_roll_input[| 1] = 2;
		ds_roll_input[| 2] = 3;
		ds_roll_input[| 3] = 4;
		ds_roll_input[| 4] = 5;
		ds_roll_input[| 5] = 6;
	}
}