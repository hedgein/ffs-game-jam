// roll option doubles as the select and array index
function scr_roll_success(roll_range, roll){
	var roll_success = false;;
	switch (roll_range){
		case "1-3": {
			if (roll < 4) {
				roll_success = true;
			} else {
				roll_success = false;
			}
			break;
		}
		case "1-2": {
			if (roll < 3) {
				roll_success = true;
			} else {
				roll_success = false;
			}
			break;
		}
		case "3-4": {
			if (roll == 3) || (roll == 4) {
				return true;
			} else {
				return false;
			}
			break;
		}
		case "5-6": {
			if (roll == 5) || (roll == 6) {
				roll_success = true;
			} else {
				roll_success = false;
			}	
		  break;
		}
		
		case "3-6": {
			if (roll > 2) {
				return true;
			} else {
				return false;
			}
			break;
		}
		case "1-4": {
			if (roll < 5){
				roll_success = true;
			} else {
				roll_success = false;
			}
			break;
		
		}
		case "4-6": {
			if (roll > 3) {
				roll_success = true;
			} else {
				roll_success = false;
			}
		}
	}
	
	return roll_success;
}