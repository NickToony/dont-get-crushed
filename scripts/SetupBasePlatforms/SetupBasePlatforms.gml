with (objBasePlatform) { instance_destroy(); }

for (var i = 0; i < global.SIDES; i ++) {
	var instance = instance_create_layer(0, 0, global.LAYER_PLATFORMS, objBasePlatform);
	instance.side = i;
}