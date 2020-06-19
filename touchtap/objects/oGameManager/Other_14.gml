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

intersects = array_create(4, 0)
intersect = function(angle) constructor {
	var ihorizontal = lengthdir_x(1, angle)
	var ivertical = lengthdir_y(1, angle)
	var itangent = ivertical / ihorizontal
	ix = other.x + min(abs(-1 / itangent), 1) * sign(ihorizontal) * other.size[0] * 0.5
	iy = other.y + min(abs(itangent), 1) * sign(ivertical) * other.size[1] * 0.5
	idirection = angle
}

for (var i = 0; i < 4; ++i) {
	intersects[i] = new intersect(i * 90)
}

// 큐: [노드, 다음 대기 시간]
trigger_queue = ds_queue_create()
trigger_time = -1
trigger = function(time_wait, datas) constructor {
	
}

node = function(nx, ny, ndirection) constructor {
	x = nx
	y = ny
	direction = ndirection
}

trigger_queue_add = function(nangle_index, time_wait) {
	var nx = intersects[nangle_index].ix
	var ny = intersects[nangle_index].iy
	var nd = (intersects[nangle_index].idirection + 180) mod 360
	ds_queue_enqueue(trigger_queue, [new node(nx, ny, nd), time_wait])
}

node_place = function(nnode) {
	with instance_create(oNode, nnode.ix, nnode.iy, "Instances") {
		direction = nnode.idirection
		speed = 16 / seconds(1)
		return id
	}
}

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
