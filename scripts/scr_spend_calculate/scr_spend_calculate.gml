// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spend_calculate(roll_range, range_set){
	var points_spent = 0;
	switch (roll_range){
		case "1-2": { // 1-2 3-4, 5-6  =------= 1-2, 3-6
			switch (range_set) {
				case "EVEN": {
					points_spent = 2;
					break;
				}
				
				case "HARD FLIP": {
					points_spent = 4;
					break;
				}
			}
		}
		case "3-4": {
			points_spent = 2;
			break;
		}
		case "5-6": {
			switch (range_set) {
				case "EVEN": {
					points_spent = 2;
					break;
				}
				
				case "HARD": {
					points_spent = 4;
					break;
				}
			}
		  break;
		}
		
		case "3-6":{
			points_spent = 2;
			break;
		}
		
		case "1-4": {
			points_spent = 2; 
			break;
		}
		
		case "1-3": {
			points_spent = 3;
			break;
		}
		
		case "4-6": {
			points_spent = 3;
			break;
		}
	}
	
	return points_spent;
}