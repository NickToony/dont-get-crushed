#region Destroy
if (destroy) {
	destroyCount += 1;
	image_xscale = lerp(image_xscale, 0, 0.1);
	if (destroyCount > 15) { instance_destroy(); };
}
#endregion

#region Colour management
if (MINIMAL) {
	image_blend = global.THEME;
} else {
	image_blend = merge_color(image_blend, global.THEME, 0.1);
}
#endregion

#region Real Position

// Calclate flat position
var targetXScale = (room_width / (global.SIDES)) / spriteWidth;
var targetYScale = (dist / SCALE_DISTANCE)
	
image_xscale = lerp(image_xscale, targetXScale, created ? 0.1 : 1);
image_yscale = lerp(image_yscale, targetYScale, created ? 0.1 : 1);
// Override
image_yscale = max(0.2, image_yscale);
	
var targetX = ((room_width / (global.SIDES)) * min(side, global.SIDES-1)) + (sprite_width/2);
var targetY = room_height - dist;
	
x = lerp(x, targetX, created ? 0.1 : 1);
y = lerp(y, targetY, created ? 0.1 : 1);

#endregion

// Only draw flat if mode is right
if (global.MODE == RENDER_MODE.FLAT) {
	draw_self();
} else {
	var angle = (360 / global.SIDES);
	//if (lastSides != global.SIDES) {
	//	// Cosine rule
	//	var asquared = (sqr(START_DISTANCE) + sqr(START_DISTANCE)) - (2 * (START_DISTANCE) * (START_DISTANCE) * dcos(angle));
	//	sideLength = sqrt(asquared);
	
	//	// Pythag
	//	var distSquared = sqr(START_DISTANCE) - sqr(sideLength/2);
	//	initialDist = sqrt(distSquared);	
		
	//	lastSides = global.SIDES;
	//}
	
	var asquared = (sqr(dist) + sqr(dist)) - (2 * (dist) * (dist) * dcos(angle));
	var sideLength = sqrt(asquared);
	
	var distSquared = sqr(dist) - sqr(sideLength/2);
	var vertexDist = sqrt(distSquared);	
	
	if (destroy) {
		drawScaleX = lerp(drawScaleX, 0, 0.3);	
		drawScaleY = lerp(drawScaleY, 0, 0.1);
	} else {
		//drawScaleX = lerp(drawScaleX, sideLength / spriteWidth, 0.2);
		//drawScaleY = lerp(drawScaleY, image_yscale/4, 0.2);
		drawScaleX = sideLength / spriteWidth;
		//drawScaleY = image_yscale;
		//lerp(drawScaleY, (dist / initialDist) * 1.5, 0.2); 
		drawScaleY = (dist / START_DISTANCE) * 1.5;
		//drawScaleY = image_yscale/2;
	}
	
	var targetAngle = (angle * ((global.SIDES - 1) - side )) - 90;
	drawAngle -= angle_difference(drawAngle, targetAngle) * 0.1;
	var actualAngle = drawAngle + global.ROTATE;
	var xx = global.CENTER_X + lengthdir_x(vertexDist + objControl.bounce, actualAngle);
	var yy = global.CENTER_Y + lengthdir_y(vertexDist + objControl.bounce, actualAngle);
	draw_sprite_ext(sprite_index, image_index, xx, yy, drawScaleX, drawScaleY, actualAngle + 90, image_blend, image_alpha);
}

created = true;