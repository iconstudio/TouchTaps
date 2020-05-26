if struct_exists(mode) {
	color.run()
	image_blend = color_method(color.hue, color.sat, color.val)
	mode.run()
}
