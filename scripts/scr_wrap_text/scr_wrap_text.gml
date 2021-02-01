/// @description Wraps text smartly, accomodating for typewriter effects.
/// @arg string
/// @arg max_width
function scr_wrap_text(str, max_width){
	var str_len = string_length(str);
	var last_space = 1;
	
	var count = 1;
	var substring;
	repeat(str_len) {
		// Get substring.
		substring = string_copy(str, 1, count);
		// Get the last space character index.
		if (string_char_at(str, count) == " ")
		{
			last_space = count;	
		}
		// Ensure width is below maximum.
		if (string_width(substring) > max_width)
		{
			// Delete space and replace with a newline.
			str = string_delete(str, last_space, 1);
			str = string_insert("\n", str, last_space);
			count++;
		}
		// Increment count.
		count++;
	}
	
	return str;
}