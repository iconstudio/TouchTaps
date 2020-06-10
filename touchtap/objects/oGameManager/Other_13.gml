/// @description 색상 구조체 선언
color_method = make_color_hsv
color_periods = [seconds(1), seconds(0.75), seconds(0.5), seconds(0.25), seconds(0.1)]
color = new (function() constructor {
	period = other.color_periods[0]
	time = period
	hue = 0
	sat = 0
	val = 0
	hue_begin = 0
	sat_begin = 0
	val_begin = 0
	hue_target = 0
	sat_target = 0
	val_target = 0

	run = function() {
		other.image_blend = other.color_method(hue, sat, val)

		var gradient_ratio = time / period
		if time++ < period {
			hue = lerp(hue_begin, hue_target, gradient_ratio)
			sat = lerp(sat_begin, sat_target, gradient_ratio)
			val = lerp(val_begin, val_target, gradient_ratio)
			return true
		} else {
			hue = hue_target
			sat = sat_target
			val = val_target
			return false
		}
	}

	set = function(hue_new, sat_new, val_new) {
		time = 0
		hue_begin = hue
		sat_begin = sat
		val_begin = val
		hue_target = hue_new
		sat_target = sat_new
		val_target = val_new
	}

	set_immediately = function(hue_new, sat_new, val_new) {
		time = period
		hue = hue_new
		sat = sat_new
		val = val_new
		hue_begin = hue
		sat_begin = sat
		val_begin = val
		hue_target = hue
		sat_target = sat
		val_target = hue
	}

	set_period = function(times) {
		period = times
	}
})()

function background_set_color() {
	layer_background_blend(background_id, color_method(color.hue, color.sat, color.val))
}

function change_color(h, s, v) {
	color.set(h, s, v)
	background_set_color()
	//image_blend = color_method(color.hue, color.sat, color.val)
}

function change_color() {
	color.set(irandom(255), irandom(255), irandom(255))
	background_set_color()
	//image_blend = color_method(color.hue, color.sat, color.val)
}

// ** 즉시 색상 변경 **
function change_color_immediately() {
	color.set_immediately(irandom(255), 63 + irandom(192), 128 + irandom(127))
	background_set_color()
	//image_blend = color_method(color.hue, color.sat, color.val)
}
