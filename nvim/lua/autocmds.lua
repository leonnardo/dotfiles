-- autocmds.lua

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('YankHighlight', {}),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Enable native LSP completion with autotrigger per buffer (not global)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('LspCompletion', {}),
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true })
  end,
})
