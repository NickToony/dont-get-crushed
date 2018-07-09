if (global.SIDES != lastSides) {
	angle = (360 / global.SIDES);
	targetAngle = angle * side;
	
	// Cosine rule
	var asquared = (sqr(START_DISTANCE) + sqr(START_DISTANCE)) - (2 * (START_DISTANCE) * (START_DISTANCE) * dcos(angle));
	sideLength = sqrt(asquared) + 28;
	
	// Pythag
	var distSquared = sqr(START_DISTANCE) - sqr(sideLength/2);
	initialDist = sqrt(distSquared);
	
	// Set the initial dist
	if (dist <= 0) {
		dist = initialDist;
		image_angle = targetAngle;
		x = global.CENTER_X + lengthdir_x(dist, targetAngle);
		y = global.CENTER_Y + lengthdir_y(dist, targetAngle);
		image_xscale = dist / initialDist;
		image_yscale = sideLength * (dist / initialDist) / spriteWidth;
	}
	
	if (side >= global.SIDES) {
		instance_destroy();
	}
	
	lastSides = global.SIDES;
}

targetX = global.CENTER_X + lengthdir_x(dist, targetAngle);
targetY = global.CENTER_Y + lengthdir_y(dist, targetAngle);
dist = lerp(0, point_distance(targetX, targetY, global.CENTER_X, global.CENTER_Y), 0.99);
dir = point_direction(targetX, targetY, global.CENTER_X, global.CENTER_Y);
x = lerp(x, targetX, 0.1);
y = lerp(y, targetY, 0.1);

image_xscale = lerp(image_xscale, dist / initialDist, 0.1);
image_yscale = lerp(image_yscale, sideLength * (dist / initialDist) / spriteWidth, 0.1);
image_angle = lerp(image_angle, targetAngle, 0.1);

if (dist < MIN_DISTANCE) {
	instance_destroy();
}