var rand = choose(1, 2, 3, 4);

var instance = instance_create_depth((room_width/5) * rand, 0 , 0, obj_ddr_button);

instance.image_index = rand - 1;
