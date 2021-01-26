/// @description Game start
// Debug if we start for the first time.
if (!gameStart)
{
	show_debug_message("Game started!");
}
// Set the state.
gameStart = true;
gameRunning = true;

// Destroy UI.
event_user(1);
menuOpen = false;