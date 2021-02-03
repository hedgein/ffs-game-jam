/// @description Move player
// INPUT.
input_interact = keyboard_check_pressed(ord("Z"));

// MOVEMENT.
var transition = instance_exists(obj_fade);
if (reached_start && can_move && !paused && !transition)
{
	// Cycle through our 4 directional inputs and if they were pressed this step, add them to our stack.
	for( var i = 0; i < 2; ++i )
	{
		for( var j = 0; j < 4; ++j )
		{
		    if( keyboard_check_pressed( InputList[i][j] ) )
			{
		        ds_stack_push( InputStack, InputList[i][j] );
		    }
		}
	}
	
	// Clear out any inputs that have been released.
	while( !ds_stack_empty( InputStack ) && !keyboard_check( ds_stack_top( InputStack ) ) )
	{
	    ds_stack_pop( InputStack );
	}
	
	// If no inputs are on the stack, pause character.
	if( ds_stack_empty( InputStack ) )
	{
		// Pause when the character is static.
		if (floor(image_index) == 0 || floor(image_index) == 2)
		{
			image_speed = 0;
		}
	}

	// If any input is active, move according to the most recent press.
	var _collision_speed = player_speed + 5;
	if( !ds_stack_empty( InputStack ) )
	{
		image_speed = 1;
	    switch( ds_stack_top( InputStack ) )
		{
			// UP
	        case InputList[0][0]:
			case InputList[1][0]:
				if (place_free(x, y - _collision_speed)) y -= player_speed;
				sprite_index = protag_up;
	            break;
			// DOWN
	        case InputList[0][1]:
			case InputList[1][1]:
	            if (place_free(x, y + _collision_speed)) y += player_speed;
				sprite_index = protag_down;
	            break;
			// LEFT
	        case InputList[0][2]:
			case InputList[1][2]:
				if (place_free(x - _collision_speed, y)) x -= player_speed;
				sprite_index = protag_left;
	            break;
			// RIGHT
	        case InputList[0][3]:
			case InputList[1][3]:
	            if (place_free(x + _collision_speed, y)) x += player_speed;
				sprite_index = protag_right;
	            break;
	    }
	}
}
else if (!reached_start && !transition)
{
	if ((x == start_x) && (y == start_y)) {
		reached_start = true;
		motion_set(0, 0);
	}
	else {
		// Move character by one pixel each frame to get there.
		motion_set(
			point_direction(x, y, start_x, start_y), 
			player_speed
		);
	}	
}
	
if (!npc_triggered)
{
	npc = collision_line(x, y + 1000, x, y - 1000, obj_npc, false, false);
	if (input_interact)
	{
		npc = collision_rectangle(x-radius, y-radius, x+radius, y+radius, obj_npc, false, false);
	}
	if (npc)
	{
		if (!active_textbox)
		{
			motion_set(0, 0);
			image_speed = 0;
			image_index = 0;
			npc_triggered = true;
			can_move = false;
		
			with (npc)
			{
				var tbox = scr_create_textbox(text, speakers, indices, scr_start_battle, battle);
				can_move = false;
			}
			
			active_textbox = tbox;
		}
		else if (!instance_exists(active_textbox))
		{
			active_textbox = noone;	
		}
	}
}

if (victory_dialogue)
{
	if (!active_textbox)
	{
		motion_set(0, 0);
		image_speed = 0;
		image_index = 0;
		can_move = false;
		
		with (npc)
		{
			left = victory_sprite_left;
			right = victory_sprite_right;
			portrait_sprite = victory_portrait;
			name = victory_name;
			walk_path = victory_walk_path;
			var func = noone;
			if (victory_callback != noone) func = victory_callback;
			var tbox = scr_create_static_textbox(victory_text, victory_speakers, victory_indices, func);
			can_move = false;
			solid = false;
		}
		
		active_textbox = tbox;
	}
	else if (!instance_exists(active_textbox))
	{
		active_textbox = noone;	
	}
	
	victory_dialogue = false;
}

// Update depth.
depth = -y;