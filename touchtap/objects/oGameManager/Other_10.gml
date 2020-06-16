/// @description 제목 서피스 생성
surface_title = surface_create(size[0], size[1])
surface_set_target(surface_title)
draw_clear_alpha(0, 0)
draw_set_font(fontMainTitle)
draw_set_halign(1)
draw_set_valign(1)

draw_set_alpha(1)
draw_set_color(0)
var drawers = [x, size[1] * 0.3333]
for (var i = 0; i < 8; ++i)
	draw_text(drawers[0] + lengthdir_x(2, i * 45), drawers[1] + lengthdir_y(2, i * 45), "TAPPYSTRY")

draw_set_color($ffffff)
draw_text(drawers[0], drawers[1], "TAPPYSTRY")
surface_reset_target()
