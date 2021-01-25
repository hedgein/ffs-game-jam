if (battle == true) {
	
	//Buffer and coordinates
	var BUFFER = 4;
	guiX = surface_get_width(application_surface) / 2;
	guiY = surface_get_height(application_surface);
	textX = guiX - (sprite_get_width(textbox) / 2) + (BUFFER * 3);
	textY = guiY - (sprite_get_height(textbox) - (BUFFER * 3));

	draw_sprite(textbox, 0, guiX - (sprite_get_width(textbox) / 2) - BUFFER, guiY - (sprite_get_height(textbox))- (BUFFER * 2.2));

	// DRAW THE OPTIONS
	optionX = 500;
	optionY = 360;
	draw_set_font(fnt_battle_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	fontSize = font_get_size(fnt_battle_text)
	

	
	if (!show_roll_options){
		for (var i = 0; i < array_length_1d(a_text); i++) {
			if (selected_option == i) {
				if (player_turn) && (!show_battle_text) {
					draw_sprite(arrow, 0, optionX - sprite_get_width(arrow), optionY + ((fontSize + BUFFER + 1) * i ));
				}
			}
		text = a_text[i];
		draw_text(optionX + shakeX, optionY + ((fontSize + BUFFER) * i ) + shakeY, text);
		}
	} else {
		//DRAW TEXT OPTION INSIDE BOX
		if (show_roll_options) {
			inner_text_X = textX +15;
			inner_text_Y = textY;
			

				for (var j = 0; j < monster_array[current_passage, 4] ; j++){
					options_text = monster_array[current_passage, j+1];
					if  (roll_option == j ){
						draw_sprite(arrow, 0, inner_text_X - sprite_get_width(arrow), inner_text_Y + 4 + ((fontSize + BUFFER) * (j) * 1.5 ));
					}
					draw_text(inner_text_X, inner_text_Y + ((fontSize + BUFFER) * (j) * 1.5), options_text);
				}
			
		}	
	}

	




//DRAW THE MESSAGES


if (show_battle_text) {
	
	
	sep = (fontSize + BUFFER);
	w = sprite_get_width(textbox) - (BUFFER * 6);
	
	var total_message_size = 0;
	
	for (var a = 0; a <= message_counter; a++) {
		draw_text_ext(textX + shakeX, textY + total_message_size + shakeY, ds_messages[| a], (fontSize + BUFFER), sprite_get_width(textbox) - (BUFFER * 6));
		total_message_size += string_height_ext(ds_messages[| a], sep, w);
	}
	
	max_message_height = sprite_get_height(textbox) - (BUFFER * 6) ;
	while (total_message_size > max_message_height) {
		total_message_size -= string_height_ext(ds_messages[| 0], sep, w);
		ds_list_delete(ds_messages, 0);
		message_counter--; 
	}
	
}

//No more need for drawing HP's
}