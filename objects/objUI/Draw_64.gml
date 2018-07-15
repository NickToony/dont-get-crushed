var width = display_get_gui_width();
var height = display_get_gui_height();
var hwidth = width/2;
var hheight = height/2;

if (message == noone && !ds_queue_empty(messages)) {
	message = ds_queue_dequeue(messages);
	count = 0;
	stage = MSG_STAGE.SHOWING;
	timer = 0;
}

if (message != noone) {
	draw_set_color(c_white);
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	draw_set_font(fntUI);
	
	var text = "";
	switch (stage) {
		case MSG_STAGE.SHOWING:
		if (timer <= 0) {
			if (count < string_length(message)) {
				count ++;
				timer = DELAY_LETTER;
			} else {
				stage = MSG_STAGE.PAUSING;
				timer = DELAY_PAUSE;
			}
		} else {
			timer --;	
		}
		text = string_copy(message, 0, count);
		break;
		
		case MSG_STAGE.PAUSING:
		if (timer <= 0) {
			stage = MSG_STAGE.HIDING;
			timer = 0;
		} else {
			timer --;	
		}
		text = message;
		break;
		
		case MSG_STAGE.HIDING:
		if (timer <= 0) {
			if (count > 0) {
				count --;
				timer = DELAY_LETTER;
			} else {
				message = noone;
			}
		} else {
			timer --;
		}
		text = string_copy(message, 0, count);
		break;
	}
	
	draw_text(hwidth, hheight, text);
}