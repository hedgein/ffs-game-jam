var rand = choose(1, 2, 3, 4);

var instance = instance_create_depth((room_width/ 10) * rand, 0 , 0, obj_ddr_button);

instance.image_index = rand - 1;

//recall it self;
alarm[0] = room_speed/2;
