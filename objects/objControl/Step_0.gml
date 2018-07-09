if (keyboard_check_pressed(vk_down)) {
	global.SIDES -= 1;
}
if (keyboard_check_pressed(vk_up)) {
	global.SIDES += 1;	
}
global.SIDES = clamp(global.SIDES, MIN_SIDES, MAX_SIDES);