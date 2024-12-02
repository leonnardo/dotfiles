return { -- Autocompletion
	"iguanacucumber/magazine.nvim",
	name = "nvim-cmp",
	enabled = not vim.g.use_blink_cmp,
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		-- Snippet Engine & its associated nvim-cmp source
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		{ "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
		{ "iguanacucumber/mag-nvim-lua", name = "cmp-nvim-lua" },
		{ "iguanacucumber/mag-buffer", name = "cmp-buffer" },
		{ "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },
		"saadparwaiz1/cmp_luasnip",
		-- "hrsh7th/cmp-path",
		-- "hrsh7th/cmp-nvim-lsp-document-symbol",
		-- "hrsh7th/cmp-nvim-lsp-signature-help",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		luasnip.config.setup({})

		cmp.setup({
			preselect = cmp.PreselectMode.None,
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol", -- show only symbol annotations
					maxwidth = {
						-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						-- can also be a function to dynamically calculate max width such as
						-- menu = function() return math.floor(0.45 * vim.o.columns) end,
						menu = 50, -- leading text (labelDetails)
						abbr = 50, -- actual suggestion item
					},
					ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
					show_labelDetails = true, -- show labelDetails in menu. Disabled by default
				}),
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert,noselect" },
			-- For an understanding of why these mappings were
			-- chosen, you will need to read `:help ins-completion`
			--
			-- No, but seriously. Please read `:help ins-completion`, it is really good!
			mapping = cmp.mapping.preset.insert({
				-- Scroll the documentation window [b]ack / [f]orward
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- Accept ([y]es) the completion.
				--  This will auto-import if your LSP supports it.
				--  This will expand snippets if the LSP sent a snippet.
				-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									behavior = cmp.ConfirmBehavior.Replace,
									select = true,
								})
							end
						else
							fallback()
						end
					end,
					s = cmp.mapping.confirm({ select = true }),
					c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }), -- s means INSIDE SNIPPET!

				-- ["<Tab>"] = cmp.mapping(function(fallback)
				-- 	local col = vim.fn.col(".") - 1
				-- 	if cmp.visible() then
				-- 		cmp.select_next_item({ behavior = "select" })
				-- 	elseif luasnip.expand_or_locally_jumpable() then
				-- 		luasnip.expand_or_jump()
				-- 	elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
				-- 		fallback()
				-- 	else
				-- 		cmp.complete()
				-- 	end
				-- end, { "i", "s" }),

				-- Super shift tab
				-- ["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 	if cmp.visible() then
				-- 		cmp.select_prev_item({ behavior = "select" })
				-- 	elseif luasnip.locally_jumpable(-1) then
				-- 		luasnip.jump(-1)
				-- 	else
				-- 		fallback()
				-- 	end
				-- end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				-- Manually trigger a completion from nvim-cmp.
				--  Generally you don't need this, because nvim-cmp will display
				--  completions whenever it has completion options available.
				["<C-Space>"] = cmp.mapping.complete({}),

				-- Think of <c-l> as moving to the right of your snippet expansion.
				--  So if you have a snippet that's like:
				--  function $name($args)
				--    $body
				--  end
				--
				-- <c-l> will move you to the right of each of the expansion locations.
				-- <c-h> is similar, except moving you backwards.
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),

				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
			}),
			sources = cmp.config.sources({
				{
					name = "lazydev",
					-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
					group_index = 0,
					keyword_length = 3,
				},
				{ name = "nvim_lsp_signature_help", keyword_length = 3 },
				{ name = "nvim_lsp", keyword_length = 3 },
				{
					name = "luasnip",
					-- Don't show snippet completions in comments or strings.
					entry_filter = function()
						local ctx = require("cmp.config.context")
						local in_string = ctx.in_syntax_group("String") or ctx.in_treesitter_capture("string")
						local in_comment = ctx.in_syntax_group("Comment") or ctx.in_treesitter_capture("comment")

						return not in_string and not in_comment
					end,
					keyword_length = 3,
				},
				{
					name = "buffer",
					keyword_length = 3,
					option = {
						-- Buffer completions from all visible buffers (that aren't huge).
						get_bufnrs = function()
							local bufs = {}

							for _, win in ipairs(vim.api.nvim_list_wins()) do
								local buf = vim.api.nvim_win_get_buf(win)
								if vim.bo[buf].filetype ~= "bigfile" then
									table.insert(bufs, buf)
								end
							end

							return bufs
						end,
					},
				},
			}),
			performance = { max_view_entries = 10 },
		})

		cmp.setup.cmdline({ "/", "?" }, {
			preselect = "none",
			completion = {
				completeopt = "menu,preview,menuone,noselect",
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
				["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			},
			sources = {
				{ name = "nvim_lsp_document_symbol" },
				{ name = "buffer" },
			},
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		})

		cmp.setup.cmdline(":", {
			preselect = "none",
			completion = {
				completeopt = "menu,preview,menuone,noselect",
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
				["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
				["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			},
			sources = cmp.config.sources({
				{ name = "path", keyword_length = 3 },
			}, {
				{ name = "cmdline", keyword_length = 3 },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		})
	end,
}
