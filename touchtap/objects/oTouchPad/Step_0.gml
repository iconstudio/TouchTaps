if mode == game_mode.ready {
	
} else if mode == game_mode.playing {
	if 0 < touch_time {
		touch_time--
	} else if 1 < lives {
		lives--
		touch_time = touch_period
	} else {
	
	}
} else {
	
}
