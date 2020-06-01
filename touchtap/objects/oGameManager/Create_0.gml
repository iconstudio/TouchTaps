/// @description 초기화
global.stage = 0
player = new (function() constructor {
	hp_max_default = 3
	hp = hp_max_default
	stars = 0
	combo = 0

	static ready = function() {
		hp = hp_max_default
		stars = 0
		combo = 0
	}

	static die = function() {
		
	}
})()

event_user(2)
event_user(3)

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

// 서피스 생성
event_user(0)
event_user(1)

draw_title = function(x, y) {
	if !surface_exists(surface_title)
		event_user(0)

	if surface_exists(surface_title) {
		gpu_set_blendmode_ext(bm_inv_dest_color,bm_inv_src_color)
		var dx = 0
		var dy = 0
		if 1 <= argument_count {
			dx = x
			if 2 == argument_count {
				dy = y
			}
		}
		draw_surface(surface_title, dx, dy)
		gpu_set_blendmode(bm_normal)
	}
}

draw_starter = function() {
	if !surface_exists(surface_starter)
		event_user(1)

	if surface_exists(surface_title) {
		draw_surface(surface_starter, 0, 0)
	}
}
