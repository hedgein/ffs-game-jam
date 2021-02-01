// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_monster_array_access(monster, index_1, index_2){
	switch (monster) {
		case "SNAIL": {
			return global.battle_snail[index_1, index_2]
			break;
		}
		case "CULTIST": {
			return global.battle_cultist[index_1, index_2];
			break;
		}
		case "DRAGON": {
			return global.battle_dragon[index_1, index_2];
			break;
		}
	}
}