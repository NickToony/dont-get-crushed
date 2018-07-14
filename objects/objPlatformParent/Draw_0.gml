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
var playOffset = 100;
var playArea = room_width - (2*playOffset);
	
targetXScale = (playArea / (global.SIDES)) / spriteWidth;
targetYScale = 0.5;
	
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
	
targetX = playOffset + ((playArea / (global.SIDES)) * min(side, global.SIDES-1)) + (sprite_width/2);
targetY = room_height - dist;
	
if (created) {
	x = lerp(x, targetX, 0.1);
	y = lerp(y, targetY, 0.1);
} else {
	created = true;
	x = targetX;
	y = targetY;
}

// Only draw flat if mode is right
if (global.MODE == MODE_FLAT) {
	draw_self();
}