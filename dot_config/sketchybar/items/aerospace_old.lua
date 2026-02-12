local colors = require("colors")
local settings = require("settings")

local max_workspaces = 10
local query_workspaces =
	"aerospace list-workspaces --all --format '%{workspace}%{monitor-appkit-nsscreen-screens-id}' --json"
local workspace_monitor = {}

-- Add padding to the left
sbar.add("item", {
	icon = {
		color = colors.white,
		highlight_color = colors.red,
		drawing = false,
	},
	label = {
		color = colors.grey,
		highlight_color = colors.white,
		drawing = false,
	},
	background = {
		color = colors.bg1,
		border_width = 1,
		height = 23,
		border_color = colors.black,
		corner_radius = 9,
		drawing = false,
	},
	padding_left = 5,
	padding_right = 0,
})

local workspaces = {}

local function updateWindows(workspace_index)
	local get_windows =
		string.format("aerospace list-windows --workspace %s --format '%%{app-name}' --json", workspace_index)
	sbar.exec(get_windows, function(open_windows)
		-- local icon_line = ""
		local no_app = true
		for _, _ in ipairs(open_windows) do
			no_app = false
			-- local app = open_window["app-name"]
			-- local lookup = app_icons[app]
			-- local icon = ((lookup == nil) and app_icons["default"] or lookup)
		end
		sbar.animate("tanh", 10, function()
			if no_app then
				workspaces[workspace_index]:set({
					icon = { drawing = false },
					label = { drawing = false },
					background = { drawing = false },
					padding_right = 0,
					padding_left = 0,
				})
				return
			end

			workspaces[workspace_index]:set({
				icon = { drawing = true },
				label = { drawing = true },
				background = { drawing = true },
				padding_right = 1,
				padding_left = 1,
			})
		end)
	end)
end

local function updateWorkspaceMonitor(workspace_index)
	sbar.exec(query_workspaces, function(workspaces_and_monitors)
		for _, entry in ipairs(workspaces_and_monitors) do
			local space_index = tonumber(entry.workspace)
			local monitor_id = math.floor(entry["monitor-appkit-nsscreen-screens-id"])
			workspace_monitor[space_index] = monitor_id
		end
		workspaces[workspace_index]:set({
			display = workspace_monitor[workspace_index],
		})
	end)
end

for workspace_index = 1, max_workspaces do
	local workspace = sbar.add("item", {
		icon = {
			color = colors.white,
			highlight_color = colors.red,
			drawing = false,
			font = { family = settings.font.numbers },
			string = workspace_index,
			padding_left = 10,
			padding_right = 5,
		},
		padding_right = 2,
		padding_left = 2,
		background = {
			color = colors.bg1,
			border_width = 1,
			height = 28,
			border_color = colors.bg2,
		},
		click_script = "aerospace workspace " .. workspace_index,
	})

	workspaces[workspace_index] = workspace

	workspace:subscribe("aerospace_workspace_change", function(env)
		local focused_workspace = tonumber(env.FOCUSED_WORKSPACE)
		local is_focused = focused_workspace == workspace_index

		sbar.animate("tanh", 10, function()
			workspace:set({
				icon = { highlight = is_focused },
				label = { highlight = is_focused },
				background = {
					border_width = is_focused and 2 or 0,
				},
			})
		end)
	end)

	workspace:subscribe("display_change", function()
		updateWindows(workspace_index)
		updateWorkspaceMonitor(workspace_index)
	end)

	-- initial setup
	updateWindows(workspace_index)
	updateWorkspaceMonitor(workspace_index)
	sbar.exec("aerospace list-workspaces --focused", function(focused_workspace)
		workspaces[tonumber(focused_workspace)]:set({
			icon = { highlight = true },
			label = { highlight = true },
			background = { border_width = 2 },
		})
	end)
end
