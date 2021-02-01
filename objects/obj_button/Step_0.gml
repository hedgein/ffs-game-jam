/// @description Check each frame for hover over button
// Get hover/click.
var _hover = scr_get_hover();
var _click = _hover && mouse_check_button_pressed(mb_left);

// An invisible button shouldn't be active.
if (!layer_get_visible(layer) || !visible)
{
	active = false;
}
else
{
	active = true;
}

// Make sure button is active, and enabled.
if (active && !disabled)
{
	image_index = _hover;
	if (_click && script >= 0 && (global.click_timer <= 0))
	{
		// Play tap.
		audio_play_sound(tap, 10, false);
		audio_sound_gain(tap, 1, 0);
		// Run callback.
		script_execute(script);
		// Restart click timer.
		global.click_timer = room_speed * 0.1;
	}
}