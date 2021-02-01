image_speed = 0;
with (obj_battle) {
	if (current_passage == 15) || (current_passage == 16) || (current_passage == 17) {
		obj_snail.animation_state = "CRACKED";
	} else {
		obj_snail.animation_state = "NORMAL";
	}
}

animation_state_previous = animation_state;
anim_index = 0;