/// @description Hide menu
scr_pause_all_objects(false);
global.game_running = false;

// Reset visibility.
event_user(5);

// Resume the game.
with (obj_ow_manager)
{
	event_user(1);	
}

menuOpen = false;