/// @description New game
gameRunning = true;
// First time running.
if(!gameStart)
{
	// Create the character sprite.
	instance_create_depth(0, 500, 0, obj_ow_player);
	// Set the start location.
	with (obj_ow_player)
	{
		start_x = 150;
		start_y = 500;
	}
	// Play the music on loop.
	audio_play_sound(overworld, 1, true);
	// Game is fully started.
	gameStart = true;
}

