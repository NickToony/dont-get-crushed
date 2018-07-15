if (global.PAUSED || objControl.levelPause > 0) return;

if (dist > SCALE_DISTANCE + 200) {
	dist -= global.DROP_SPEED * 30;
} else if (dist > SCALE_DISTANCE) {
	dist -= global.DROP_SPEED * 10;
} else if (dist > 300) {
	dist -= global.DROP_SPEED;
} else {
	dist -= global.DROP_SPEED*0.7;
}


event_inherited();

