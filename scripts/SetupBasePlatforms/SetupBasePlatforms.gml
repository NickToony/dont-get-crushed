if (instance_number(objBasePlatform) == 0) {
	for (var i = 0; i < global.SIDES; i ++) {
		var instance = instance_create_layer(0, 0, global.LAYER_PLATFORMS, objBasePlatform);
		instance.side = i;
	}
} else {
	if (argument0) {
		with (objBasePlatform) {
			// Find all final sides
			if (side == global.SIDES - 2) {
				var instance = instance_create_layer(x, y, global.LAYER_PLATFORMS, objBasePlatform);
				instance.side = side + 1;
				instance.dist = dist;
				//instance.drawScaleX = drawScaleX;
				instance.drawScaleY = drawScaleY * 0.8;
				instance.drawAngle = drawAngle;
			}
		}
	}


}