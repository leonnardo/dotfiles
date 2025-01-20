return {
	"echasnovski/mini.ai",
	opts = function()
		local treesitter = require("mini.ai").gen_spec.treesitter
		return {
			n_lines = 500,
			custom_textobjects = {
				a = treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
				c = treesitter({ a = "@class.outer", i = "@class.inner" }),
				f = treesitter({ a = "@function.outer", i = "@function.inner" }),
				k = treesitter({ a = "@block.outer", i = "@block.inner" }),
				l = treesitter({ a = "@loop.outer", i = "@loop.inner" }),
			},
		}
	end,
}
