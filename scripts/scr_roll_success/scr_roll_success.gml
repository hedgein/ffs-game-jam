// roll option doubles as the select and array index
function scr_roll_success(roll_range, roll){
	switch (roll_range){
		case "1-2": {
			if (roll < 3) {
				return true;
			} else {
				return false;
			}
			break;
		}
		case "3-4": {
			if (roll > 2 && roll <5) {
				return true;
			} else {
				return false;
			}
			break;
		}
		case "5-6": {
			if (roll > 5) {
				return true;
			} else {
				return false;
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
				return true;
			} else {
				return false;
			}
			break;
		}
	}
}