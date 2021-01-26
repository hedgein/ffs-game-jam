// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_create_menu(text_array, fn_array){
	// Get length of first array.
	var len = array_length_1d(text_array);
	
	// Dimensions of buttons.
	var _btn_width = 300;
	var _btn_height = 50;
	// Horizontal position: center - half width of button.
	var _pos_x = (camera_get_view_width(view_camera[0]) / 2) - (_btn_width / 2);
	// Vertical position: center - half height of menu.
	var _pos_y = (camera_get_view_height(view_camera[0]) / 2) - (_btn_height * len / 2);

	// Draw all the buttons.
	var _SEPARATOR = 40;
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