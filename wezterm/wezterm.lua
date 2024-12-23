local wezterm = require("wezterm")

local tmux_prefix = function(key)
	return wezterm.action.Multiple({
		wezterm.action.SendKey({ mods = "CTRL", key = "a" }),
		wezterm.action.SendKey({ key = key }),
	})
end

local ctrl_prefix = function(key)
	return wezterm.action.SendKey({ mods = "CTRL", key = key })
end

return {
	-- default_prog = { "tmux", "new", "-A" },
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "DemiBold" }),
	font_size = 15.0,
	enable_tab_bar = false,
	window_decorations = "RESIZE",
	window_background_opacity = 0.97,
	window_close_confirmation = "NeverPrompt",
	native_macos_fullscreen_mode = false,
	keys = {
		-- { mods = "SUPER", key = "", action = },
		{ mods = "SUPER", key = "t", action = tmux_prefix("t") },
		{ mods = "SUPER", key = "w", action = tmux_prefix("w") },
		{ mods = "SUPER", key = "m", action = tmux_prefix("s") },
		{ mods = "SUPER", key = "s", action = tmux_prefix("%") },
		{ mods = "SUPER", key = "S", action = tmux_prefix("-") },
		{ mods = "SUPER", key = "Z", action = tmux_prefix("z") },
		{ mods = "SUPER", key = "r", action = ctrl_prefix("r") },
		{ mods = "SUPER", key = "1", action = ctrl_prefix("1") },
		{ mods = "SUPER", key = "2", action = ctrl_prefix("2") },
		{ mods = "SUPER", key = "3", action = ctrl_prefix("3") },
		{ mods = "SUPER", key = "4", action = ctrl_prefix("4") },
		{ mods = "SUPER", key = "5", action = ctrl_prefix("5") },
		{ mods = "SUPER", key = "e", action = tmux_prefix("n") },
		{ mods = "SUPER", key = "n", action = tmux_prefix("p") },
		{ mods = "SUPER", key = "LeftArrow", action = ctrl_prefix("LeftArrow") },
		{ mods = "SUPER", key = "DownArrow", action = ctrl_prefix("DownArrow") },
		{ mods = "SUPER", key = "UpArrow", action = ctrl_prefix("UpArrow") },
		{ mods = "SUPER", key = "RightArrow", action = ctrl_prefix("RightArrow") },
	},
}
