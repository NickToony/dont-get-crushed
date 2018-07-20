#macro DELAY_LETTER 2
#macro DELAY_PAUSE room_speed*2

if (instance_number(objUI) > 1) {
	instance_destroy();
	return;
}

enum MENU {
	ACTIVE,
	FIRST_PLAY,
	INACTIVE
}

enum MSG_STAGE {
	SHOWING,
	PAUSING,
	HIDING
}

messages = ds_queue_create();
message = noone;
count = 0;
timer = 0;
stage = MSG_STAGE.SHOWING;
musicLast = noone;
score = 0;
scoreCounter = room_speed;
music = true;

global.MESSAGES_FAIL = srcInitFailMessages();
global.MESSAGES_START = scrInitStartMessages();
global.MESSAGES_UP = scrInitAddPlatMessages();
global.MESSAGES_DOWN = scrInitRemovePlatMessages();

global.MENU = MENU.ACTIVE;

// Fix scaling
base_size = browser_width;
width = browser_width;
height = browser_height;
fullscreen = false;
fullscreenLast = fullscreen;
scrResizeScreen(base_size, width, height);

