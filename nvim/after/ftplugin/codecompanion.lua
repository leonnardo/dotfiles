local group = vim.api.nvim_create_augroup("CodeCompanionHooks", { clear = true })

vim.api.nvim_create_autocmd({ "User" }, {
  group = group,
  pattern = "CodeCompanionChatOpened",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})
