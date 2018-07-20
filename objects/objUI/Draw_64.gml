var width = display_get_gui_width();
var height = display_get_gui_height();
var hwidth = width/2;
var hheight = height/2;

if (message == noone) {
	if (!ds_queue_empty(messages)) {
		message = ds_queue_dequeue(messages);
		count = 0;
		stage = MSG_STAGE.SHOWING;
		timer = 0;
	} else if (!instance_exists(objPlayer) && global.MENU != MENU.ACTIVE) {
		message = "Hit R to Retry!";	
		count = 0;
		stage = MSG_STAGE.PAUSING;
		timer = 99999;
	}
}

draw_set_color(c_white);
draw_set_font(fntUISmaller);

if (global.MENU != MENU.ACTIVE) {
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text(16, 16, string(score));
}

draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text(width-16, 16, "M - Music");

draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_set_font(fntUI);

if (global.MENU == MENU.ACTIVE) {
	var menuText = "Don't Get Crushed";
	var helpText = "";
	switch (stage) {
		case MSG_STAGE.SHOWING:
		if (timer <= 0) {
			if (count < string_length(menuText)) {
				count ++;
				timer = UI_DELAY_LETTER;
			} else {
				stage = MSG_STAGE.PAUSING;
				timer = UI_DELAY_PAUSE;
			}
		} else {
			timer --;	
		}
		text = string_copy(menuText, 0, count);
		break;
		
		case MSG_STAGE.PAUSING:
		text = menuText;
		helpText = "Press R to start";
		break;
	}
	draw_text(hwidth, hheight, text);
	draw_set_font(fntUISmaller);
	draw_text(hwidth, hheight + 64, helpText);
} else if (global.PAUSED && instance_exists(objPlayer)) {
	draw_text(hwidth, hheight, "Paused - Press P to unpause");
} else if (message != noone) {
	var text = "";
	switch (stage) {
		case MSG_STAGE.SHOWING:
		if (timer <= 0) {
			if (count < string_length(message)) {
				count ++;
				timer = UI_DELAY_LETTER;
			} else {
				stage = MSG_STAGE.PAUSING;
				timer = UI_DELAY_PAUSE;
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
				timer = UI_DELAY_LETTER;
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