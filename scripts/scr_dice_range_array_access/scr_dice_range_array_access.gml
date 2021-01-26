// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dice_range_array_access(monster, current_passage){
	range_selector = scr_monster_array_access(monster, current_passage, 5)
	
	switch (range_selector) {
		case 1: {
			return global.ga_dice_range_even;
			break;
		}
		case 2: {
			return global.ga_dice_range_hard;
			break;
		}
		case 3: {
			return global.ga_dice_range_hard_flip;
			break;
		}

	}
	
}