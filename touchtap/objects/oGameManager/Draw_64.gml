draw_set_color($ffffff)
if !surface_exists(surface_title)
	event_user(0)

if !surface_exists(surface_starter)
	event_user(1)

if struct_exists(mode) {
	mode.draw()
}
