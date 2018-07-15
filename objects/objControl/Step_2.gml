//if (keyboard_check_pressed(vk_down)) {
//	global.SIDES -= 1;
//}
//if (keyboard_check_pressed(vk_up)) {
//	global.SIDES += 1;
//}

if (keyboard_check_pressed(ord("M"))) {
	global.MODE = (global.MODE == MODE_FLAT) ? MODE_SPIRAL : MODE_FLAT;
}
if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}

if (keyboard_check_pressed(ord("P"))) pauseGame = !pauseGame;
global.PAUSED = pauseGame;
levelPause -= 1;

if (!instance_exists(objPlayer)) {
	if (keyboard_check(vk_left)) targetRotation += 2;
	if (keyboard_check(vk_right)) targetRotation -= 2;
} else {
	targetRotation = -objPlayer.myAngle + 90;	
}

if (!global.PAUSED) {
	nextSpawn -= 1;	
	if (nextSpawn < 0) {
		event_user(0);
	}
}

if (lastSides != global.SIDES) {
	global.SIDES = clamp(global.SIDES, MIN_SIDES, MAX_SIDES);
	FixHoles(lastSides < global.SIDES);
	RandomiseTheme();
	SetupBasePlatforms(lastSides < global.SIDES);
	lastSides = global.SIDES;
}

zoom = zoom + (zoomTo - zoom) / 100;
zoomTo = (max(objPlayer.dist*1.3, 100) / START_DISTANCE) * maxZoom;
zoomTo = min(max(zoomTo, minZoom), maxZoom);
var vm = matrix_build_lookat(global.CENTER_X, global.CENTER_Y, -10, global.CENTER_X, global.CENTER_Y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_wport[0] * zoom, view_hport[0] * zoom, 1, 1000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
