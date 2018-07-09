#macro MAX_SIDES 8
#macro MIN_SIDES 4

global.LAYER_PLATFORMS = layer_get_id("Platforms");

global.SIDES = 8;
global.CENTER_X = room_width/2;
global.CENTER_Y = room_height/2;

display_reset(0, true);

alarm[0] = room_speed;