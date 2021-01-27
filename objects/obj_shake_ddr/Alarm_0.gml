var rand = choose(2, 3, 4, 5);

var instance = instance_create_depth((room_width/ 15) * rand, 0 , 0, obj_ddr_button);

instance.image_index = rand - 2;

if( instance_counter < 10){
	instance_counter++ ;
} else {
	//Shown all arrows, to end ddr we can turn off ddr_start and destory instance
	with(obj_battle){
		ddr_start = false;	
	}
	instance_destroy();
	instance_create_depth(320, 192, 0 , obj_snail);
}

//recall it self;
alarm[0] = room_speed/2;


