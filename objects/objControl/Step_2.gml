//if (keyboard_check_pressed(vk_down)) {
//	global.SIDES -= 1;
//}
//if (keyboard_check_pressed(vk_up)) {
//	global.SIDES += 1;
//}

if (keyboard_check_pressed(ord("B")) && os_browser == browser_not_a_browser) {
	global.MODE = (global.MODE == MODE_FLAT) ? MODE_SPIRAL : MODE_FLAT;
}
if (keyboard_check_pressed(ord("R"))) {
	switch (global.MENU) {
		case MENU.ACTIVE:
			global.MENU = MENU.FIRST_PLAY;
			break;
			
		case MENU.FIRST_PLAY:
			global.MENU = MENU.INACTIVE;
			break;
	}
	
	room_restart();
}

if (keyboard_check_pressed(ord("P"))) pauseGame = !pauseGame;
global.PAUSED = pauseGame || (!instance_exists(objPlayer) && !global.MENU == MENU.ACTIVE);
if (!global.PAUSED) {
	levelPause -= 1;
}

if (!instance_exists(objPlayer)) {
	targetRotation += 0.1;
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
	scrFixHoles(lastSides < global.SIDES);
	scrThemeRandomise();
	scrCreateBasePlatforms(lastSides < global.SIDES);
	if (lastSides > 0) {
		scrMessageRandom(lastSides < global.SIDES ? global.MESSAGES_UP : global.MESSAGES_DOWN, false);
	}
	lastSides = global.SIDES;
}

zoom = zoom + (zoomTo - zoom) / 100;
if (instance_exists(objPlayer)) {
	zoomTo = (max(objPlayer.dist*1.3, 100) / START_DISTANCE) * maxZoom;
} else {
	zoomTo = 0;
}
zoomTo = min(max(zoomTo, minZoom), maxZoom);
var vm = matrix_build_lookat(global.CENTER_X, global.CENTER_Y, -10, global.CENTER_X, global.CENTER_Y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_wport[0] * zoom, view_hport[0] * zoom, 1, 1000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

if (bounceState == 0) {
	if (bounce < 1.5) {
		bounce = lerp(bounce, 2, 0.2);	
	} else {
		bounceState = 1;
	}
} else {
	bounce = lerp(bounce, 0, 0.2);	
}