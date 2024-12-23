local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "DemiBold" })
config.font_size = 15.0
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.90
config.macos_window_background_blur = 25
config.native_macos_fullscreen_mode = false

config.keys = {
	-- {
	--   key = 'A',
	--   mods = 'CTRL|SHIFT',
	--   action = wezterm.action.QuickSelect,
	-- }
}

return config
