var rand = choose(2, 3, 4, 5);

var instance = instance_create_depth((room_width/ 15) * rand, 0 , 0, obj_ddr_button);

instance.image_index = rand - 2;
//Shown all arrows, to end ddr we can turn off ddr_start and destory instance
if( instance_counter >10){
	ddr_points = scr_ddr_dice_pts(ddr_steps, 9);;
	with(obj_battle){
	dice_points_earned = ddr_points;
	}
	instance_destroy();
	
} else {
	instance_counter++;
	alarm[0] = room_speed / 2;
	

}





