/// @description 초기화
player = {
	lives: 3,
	combo: 0,
	score: 0,
}

state_ready = new (function() constructor {
	time = 0
	period = 0

	static construct = function() {
		
	}

	static run = function() {
		
	}

	static destruct = function() {
		
	}
})()

state_play = new (function() constructor {
	hp = 1
	time = 0
	period = 0
	touch_time = 0
	touch_period = seconds(0.3)

	static construct = function() {
		
	}

	static run = function() {
		touch_precedure = function() {
			other.color_change()
		}
		
		if 0 < touch_time {
			touch_time--
		} else if 1 < lives {
			lives--
			touch_time = touch_period
		} else {
	
		}

		if mouse_check_button_pressed(mb_left) or (global.debug and keyboard_check_pressed(vk_space)) {
			touch_precedure()
		}
	}

	function destruct() {
		
	}
})()

state_over = new (function() constructor {
	time = 0
	period = 0

	static construct = function() {
		
	}

	static run = function() {
		
	}

	static destruct = function() {
		
	}
})()

// ** 게임 상태 변경 **
mode = -1
mode_change = function(Mode) {
	if mode != Mode {
		mode.destruct()
		mode = Mode
		mode.construct()
	}
}
mode_change(state_ready)

color_change = function() {
	image_blend = color_get_random()
}

image_xscale = room_width
image_yscale = room_height

color_change()
