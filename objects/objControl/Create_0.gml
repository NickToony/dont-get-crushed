#macro MAX_SIDES 20
#macro MIN_SIDES 4
#macro MINIMAL true
#macro DEBUG true

show_debug_overlay(DEBUG);

display_reset(0, true);

global.LAYER_PLATFORMS = layer_get_id("Platforms");

global.SIDES = 8;
global.CENTER_X = room_width/2;
global.CENTER_Y = room_height/2;
global.THEME = c_white;
global.THEME_LAST = c_white;
global.ROTATE = 0;
currentRow = 0;
RandomiseTheme();

alarm[0] = room_speed;