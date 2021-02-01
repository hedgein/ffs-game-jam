/// @description Player interact
if (keyboard_check_pressed(interact_key))
{
	// If key is pressed before string is fully printed,
	// skip ahead to the end.
	if (typewriter_counter < str_len)
	{
		typewriter_counter = str_len;	
	}
	else if (page < array_length_1d(main_text) - 1)
	{
		// Otherwise, advance to the next page.
		page++;
		// Get text-wrapped string.
		event_user(0);
	}
	else
	{
		instance_destroy();	
	}
}
