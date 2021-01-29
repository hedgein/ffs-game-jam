// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_start_game(){
	with (obj_ui_manager) {
		// Start the game.
		event_user(2);
	}
	with (obj_ow_manager) {
		// Start the game.
		event_user(2);
	}
}