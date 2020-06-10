/// @description 자신과 패드 그리기
if stop
	exit

draw_self()
draw_sprite_ext(sPaddle, 0, x, y, 1, 1, direction, $ffffff, 1)
