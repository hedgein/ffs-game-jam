// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ddr_instance_start(monster){
	switch (monster) {
		case "SNAIL": {
			instance_destroy(obj_snail);
			break;
		}
		case "CULTIST": {
			instance_destroy(obj_cultist);
			break;
		}
		case "DRAGON": {
			instance_destroy(obj_dragon);
			break;
		}
	}
	
	instance_create_layer(0, 0, "Instances", obj_shake_ddr);
	instance_create_layer(0, 0, "Instances", obj_ddr_steps);
	ddr_start = true;
	ddr_steps = 0;
}