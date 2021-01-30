image_speed = 0;
with (obj_battle) {
	if (current_passage == 1) {
		obj_snail.animation_state = "CRACKED";
	} else {
		obj_snail.animation_state = "NORMAL";
	}
}

animation_state_previous = animation_state;
anim_index = 0;