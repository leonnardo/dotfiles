return {
	"echasnovski/mini.ai",
	version = "*",
	config = function()
		local spec_treesitter = require("mini.ai").gen_spec.treesitter
		require("mini.ai").setup({
			custom_textobjects = {
				F = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
				o = spec_treesitter({
					a = { "@conditional.outer", "@loop.outer" },
					i = { "@conditional.inner", "@loop.inner" },
				}),
			},
		})
	end,
	-- opts = {
	-- 	custom_textobjects = {
	-- 		-- local spec_treesitter = require('mini.ai').gen_spec.treesitter
	-- 		F = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
	-- 	},
	-- },
}
