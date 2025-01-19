local toggle = function()
	if not MiniFiles.close() then
		MiniFiles.open()
	end
end
return {
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
			{ "<leader>te", toggle, desc = "Toggle explorer" },
		},
	},
}
