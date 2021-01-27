// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_ddr_instance_end(){
	instance_destroy(obj_ddr_steps);
	instance_create_depth(320, 192, 0, obj_snail);
}