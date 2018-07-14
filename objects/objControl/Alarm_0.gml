alarm[0] = room_speed * global.DROP_RATE;

var angle = 0;
var instances = ds_list_create();
for (var i = 0; i < global.SIDES; i ++) {
	var instance = instance_create_layer(0, 0, global.LAYER_PLATFORMS, objFallingPlatform);
	instance.side = i
	instance.row = currentRow;
	ds_list_add(instances, instance.id);
}

var removePlatforms = choose (1, 2);
while (removePlatforms > 0) {
	// Shuffle the list
	ds_list_shuffle(instances);
	// Grab the instance and delete it
	with (ds_list_find_value(instances, 0)) { instance_destroy(); };
	ds_list_delete(instances, 0)
	removePlatforms -= 1;
}
ds_list_destroy(instances);

currentRow += 1;