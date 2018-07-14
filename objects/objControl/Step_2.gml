var changed = false;
if (keyboard_check_pressed(vk_down)) {
	global.SIDES -= 1;
	changed = true;
}
if (keyboard_check_pressed(vk_up)) {
	global.SIDES += 1;
	changed = true;
}
if (changed) {
	global.SIDES = clamp(global.SIDES, MIN_SIDES, MAX_SIDES);
	FixHoles();
	RandomiseTheme();
	SetupBasePlatforms();
}

if (keyboard_check_pressed(ord("M"))) {
	global.MODE = (global.MODE == MODE_FLAT) ? MODE_SPIRAL : MODE_FLAT;
}

if (keyboard_check(vk_left)) global.ROTATE += 2;
if (keyboard_check(vk_right)) global.ROTATE -= 2;