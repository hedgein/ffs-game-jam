/// @description Constructor for manager
// FLAGS.
// Menu is open.
menuOpen = false;

// GLOBALS.
// Timer used to limit clicks per second.
global.click_timer = 0;
// Dimensions of game.
global.game_width  = 1280;
global.game_height = 960;
// Color used for writing text.
//global.ui_text_color = make_color_rgb(135, 58, 53);
global.ui_text_color = make_color_rgb(125, 45, 40);
global.ui_font       = fnt_button;
