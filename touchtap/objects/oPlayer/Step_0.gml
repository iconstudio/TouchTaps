/// @description 동작
var check_h = global.io_pressed_right - global.io_pressed_left
var check_v = global.io_pressed_down - global.io_pressed_up

if check_h != 0 && check_v != 0 {
	direction = floor(point_direction(0, 0, check_h, check_v) / 90) * 90
} else if check_h != 0 {
	direction = darccos(check_h) // -check_h * 90 + 90
} else if check_v != 0 {
	direction = darcsin(-check_v)
}
