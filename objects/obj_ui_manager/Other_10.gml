/// @description Show menu
scr_pause_all_objects(true);

// Reset visibility.
event_user(5);

// Enable menu border.
layer_set_visible(border_layer, true);

if (global.game_start)
{
	// Enable pause menu.
	layer_set_visible(pause_layer, true);
}
else
{
	// Enable main menu.
	layer_set_visible(main_layer, true);
}

menuOpen = true;