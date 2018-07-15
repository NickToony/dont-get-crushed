if (global.MODE == MODE_FLAT) {
	draw_self();	
}

var w = (room_width-x) / room_width;
var side = w * global.SIDES;
var segment = (360 / global.SIDES);
myAngle = (w * 360) - 90 - (segment/2);
dist = (room_height-y);
//var realAngle = side * (360 / global.SIDES);


var offset = 0;
if (dist < 300) {
	offset = (((300-dist)) / 300) * 10;
} else {
	offset = -((dist / SCALE_DISTANCE) * 20);
}
var xx = global.CENTER_X + lengthdir_x(dist - offset, myAngle+ global.ROTATE);
var yy = global.CENTER_Y + lengthdir_y(dist - offset, myAngle+ global.ROTATE);
var scale = (dist / SCALE_DISTANCE) * 2;
image_yscale = max(0.5, scale);
image_yscale = 0.5;
	
if (global.MODE == MODE_SPIRAL) {
	draw_sprite_ext(sprite_index, image_index, xx, yy, scale, scale, myAngle + 90+ global.ROTATE, image_blend, image_alpha);
}

if (dist < MIN_DISTANCE - 10) {
	RandomMessage(global.MESSAGES_FAIL);
	room_restart();	
}
