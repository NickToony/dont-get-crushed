if (DEBUG) {
	if (keyboard_check_pressed(ord("B"))) {
		global.MODE = (global.MODE == RENDER_MODE.FLAT) ? RENDER_MODE.CIRCLE : RENDER_MODE.FLAT;
	}
	
	if (keyboard_check_pressed(ord("O"))) {
		global.SIDES -= 1;
	} else if (keyboard_check_pressed(ord("I"))) {
		global.SIDES += 1;	
	}
}
if (keyboard_check_pressed(ord("R"))) {
	if (global.MENU == MENU.ACTIVE) {
		global.MENU = MENU.INACTIVE;
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

if (bounceState == 0) {
	if (bounce < 1.5) {
		bounce = lerp(bounce, 2, 0.2);	
	} else {
		bounceState = 1;
	}
} else {
	bounce = lerp(bounce, 0, 0.2);	
}