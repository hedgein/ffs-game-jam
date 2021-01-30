//Prevent memory leaks
if (ds_exists(ds_messages, ds_type_list)) {
	ds_list_destroy(ds_messages);
}

if (ds_exists(ds_roll_input, ds_type_list)) {
	ds_list_destroy(ds_roll_input);
}
