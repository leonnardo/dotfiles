return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "j-hui/fidget.nvim", opts = {} },
			{ "jinzhongjia/LspUI.nvim", cond = false, opts = {} }, -- TODO: test it later
			{ "soulis-1256/eagle.nvim", cond = false, opts = {} }, -- TODO: test it later
			{ "ray-x/navigator.lua", cond = false, opts = {} }, -- TODO: test it later
			{ "SmiteshP/nvim-navic", cond = false, opts = {} }, -- TODO: test it later
			-- { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("gd", "<cmd>Glance definitions<CR>", "[G]oto [D]efinition")
					map("gr", "<cmd>Glance references<CR>", "[G]oto [R]eferences")
					map("gi", "<cmd>Glance implementations<CR>", "[G]oto [I]mplementation")
					map("gt", "<cmd>Glance implementations<CR>", " [G]oto [T]ype definition")
					map("<leader>csd", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map(
						"<leader>csw",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					map("<leader>cr", vim.lsp.buf.rename, "[R]ename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code [A]ction", { "n", "x" })
					map("", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "i" })
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					--
					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					--
					--
					--
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { underline = false })
					vim.diagnostic.config({
						virtual_text = false,
						severity_sort = true,
						float = {
							scope = "cursor",
						},
						signs = {
							severity = { min = vim.diagnostic.severity.WARN },
							text = {
								[vim.diagnostic.severity.ERROR] = "",
								[vim.diagnostic.severity.WARN] = "",
								[vim.diagnostic.severity.HINT] = "",
								[vim.diagnostic.severity.INFO] = "",
							},
						},
					})

					-- Change diagnostic symbols in the sign column (gutter)
					-- if vim.g.have_nerd_font then
					--   local signs = { Error = '', Warn = '', Hint = '', Info = '' }
					--   for type, icon in pairs(signs) do
					--     local hl = 'DiagnosticSign' .. type
					--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
					--   end
					-- end

					vim.api.nvim_create_autocmd({ "CursorHold" }, {
						group = vim.api.nvim_create_augroup("_auto_diag", { clear = true }),
						buffer = event.buf,
						callback = function()
							local opts = {
								focusable = false,
								border = "rounded",
								close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
								prefix = " ",
							}
							vim.diagnostic.open_float(nil, opts)
						end,
					})

					-- The following code creates a keymap to toggle inlay hints in your
					-- code, if the language server you are using supports them
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>cth", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "[T]oggle Inlay [H]ints")
					end
				end,
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			--  By default, Neovim doesn't support everything that is in the LSP specification.
			--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
			--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			if not vim.g.use_blink_cmp then
				capabilities =
					vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
			end

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
				yamlls = {
					settings = {
						yaml = {
							schemas = {
								kubernetes = "*.yaml",
							},
						},
					},
				},
			}

			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			local get_lsp_capabilities = function(capabilities)
				if vim.g.use_blink_cmp then
					return require("blink.cmp").get_lsp_capabilities(capabilities)
				else
					return capabilities
				end
			end

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for ts_ls)
						server.capabilities = vim.tbl_deep_extend(
							"force",
							{},
							capabilities,
							get_lsp_capabilities(server.capabilities) or {}
						)
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})

			-- local lspconfig = require("lspconfig")
			-- local configs = require("lspconfig.configs")
			-- configs.roslyn = {
			-- 	default_config = {
			-- 		cmd = { "roslyn" },
			-- 		root_dir = require("lspconfig").util.root_pattern(".git"),
			-- 		filetypes = { "cs" },
			-- 	},
			-- }
			--
			-- lspconfig.roslyn.setup({})
		end,
	},
}
