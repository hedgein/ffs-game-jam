/// @description Move player
// INPUT.
input_left     = keyboard_check(ord("A")) || keyboard_check(vk_up);
input_right    = keyboard_check(ord("D")) || keyboard_check(vk_right);
input_up       = keyboard_check(ord("W")) || keyboard_check(vk_up);
input_down     = keyboard_check(ord("S")) || keyboard_check(vk_down);
input_interact = keyboard_check_pressed(ord("Z"));

// MOVEMENT.
var transition = instance_exists(obj_fade);
if (reached_start && can_move && !paused && !transition) {
	// Handle normal movement logic.
	var RIGHT = 0;
	var UP = 90;
	var LEFT = 180;
	var DOWN = 270;
	var _collision_speed = player_speed + 5;
	if (input_left && place_free(x - _collision_speed, y)) {
		motion_set(LEFT, player_speed);
		sprite_index = protag_left;
		image_speed = 1;
	}
	else if (input_right && place_free(x + _collision_speed, y)) {
		motion_set(RIGHT, player_speed);
		sprite_index = protag_right;
		image_speed = 1;
	}
	else if (input_up && place_free(x, y - _collision_speed)) {
		motion_set(UP, player_speed);
		sprite_index = protag_up;
		image_speed = 1;
	}
	else if (input_down && place_free(x, y + _collision_speed )) {
		motion_set(DOWN, player_speed);
		sprite_index = protag_down;
		image_speed = 1;
	}
	else {
		// NO MOTION.
		motion_set(0, 0);
		// Pause when the character is static.
		if (floor(image_index) == 0 || floor(image_index) == 2)
		{
			image_speed = 0;
		}
	}
}
else if (!reached_start && !transition) {
	// Check if we have reached the starting position.
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
else
{
	motion_set(0, 0);
	image_speed = 0;
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