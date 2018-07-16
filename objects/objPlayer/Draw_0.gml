if (global.MODE == MODE_FLAT) {
	draw_self();	
}

var w = (room_width-x) / room_width;
var side = floor(w * global.SIDES);
var segmentAngle = (360 / global.SIDES);
myAngle = (w * 360) - 90 - (segmentAngle/2);
dist = (room_height-y);

////var segmentIndex = 0;
////var an = 0;
////while (an < myAngle) {
////	segmentIndex += 1;
////	an += segmentAngle;
////}

//myAngle = (side * segmentAngle) - 90;
var segmentDir = (side * segmentAngle) - 90;
var segmentWidth = (room_width / (global.SIDES));
var percent = abs((x) mod segmentWidth) / segmentWidth;

if (lastSides != global.SIDES) {
	// Cosine rule
	var asquared = (sqr(START_DISTANCE) + sqr(START_DISTANCE)) - (2 * (START_DISTANCE) * (START_DISTANCE) * dcos(segmentAngle));
	sideLength = sqrt(asquared);
	
	// Pythag
	var distSquared = sqr(START_DISTANCE) - sqr(sideLength/2);
	initialDist = sqrt(distSquared);	
		
	lastSides = global.SIDES;
}

var radialWidth = sideLength * (dist / initialDist);

var offset = (dist / START_DISTANCE) * 32;
var xx = global.CENTER_X + lengthdir_x(dist + offset, segmentDir + global.ROTATE);
var yy = global.CENTER_Y + lengthdir_y(dist + offset, segmentDir + global.ROTATE);

xx += lengthdir_x( (percent * radialWidth) - radialWidth/2, segmentDir + global.ROTATE - 90);
yy += lengthdir_y( (percent * radialWidth) - radialWidth/2, segmentDir + global.ROTATE - 90);

var scale = min(1, (dist / SCALE_DISTANCE) * 2);
//image_yscale = max(0.5, scale);
image_yscale = 0.5;
	
if (global.MODE == MODE_SPIRAL) {
	draw_sprite_ext(sprite_index, image_index, xx, yy, scale, scale, segmentDir + 90 + global.ROTATE, image_blend, image_alpha);
}

if (dist < MIN_DISTANCE - 10) {
	RandomMessage(global.MESSAGES_FAIL, true);
	instance_destroy();
}