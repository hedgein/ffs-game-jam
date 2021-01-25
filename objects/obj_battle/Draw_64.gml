if (battle == true) {

	// DRAW THE OPTIONS
	optionX = 500;
	optionY = 360;
	draw_set_font(fnt_battle_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	fontSize = font_get_size(fnt_battle_text)
	var BUFFER = 4;

	
	if (!show_roll_options) && (!show_attack_options) && (!show_heal_options) && (!show_defense_options){
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
		if (show_roll_options) || (show_defense_options) || (show_heal_options) {
			var rollX = optionX;
			var rollY = optionY;
			for (var j = 0; j < array_length_1d(a_roll_text); j++){
				text = a_roll_text[j];
				if  (roll_option == j ){
					draw_sprite(arrow, 0, rollX - sprite_get_width(arrow), rollY + ((fontSize + BUFFER + 1) * j ));
				}
				draw_text(rollX, rollY + ((fontSize + BUFFER) * j), text);
			}
		}
		if (show_attack_options) {
			var attackX = optionX;
			var attackY = optionY;
			for (var attack_array_index = 0; attack_array_index < array_length_1d(an_attack_text); attack_array_index++){
				text = an_attack_text[attack_array_index];
				if  (attack_option == attack_array_index ){
					draw_sprite(arrow, 0, attackX - sprite_get_width(arrow), attackY + ((fontSize + BUFFER + 1) * attack_array_index ));
				}
				draw_text(attackX, attackY + ((fontSize + BUFFER) * attack_array_index), text);
			}
		}

		
	}

	




//DRAW THE MESSAGES

guiX = surface_get_width(application_surface) / 2;
guiY = surface_get_height(application_surface);

draw_sprite(textbox, 0, guiX - (sprite_get_width(textbox) / 2) - BUFFER, guiY - (sprite_get_height(textbox))- (BUFFER * 2.2));

if (show_battle_text) {
	textX = guiX - (sprite_get_width(textbox) / 2) + (BUFFER * 3);
	textY = guiY - (sprite_get_height(textbox) - (BUFFER * 3));
	
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

//DRAW MONSTER's HP
draw_set_valign(fa_top);
draw_set_halign(fa_left);
monster_hpX = BUFFER;
monster_hpY = BUFFER;
draw_text(monster_hpX + shakeX, monster_hpY + shakeY, "ENEMY HP: " + string(monster_HP) + " / " + string(monster_MAX_HP));




//DRAW PLAYER'S HP


draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
hpX = BUFFER;
hpY = surface_get_height(application_surface) - BUFFER;
draw_text(hpX + shakeX, hpY + shakeY, "HP: " + string(player_HP) + " / " + string(player_MAX_HP));

}