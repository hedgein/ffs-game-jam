/// @description Draw button on the UI layer
// Set color with lerped hover value
draw_set_color(merge_color(c_ltgray, c_white, hover));

// Draw rounded rectangle
draw_roundrect(x, y, x + width, y + height, 0);

// Set align and color of text
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
// Draw in center of button
draw_text(x + width/2, y + height/2, text);

// Reset color/align
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);