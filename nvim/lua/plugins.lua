-- plugins.lua — Plugin declarations + configuration
-- Each plugin: vim.pack.add() followed by setup()

-- Colorscheme
vim.pack.add('https://github.com/folke/tokyonight.nvim')
vim.cmd.colorscheme('tokyonight-night')

-- LSP server default configs (provides lsp/*.lua for hundreds of servers)
vim.pack.add('https://github.com/neovim/nvim-lspconfig')

-- Treesitter (main branch: manual install + vim.treesitter.start())
vim.pack.add({ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' })

-- Git signs
vim.pack.add('https://github.com/lewis6991/gitsigns.nvim')
require('gitsigns').setup({})

-- Split navigation (tmux-aware)
vim.pack.add('https://github.com/mrjones2014/smart-splits.nvim')
require('smart-splits').setup({})

-- Picker + explorer
vim.pack.add('https://github.com/folke/snacks.nvim')
require('snacks').setup({
  picker = {
    preset = 'ivy',
  },
})

-- Keybind discovery
vim.pack.add('https://github.com/folke/which-key.nvim')
require('which-key').setup({})

-- Editing: surround (add/delete/replace)
vim.pack.add('https://github.com/nvim-mini/mini.surround')
require('mini.surround').setup({})

-- Editing: enhanced text objects
vim.pack.add('https://github.com/nvim-mini/mini.ai')
require('mini.ai').setup({})
