if (battle == true) {

	//Buffer and coordinates
	var BUFFER = 4;
	guiX = surface_get_width(application_surface) / 2;
	guiY = surface_get_height(application_surface);
	textX = guiX - (sprite_get_width(textbox) / 2) + (BUFFER * 3);
	textY = guiY - (sprite_get_height(textbox) - (BUFFER));

	draw_sprite(textbox, 0, guiX - (sprite_get_width(textbox) / 2) - BUFFER, guiY - (sprite_get_height(textbox))- (BUFFER * 2.2));

	passage_text = scr_monster_array_access(monster, current_passage, 0);
	// DRAW THE OPTIONS
	optionX = 550;
	optionY = 360;
	draw_set_font(fnt_battle_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	fontSize = font_get_size(fnt_battle_text)
	

	
	if (!show_roll_options) && (!show_battle_text) && (player_turn) {
		for (var i = 0; i < array_length_1d(a_text); i++) {
			if (selected_option == i) {
				if (player_turn) && (!show_battle_text) {
					draw_sprite(arrow, 0, optionX - sprite_get_width(arrow) - BUFFER, optionY + ((fontSize + BUFFER + 1)* i ));
				}
			}
		text = a_text[i];
		draw_text(optionX + shakeX, optionY + ((fontSize + BUFFER + 1) * i ) + shakeY, text);
		}
		
		draw_text_ext(textX + shakeX, textY + shakeY, 
		passage_text, (fontSize + BUFFER), 
		sprite_get_width(textbox) - (BUFFER * 6));

		
	} else {
		//DRAW TEXT OPTION INSIDE BOX
		if (show_roll_options) {
			inner_text_X = textX + 15;
			inner_text_Y = textY;
				var sep = (fontSize + BUFFER);
				var w = sprite_get_width(textbox) - (BUFFER * 6);
			
				
				var total_message_size = 0;
				for (var j = 0 ; j < scr_monster_array_access(monster, current_passage, 4); j++){
					options_text = scr_monster_array_access(monster, current_passage, j+1)
					if  (roll_option == j ){
						draw_sprite(arrow, 0, inner_text_X - sprite_get_width(arrow) - BUFFER, inner_text_Y + ((fontSize + BUFFER) * (j) * 1.5 ));
					}
					
					//If the option IS locked, color it red
					if (ds_options_lock[| j]) {
						draw_text_ext_color(inner_text_X + shakeX, 
						inner_text_Y + shakeY + ((fontSize + BUFFER) * (j) * 1.5),
						options_text, (fontSize + BUFFER),
						sprite_get_width(textbox) - (BUFFER * 6),
						c_red, c_red, c_red, c_red, 1);
					} else{
						draw_text_ext(inner_text_X + shakeX, 
						inner_text_Y + shakeY + ((fontSize + BUFFER) * (j) * 1.5), 
						options_text, (fontSize + BUFFER), 
						sprite_get_width(textbox) - (BUFFER * 6));
					}
					
					
					
					//Draw roll chances
					
					roll_ranges_text = scr_dice_range_array_access(monster, current_passage);
					draw_text(inner_text_X + shakeX - (string_width(roll_ranges_text[j]) * 2.5), 
					inner_text_Y + shakeY + ((fontSize + BUFFER) * (j) * 1.5), 
					roll_ranges_text[j]);
					
					total_message_size += string_height_ext(options_text, sep, w);
				}
				
				max_message_height = sprite_get_height(textbox) - (BUFFER * 6) ;
				if (total_message_size > max_message_height) {
					total_message_size -= string_height_ext(scr_monster_array_access(monster, current_passage, roll_option_adjuster +  1), sep, w);
					roll_option_adjuster += 1;
				} 
				
				//Draw Dice Points on screen
				dice_pts_display = "Dice Points: " + string(dice_points);
				draw_text_ext(optionX + shakeX, optionY + shakeY, 
				dice_pts_display, (fontSize + BUFFER), 25);
			
		}	
	}

	




//DRAW THE MESSAGES


if (show_battle_text){
	
	
	var sep = (fontSize + BUFFER);
	var w = sprite_get_width(textbox) - (BUFFER * 8);
	
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