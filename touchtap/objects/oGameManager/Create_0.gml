/// @description 초기화
global.stage = 0
mode = -1

layer_id = layer_get_id("Background")
background_id = layer_background_get_id(layer_id)
size = [room_width, room_height]
x = size[0] * 0.5
y = size[1] * 0.5
//image_xscale = size[0]
//image_yscale = size[1]

global.player = instance_create_layer(x, y, "Instances", oPlayer)
score = 0
lives = 3
combo = 0

intersects = array_create(4, 0)
intersect = function(angle) constructor {
	ihorizontal = lengthdir_x(1, angle)
	ivertical = lengthdir_y(1, angle)
	itangent = ivertical / ihorizontal
	x = other.x + min(abs(-1 / itangent), 1) * sign(ihorizontal) * other.size[0]
	y = other.y + min(abs(itangent), 1) * sign(ivertical) * other.size[1]
	direction = angle
}

for (var i = 0; i < 4; ++i) {
	intersects[i] = new intersect(i * 90)
}

// 큐: [노드, 다음 대기 시간]
node_queue = ds_queue_create()
node_time = -1
node = function(nx, ny, ndirection) constructor {
	x = nx
	y = ny
	direction = ndirection
}

node_queue_add = function(nangle_index, time_wait) {
	var nx = intersects[nangle_index].x
	var ny = intersects[nangle_index].y
	var nd = (intersects[nangle_index].direction + 180) mod 360
	ds_queue_enqueue(node_queue, [new node(nx, ny, nd), time_wait])
}

node_place = function(nnode) {
	with instance_create(oNode, nnode.x, nnode.y, "Instances") {
		direction = nnode.direction
		speed = 16 / seconds(1)
		return id
	}
}

// 서피스 생성
event_user(0)
event_user(1)

//
event_user(2)
event_user(3)

//
event_user(4)
