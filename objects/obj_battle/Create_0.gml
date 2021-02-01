/// @description Insert description here
// You can write your code in this editor
randomize();

// Prevent OW player from moving.
with (obj_ow_player)
{
	can_move = false;	
}

// Audio.
audio_stop_all();
if (monster == "DRAGON") {
	audio_play_sound(roll_of_fate, 1, true);
} else {
	audio_play_sound(monster_chip, 1, true);
}


//dice_ranges
ga_range_even[0] = "1-2"
ga_range_even[1] = "3-4"
ga_range_even[2] = "5-6"

ga_range_hard[0] = "1-4"; // 2 cost
ga_range_hard[1] = "5-6"; // 4 cost

ga_range_hard_flip[0] = "1-2"; // 4 cost
ga_range_hard_flip[1] = "3-6"; // 2 cost

ga_range_even_duo[0] = "1-3"; //3 cost
ga_range_even_duo[1] = "4-6"; //3 cost



//Create menu texts
a_text[0] = "ROLL";
a_text[1] = "SPEND";
a_text[2] = "CHECK";
//If there's a need for a fourth option later?
//a_text[3] = "HEAL";


//Track which passage we're on
current_passage = 0;
next_passage = 0;




//Use this function to create snail object 
//will destroy ddr instance, but there will be none to destory)
scr_ddr_instance_end(monster);





//Dice points
dice_points = 0;
dice_points_earned = 0;
ddr_steps = 0;
spend_ok = false;

//Getting rid of player HP and monster HP stats -> not needed anymore

selected_option = 0; //which option is the arrow on
player_turn = true;;
ds_messages = ds_list_create();
message_counter = 0 ;//Tracks which message we're on
show_battle_text = false; //Display battle text or not

message_timer = 0;
time_before_button_accepted = 15;

enemy_timer = 0;
time_til_enemy_attacks = 30; 


stay_player_turn_boolean = false;

battle = true; 
state = "READY";

//Roll menu
show_roll_options = false; //Show roll options/choices or not
roll_option = 0;

//Roll mechanic
roll = 0;
roll_success = false;


 

//Screenshake
screen_shake = false;
max_shakeX = 5;
max_shakeY = 5;
shakeX = 0;
shakeY = 0; 
shake_timer = 0;
time_til_shake_ends = 30;

//Create list of possible rolls here
ds_roll_input = ds_list_create();
ds_roll_input[| 0] = 1;
ds_roll_input[| 1] = 2;
ds_roll_input[| 2] = 3;
ds_roll_input[| 3] = 4;
ds_roll_input[| 4] = 5;
ds_roll_input[| 5] = 6;

//Create options lock for first passage (every enemy will have two options at beginning)
ds_options_lock = ds_list_create();
ds_options_lock[| 0] = false;
ds_options_lock[| 1] = false;

last_lock_boolean = false;
lock_counter = 0;
//If player is spend option or not
spend_ready = false;
//Time when to turn ddr off and on
ddr_start = false;

//tmp
check_boolean= false;

//ending
ending = false;

