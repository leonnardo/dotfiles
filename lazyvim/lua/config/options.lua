-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
require("config.clipboard").setup()

vim.g.ai_cmp = false
vim.opt.cursorline = false -- Disable cursor line highlighting
vim.g.snacks_animate = false
vim.opt.fillchars:append({ diff = " " })

local markdown_window_options = vim.api.nvim_create_augroup("MarkdownWindowOptions", { clear = true })

vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter", "WinEnter" }, {
  group = markdown_window_options,
  callback = function()
    if vim.bo.filetype ~= "markdown" then
      return
    end

    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.wo.wrap = false
  end,
  desc = "Disable line numbers and wrap for Markdown",
})
