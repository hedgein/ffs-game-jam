// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_crit(max_crit){
	return choose(round(max_crit/2), round(max_crit/4), 0);
}