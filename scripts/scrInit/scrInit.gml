// Global config
#macro MINIMAL true
#macro DEBUG (os_get_config() == "debug")

// Render modes
enum RENDER_MODE {
	CIRCLE,
	FLAT
}
// Default to circle
global.MODE = RENDER_MODE.CIRCLE;

// Game config
#macro MAX_SIDES 20
#macro MIN_SIDES 4
#macro START_DISTANCE 2000
#macro MIN_DISTANCE 40
#macro SCALE_DISTANCE 1000

// UI Config
#macro UI_DELAY_LETTER 2
#macro UI_DELAY_PAUSE room_speed*2

// Debug stuff
show_debug_overlay(DEBUG);

// Fix the display, and set a proper FPS
display_reset(0, true);
game_set_speed(60, gamespeed_fps);

// Make sure the levels are random!
randomise();

// Globals
global.FIRST_GAME = true;