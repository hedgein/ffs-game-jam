//Passage # includes zero (zero is first)
with (obj_battle){
	if(!show_battle_text && !player_turn){
	current_passage = next_passage;
	} 
	if (show_roll_options) {
		if (keyboard_check_pressed(ord("Z"))) {
			passage_text = global.battle_snail[current_passage, 0];
			switch (current_passage) {
				case 0: {
					//
					switch (roll_option) {
						case 0: {
							next_passage = 1;
							break;
						}
						case 1: {
							next_passage = 2;
							break;
						}
					}
					break;
				}
			
			}
		}
	}	
}