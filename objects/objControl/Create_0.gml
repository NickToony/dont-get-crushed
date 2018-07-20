#macro MAX_SIDES 20
#macro MIN_SIDES 4
#macro MINIMAL true
#macro DEBUG false

#macro MODE_SPIRAL 0
#macro MODE_FLAT 1


global.MODE = MODE_SPIRAL;

show_debug_overlay(DEBUG);

display_reset(0, true);
room_speed = 60;

global.LAYER_PLATFORMS = layer_get_id("Platforms");
global.LAYER_UI = layer_get_id("UI");

global.SIDES = 8;
global.CENTER_X = room_width/2;
global.CENTER_Y = room_height/2;
global.THEME = c_white;
global.THEME_LAST = c_white;
global.ROTATE = 0;
global.PAUSED = false;
global.DIFFICULTY = 0;

// Difficulty
lastMode = -1;
scrModeRandomise(false);

global.DROP_POSITION = START_DISTANCE;

currentRow = 0;
lastSides = 0;
targetRotation = 0;
scrThemeRandomise();

lastRemoved = ds_list_create();

nextSpawn = -1;
spawnsSinceLastEvent = -5;


// Create blank camera
camera = camera_create();
view_visible[0] = true;
view_wport[0] = 1024;
view_hport[0] = 768;
// Matrixes
var vm = matrix_build_lookat(global.CENTER_X, global.CENTER_X, -10, global.CENTER_X, global.CENTER_X, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_wport[0], view_hport[0], 1, 1000);
// Apply
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
// give viewport
view_camera[0] = camera;
zoom = 1;
zoomTo = 2;
zoomSpeed = 0.05;
minZoom = 0.5;
maxZoom = 7;

pauseGame = false;
levelPause = -1;

bounce = 0;
bounceState = 0;

if (global.MENU != MENU.ACTIVE) {
	if (global.MENU == MENU.FIRST_PLAY) {
		scrMessageAdd("Space to jump\nWASD/Arrow keys to move", true);
		scrMessageAdd("Don't get crushed", false);
		global.MENU = MENU.INACTIVE;
	} else {
		randomise();
		scrMessageRandom(global.MESSAGES_START, true);
		scrMessageAdd("Space to jump", false);
	}
	
	instance_create_layer(global.CENTER_X, global.CENTER_Y, "Player", objPlayer);
}