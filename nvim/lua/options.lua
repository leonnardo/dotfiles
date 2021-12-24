local opt = vim.opt

vim.o.lazyredraw = true
opt.mouse = "a"
opt.hidden = true
opt.encoding = "utf-8"
--opt.pumheight=10
--opt.cmdheight=2
--opt.iskeyword +=-
--opt.iskeyword+=_
opt.splitbelow = true
opt.splitright = true
opt.number = true
opt.relativenumber =  true
opt.cursorline = true
opt.expandtab = true
opt.smarttab= true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true
opt.incsearch =true
opt.hlsearch = true
opt.list = true
opt.listchars = { tab = "→ ", trail = "▫" } --, eol = "⏎"  }
opt.showcmd = true
opt.signcolumn = "yes:1"
opt.clipboard = "unnamedplus"
opt.updatetime = 100
opt.completeopt = "menuone,noselect"
opt.shortmess:append "c"
opt.backspace = { "indent", "eol", "start" }
opt.termguicolors = true
opt.swapfile = false
opt.wrap = false
opt.timeoutlen = 250
