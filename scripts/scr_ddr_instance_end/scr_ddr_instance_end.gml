// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ddr_instance_end(){
	monsterX_Y = surface_get_width(application_surface) / 2;
	
	instance_destroy(obj_shake_ddr);
	instance_destroy(obj_ddr_steps);
	instance_create_depth(monsterX_Y, monsterX_Y, 0, obj_snail);
}