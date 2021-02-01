with(obj_battle){
//UP
if (keyboard_check_pressed(vk_up)) || (keyboard_check_pressed(ord("W"))){
	var hit = collision_line((room_width/15) * 8.1, 375-(sprite_get_height(ddr_arrow) * 1), 
	(room_width/15) * 8.1, 375 + (sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if (hit){
		ddr_steps++;
		instance_destroy(hit);
	}
}

//DOWN
if (keyboard_check_pressed(vk_down)) || (keyboard_check_pressed(ord("S"))){
	var hit = collision_line((room_width/15) * 7, 375-(sprite_get_height(ddr_arrow) * 1), 
	(room_width/15) * 7, 375 + (sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if (hit){
		ddr_steps++;
		instance_destroy(hit);
	}
}

//RIGHT

if (keyboard_check_pressed(vk_right)) || (keyboard_check_pressed(ord("D"))){
	var hit = collision_line((room_width/15) * 9, 375-(sprite_get_height(ddr_arrow)*1), 
	(room_width/15) * 9, 375 +(sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if (hit){
		ddr_steps++;
		instance_destroy(hit);

	}
}

//LEFT
if (keyboard_check_pressed(vk_left)) || (keyboard_check_pressed(ord("A"))){
	var hit = collision_line((room_width/15) * 6, 375-(sprite_get_height(ddr_arrow) * 1), 
	(room_width/15) * 6, 375 +(sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if (hit){
		instance_destroy(hit);
		ddr_steps++;

	}
}
}


