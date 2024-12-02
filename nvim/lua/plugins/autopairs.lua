return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		-- Optional dependency
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({})
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
		enabled = not vim.g.use_mini_autopairs,
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.pairs").setup()
		end,
		enabled = vim.g.use_mini_autopairs,
	},
}
