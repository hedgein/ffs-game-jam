
with(obj_battle){
obj_shake_ddr.button_timer++;

key_UP = keyboard_check_pressed(vk_up);
key_W = keyboard_check_pressed(ord("W"));
key_DOWN = keyboard_check_pressed(vk_down);
key_S = keyboard_check_pressed(ord("S"));
key_LEFT = keyboard_check_pressed(vk_left);
key_A = keyboard_check_pressed(ord("A"));
key_RIGHT = keyboard_check_pressed(vk_right);
key_D = keyboard_check_pressed(ord("D"));


//UP
if (((key_UP) || (key_W)) && (!key_DOWN) && (!key_S) && (!key_LEFT) && (!key_A) && (!key_RIGHT) && (!key_D)) {
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
if ((!key_UP) && (!key_W) && ((key_DOWN) || (key_S)) && (!key_LEFT) && (!key_A) && (!key_RIGHT) && (!key_D)){
	var hit = collision_line((room_width/15) * 7, 375-(sprite_get_height(ddr_arrow) * 1), 
	(room_width/15) * 7, 375 + (sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if ((hit) && (obj_shake_ddr.button_timer >= obj_shake_ddr.time_til_pressed_button)){
		ddr_steps++;
		instance_destroy(hit);
		obj_shake_ddr.button_timer = 0;
	}
}

//RIGHT

if ((!key_UP) && (!key_W) && (!key_DOWN) && (!key_S) && (!key_LEFT) && (!key_A) && ((key_RIGHT) || (key_D))){
	var hit = collision_line((room_width/15) * 9, 375-(sprite_get_height(ddr_arrow)*1), 
	(room_width/15) * 9, 375 +(sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if ((hit) && (obj_shake_ddr.button_timer >= obj_shake_ddr.time_til_pressed_button)){
		ddr_steps++;
		instance_destroy(hit);
		obj_shake_ddr.button_timer = 0;
	}
}

//LEFT
if ((!key_UP) && (!key_W) && (!key_DOWN) && (!key_S) && ((key_LEFT) || (key_A)) && (!key_RIGHT) && (!key_D)){
	var hit = collision_line((room_width/15) * 6, 375-(sprite_get_height(ddr_arrow) * 1), 
	(room_width/15) * 6, 375 +(sprite_get_height(ddr_arrow) * 1),  obj_ddr_button, false, true);

	if ((hit) && (obj_shake_ddr.button_timer >= obj_shake_ddr.time_til_pressed_button)){
		ddr_steps++;
		instance_destroy(hit);
		obj_shake_ddr.button_timer = 0;
	}
}
}


