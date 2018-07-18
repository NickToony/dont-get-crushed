if (global.MODE == MODE_FLAT) {
	draw_self();	
}

var w = (room_width-x) / room_width;
var segmentWidth = (room_width / (global.SIDES));
var side = 0;
var xxx = 0;
while (xxx + segmentWidth < x) {
	side += 1;
	xxx += segmentWidth;
}
var diff = x - xxx;
side = (global.SIDES-1) - side;

var segmentAngle = (360 / global.SIDES);
dist = (room_height-y);
var segmentDir = (side * segmentAngle) - 90;
var percent = diff / segmentWidth;

// Needed for camera
myAngle = (w * 360) - 90 - (segmentAngle/2); 

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
	repeat (DEATH_COUNT) {
		instance_create_layer(xPrev, yPrev, global.LAYER_PLATFORMS, objDeath);	
	}
	audio_play_sound(sndLose, 100, false);
	instance_destroy();
}

xPrev = xx;
yPrev = yy;