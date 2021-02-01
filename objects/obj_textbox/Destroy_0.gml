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
	if (battle_room == noone)
	{
		script_execute(callback);
	}
	else
	{
		script_execute(callback, battle_room);
	}
}