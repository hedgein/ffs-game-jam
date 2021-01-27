// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ddr_dice_pts(ddr_steps, total_steps){
	var ddr_score = ddr_steps / total_steps;
	if (ddr_score <= 0.17) {
		return 0;
	}
	if (ddr_score > 0.17 && ddr_score <= 0.34) {
		return 0;
	}
	if (ddr_score > 0.34 && ddr_score <= 0.51) {
		return 1;
	}
	if (ddr_score > 0.51 && ddr_score <= 0.68) {
		return 2;
	}
	if (ddr_score > 0.68 && ddr_score <= 0.84) {
		return 3;
	}
	if (ddr_score  > 0.84 && ddr_score < 1) {
		return 4;
	}
	if (ddr_score = 1) {
		return 5;
	}
}