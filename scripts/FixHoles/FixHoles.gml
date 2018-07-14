with (objFallingPlatform) {
	// Find all final sides
	if (side == global.SIDES - 2) {
		var instance = instance_create_layer(x, y, global.LAYER_PLATFORMS, objFallingPlatform);
		instance.side = side + 1;
		instance.row = row;
		instance.dist = dist;
		instance.image_xscale = image_xscale*1.2;
		instance.image_yscale = 0;
		instance.image_angle = image_angle;
		instance.image_blend = image_blend;
		instance.created = true;
	}
}

