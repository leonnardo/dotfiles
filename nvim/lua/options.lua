-- options.lua — Editor settings

-- General
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.undofile = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace visibility
vim.opt.list = true
vim.opt.listchars = {
  tab = '→ ',
  trail = '·',
  space = '·',
  eol = '↵',
  nbsp = '␣',
}
vim.opt.fillchars:append({ diff = ' ' })

-- Native completion (popup behavior, autotrigger via LspAttach in autocmds.lua)
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'fuzzy' }
