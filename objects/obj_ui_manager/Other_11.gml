/// @description Remove UI
// Destroy all instance of the buttons.
instance_destroy(obj_button);

// Resume the game.
with (obj_ow_manager)
{
	event_user(1);	
}