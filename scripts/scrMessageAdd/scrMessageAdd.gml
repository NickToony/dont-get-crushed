if (argument1) {
	objUI.message = noone;	
	ds_queue_clear(objUI.messages);
}
ds_queue_enqueue(objUI.messages, argument0);