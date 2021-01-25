/// @description Insert description here
// You can write your code in this editor
randomize();
audio_play_sound(monster_chip, 1, true);
a_text[0] = "ATTACK";
a_text[1] = "DEFEND";
a_text[2] = "SPECIAL";
a_text[3] = "HEAL";

a_roll_text[0] = "ROLL";
a_roll_text[1] = "CHECK";

an_attack_text[0] = "ROLL";
an_attack_text[1] = "FISTS";
an_attack_text[2] = "CHECK";

player_HP = 20;
player_MAX_HP = 20;

monster_HP = 50;
monster_MAX_HP = 50;

selected_option = 0; //which option is the arrow on
player_turn = true;
ds_messages = ds_list_create();
message_counter = 0 ;//Tracks which message we're on
show_battle_text = false; //Display battle text or not

message_timer = 0;
time_before_button_accepted = 15;

enemy_timer = 0;
enemy_turn_counter = 0;
time_til_enemy_attacks = 30; 
battle_option = 0; //which option has been selected by either monster or player

check_boolean = false;

player_dead = false;
battle = true; 
victory = false;
state = "READY";

	//Roll mechanic
	show_roll_options = false; //Show lock menu or not
	roll_option = 0;

	//Attack mechanic
	show_attack_options = false;
	attack_option = 0; 

	//Heal Mechanic
	show_heal_options = false;
	heal_option = 0;
	
	show_defense_options = false;

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

ds_roll_input = ds_list_create();
ds_roll_input[| 0] = 1;
ds_roll_input[| 1] = 2;
ds_roll_input[| 2] = 3;
ds_roll_input[| 3] = 4;
ds_roll_input[| 4] = 5;
ds_roll_input[| 5] = 6;