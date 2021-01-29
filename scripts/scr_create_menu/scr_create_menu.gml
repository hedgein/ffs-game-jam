// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_menu(text_array, fn_array, shift_y){
	// Get length of first array.
	var len = array_length_1d(text_array);
	
	// Dimensions of menu/buttons.
	var _btn_width = 300;
	var _btn_height = 50;
	var _SEPARATOR = 40;
	// Horizontal center.
	var _half_camera_width = camera_get_view_width(view_camera[0]) / 2;
	var _half_button_width = _btn_width / 2;
	var _pos_x = _half_camera_width - _half_button_width;
	// Vertical center.
	var _half_camera_height = camera_get_view_height(view_camera[0]) / 2;
	var _half_menu_height = (_btn_height + _SEPARATOR) * len / 2;
	var _pos_y = _half_camera_height - _half_menu_height + shift_y;

	// Draw all the buttons.
	for (var i = 0; i < len; i += 1)
	{
		// Passing in functions as callbacks (to be executed if button is clicked).
		scr_create_button(
			_pos_x, (_pos_y + i*(_btn_height+_SEPARATOR)),
			_btn_width, _btn_height,
			text_array[i],
			"Instances",
			fn_array[i]
		);
	}
}