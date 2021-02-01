/// @description Show controls

// Reset visibility.
event_user(5);

// Enable menu border.
layer_set_visible(border_layer, true);

if (global.game_start)
{
	// Disable pause menu.
	layer_set_visible(pause_layer, false);
}
else
{
	// Disable start menu.
	layer_set_visible(main_layer, false);
}

// Enable controls menu.
layer_set_visible(controls_layer, true);