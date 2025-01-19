local builtin = require("telescope.builtin")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local desc = function(desc)
	return { noremap = true, desc = desc }
end

local search_directories = function()
	local opts = {
		path_display = "shorten",
		sorter = sorters.get_substr_matcher(),
		find_command = { "fd", "--type", "d" },
		attach_mappings = function(prompt_bufnr, _)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				vim.cmd("cd " .. selection[1])
			end)
			return true
		end,
	}

	builtin.find_files(opts)
end

local find_files_config = function()
	local opts = {
		cwd = vim.fn.stdpath("config"),
		results_title = "Neovim Config",
	}
	return builtin.find_files(opts)
end

vim.keymap.set("n", "<leader>ss", builtin.find_files, desc("Search in CWD"))
vim.keymap.set("n", "<leader>st", builtin.git_files, desc("Search in git root"))
vim.keymap.set("n", "<leader>sf", builtin.live_grep, desc("Live grep in CWD"))
vim.keymap.set("n", "<leader>sw", function()
	builtin.live_grep({ default_text = vim.fn.expand("<cword>") })
end, desc("Live grep cursor word in CWD"))
vim.keymap.set("n", "<leader>so", builtin.buffers, desc("Search open buffers"))
vim.keymap.set("n", "<leader>sr", builtin.lsp_workspace_symbols, desc("Search for workspace symbols"))
vim.keymap.set("n", "<leader>sh", builtin.help_tags, desc("Help tags"))
vim.keymap.set("n", "<leader>sm", builtin.keymaps, desc("Search keymaps"))
vim.keymap.set("n", "<leader>sp", search_directories, desc("Search directories and change to project root"))
vim.keymap.set("n", "<leader>sn", find_files_config, desc("Search in Neovim config"))
