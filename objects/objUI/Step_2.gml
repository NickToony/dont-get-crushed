if (browser_width != width || browser_height != height || window_get_fullscreen() != fullscreen) {
	fullscreen = window_get_fullscreen();
	if (!fullscreen) {
	    width = browser_width;
	    height = browser_height;
	} else {
		width = window_get_width();
		height = window_get_height();
	}
    canvas_fullscreen(width, width, height);
}
