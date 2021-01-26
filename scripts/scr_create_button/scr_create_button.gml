/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg text
/// @arg layer
/// @arg script
function scr_create_button(_x, _y, _width, _height, _text, _layer, _script){
	var _button = instance_create_layer(_x, _y, _layer, obj_button);
	
	with (_button) {
		width  = _width;
		height = _height;
		text   = _text;
		script = _script;
	}
	
	return _button;
}