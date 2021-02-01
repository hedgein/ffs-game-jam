/// @description Initialize
// PARENT.
event_inherited();

// Overrides.
left = enemy2_left;
right = enemy2_right;
path = path_enemy2;
portrait_sprite = enemy2_portrait;
name = "Cultist";
battle = Battle_Child_0;

// Text.
text = [ 
	"I'm looking for an unassuming prince! Are you the weird lady?", 
	"Wha- I'm into whatever I'm into alright?"
];
speakers = [ obj_ow_player, id ];
indices  = [ 2, 1 ];

// After the battle.
victory_sprite_left = enemy2_left;
victory_sprite_right = enemy2_right;
victory_portrait = enemy2_portrait;
victory_walk_path = true;
victory_name = "Cultist"
victory_callback = noone;

victory_text = [
	"Now, tell me what you did!",
	"I don't have time for this! There are more pressing matters!",
	"Well, where did the unassuming prince go?",
	"As if I'd tell the likes of you! You're just demanding all these things out of nowhere!",
	"(*Sigh*, reminds me of why I broke up with my ex.)",
	"I... remind you of your ex...?",
	"Excuse me? You're being ridiculous kid.",
	"(Maybe I should send them a raven... just to see how they're doing...)",
	"Erm...",
	"(No, no, no. I'm in a better place now...)",
	"(I better get out of here, maybe through the forest?)"
];
victory_speakers = [ 
	obj_ow_player, 
	id, 
	obj_ow_player, 
	id, 
	id, 
	obj_ow_player, 
	id, 
	id, 
	obj_ow_player, 
	id, 
	obj_ow_player
];
victory_indices = [
	0,
	1,
	0,
	0,
	1,
	3,
	0,
	1,
	3,
	1,
	3
];