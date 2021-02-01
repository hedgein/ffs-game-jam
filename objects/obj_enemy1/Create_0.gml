/// @description Initialize
// Parent constructor.
event_inherited();

// Overrides.
left = enemy1_left;
right = enemy1_right;
path = path_enemy1;
portrait_sprite = enemy1_portrait;
name = "Snail";

// Text.
text = [ 
	"Hi, I'm on an adventure! Can you tell me where to go?", 
	"Nope, cause I'm shy! UwU UwU." 
];
speakers = [ obj_ow_player, id ];
indices = [ 2, 0 ];

// After the battle.
victory_sprite_left = enemy1_transformed_idle;
victory_sprite_right = enemy1_transformed_idle;
victory_portrait = enemy1_transformed_portrait;
victory_walk_path = false;
victory_name = "Snail";

victory_text = [
	"Wow, you cracked my shell! I feel like I can tell you everything now!",
	"I saw this weird lady do some hocus pocus stuff on an unassuming prince. They went into the middle of the forest. Maybe there's adventure for you there!",
	"Smells like trouble! Thanks Not-Shy-Anymore Snail!"
];
victory_speakers = [ id, id, obj_ow_player ];
victory_indices = [ 0, 0, 1 ];