image_speed = 0.25;
switch (animation_state) {
	case "NORMAL": {
		anim_index = 0;
		image_speed = 0.25;
		break;
	}
	case "CRACKED": {
		anim_index =5;
		image_speed = 0.30;
		break;
	}
}

if (animation_state != animation_state_previous) {
	animation_state_previous = animation_state
	image_index = anim_index;
}

switch (animation_state) {
	case "NORMAL": {
		image_index = max(anim_index, image_index % ((anim_index + 4) - image_speed));
		break;
	}
	case "CRACKED": {
		image_index = max(anim_index, image_index % ((anim_index + 5) - image_speed));
		break;
	}
}