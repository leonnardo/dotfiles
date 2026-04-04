-- init.lua — Neovim 0.12 native config
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('options')
require('autocmds')
require('plugins')
require('keymaps')

vim.lsp.enable({
  'lua_ls',
  'gopls',
  'pyright',
  'roslyn_ls',
  'dockerls',
  'docker_compose_language_service',
  'yamlls',
  'jsonls',
})
