/// @description 초기화
global.stage = 0
event_user(4)
mode = -1
mode_change(state_intro)

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

// 서피스 생성
event_user(0)
event_user(1)

//
event_user(2)
event_user(3)
