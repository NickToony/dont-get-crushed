var ran = argument0;

enum MODES {
	NORMAL,
	FAST,
	SLOW
}

if (!ran) {
	global.DROP_RATE = 1.5;
	global.DROP_SPEED = 2;	
	lastMode = MODES.NORMAL;
} else {
	var mode = MODES.NORMAL;
	if (lastMode != MODES.NORMAL) {
		global.DROP_RATE = 1.5;
		global.DROP_SPEED = 2;
		mode = MODES.NORMAL;
	} else {
		switch (choose(1, 2)) {
			case 1:
			global.DROP_RATE = 1;
			global.DROP_SPEED = 2;
			mode = MODES.FAST;
			break;
		
			case 2:
			global.DROP_RATE = 1.5;
			global.DROP_SPEED = 1.5;
			mode = MODES.SLOW;
			break;
		}
	}
	
	if (lastMode != mode) {
		switch(mode) {
			case MODES.NORMAL:
			AddMessage("back to normal", false);
			break;
			
			case MODES.FAST:
			AddMessage(choose(
				"Let's increase the spawn rate",
				"Higher spawn rate!"
			), false);
			break;
			
			case MODES.SLOW:
			AddMessage(choose(
				"Sloooooow dooooown...",
				"Time to go a bit slower",
				"SLOW!",
				"slow and steady"
			), false);
			break;
		}
		
		lastMode = mode;
	}
}

RandomiseTheme();