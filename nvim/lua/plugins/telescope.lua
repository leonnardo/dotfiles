return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		{ "nvim-telescope/telescope-frecency.nvim" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
				},
				mappings = {
					i = {
						["<esc>"] = require("telescope.actions").close,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
					},
				},
			},
			pickers = {
				buffers = {
					theme = "dropdown",
					windblend = 10,
					previewer = false,
					sort_mru = true,
					ignore_current_buffer = true,
					mappings = {
						i = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
						},
						n = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
						},
					},
				},
				git_files = {
					previewer = false,
					theme = "ivy",
				},
				live_grep = {
					theme = "ivy",
				},
				find_files = {
					find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
					theme = "ivy",
					windblend = 10,
					previewer = false,
				},
				current_buffer_fuzzy_find = {
					theme = "dropdown",
					windblend = 10,
					previewer = false,
				},
				help_tags = {
					theme = "dropdown",
					previewer = false,
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				["frecency"] = {
					show_scores = false,
					show_filter_column = false,
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "frecency")
	end,
}
