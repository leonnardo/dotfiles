require('go').setup()

vim.api.nvim_command([[
  autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
]])
