// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ddr_instance_start(){
	instance_destroy(obj_snail);
	instance_create_depth(0, 0, 0, obj_shake_ddr);
	instance_create_depth(0, 0, 0, obj_ddr_steps);
}