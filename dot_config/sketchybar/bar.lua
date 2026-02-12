local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	height = 30,
	-- color = "0xff1e1e2e",
	color = colors.bar.bg,
	border_color = colors.bar.border,
	shadow = true,
	sticky = true,
	padding_right = 10,
	padding_left = 10,
	blur_radius = 20,
	topmost = "window",
})
