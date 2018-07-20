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

global.MESSAGES_FAIL = MessagesFail();
global.MESSAGES_START = MessagesStart();
global.MESSAGES_UP = MessagesLevelUp();
global.MESSAGES_DOWN = MessagesLevelDown();

global.MENU = MENU.ACTIVE;

// Fix scaling
base_size = browser_width;
width = browser_width;
height = browser_height;
fullscreen = false;
fullscreenLast = fullscreen;
canvas_fullscreen(base_size, width, height);
