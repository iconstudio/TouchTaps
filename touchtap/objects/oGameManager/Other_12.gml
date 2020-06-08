/// @description 게임 모드 선언
state_intro = new (function() constructor {
	time = 0
	period = seconds(2)

	static construct = function() {
		other.color.set_period(1)
		other.change_color()
	}

	static run = function() {
		if time < period {
			time++
		} else {
			other.mode_change(other.state_main)
		}
	}

	static draw = function() {
		var time_ratio = time / period * 3
		draw_sprite_ext(sLogo, 0, other.size[0] * 0.5, other.size[1] * 0.5, 1, 1, 0, $ffffff, time_ratio)
	}

	static destruct = function() {
		time = 0
	}
})()

state_main = new (function() constructor {
	time = 0
	period = seconds(2)

	static construct = function() {
		other.color.set_period(other.color_periods[0])
	}

	static run = function() {
		if io_check_ok() or mouse_check_button_pressed(mb_left) {
			other.mode_change(other.state_ready)
		}
	}

	static draw = function() {
		other.draw_title()
		other.draw_starter()
	}

	static destruct = function() {
		time = 0
	}
})()

state_ready = new (function() constructor {
	time = 0
	period = seconds(2)
	counter = 0
	counter_max = 3
	counter_time = 0
	counter_period = seconds(1)

	static construct = function() {
		other.color.set_period(other.color_periods[0])
	}

	static run = function() {
		if counter_time < counter_period {
			counter_time++
		} else {
			if counter++ < counter_max {
				counter_time = 0
				other.change_color()
				other.mode_change(other.state_ready)
			} else {
				counter_time = 0
				counter = 0
				other.change_color()
			}
		}
	}

	static draw = function() {
		draw_set_font(fontGame)
		draw_set_halign(1)
		draw_set_valign(1)

		if counter < counter_max {
			
		} else {
			
		}
	}

	static destruct = function() {
		
	}
})()

state_play = new (function() constructor {
	hp = 1
	time = 0
	period = 0
	touch_time = 0
	touch_period = 1
	touch_period_max = seconds(0.5)

	static construct = function() {
		other.player.stop = false
	}

	static run = function() {
		touch_precedure = function() {
			other.change_color()
		}
		
		if 0 < touch_time {
			touch_time--
		} else if 1 < other.player.hp {
			other.player.hp--
			touch_time = touch_period
		} else {
	
		}

		if io_check_ok() or mouse_check_button_pressed(mb_left) {
			touch_precedure()
		}
	}

	static draw = function() {
		draw_set_font(fontGame)
		draw_set_halign(1)
		draw_set_valign(1)

		gpu_set_blendmode_ext(bm_inv_dest_color,bm_inv_src_color)
		draw_text(other.size[0] * 0.5, other.size[1] * 0.4, lives)
		draw_text(other.size[0] * 0.5, other.size[1] * 0.5, score)
		draw_text(other.size[0] * 0.5, other.size[1] * 0.6, combo)
		gpu_set_blendmode(bm_normal)
	}

	static destruct = function() {
		other.player.stop = true
	}
})()

state_over = new (function() constructor {
	time = 0
	period = 0

	static construct = function() {
		
	}

	static run = function() {
		
	}

	static draw = function() {
		
	}

	static destruct = function() {
		
	}
})()
