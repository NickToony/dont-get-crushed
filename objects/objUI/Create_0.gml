#macro DELAY_LETTER 2
#macro DELAY_PAUSE room_speed*2

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

global.MESSAGES_FAIL = MessagesFail();
global.MESSAGES_START = MessagesStart();
global.MESSAGES_UP = MessagesLevelUp();
global.MESSAGES_DOWN = MessagesLevelDown();