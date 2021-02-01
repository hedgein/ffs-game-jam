/// @description NPC step
// PATH PLANNING.
// Check for collisions on either side of the path.
if (walk_path)
{
	var left_blocked  = !place_free(x - (npc_speed + 5), y);
	var right_blocked = !place_free(x + (npc_speed + 5), y);
	if(paused || !can_move || left_blocked || right_blocked)
	{
		// Remove path speed and pause animation.
		path_speed = 0;
		image_speed = 0;
	}
	else
	{
		// END OF PATH.
		if (path_position == 1)
		{
			path_running = false;
		}
	
		if (!path_running)
		{
			// End the current path.
			path_end();
		
			if (move_dir == 0)
			{
				// LEFT.
				// Start path.
				path_start(path, npc_speed, path_action_stop, 0);
				path_orientation = 180;
			
				// Switch sprite.
				sprite_index = left;
			}
			else
			{
				// RIGHT.
				// Start path.
				path_start(path, npc_speed, path_action_stop, 0);
				path_orientation = 0;
			
				// Switch sprite.
				sprite_index = right;
			}
			// Swap directions.
			move_dir = !move_dir;
			path_running = true;
		}
	
		// Resume path speed and animation.
		path_speed = npc_speed;
		image_speed = 1;
	}
}
else
{
	sprite_index = left;
	image_speed = 1;
}

depth = -y;