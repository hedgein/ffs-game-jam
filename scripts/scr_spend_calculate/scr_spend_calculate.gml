// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spend_calculate(roll_range, difficulty){
	var points_spent = 0;
	switch (roll_range){
		case "1-2": {
			if (difficulty > 1){
				points_spent = 4;
			} else {
				points_spent = 2;
			}
			
			break;
		}
		case "3-4": {
			points_spent = 2;
			break;
		}
		case "5-6": {
			if (difficulty > 1){
				points_spent = 2;
			} else {
				if (difficulty == 1){
					points_spent = 2;
				} else {
					points_spent = 4;
				}
				
			}
		  break;
		}
		
		case "3-6": {
			points_spent = 2;
			break;
		}
		case "1-4": {
			points_spent = 2; 
			break;
		
		}
	}
	
	return points_spent;
}