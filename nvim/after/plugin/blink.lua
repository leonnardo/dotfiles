vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpCompletionMenuOpen",
  callback = function()
    vim.b.copilot_suggestion_hidden = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpCompletionMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})
