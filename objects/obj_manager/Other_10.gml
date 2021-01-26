/// @description Create UI
// Buttons to be drawn (we don't serve classes here, best I can getcha are arrays).
var _text_array = [
	"Play", 
	"Controls", 
	"Exit"
];
// Change "Play" to "Resume" if the game has been started).
if (gameStart)
{
	_text_array[0] = "Resume";
}

// Functions mapped to buttons.
var _fn_array = [
	scr_start_game, 
	scr_show_controls, 
	scr_exit
];

scr_create_menu(_text_array, _fn_array);
