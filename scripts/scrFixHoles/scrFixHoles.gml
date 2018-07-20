if (argument0) {
	var nearestRow = -1;
	with (objPlayer) {
		nearestRow = instance_nearest(x, y, objFallingPlatform);
		if (nearestRow) {
			nearestRow = nearestRow.row;
		}
	}
	
	with (objFallingPlatform) {
		// Find all final sides
		if (side == 0 && row != nearestRow) {
			var instance = instance_create_layer(x, y, global.LAYER_PLATFORMS, objFallingPlatform);
			instance.side = global.SIDES - 1;
			instance.row = row;
			instance.dist = dist;
			instance.image_xscale = image_xscale*1.2;
			instance.image_yscale = 0;
			instance.image_angle = image_angle;
			instance.image_blend = image_blend;
			instance.created = true;
			show_debug_message("Inserted a platform: " + string(row));
		}
	}
}
	
{
	var map = ds_map_create();
	with (objFallingPlatform) {
		if (side < global.SIDES) {
			if (ds_map_exists(map, row)) {
				ds_map_set(map, row, ds_map_find_value(map, row) + 1);
			} else {
				ds_map_set(map, row, 1);
			}
		}
	}
	
	var current = ds_map_find_first(map);
	while (!is_undefined(current)) {
		var count = ds_map_find_value(map, current);
		show_debug_message("Plat count: " + string(count));
		while (count >= global.SIDES) {
			with (objFallingPlatform) {
				if (row == current) {
					instance_destroy();
					count -= 1;
					break;
				}
			}
		}
		current = ds_map_find_next(map, current);
	}
	ds_map_destroy(map);
}