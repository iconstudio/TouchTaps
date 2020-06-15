/// @description 초기화
global.stage = 0
mode = -1

layer_id = layer_get_id("Background")
background_id = layer_background_get_id(layer_id)
size = [room_width, room_height]
//image_xscale = size[0]
//image_yscale = size[1]

global.player = instance_create_layer(size[0] * 0.5, size[1] * 0.5, "Instances", oPlayer)
score = 0
lives = 3
combo = 0

global.node_queue = ds_queue_create()
node = function(direction) constructor {
	self.direction = direction
}

// 서피스 생성
event_user(0)
event_user(1)

//
event_user(2)
event_user(3)

//
event_user(4)
