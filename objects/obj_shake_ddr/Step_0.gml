with(obj_battle){
obj_shake_ddr.button_timer++;
//UP
if (keyboard_check_pressed(vk_up)) || (keyboard_check_pressed(ord("W"))){
	var hit = collision_line((room_width/15) * 8.1, 375-(sprite_get_height(ddr_arrow) * 1), 
	(room_width/15) * 8.1, 375 + (sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if (hit){
		if (obj_shake_ddr.button_timer >= obj_shake_ddr.time_til_pressed_button) {
		ddr_steps++;
		instance_destroy(hit);
		obj_shake_ddr.button_timer = 0;
		}
	}
}

//DOWN
if (keyboard_check_pressed(vk_down)) || (keyboard_check_pressed(ord("S"))){
	var hit = collision_line((room_width/15) * 7, 375-(sprite_get_height(ddr_arrow) * 1), 
	(room_width/15) * 7, 375 + (sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if ((hit) && (obj_shake_ddr.button_timer >= obj_shake_ddr.time_til_pressed_button)){
		ddr_steps++;
		instance_destroy(hit);
		obj_shake_ddr.button_timer = 0;
	}
}

//RIGHT

if (keyboard_check_pressed(vk_right)) || (keyboard_check_pressed(ord("D"))){
	var hit = collision_line((room_width/15) * 9, 375-(sprite_get_height(ddr_arrow)*1), 
	(room_width/15) * 9, 375 +(sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if ((hit) && (obj_shake_ddr.button_timer >= obj_shake_ddr.time_til_pressed_button)){
		ddr_steps++;
		instance_destroy(hit);
		obj_shake_ddr.button_timer = 0;
	}
}

//LEFT
if (keyboard_check_pressed(vk_left)) || (keyboard_check_pressed(ord("A"))){
	var hit = collision_line((room_width/15) * 6, 375-(sprite_get_height(ddr_arrow) * 1), 
	(room_width/15) * 6, 375 +(sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if ((hit) && (obj_shake_ddr.button_timer >= obj_shake_ddr.time_til_pressed_button)){
		ddr_steps++;
		instance_destroy(hit);
		obj_shake_ddr.button_timer = 0;
	}
}
}


