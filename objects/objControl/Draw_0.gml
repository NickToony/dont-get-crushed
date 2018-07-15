if (MINIMAL) {
	image_blend = global.THEME;
} else {
	image_blend = merge_color(image_blend, global.THEME, 0.1);
}

image_alpha = 0.3;
image_angle -= angle_difference(image_angle, targetRotation) * 0.02;
global.ROTATE = image_angle;

var skip = true;
for (var i = 0; i < global.SIDES; i ++) {
	skip = !skip;
	if (skip) continue;
	
	var angle = (360 / (global.SIDES));
	var rotate = global.ROTATE + (angle * i);
	
	draw_primitive_begin(pr_trianglelist);
	draw_vertex_color(global.CENTER_X, global.CENTER_Y, image_blend, image_alpha);
	draw_vertex_color(
		global.CENTER_X + lengthdir_x(START_DISTANCE, rotate - (angle/2)), 
		global.CENTER_Y + lengthdir_y(START_DISTANCE, rotate - (angle/2)), 
		image_blend, image_alpha);
	draw_vertex_color(
		global.CENTER_X + lengthdir_x(START_DISTANCE, rotate + (angle/2)), 
		global.CENTER_Y + lengthdir_y(START_DISTANCE, rotate + (angle/2)), 
		image_blend, image_alpha);
	draw_primitive_end();
}