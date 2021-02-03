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
hsp = 0;
vsp = 0;
dir = 0;
state = "idle";
InputStack = ds_stack_create();
InputList[0] = [ ord("W"), ord("S"), ord("A"), ord("D") ];
InputList[1] = [ vk_up, vk_down, vk_left, vk_right ];

// Dialogue
portrait_sprite = protag_portrait;
portrait_index = 0;
name = "Player";
active_textbox = noone;
victory_dialogue = false;
most_recent_press = "LEFT";

// NPC
npc = noone;
npc_triggered = false;