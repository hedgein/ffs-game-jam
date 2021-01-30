// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spend_ok(roll_cost, dice_points){
	if (roll_cost <= dice_points) && (dice_points != 0) {
		return true;
	} else {
		return false;
	}
}