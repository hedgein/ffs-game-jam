//Passage # includes zero (zero is first)
with (obj_battle){
	current_passage = next_passage;

	if (show_roll_options){
		if (keyboard_check_pressed(ord("Z"))) {
			passage_text = global.battle_snail[current_passage, 0];

			switch (current_passage) {
				//Start
				case 0: {
					if (roll_success) {
						switch (roll_option) {
							//knock knock
							case 0: {
									next_passage = 1;
							}
							//grab the hammer
							case 1: {
								next_passage = 2;
							}
						}	
					if (ds_exists(ds_options_lock, ds_type_list)){
						ds_list_destroy(ds_options_lock);
					}
					}
					break;
				}
				
				//Case 2
			
			}
	
		}
	}	
}