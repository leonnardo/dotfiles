return {
	"saghen/blink.cmp",
	lazy = false,
	event = "InsertEnter",
	version = "*",
	opts_extend = { "sources.default" },
	dependencies = {
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		{ "saghen/blink.compat", version = "*", opts = { impersonate_nvim_cmp = true } },
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
		keymap = {
			preset = "enter",
		},
		completion = {
			keyword = {
				range = "full",
			},
			menu = { border = "rounded", scrollbar = false },
			trigger = {
				show_in_snippet = false,
			},
			list = {
				selection = {
					preselect = function(ctx)
						return ctx.mode ~= "cmdline" and not require("blink.cmp").snippet_active({ direction = 1 })
					end,
					auto_insert = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "padded",
				},
			},
		},
		snippets = {
			preset = "luasnip",
		},
		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},
		sources = {
			default = { "lsp", "snippets", "path", "codecompanion" },
		},
	},
}
