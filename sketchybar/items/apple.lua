local icons = require("icons")
local colors = require("colors")

local popup_toggle = "sketchybar --set $NAME popup.drawing=toggle"

local apple_logo = sbar.add("item", {
	padding_right = 5,
	click_script = popup_toggle,
	icon = {
		string = icons.apple,
		font = {
			style = "Semibold",
			size = 14.0,
		},
		color = colors.white,
	},
	label = {
		drawing = false,
	},
	popup = {
		height = 35,
	},
})

local apple_prefs = sbar.add("item", {
	position = "popup." .. apple_logo.name,
	icon = icons.preferences,
	label = "Preferences",
})

local apple_activity = sbar.add("item", {
	position = "popup." .. apple_logo.name,
	icon = icons.activity,
	label = "Activity Monitor",
})

apple_prefs:subscribe("mouse.clicked", function(_)
	sbar.exec("open -a 'System Preferences'")
	apple_logo:set({ popup = { drawing = false } })
end)

apple_activity:subscribe("mouse.clicked", function(_)
	sbar.exec("open -a 'Activity Monitor'")
	apple_logo:set({ popup = { drawing = false } })
end)
