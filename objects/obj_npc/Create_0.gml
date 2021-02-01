/// @description Initialize
// Properties
npc_speed = 2;
paused = true;
can_move = true;

// Vars
move_dir = 1;
path_running = false;

// Sprites
left = enemy1_left;
right = enemy1_right;
path = path_enemy1;
walk_path = true;

// Dialogue
portrait_sprite = enemy1_portrait;
name = "Anonymous";
text = [ "This person has nothing to say." ];
speakers = [ id ];
indices = [ 0 ];