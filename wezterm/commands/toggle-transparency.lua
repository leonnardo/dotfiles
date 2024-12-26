local wezterm = require("wezterm")

return {
	brief = "Toggle transparency",
	icon = "md_circle_opacity",
	action = wezterm.action_callback(function(window)
		local config = window:get_config_overrides() or {}

		if not config.window_background_opacity or config.window_background_opacity == 1 then
			config.window_background_opacity = 0.85
		else
			config.window_background_opacity = 1
		end

		window:set_config_overrides(config)
	end),
}
