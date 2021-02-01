/// @description Draw textbox

// ELEMENTS.
// Draw portrait.
draw_sprite(portrait, portrait_index, port_x, port_y);

// Draw box.
draw_sprite(box, 0, box_x, box_y);

// Draw namebox.
draw_sprite(name, 0, name_x, name_y);

// TEXT.
// Draw name.
draw_set_color(global.ui_text_color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(name_text_x, name_text_y, name_text);

// Draw main text.
draw_set_halign(fa_left);
draw_set_valign(fa_top);
// Increment typewriter counter.
if (!pause && typewriter_counter < str_len)
{
	typewriter_counter++;
	if (typewriter_counter mod 2)
	{
		audio_play_sound(tap, 10, false);
		audio_sound_gain(tap, 0.25, 0);
	}
	
	// Check for punctuation and pause.
	switch (string_char_at(text_wrapped, typewriter_counter))
	{
		case ",": pause = true; alarm[0] = 15; break;
		case ".": 
		case "?": 
		case "!": pause = true; alarm[0] = 25; break;
	}
}
var substring = string_copy(text_wrapped, 1, typewriter_counter);

// Text should wrap around at the text_max_width.
draw_text(text_x, text_y, substring);

// Reset color.
draw_set_color(c_white);