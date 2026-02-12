local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
