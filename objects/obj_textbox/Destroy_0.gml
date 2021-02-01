/// @description Unpause, callback
with (obj_npc)
{
	can_move = true;
}

with (obj_ow_player)
{
	can_move = true;
	active_textbox = noone;
}

if (callback)
{
	script_execute(callback)	
}