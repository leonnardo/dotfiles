return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
			end,
		},
	},
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim",
	},
	config = true,
}
