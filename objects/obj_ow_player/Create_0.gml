/// @description Add player
// Properties
start_x = 0;
start_y = 0;
player_speed = 3;
paused = false;
can_move = true;
radius = 200;

// Vars
reached_start = false;
input_left = 0;
input_right = 0;
input_up = 0;
input_down = 0;
input_interact = 0;

// Dialogue
portrait_sprite = protag_portrait;
portrait_index = 0;
name = "Player";
active_textbox = noone;
victory_dialogue = false;

// NPC
npc = noone;
npc_triggered = false;
