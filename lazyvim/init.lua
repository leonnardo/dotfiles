-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("vscodenvim.keymaps")
  require("config.clipboard").setup()
else
  require("config.lazy")
end

vim.lsp.set_log_level(vim.log.levels.OFF)
