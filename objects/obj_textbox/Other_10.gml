/// @description Wrap text
// SET ATTRIBUTES.
name_text      = names[page];
portrait       = portraits[page];
portrait_index = indices[page];

// FETCH TEXT.
text_wrapped = scr_wrap_text(main_text[page], text_max_width);
str_len = string_length(text_wrapped);
typewriter_counter = 0;

// UPDATE POSITIONS.
// Set portrait dimensions.
port_width  = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
// Set positions.
box_x  = (global.game_width / 2) - (box_width / 2);
box_y  = (global.game_height*0.98) - box_height;
if (sprite_get_name(portrait) == "protag_portrait")
{
	port_x = box_x + x_buffer;
}
else
{
	port_x = box_x + box_width - port_width - x_buffer;	
}
port_y = box_y + box_height - port_height;
name_x = box_x + x_buffer;
name_y = box_y - name_height - 10;
// Set position of text (name is center aligned).
text_x      = box_x + x_buffer;
text_y      = box_y + y_buffer;
name_text_x = name_x + (name_width / 2);
name_text_y = name_y + (name_height / 2);
