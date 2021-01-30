// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dice_range_array_access(monster, current_passage, roll_option){
	range_selector = scr_monster_array_access(monster, current_passage, 5)
	
	switch (range_selector) {
	
			case "EVEN": {
				return obj_battle.ga_range_even[roll_option];
				break;
			}
			case "HARD": {
				return obj_battle.ga_range_hard[roll_option];
				break;
			}
			case "HARD FLIP": {
				return obj_battle.ga_range_hard_flip[roll_option];
				break;
			}
			case "EVEN DUO": {
				return obj_battle.ga_range_even_duo[roll_option];
				break;
			}
		}


	
}