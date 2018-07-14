var onFloor = place_meeting(x, y + global.DROP_SPEED*2, objPlatformParent);

if (moveLeft && !moveRight && hspd > -moveSpeed) {
	if (onFloor) {
		hspd = min(hspd - accl, 0);
	} else {
		hspd -= accl;
	}
} else if (moveRight && !moveLeft && hspd < moveSpeed) {
	if (onFloor) {
		hspd = max(hspd + accl, 0);
	} else {
		hspd += accl;
	}
} else {
	if (hspd == 0) {
		// do nothing
	} else if (abs(hspd) < accl) {
		hspd = 0;
	} else if (hspd > 0) {
		hspd -= accl;
	} else if (hspd < 0) {
		hspd += accl;
	}
}
// Gravity
if (onFloor) {
	vspd += global.DROP_SPEED;
} else {
	vspd += grav;
}

if (jumpPressed && canJump && onFloor) {
	vspd = -jumpSpeed;
	jumping = true;
	onFloor = false;
	//canJump = false;
	//alarm[0] = jumpDelay;
} else if (jumpReleased && jumping) {
	vspd *= 0.7;
	jumping = false;
}

// Sprite facing
if (hspd > 0) {
	image_xscale = 1;
} else if (hspd < 0) {
	image_xscale = -1;
}
 
//Horizontal Collision
if (place_meeting(x + hspd, y, objPlatformParent)) {
	while (!place_meeting(x + sign(hspd), y, objPlatformParent)) {
		x += sign(hspd);
	}
	hspd = 0;
}
x += hspd;
 
//Vertical Collision
// Check head
var count = 0;
while (instance_place(x, y, objPlatformParent)) {
	count += 1;
	y += 1;
}

if (count > global.DROP_SPEED * 2) {
	game_restart();	
} else if (count > 0) {
	y += global.DROP_SPEED;
	jumping = false;
	vspd = global.DROP_SPEED;
}

if (instance_place(x, y + vspd, objPlatformParent)) {
	while(!place_meeting(x,y + sign(vspd), objPlatformParent)) {
	    y += sign(vspd);
	}
	vspd = 0;
}
y += vspd;
