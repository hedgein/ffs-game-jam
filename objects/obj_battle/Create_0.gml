/// @description Insert description here
// You can write your code in this editor
randomize();
audio_play_sound(monster_chip, 1, true);
instance_create_depth(320, 192, 0 , obj_snail);
a_text[0] = "ROLL";
a_text[1] = "SPEND";
a_text[2] = "CHECK";
//If there's a need for a fourth option later?
//a_text[3] = "HEAL";


//Track which passage we're on
current_passage = 0;
next_passage = 0;

monster = "SNAIL";





//Dice points
dice_points = 0;
dice_points_earned = 0;
ddr_steps = 0;

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

player_dead = false;
battle = true; 
victory = false;
state = "READY";

//Roll menu
show_roll_options = false; //Show roll options/choices or not
roll_option = 0;

//Roll mechanic
roll = 0;
roll_success = false;


 
//sound
victory_sound_played = false;

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

spend_ready = false;
ddr_start = false;