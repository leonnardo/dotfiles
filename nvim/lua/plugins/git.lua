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
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim",
		},
		config = function()
			local opts = {
				kind = "floating",
				commit_editor = {
					kind = "floating",
				},
				mappings = {
					commit_editor = {
						["<Enter>"] = "Submit",
					},
				},
			}
			require("neogit").setup(opts)
			vim.keymap.set("n", "<leader>gs", "<cmd>Neogit<CR>", { noremap = true, silent = true, desc = "Neogit" })
		end,
	},
}
