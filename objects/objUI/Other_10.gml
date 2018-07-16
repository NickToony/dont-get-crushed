if (music) {
	if (!audio_is_playing(sndMusic1))
		audio_play_sound(sndMusic1, 10, true);
} else {
	audio_stop_all();
}