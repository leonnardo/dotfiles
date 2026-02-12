local sbar = require("sketchybar")
local settings = require("settings")

local kbd = sbar.add("item", {
	position = "right",
	icon = {
		drawing = false,
	},
	label = {
		font = string.format("%s:Semibold:14.0", settings.font),
	},
})

local cmd =
	'defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep "KeyboardLayout Name" | cut -c 33- | rev | cut -c 2- | rev'

-- TODO: add action to chaegn kbd layout on click
local update_kbd = function(layout)
	if string.find(layout, "U.S") then
		layout = "US"
	elseif string.find(layout, "Brazil") then
		layout = "BR"
	end
	kbd:set({ label = layout })
end

sbar.add("event", "kbd_change", "AppleSelectedInputSourcesChangedNotification")

kbd:subscribe("kbd_change", function()
	sbar.exec(cmd, update_kbd)
end)
sbar.exec(cmd, update_kbd)
