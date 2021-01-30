/// @description Create UI
// Buttons to be drawn (we don't serve classes here, best I can getcha are arrays).
var _text_array = [
	"Play", 
	"Controls", 
	"Exit"
];
// Change "Play" to "Resume" if the game has been started).
var _shift_y = 150;
if (gameStart)
{
	_text_array[0] = "Resume";
	_shift_y = 0;
}
else
{
	instance_create_layer(camera_get_view_width(view_camera[0]) / 2, 50, "GUI", obj_logo);	
}

// Functions mapped to buttons.
var _fn_array = [
	scr_start_game, 
	scr_show_controls, 
	scr_exit
];

scr_create_menu(_text_array, _fn_array, _shift_y);
