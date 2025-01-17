local use_roslyn_nvim = true

return {
	{
		"MoaidHathot/dotnet.nvim",
		cmd = "DotnetUI",
		opts = {},
	},
	{
		"iabdelkareem/csharp.nvim",
		enabled = not use_roslyn_nvim,
		dependencies = {
			"Tastyep/structlog.nvim",
		},
		opts = {
			dap = {
				adapter_name = "netcoredbg",
			},
			lsp = {
				-- Sets if you want to use omnisharp as your LSP
				omnisharp = {
					-- When set to false, csharp.nvim won't launch omnisharp automatically.
					enable = true,
					-- When set, csharp.nvim won't install omnisharp automatically. Instead, the omnisharp instance in the cmd_path will be used.
					cmd_path = vim.fn.stdpath("data") .. "/mason/bin/omnisharp",
				},
				roslyn = {
					enable = true,
					cmd_path = vim.fn.stdpath("data") .. "/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll",
				},
				-- The default timeout when communicating with omnisharp
				default_timeout = 2000,
				-- Settings that'll be passed to the omnisharp server
				enable_editor_config_support = true,
				organize_imports = true,
				load_projects_on_demand = true,
				enable_analyzers_support = true,
				enable_import_completion = true,
				include_prerelease_sdks = true,
				analyze_open_documents_only = false,
				enable_package_auto_restore = true,
				-- Launches omnisharp in debug mode
				debug = true,
			},
		},
	},
	{
		"seblj/roslyn.nvim",
		ft = { "cs", "sln", "csproj", "props", "targets" },
		cond = use_roslyn_nvim,
		init = function()
			vim.keymap.set("n", "<leader>ds", function()
				if not vim.g.roslyn_nvim_selected_solution then
					return vim.notify("No solution file found")
				end

				local projects = require("roslyn.sln.api").projects(vim.g.roslyn_nvim_selected_solution)
				local files = vim.iter(projects)
					:map(function(it)
						return vim.fs.dirname(it)
					end)
					:totable()

				local root = vim.fs.root(0, ".git") or vim.fs.dirname(vim.g.roslyn_nvim_selected_solution)

				require("telescope.pickers")
					.new({}, {
						cwd = root,
						prompt_title = "Find solution files",
						finder = require("telescope.finders").new_oneshot_job(
							vim.list_extend({ "fd", "--type", "f", "." }, files),
							{ entry_maker = require("telescope.make_entry").gen_from_file({ cwd = root }) }
						),
						sorter = require("telescope.config").values.file_sorter({}),
						previewer = require("telescope.config").values.grep_previewer({}),
					})
					:find()
			end)
		end,
		opts = {
			config = {
				settings = {
					["csharp|background_analysis"] = {
						dotnet_analyzer_diagnostic_scope = "openFiles",
						dotnet_compiler_diagnostics_scope = "openFiles",
					},
					["csharp|completion"] = {
						dotnet_show_completion_items_for_unimported_namespaces = true,
						dotnet_show_name_completion_suggestions = true,
					},
					["csharp|symbol_search"] = {
						dotnet_search_reference_assemblies = true,
					},
					["csharp|code_lens"] = {
						dotnet_enable_references_code_lens = true,
					},
				},
			},
		},
	},
}
