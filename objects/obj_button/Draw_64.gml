/// @description Draw button on the UI layer
// Set align and color of text
draw_set_color(global.ui_text_color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
// Draw in center of button
draw_set_font(fnt_button);
// NOTE: We floor the X, Y value to avoid weird pixellation issues.
var half_width = floor(x + sprite_width/2);
var half_height = floor(y + sprite_height/2);
draw_text(half_width, half_height, text);

// Reset color/align.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);