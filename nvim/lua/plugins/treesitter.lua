return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	opts = {
		ensure_installed = {
			"bash",
			"c_sharp",
			"diff",
			"dockerfile",
			"go",
			"gomod",
			"gosum",
			"json",
			"jsonc",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"powershell",
			"python",
			"query",
			"vim",
			"vimdoc",
			"yaml",
		},
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				node_incremental = "v",
				node_decremental = "V",
			},
		},
	},
	-- There are additional nvim-treesitter modules that you can use to interact
	-- with nvim-treesitter. You should go explore a few and see what interests you:
	--
	--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
	--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
	--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
