// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_show_credits(){
	audio_stop_all();
	audio_play_sound(snd_credits, 0, true);
	with (obj_ow_player)
	{
		visible = false;	
	}
	instance_deactivate_all(true);
	room_goto(Credits);
}