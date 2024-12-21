-- return {
--   black = 0xff181926,
--   white = 0xffcad3f5,
--   red = 0xffed8796,
--   green = 0xffa6da95,
--   blue = 0xff8aadf4,
--   yellow = 0xffeed49f,
--   orange = 0xfff5a97f,
--   magenta = 0xffc6a0f6,
--   grey = 0xff939ab7,
--   transparent = 0x00000000,
--
--   bar = {
--     bg = 0xd01e1e2e,
--     border = 0xff494d64,
--   },
--   popup = {
--     bg = 0xff1e1e2e,
--     border = 0xffcad3f5
--   },
--   bg1 = 0x803c3e4f,
--   bg2 = 0xff494d64,
-- }
return {
	black = 0xff181819,
	white = 0xffe2e2e3,
	red = 0xfffc5d7c,
	green = 0xff9ed072,
	blue = 0xff76cce0,
	yellow = 0xffe7c664,
	orange = 0xfff39660,
	magenta = 0xffb39df3,
	grey = 0xff7f8490,
	transparent = 0x00000000,

	aerospace_label_color = 0xffe2e2e3,
	aerospace_label_highlight_color = 0xff9ed072,
	aerospace_icon_highlight_color = 0xffe7c664,
	front_app_color = 0xff181819,

	bar = {
		bg = 0xd01e1e2e,
		-- bg = 0x829b9b9b,
		border = 0x66494d64,
		-- border = 0xff494d66,
		-- border = 0x801a1b27,
	},
	popup = {
		bg = 0xc02c2e34,
		border = 0xff7f8490,
	},
	-- bg1 = 0xff363944,
	-- bg2 = 0xff414550,
	-- bg2 = 0xff,
	bg1 = 0xff363944,
	bg2 = 0xff414550,
	bg3 = 0x99363944,
	-- bg3 = 0xff414550,
	-- bg3 = 0x754a4a4a,
	-- bg3 = 0xc02c2e34,
	transparency = 0.95,
	blur_radius = 20,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
