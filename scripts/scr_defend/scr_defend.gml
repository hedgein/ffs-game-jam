// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_defend(defense_buff){

		//If monster base atk is greater than player base def, calculate positive damage
		if (global.monster_base_atk > global.player_base_def + defense_buff) {
			base_damage = global.monster_base_atk - (global.player_base_def + defense_buff) + scr_crit(global.monster_base_atk);
		//Player def is greater than monsters's base atk
		} else {
			if (global.monster_base_atk > round((global.player_base_def + defense_buff) / 2)) {
				base_damage = 1;
			} else {
				return 0;
			}
			
		}
	
		return base_damage;

}
	
	