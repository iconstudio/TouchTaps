/// @description 시작 메시지 서피스 생성
surface_starter = surface_create(size[0], size[1])
surface_set_target(surface_starter)
draw_clear_alpha(0, 0)
draw_set_font(fontMain)
draw_set_halign(1)
draw_set_valign(1)

draw_set_alpha(1)
draw_set_color(0)
var drawers = [x, size[1] * 0.8]
for (var i = 0; i < 8; ++i)
	draw_text(drawers[0] + lengthdir_x(2, i * 45), drawers[1] + lengthdir_y(2, i * 45), "TAP TO START")

draw_set_color($ffffff)
draw_text(drawers[0], drawers[1], "TAP TO START")
surface_reset_target()
