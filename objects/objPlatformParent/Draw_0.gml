if (destroy) {
	destroyCount += 1;
	if (destroyCount > 15) { instance_destroy(); };
}

if (MINIMAL) {
	image_blend = global.THEME;
} else {
	image_blend = merge_color(image_blend, global.THEME, 0.1);
}

// Calclate flat position
var playOffset = 0;
var playArea = room_width - (2*playOffset);
	
targetXScale = (playArea / (global.SIDES)) / spriteWidth;
targetYScale = (dist / START_DISTANCE)
	
if (created) {
	image_xscale = lerp(image_xscale, targetXScale, 0.1);
	image_yscale = lerp(image_yscale, targetYScale, 0.1);
} else {
	image_xscale = targetXScale;
	image_yscale = targetYScale;
}
	
if (destroy) {
	image_xscale = lerp(image_xscale, 0, 0.1);	
}
image_yscale = 0.2;
	
var targetX = playOffset + ((playArea / (global.SIDES)) * min(side, global.SIDES-1)) + (sprite_width/2);
var targetY = room_height - dist;
	
if (created) {
	x = lerp(x, targetX, 0.1);
	y = lerp(y, targetY, 0.1);
} else {
	x = targetX;
	y = targetY;
}

// Only draw flat if mode is right
if (global.MODE == MODE_FLAT) {
	draw_self();
} else {
	var angle = (360 / global.SIDES);
	if (lastSides != global.SIDES) {
		// Cosine rule
		var asquared = (sqr(START_DISTANCE) + sqr(START_DISTANCE)) - (2 * (START_DISTANCE) * (START_DISTANCE) * dcos(angle));
		sideLength = sqrt(asquared);
	
		// Pythag
		var distSquared = sqr(START_DISTANCE) - sqr(sideLength/2);
		initialDist = sqrt(distSquared);	
		
		lastSides = global.SIDES;
	}
	var offset =  8 + sprite_height/2;
	
	if (destroy) {
		drawScaleX = lerp(drawScaleX, 0, 0.3);	
		drawScaleY = lerp(drawScaleY, 0, 0.1);	
	} else {
		drawScaleX = lerp(drawScaleX, sideLength * (dist / initialDist) / spriteWidth, 0.2);
		drawScaleY = lerp(drawScaleY, (dist / initialDist) * 1.5, 0.2);
	}
	
	//drawScaleY = 0.2;
	
	var targetAngle = (angle * ((global.SIDES - 1) - side )) - 90;
	drawAngle -= angle_difference(drawAngle, targetAngle) * 0.1;
	var actualAngle = drawAngle + global.ROTATE;
	var xx = global.CENTER_X + lengthdir_x(dist, actualAngle);
	var yy = global.CENTER_Y + lengthdir_y(dist, actualAngle);
	draw_sprite_ext(sprite_index, image_index, xx, yy, drawScaleX, drawScaleY, actualAngle + 90, image_blend, image_alpha);
}

created = true;