nextSpawn = room_speed * global.DROP_RATE;

var angle = 0;
var instances = ds_list_create();
for (var i = 0; i < global.SIDES; i ++) {
	var instance = instance_create_layer(0, 0, global.LAYER_PLATFORMS, objFallingPlatform);
	instance.side = i
	instance.row = currentRow;
	ds_list_add(instances, instance.id);
}


var removedList = ds_list_create();
var removePlatforms = 1 + irandom(floor(sqrt(global.SIDES))-1);
while (removePlatforms > 0) {
	// Shuffle the list
	ds_list_shuffle(instances);
	// Grab the instance and delete it
	var instance = ds_list_find_value(instances, 0);
	if (ds_list_find_index(lastRemoved, instance.side) == -1) {
		ds_list_add(removedList, instance.side);
		with (instance) { instance_destroy(); };
		ds_list_delete(instances, 0)
		removePlatforms -= 1;
	}
}
ds_list_destroy(instances);
ds_list_destroy(lastRemoved);
lastRemoved = removedList;

currentRow += 1;
spawnsSinceLastEvent += 1;

if (spawnsSinceLastEvent > 3 + irandom(2)) {
	global.SIDES += choose (-1, 1);
	spawnsSinceLastEvent = 0;
	levelPause = room_speed;
	nextSpawn += room_speed;
}

if (global.DROP_POSITION < START_DISTANCE) {
	global.DROP_POSITION += 125;
}