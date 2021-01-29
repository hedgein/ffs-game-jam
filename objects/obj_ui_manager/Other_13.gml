/// @description Show controls
// Destroy all instance of the buttons.
instance_destroy(obj_button);

// Buttons to be drawn (we don't serve classes here, best I can getcha are arrays).
var _text_array = [
	"Action: Z",
	"Cancel: X",
	"Movement: WASD/Arrow Keys",
	"Back"
];
// Functions mapped to buttons.
// TODO: Add ability to set custom mappings. For now these callbacks do nothing.
var _fn_array = [
	scr_map_controls,
	scr_map_controls,
	scr_map_controls,
	scr_hide_controls
];

var _shift_y = 150;
if (gameStart)
{
	_shift_y = 0;
}
scr_create_menu(_text_array, _fn_array, _shift_y);