return {
	"saghen/blink.cmp",
	lazy = false,
	event = "InsertEnter",
	opts_extend = { "sources.default" },
	dependencies = {
		"L3MON4D3/LuaSnip",
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
				selection = function(ctx)
					return ctx.mode == "cmdline" and "auto_insert" or "preselect"
				end,
				max_items = 25,
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
			expand = function(snippet)
				require("luasnip").lsp_expand(snippet)
			end,
			active = function(filter)
				if filter and filter.direction then
					require("luasnip").jumpable(filter.direction)
				end
				return require("luasnip").in_snippet()
			end,
			jump = function(direction)
				require("luasnip").jump(direction)
			end,
		},
		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},
		sources = {
			default = { "lsp", "path", "snippets" },
			providers = {
				luasnip = {
					name = "luasnip",
					module = "blink.compat.source",
					score_offset = -3,
					opts = {
						use_show_condition = false,
						show_autosnippets = true,
					},
				},
			},
		},
	},
}
