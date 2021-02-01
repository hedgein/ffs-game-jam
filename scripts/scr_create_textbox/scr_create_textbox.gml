/// @description create_textbox
/// @arg text
/// @arg speakers
/// @arg indices
/// @arg callback
function scr_create_textbox(_text, _speakers, _indices, _callback)
{
	// Create textbox on layer.
	var tbox = instance_create_layer(0, 0, "Text", obj_textbox);
	
	// Set properties.
	with (tbox)
	{
		main_text = _text;
		speakers  = _speakers;
		indices   = _indices;
		if (_callback)
		{
			callback  = _callback;
		}
		
		for (var i = 0; i < array_length_1d(main_text); i++)
		{
			names[i]     = speakers[i].name;
			portraits[i] = speakers[i].portrait_sprite;
		}
		
		// Generate wrapped text.
		event_user(0);
	}
	
	return tbox;
}