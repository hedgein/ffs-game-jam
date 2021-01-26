/// @description Check for menu open
// On first run, display menu.
if (firstRun) {
	// Create UI.
	event_user(0);
	// Set state.
	firstRun = false;
	menuOpen = true;
}

// If ESC key pressed, pause and enter menu.
if (gameStart && keyboard_check_pressed(vk_escape)) {
	// Toggle flag.
	menuOpen = !menuOpen;
	
	if (menuOpen) {
		// Create UI.
		event_user(0);
		gameRunning = false;
	}
	else {
		// Destroy UI.
		event_user(1);
		gameRunning = true;
	}
}

// MAIN RUN LOOP.
if (gameRunning)
{
	// show_debug_message("Running!")
}