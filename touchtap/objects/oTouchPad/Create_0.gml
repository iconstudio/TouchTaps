/// @description 초기화
function random_color() {
	return make_color_rgb(irandom(255), irandom(255), irandom(255))
}

function change_color() {
	image_blend = random_color()
}

image_xscale = room_width
image_yscale = room_height

change_color()

enum game_mode {
	ready,
	playing,
	over
}
mode = game_mode.ready 

player = {
	lives: 3,
	combo: 0,
	score: 0,
}

hp = 1
touch_time = 0
touch_period = seconds(0.3)
touch_precedure = function() {
	change_color()
}

procedure_finish = -1

