local builtin = require("telescope.builtin")
local find_files_config = function()
	local opts = {
		cwd = vim.fn.stdpath("config"),
		results_title = "Neovim Config",
	}
	return builtin.find_files(opts)
end

local find_dotfiles = function()
	opts = {
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
		"<leader>ff",
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
		builtin.live_grep,
		desc = "Live grep",
	},
	{
		"<leader>sn",
		find_files_config,
		desc = "Neovim config",
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
}
