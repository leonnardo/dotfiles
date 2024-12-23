return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
	{
		"epwalsh/obsidian.nvim",
		cond = false,
		opts = {
			ui = {
				enable = false,
			},
			workspaces = {
				{
					name = "Work",
					path = "/mnt/c/Users/lrabello/iCloudDrive/iCloud~md~obsidian/SecondBrain",
				},
			},
			templates = {
				folder = "_templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
			},
			note_id_func = function(title)
				if title ~= nil then
					title = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
					title = tostring(os.date("%Y%m%d"))
				end
				return title
			end,
		},
	},
}
