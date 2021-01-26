/// @description Check each frame for hover over button
var _hover = scr_get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left);

// Smooth the transition between 0 and 1
hover = lerp(hover, _hover, 0.1);

// Execute action if 1.
if (_click && script >= 0)
{
	script_execute(script);
}