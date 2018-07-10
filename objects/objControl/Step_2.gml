if (keyboard_check_pressed(vk_down)) {
	global.SIDES -= 1;
	RandomiseTheme();
}
if (keyboard_check_pressed(vk_up)) {
	global.SIDES += 1;
	with (objPlatform) {
		// Find all final sides
		if (side == global.SIDES - 2) {
			var instance = instance_create_layer(x, y, global.LAYER_PLATFORMS, objPlatform);
			instance.side = side + 1;
			instance.row = row;
			instance.dist = dist;
			instance.image_xscale = image_xscale*1.2;
			instance.image_yscale = 0;
			instance.image_angle = image_angle;
			instance.image_blend = image_blend;
		}
	}
	RandomiseTheme();
}
global.SIDES = clamp(global.SIDES, MIN_SIDES, MAX_SIDES);

if (keyboard_check(vk_left)) global.ROTATE += 2;
if (keyboard_check(vk_right)) global.ROTATE -= 2;