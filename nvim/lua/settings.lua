local utils = require('utils')

local indent = 4
cmd 'colorscheme gruvbox'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)
utils.opt('o', 'hidden', true)
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
