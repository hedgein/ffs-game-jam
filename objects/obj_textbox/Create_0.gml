/// @description Create textbox
// Save sprites.
box = ui_text_box;
portrait = protag_portrait;
name = ui_button;

// Which frame to use on the portrait sprite.
portrait_index = 0;

// Counter used for typewriter text.
typewriter_counter = 0;

// Sprite dimensions.
box_width   = sprite_get_width(box);
box_height  = sprite_get_height(box);
port_width  = sprite_get_width(portrait);
port_height = sprite_get_height(portrait);
name_width  = sprite_get_width(name);
name_height = sprite_get_height(name);

// Text padding.
x_buffer = 40;
y_buffer = 30;

// Positions of UI elements.
box_x = 0;
box_y = 0;
port_x = 0;
port_y = 0;
name_x = 0;
name_y = 0;

// TEXT.
// Position of text (name is center aligned).
text_x      = 0;
text_y      = 0;
name_text_x = 0;
name_text_y = 0;
// Text options.
draw_set_font(global.ui_font);
// Text dimensions.
text_max_width = box_width - (2*x_buffer);

// Contents.
main_text[0] = "";
name_text    = "Hero";
page         = 0;

// Key to move the text forward.
interact_key = ord("Z");

// Used to pause on punctuation.
pause = false;

// Optional callback function.
callback = noone;
