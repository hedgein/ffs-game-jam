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
	// Play SFX.
	audio_play_sound(tap, 1, false);
	
	if (!menuOpen) {
		// Pause game.
		with (obj_ow_manager) {
			event_user(0);
		}
		// Create UI.
		event_user(0);
	}
	else {
		// Destroy UI.
		event_user(1);
		// Resume game.
		with (obj_ow_manager) {
			event_user(1);
		}
	}
}

// Used to limit the amount of clicks.
global.click_timer--;