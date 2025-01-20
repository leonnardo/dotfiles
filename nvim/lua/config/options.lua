local opt = vim.opt

vim.g.have_nerd_font = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.use_mini_autopairs = true
vim.g.use_blink_cmp = true
vim.g.use_colemak_bindings = false

opt.mouse = "a"
opt.encoding = "utf-8"

opt.splitbelow = true
opt.splitright = true
opt.number = true
opt.relativenumber = true

opt.cursorline = true
opt.tabstop = 4
opt.softtabstop = -1
opt.shiftwidth = 0
opt.shiftround = true
opt.expandtab = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.incsearch = true
opt.inccommand = "split"
opt.scrolloff = 999
opt.hlsearch = false
opt.list = true
opt.listchars = { tab = "→ ", trail = "▫", eol = "⏎" }
opt.showcmd = true
opt.signcolumn = "yes"
opt.completeopt = "menu,menuone,noselect"
opt.shortmess:append("c")
opt.backspace = { "indent", "eol", "start" }
opt.termguicolors = true
opt.swapfile = false
opt.wrap = false
opt.linebreak = true
opt.updatetime = 250
opt.timeoutlen = 500
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.laststatus = 3
opt.foldenable = false
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "expr"
opt.smoothscroll = true
opt.backspace = { "start", "eol", "indent" }
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep --smart-case --follow"
else
  opt.grepprg = "grep -n $* /dev/null"
end

opt.formatoptions:remove({ "c", "r", "o" })

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Check if running in WSL2
local function is_wsl()
  local output = vim.fn.systemlist("uname -r")
  return output[1] and output[1]:find("WSL2") ~= nil
end

-- idea from https://github.com/drewherron/colemak-vim
local function toggle_colemak_mappings()
  if vim.g.use_colemak_bindings then
    vim.g.use_colemak_bindings = not vim.g.use_colemak_bindings
    vim.keymap.set({ "n", "v" }, "n", "j")
    vim.keymap.set({ "n", "v" }, "N", "n")
    vim.keymap.set({ "n", "v" }, "e", "k")
    vim.keymap.set({ "n", "v" }, "E", "N")
    vim.keymap.set({ "n", "v" }, "N", "n")
    vim.keymap.set({ "n", "v" }, "i", "l")
    vim.keymap.set({ "n", "v" }, "I", "L")
    vim.keymap.set({ "n", "v" }, "j", "K")
    vim.keymap.set({ "n", "v" }, "k", "e")
    vim.keymap.set({ "n", "v" }, "K", "E")
    vim.keymap.set({ "n", "v" }, "l", "i")
    vim.keymap.set({ "n", "v" }, "L", "I")
  else
    vim.g.use_colemak_bindings = not vim.g.use_colemak_bindings
    vim.keymap.set({ "n", "v" }, "n", "n")
    vim.keymap.set({ "n", "v" }, "N", "N")
    vim.keymap.set({ "n", "v" }, "e", "e")
    vim.keymap.set({ "n", "v" }, "E", "E")
    vim.keymap.set({ "n", "v" }, "N", "N")
    vim.keymap.set({ "n", "v" }, "i", "i")
    vim.keymap.set({ "n", "v" }, "I", "I")
    vim.keymap.set({ "n", "v" }, "j", "j")
    vim.keymap.set({ "n", "v" }, "k", "k")
    vim.keymap.set({ "n", "v" }, "K", "K")
    vim.keymap.set({ "n", "v" }, "l", "l")
    vim.keymap.set({ "n", "v" }, "L", "L")
  end
end

toggle_colemak_mappings()
vim.keymap.set("n", "<leader>tc", toggle_colemak_mappings)

if is_wsl() then
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
