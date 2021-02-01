/// @description Initialize
// Parent constructor.
event_inherited();

// Overrides.
walk_path = false;
left = enemy3_transformed_left;
right = enemy3_transformed_left;
path = path_enemy3;
portrait_sprite = enemy3_transformed_portrait;
name = "Dragon";
battle = Battle_Child_1;
// Text.
text = [
	"RAWRRRR!", 
	"Have you seen an unassuming prince?",
	"SKREEEE?",
	"You know... for a dragon you're quite unassuming."
];
speakers = [ id, obj_ow_player, id, obj_ow_player ];
indices = [ 0, 3, 0, 2 ];

// After the battle.
victory_sprite_left = enemy3_left;
victory_sprite_right = enemy3_left;
victory_portrait = enemy3_portrait;
victory_walk_path = false;
victory_name = "Prince";
victory_callback = scr_show_credits;

victory_text[0] = "Gee, thanks! It was quite itchy being a dragon! The scales get bothersome after a while.";
victory_speakers[0] = id;
victory_indices[0] = 0;

victory_text[1] = "Glad to help!";
victory_speakers[1] = obj_ow_player;
victory_indices[1] = 1;

victory_text[2] = "?";
victory_speakers[2] = id;
victory_indices[2] = 0;

victory_text[3] = "Oh wow! The dice! I was wondering where those went! I must have dropped them.";
victory_speakers[3] = id;
victory_indices[3] = 0;

victory_text[4] = "These are yours? Oh, I didn't mean to steal them! They were just out in the open field.";
victory_speakers[4] = obj_ow_player;
victory_indices[4] = 0;

victory_text[5] = "(Probably should take better care of your stuff though...)";
victory_speakers[5] = obj_ow_player;
victory_indices[5] = 3;

victory_text[6] = "No, no... That's okay, they're yours...";
victory_speakers[6] = id;
victory_indices[6] = 1;

victory_text[7] = "Are you sure?";
victory_speakers[7] = obj_ow_player;
victory_indices[7] = 0;

victory_text[8] = "It's the only way I can thank you! After all, it seems like if they're meant for anyone, they're meant for you.";
victory_speakers[8] = id;
victory_indices[8] = 0;

victory_text[9] = "What do you mean? They're just dice.";
victory_speakers[9] = obj_ow_player;
victory_indices[9] = 0;

victory_text[10] = "Oh no, how do you think I turned into a dragon?";
victory_speakers[10] = id;
victory_indices[10] = 0;

victory_text[11] = "The weird lady didn't cast a spell on you?";
victory_speakers[11] = obj_ow_player;
victory_indices[11] = 2;

victory_text[12] = "Nevaeh?! BAH. Of course not. Weird? Well, I guess she's into whatever she's into.";
victory_speakers[12] = id;
victory_indices[12] = 1;

victory_text[13] = "But no, it was the dice that cursed me...";
victory_speakers[13] = id;
victory_indices[13] = 0;

victory_text[14] = "For something so small, I could feel the weight of the dice slowly changing me, so I went to look for Nevaeh.";
victory_speakers[14] = id;
victory_indices[14] = 0;

victory_text[15] = "She tried to undo the curse, but it was too late. So she banished me to the cliff side to protect others from myself.";
victory_speakers[15] = id;
victory_indices[15] = 1;

victory_text[16] = "Losing myself... even my own thoughts... was frightening.";
victory_speakers[16] = id;
victory_indices[16] = 1;

victory_text[17] = "I'm not sure what it is, but it seems like the dice are better off with you.";
victory_speakers[17] = id;
victory_indices[17] = 0;

victory_text[18] = "Anyways! You must be famished, as am I (being a dragon is hungry work)! I will gladly treat you to a feast. Maybe Nevaeh can join us!";
victory_speakers[18] = id;
victory_indices[18] = 0;

victory_text[19] = "About that...";
victory_speakers[19] = obj_ow_player;
victory_indices[19] = 3;