local opt = vim.opt

vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.use_mini_autopairs = true
vim.g.use_blink_cmp = true

vim.o.lazyredraw = true
vim.o.autoread = true

opt.mouse = "a"
opt.hidden = true
opt.encoding = "utf-8"
opt.splitbelow = true
opt.splitright = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.expandtab = true
opt.smarttab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true
opt.incsearch = true
opt.inccommand = "split"
opt.scrolloff = 10
opt.hlsearch = false
opt.list = true
opt.listchars = { tab = "→ ", trail = "▫", eol = "⏎" }
opt.showcmd = true
opt.signcolumn = "yes"
opt.completeopt = "menuone,noselect"
opt.shortmess:append("c")
opt.backspace = { "indent", "eol", "start" }
opt.termguicolors = true
opt.swapfile = false
opt.wrap = false
opt.updatetime = 250
opt.timeoutlen = 600
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.laststatus = 3
opt.shell = "/bin/zsh -l"

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Check if running in WSL2
local function is_wsl()
	local output = vim.fn.systemlist("uname -r")
	return output[1] and output[1]:find("WSL2") ~= nil
end

if is_wsl() then
	print("hello")
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = { "clip.exe" },
			["*"] = { "clip.exe" },
		},
		paste = {
			["+"] = {
				"/mnt/c/Windows/System32/WindowsPowerShell/v1.0//powershell.exe",
				"-c",
				'[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			},
			["*"] = {
				"/mnt/c/Windows/System32/WindowsPowerShell/v1.0//powershell.exe",
				"-c",
				'[Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			},
		},
		cache_enabled = false,
	}
end
