/// @description Insert description here
if(!global.game_start)
{
	// Create the character.
	instance_create_layer(0, 500, "Instances", obj_ow_player);
	// Set the start location.
	with (obj_ow_player)
	{
		start_x = 150;
		start_y = 500;
	}

	// Game is fully started.
	global.game_start = true;
}