/// @description Intro cutscene.
// First time running.
if(!global.game_start)
{
	// Play music.
	audio_play_sound(overworld, 1, true);
	// Play into cutscene.
	var text = [
		"Seize the chance and behold, what uncertain tides create. A timely window that will close, a certain kind of risk to take. If you dare, take these dice. To surely set your soul unbound, become a bringer of new life. Or, seal your fate in tainted ground.",
		"Cool, some cubes! I love shapes!",
		"You pick up the dice."
	];
	var speakers = [ obj_chest, obj_ow_player, obj_ow_player ];
	var indices = [ 0, 2, 2 ];
	scr_create_static_textbox( text, speakers, indices, event_user(3) );
}

