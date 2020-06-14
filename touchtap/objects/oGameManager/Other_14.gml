/// @description 유틸리티 함수 선언
// ** 게임 상태 변경 **
mode_change = function(Mode) {
	if mode != Mode {
		if struct_exists(mode)
			mode.destruct()
		mode = Mode
		mode.construct()
	}
}
mode_change(state_intro)

draw_title = function() {
	if !surface_exists(surface_title)
		event_user(0)

	if surface_exists(surface_title) {
		gpu_set_blendmode_ext(bm_inv_dest_color,bm_inv_src_color)
		var dx = 0, dy = 0
		/*
		if 1 <= argument_count {
			dx = sx
			if 2 == argument_count {
				dy = sy
			}
		}
		*/
		draw_surface(surface_title, dx, dy)
		gpu_set_blendmode(bm_normal)
	}
}

draw_starter = function() {
	if !surface_exists(surface_starter)
		event_user(1)

	if surface_exists(surface_starter) {
		draw_surface(surface_starter, 0, 0)
	}
}