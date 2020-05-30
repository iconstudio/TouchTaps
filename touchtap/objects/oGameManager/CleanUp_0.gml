/// @description 서피스 제거
if surface_exists(surface_title)
	surface_free(surface_title)

if surface_exists(surface_starter)
	surface_free(surface_starter)

delete mode_change
delete draw_title
delete draw_starter
