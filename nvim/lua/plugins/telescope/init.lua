local utils = require("plugins.telescope.utils")

local function filenameFirst(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then
		return tail
	end
	return string.format("%s\t\t%s", tail, parent)
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
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
				path_display = "truncate",
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
				},
				git_files = {
					previewer = false,
					path_display = filenameFirst,
					theme = "dropdown",
				},
				find_files = {
					find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
					hidden = true,
					theme = "dropdown",
					windblend = 10,
					previewer = false,
					path_display = utils.filename_first,
				},
				current_buffer_fuzzy_find = {
					theme = "dropdown",
					windblend = 10,
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

		vim.keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<cr>", { noremap = true })

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "frecency")
	end,
	keys = require("plugins.telescope.keymaps"),
}
