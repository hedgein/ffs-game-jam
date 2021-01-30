// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_pause_all_objects(_paused){
	var objects = [obj_ow_player, obj_npc];
	for (var i = 0; i < array_length_1d(objects); i++)
	{
		with(objects[i])
		{
			paused = _paused;
		}
	}
}