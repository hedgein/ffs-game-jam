/// @description Insert description here
// You can write your code in this editor
randomize();
audio_play_sound(monster_chip, 1, true);
a_text[0] = "ROLL";
a_text[1] = "SPEND";
a_text[2] = "CHECK";
//If there's a need for a fourth option later?
//a_text[3] = "HEAL";


//Track which passage we're on
current_passage = 0;
next_passage = 0;

monster = "SNAIL";
monster_array = arr_copy_2d(global.battle_snail);

passage_text = "";


//Dice points
dice_points = 0;

//Getting rid of player HP and monster HP stats -> not needed anymore

selected_option = 0; //which option is the arrow on
player_turn = false;
ds_messages = ds_list_create();
message_counter = 0 ;//Tracks which message we're on
show_battle_text = false; //Display battle text or not

message_timer = 0;
time_before_button_accepted = 15;

enemy_timer = 0;
time_til_enemy_attacks = 30; 
battle_option = 0; //which option has been selected by either monster or player

check_boolean = false;

player_dead = false;
battle = true; 
victory = false;
state = "READY";

//Roll mechanic
show_roll_options = false; //Show roll options/choices or not
roll_option = 0;

 
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