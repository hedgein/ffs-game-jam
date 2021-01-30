/// @description Move player
var transition = instance_exists(obj_fade);
if (reached_start && !paused && !transition) {
	// Handle normal movement logic.
	var RIGHT = 0;
	var UP = 90;
	var LEFT = 180;
	var DOWN = 270;
	var _collision_speed = player_speed + 5;
	if ((keyboard_check(ord("A")) || keyboard_check(vk_up)) && place_free(x - _collision_speed, y)) {
		motion_set(LEFT, player_speed);
		sprite_index = protag_left;
		image_speed = 1;
    }
	else if ((keyboard_check(ord("D")) || keyboard_check(vk_right)) && place_free(x + _collision_speed, y)) {
		motion_set(RIGHT, player_speed);
		sprite_index = protag_right;
		image_speed = 1;
	}
	else if ((keyboard_check(ord("W")) || keyboard_check(vk_up)) && place_free(x, y - _collision_speed)) {
		motion_set(UP, player_speed);
		sprite_index = protag_up;
		image_speed = 1;
	}
	else if ((keyboard_check(ord("S")) || keyboard_check(vk_down)) && place_free(x, y + _collision_speed )) {
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

depth = -y;