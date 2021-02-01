/// @desc scr_fadeout(_target, _fade_color, _fade_speed, _x, _y)
/// @arg _target
/// @arg _fade_color
/// @arg _fade_speed
/// @arg _x
/// @arg _y

function scr_fadeout(_target, _fade_color, _fade_speed, _x, _y) {
	var fade = instance_create_depth(x, y, 0, obj_fade);
	fade.target = _target;
	fade.image_alpha = 0;
	fade.fade_color = _fade_color;
	fade.fade_speed = _fade_speed;
	fade.pos_x = _x;
	fade.pos_y = _y;
}