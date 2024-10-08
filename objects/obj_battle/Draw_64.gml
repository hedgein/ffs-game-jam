if (battle == true) {

	//Buffer and coordinates
	var BUFFER = 9;
	guiX = surface_get_width(application_surface) / 2;
	guiY = surface_get_height(application_surface);
	textX = guiX - (sprite_get_width(textbox) / 2) + (BUFFER * 3);
	textY = guiY - (sprite_get_height(textbox) - (BUFFER));

	draw_sprite(textbox, 0, guiX - (sprite_get_width(textbox) / 2) - BUFFER, guiY - (sprite_get_height(textbox))- (BUFFER * 2.2));

	passage_text = scr_monster_array_access(monster, current_passage, 0);
	// DRAW THE OPTIONS
	optionX = 1100;
	optionY = guiY - (sprite_get_height(textbox))- (BUFFER * 2.2);
	draw_set_font(fnt_battle_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	fontSize = font_get_size(fnt_battle_text)
	

	
	if (!show_roll_options) && (!show_battle_text) && (player_turn) && (!check_boolean){
		for (var i = 0; i < array_length_1d(a_text); i++) {
			if (selected_option == i) {
				if (player_turn) && (!show_battle_text) && (!ending){
					draw_sprite(arrow, 0, optionX - sprite_get_width(arrow) - BUFFER, optionY + ((fontSize + BUFFER + 1)* i ));
				}
			}
			text = a_text[i];
			if (!ending){
			draw_text(optionX + shakeX, optionY + ((fontSize + BUFFER + 1) * i ) + shakeY, text);
			}
		}
		
		draw_text_ext(textX + shakeX, textY + shakeY, 
		passage_text, (fontSize + BUFFER), 
		sprite_get_width(textbox) - (BUFFER * 6));

		
	} else {
		var total_message_size = 0;
		//DRAW TEXT OPTION INSIDE BOX
		if (show_roll_options) {
			inner_text_X = textX + 15;
			inner_text_Y = textY;
				var sep = (fontSize + BUFFER);
				var w = sprite_get_width(textbox) - (BUFFER * 6);
			
				
				
				for (var j = 0 ; j < scr_monster_array_access(monster, current_passage, 4); j++){
					//
					options_text = scr_monster_array_access(monster, current_passage, j+1)
					//draw arrow according to selected roll_option
					if  (roll_option == j ){
						draw_sprite(arrow, 0, inner_text_X - sprite_get_width(arrow) - BUFFER, floor(inner_text_Y + ((fontSize + BUFFER) * (j) * 1.5 )));
					}
					
					//If the option IS locked, color it red
					if (ds_options_lock[| j]) {
						draw_text_ext_color(inner_text_X + shakeX, 
						floor(inner_text_Y + shakeY + ((fontSize + BUFFER) * (j) * 1.5)),
						options_text, (fontSize + BUFFER),
						sprite_get_width(textbox) - (BUFFER * 6),
						c_red, c_red, c_red, c_red, 1);
					//Else just leave it white
					} else{
						draw_text_ext(inner_text_X + shakeX, 
						floor(inner_text_Y + shakeY + ((fontSize + BUFFER) * (j) * 1.5)), 
						options_text, (fontSize + BUFFER), 
						sprite_get_width(textbox) - (BUFFER * 6));
					}
					
					
					

					//Draw roll chances
					if (!spend_ready) {
						draw_text(inner_text_X + shakeX - (string_width(scr_dice_range_array_access(monster, current_passage, j)) * 2.5), floor(inner_text_Y + shakeY + ((fontSize + BUFFER) * (j) * 1.5)), 
						scr_dice_range_array_access(monster, current_passage, j));
					
						total_message_size += string_height_ext(options_text, sep, w);
					//Else Draw roll costs
					} else {
						var roll_cost_text = scr_spend_calculate(scr_dice_range_array_access(monster, current_passage, j), scr_monster_array_access(monster, current_passage, 5));
						draw_text(inner_text_X + shakeX - (string_width(roll_cost_text) * 6), 
						floor(inner_text_Y + shakeY + ((fontSize + BUFFER) * (j) * 1.5)), 
						roll_cost_text);
					}
					
				}
				
				max_message_height = sprite_get_height(textbox) - (BUFFER * 6) ;
				if (total_message_size > max_message_height) {
					total_message_size -= string_height_ext(scr_monster_array_access(monster, current_passage, roll_option_adjuster +  1), sep, w);
					roll_option_adjuster += 1;
				} 
				
				//Draw Dice Points on screen
				dice_pts_display = "Lucky Points: " + string(dice_points);
				draw_text_ext(optionX + shakeX, optionY + shakeY, 
				dice_pts_display, (fontSize + BUFFER), 25);
			
		}
		//Draw check box!
		if (check_boolean) {
			var checkbox_X = guiX - floor(sprite_get_width(checkbox)/3);
			var checkbox_Y = guiY - sprite_get_height(textbox)- floor(BUFFER * 3.5) - floor(sprite_get_height(checkbox)/8);
			draw_sprite(checkbox, 0, checkbox_X, checkbox_Y);
			for (var j = 0; j < 6; j++) {
				if (global.ga_dice_lock[j,1] == "LOCKED") {
						draw_text_ext_color(floor(checkbox_X/ 6 *5) + (sprite_get_width(checkbox)/9* (j+1)), 
						floor(checkbox_Y) + BUFFER,
						j + 1, 0, 50,c_red, c_red, c_red, c_red, 1);
					//Else just leave it white
					} else{
						draw_text_ext(floor(checkbox_X/6 *5 )  + (sprite_get_width(checkbox)/9 * (j+1)), 
						floor(checkbox_Y) + BUFFER, 
						j+1, 0, 50);
					}
			}
			if (global.ga_dice_lock[6,1] == "LOCKED") {
				var lock_text = "Your dice has locks on it!";
				draw_text(textX + 15, textY, lock_text);
			} else {
				var lock_text = "Your dice is unlocked!";
				draw_text(textX + 15, textY, lock_text);
			}
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