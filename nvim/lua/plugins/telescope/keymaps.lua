local builtin = require("telescope.builtin")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

function live_grep_from_project_git_root(opts)
	local function is_git_repo()
		vim.fn.system("git rev-parse --is-inside-work-tree")

		return vim.v.shell_error == 0
	end

	local function get_git_root()
		local dot_git_path = vim.fn.finddir(".git", ".;")
		return vim.fn.fnamemodify(dot_git_path, ":h")
	end

	local opts = opts or {}

	if is_git_repo() then
		opts.cwd = get_git_root()
	end
	require("telescope.builtin").live_grep(opts)
end

local find_files_config = function()
	local opts = {
		cwd = vim.fn.stdpath("config"),
		results_title = "Neovim Config",
	}
	return builtin.find_files(opts)
end

local find_dotfiles = function()
	local opts = {
		cwd = "~/src/dotfiles",
		results_title = "Dotfiles",
	}
	return builtin.git_files(opts)
end

local function project_files()
	local opts = {}
	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		require("telescope.builtin").find_files(opts)
	end
end

return {
	{
		"<C-p>",
		project_files,
		desc = "Find files",
	},
	{
		"<leader>ss",
		project_files,
		desc = "Find files",
	},
	{
		"<C-f>",
		live_grep_from_project_git_root,
		desc = "Live grep from project root",
	},
	{
		"<leader>sf",
		live_grep_from_project_git_root,
		desc = "Live grep from project root",
	},
	{
		"<leader>sw",
		function()
			live_grep_from_project_git_root({ default_text = vim.fn.expand("<cword>") })
		end,
		desc = "Live grep cursor word",
	},
	{
		"<leader>sn",
		find_files_config,
		desc = "Neovim config",
	},
	{
		"<leader>sp",
		function()
			local opts = {
				path_display = "shorten",
				sorter = sorters.get_substr_matcher(),
				find_command = { "fd", "--type", "d" },
				attach_mappings = function(prompt_bufnr, map)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						vim.cmd("cd " .. selection[1])
					end)
					return true
				end,
			}

			builtin.find_files(opts)
		end,
		desc = "Search directories and change to project root",
	},
	{
		"<leader>sd",
		find_dotfiles,
		desc = "Dotfiles",
	},
	{
		"<leader>fs",
		builtin.lsp_workspace_symbols,
		desc = "Workspace symbols",
	},
	{
		"<leader>sk",
		builtin.keymaps,
		desc = "Keymaps",
	},
}
