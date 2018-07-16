event_inherited();

if (dist < MIN_DISTANCE) {
	objControl.bounceState = 0;
	instance_destroy();
}