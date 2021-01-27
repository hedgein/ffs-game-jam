if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))){
	var hit = collision_line((room_width/15) *4, 200-(sprite_get_height(arrow)/2), 
	(room_width/15) * 4, 200 +(sprite_get_height(arrow)/2),  obj_ddr_button, false, true);

	if (hit){
		instance_destroy(hit);
		ddr_steps++;
	}
}
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))){
	var hit = collision_line((room_width/15) * 3, 200-(sprite_get_height(arrow)/2), 
	room_width/15, 300 +(sprite_get_height(arrow)/2),  obj_ddr_button, false, true);

	if (hit){
		instance_destroy(hit);
		ddr_steps++;
	}
}
if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("A"))){
	var hit = collision_line((room_width/15) * 5, 200-(sprite_get_height(arrow)/2), 
	(room_width/15) * 5, 300 +(sprite_get_height(arrow)/2),  obj_ddr_button, false, true);

	if (hit){
		instance_destroy(hit);
		ddr_steps++;
	}
}
if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("D"))){
	var hit = collision_line((room_width/15) * 2, 200-(sprite_get_height(arrow)/2), 
	(room_width/15) * 2, 300 +(sprite_get_height(arrow)/2),  obj_ddr_button, false, true);

	if (hit){
		instance_destroy(hit);
		ddr_steps++;
	}
}

