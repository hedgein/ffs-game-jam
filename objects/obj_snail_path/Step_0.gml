//Passage # includes zero (zero is first)
with (obj_battle){

	if (show_roll_options) && (keyboard_check_pressed(ord("Z"))) {
		if  (roll_success){
			
			passage_text = global.battle_snail[current_passage, 0];

			switch (current_passage) {
				//Start
				case 0: {
						switch (roll_option) {
							//knock knock
							case 0: {
									next_passage = 1;
									current_passage = next_passage;
									if (ds_exists(ds_options_lock, ds_type_list)){
									ds_list_destroy(ds_options_lock);
									}
									break;
	
							}
							//grab the hammer
							case 1: {
									next_passage = 2;
									current_passage = next_passage;
									if (ds_exists(ds_options_lock, ds_type_list)){
									ds_list_destroy(ds_options_lock);
									}
									break;
								
							}
						}	
					
					break;
				}
				
				//Case 2
			
			}
			
			
	
		}
	}	
}