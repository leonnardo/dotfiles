local toggle = function()
	if not MiniFiles.close() then
		MiniFiles.open()
	end
end
return {
	{
		"nvim-tree/nvim-tree.lua",
		enabled = false,
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
		keys = {
			-- { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle explorer" },
		},
	},
	{
		"echasnovski/mini.files",
		lazy = false,
		opts = {
			mappings = {
				go_in = "<Right>",
				go_in_plus = "<Enter>",
				go_out_plus = "<Left>",
				close = "<Esc>",
				synchronize = "s",
			},
		},
		keys = {
			{ "<leader>e", toggle, desc = "Toggle explorer" },
		},
	},
}
