/// @description 제목 서피스 생성
surface_title = surface_create(size[0], size[1])
surface_set_target(surface_title)
draw_clear_alpha(0, 0)
draw_set_alpha(1)
draw_set_color($ffffff)
draw_set_font(fontMainTitle)
draw_set_halign(1)
draw_set_valign(1)

draw_text(size[0] * 0.5, size[1] * 0.3333, "TAPPYSTRY")
surface_reset_target()
