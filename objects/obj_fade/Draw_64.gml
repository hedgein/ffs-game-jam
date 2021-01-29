/// @description Transition
draw_set_color(fade_color);
draw_set_alpha(image_alpha);

if (room != target)
{
	image_alpha += fade_speed;
	if (image_alpha == 1)
	{
		obj_ow_player.x = pos_x;
		obj_ow_player.y = pos_y;
		room_goto(target);
	}
}
else
{
	image_alpha -= fade_speed;
	if (image_alpha == 0)
	{
		instance_destroy();	
	}
}

draw_rectangle(0, 0, view_wport*2, view_hport*2, false);
draw_set_alpha(1);