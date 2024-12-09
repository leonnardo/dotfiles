return {
	"saghen/blink.cmp",
	enabled = vim.g.use_blink_cmp,
	lazy = false,
	dependencies = {
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		{ "saghen/blink.compat", version = "*", opts = { impersonate_nvim_cmp = true } },
	},

	version = "v0.*",

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
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},

		completion = {
			keyword = {
				range = "full",
			},

			trigger = {
				show_in_snippet = false,
			},

			list = {
				max_items = 50,
				selection = "auto_insert",
			},

			accept = {
				-- experimental auto-brackets support
				auto_brackets = {
					enabled = true,
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay = 200,
			},

			-- experimental signature help support
			signature = {
				enabled = true,
			},

			fuzzy = {
				use_typo_resistance = true,
			},
		},

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
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

		-- default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, via `opts_extend`
		sources = {
			completion = {
				enabled_providers = { "lsp", "path", "luasnip", "buffer" },
			},
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
	-- allows extending the enabled_providers array elsewhere in your config
	-- without having to redefine it
	opts_extend = { "sources.completion.enabled_providers" },
}
