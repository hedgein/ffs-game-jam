// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_damage(){

		//If player base atk is greater than monster base def, calculate positive damage
		if (global.player_base_atk > global.monster_base_def) {
			base_damage = global.player_base_atk - global.monster_base_def;
		//Monster def is greater than player's base atk, then take away damage from base atk
		} else {
			base_damage = global.monster_base_def - global.player_base_atk;
		}
	
		//total_damage = scr_crit(global.player_base_atk) + base_damage;
		return base_damage;
}