#macro MAX_SIDES 20
#macro MIN_SIDES 4
#macro MINIMAL true
#macro DEBUG true

#macro MODE_SPIRAL 0
#macro MODE_FLAT 1


global.MODE = MODE_FLAT;

show_debug_overlay(DEBUG);

display_reset(0, true);
room_speed = 60;

global.LAYER_PLATFORMS = layer_get_id("Platforms");

global.SIDES = 8;
global.CENTER_X = room_width/2;
global.CENTER_Y = room_height/2;
global.THEME = c_white;
global.THEME_LAST = c_white;
global.ROTATE = 0;

// Difficulty
global.DROP_RATE = 1.5;
global.DROP_SPEED = 3;

currentRow = 0;
RandomiseTheme();

SetupBasePlatforms();

alarm[0] = room_speed;