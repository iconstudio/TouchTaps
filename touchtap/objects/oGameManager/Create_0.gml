/// @description 초기화
background = {
	element_id: layer_background_get_id(layer_get_id("Background")),

	change_color: function() {
		layer_background_blend(element_id, color_get_random())
	}
}


player = {
	hp: 3,
	stars: 0,
	combo: 0
}

state_ready = new (function() constructor {
	time = 0
	period = seconds(2)

	static construct = function() {
		other.background.change_color()
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

		if mouse_check_button_pressed(mb_left) or (global.debug and keyboard_check_pressed(vk_space)) {
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
mode_change(state_ready)

size = [room_width, room_height]
image_xscale = size[0]
image_yscale = size[1]
