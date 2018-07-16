if (!global.PAUSED) {
	scoreCounter -= 1;
	if (scoreCounter <= 0) {
		scoreCounter = room_speed;
		score ++;
	}
}

if (keyboard_check_pressed(ord("M"))) {
	music = !music;
	event_user(0);
}