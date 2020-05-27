/// @description 초기화
global.stage = 0

color_method = make_color_hsv
color_periods = [seconds(1), seconds(0.75), seconds(0.5), seconds(0.25), seconds(0.1)]
color = new (function() constructor {
	period = other.color_periods[0]
	time = period
	hue = 0
	sat = 0
	val = 0
	hue_begin = 0
	sat_begin = 0
	val_begin = 0
	hue_target = 0
	sat_target = 0
	val_target = 0

	run = function() {
		var gradient_ratio = time / period
		if time++ < period {
			hue = lerp(hue_begin, hue_target, gradient_ratio)
			sat = lerp(sat_begin, sat_target, gradient_ratio)
			val = lerp(val_begin, val_target, gradient_ratio)
			return true
		} else {
			hue = hue_target
			sat = sat_target
			val = val_target
			return false
		}
	}

	set = function(hue_new, sat_new, val_new) {
		time = 0
		hue_begin = hue
		sat_begin = sat
		val_begin = val
		hue_target = hue_new
		sat_target = sat_new
		val_target = val_new
	}

	set_immediately = function(hue_new, sat_new, val_new) {
		time = period
		hue = hue_new
		sat = sat_new
		val = val_new
		hue_begin = hue
		sat_begin = sat
		val_begin = val
		hue_target = hue
		sat_target = sat
		val_target = hue
	}

	set_period = function(times) {
		period = times
	}
})()

function change_color() {
	color.set(irandom(255), irandom(255), irandom(255))
	image_blend = color_method(color.hue, color.sat, color.val)
}

// ** 즉시 색상 변경 **
function change_color_immediately() {
	color.set_immediately(irandom(255), 63 + irandom(192), 128 + irandom(127))
	image_blend = color_method(color.hue, color.sat, color.val)
}

player = {
	hp: 3,
	stars: 0,
	combo: 0
}

state_main = new (function() constructor {
	time = 0
	period = seconds(2)

	static construct = function() {
		other.change_color_immediately()
		other.change_color()
	}

	static run = function() {
		if io_check_ok() or mouse_check_button_pressed(mb_left) {
			with other
				mode_change(state_ready)
		}
	}

	static draw = function() {
		draw_set_font(fontMainTitle)
		draw_set_halign(1)
		draw_set_valign(1)

		gpu_set_blendmode_ext(bm_inv_dest_color,bm_inv_src_color)
		draw_text(other.size[0] * 0.5, other.size[1] * 0.3333, "TAPPYSTRY")
		gpu_set_blendmode(bm_normal)

		draw_set_font(fontMain)
		draw_text(other.size[0] * 0.5, other.size[1] * 0.8, "TAP TO START")
	}

	static destruct = function() {
		time = 0
	}
})()

state_ready = new (function() constructor {
	time = 0
	period = seconds(2)

	static construct = function() {
		other.change_color_immediately()
	}

	static run = function() {

	}

	static draw = function() {
		draw_set_font(fontMainTitle)
		draw_set_halign(1)
		draw_set_valign(1)

		draw_text(other.size[0] * 0.5, other.size[1] * 0.3333, "TAPPYSTRY")
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
		
	}

	static run = function() {
		touch_precedure = function() {
			other.color_change()
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
		draw_text(other.size[0] * 0.5, other.size[1] * 0.4, player.hp)
		draw_text(other.size[0] * 0.5, other.size[1] * 0.5, player.stars)
		draw_text(other.size[0] * 0.5, other.size[1] * 0.6, player.combo)
		gpu_set_blendmode(bm_normal)
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

	static draw = function() {
		
	}

	static destruct = function() {
		
	}
})()

// ** 게임 상태 변경 **
mode = -1
mode_change = function(Mode) {
	if mode != Mode {
		if struct_exists(mode)
			mode.destruct()
		mode = Mode
		mode.construct()
	}
}
mode_change(state_main)

size = [room_width, room_height]
image_xscale = size[0]
image_yscale = size[1]
