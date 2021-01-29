var rand = choose(6, 7, 8, 9);
instance_counter++;

var instance = instance_create_depth((room_width/ 15) * rand, 0 , 0, obj_ddr_button);

instance.image_index = rand - 6;
//Shown all arrows, to end ddr we can turn off ddr_start and destory instance
if (instance_counter < 10){
	alarm[0] = room_speed / 2;
} else {
	with (obj_battle) {
		ddr_start = false;
	}
		
}





