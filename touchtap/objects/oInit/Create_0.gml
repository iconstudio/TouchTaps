randomize()

global.first = true

global.debug = true
show_debug_overlay(global.debug)

global.screen_scale = [display_get_dpi_x() / 96, display_get_dpi_y() / 96]
global.shaderOutline_resolution = shader_get_uniform(shaderOutline, "resolution")
shader_set(shaderOutline)
shader_set_uniform_f(global.shaderOutline_resolution, 540 * global.screen_scale[0], 960 * global.screen_scale[1])
shader_reset()
//show_message(global.screen_scale[0])
alarm[0] = 1
