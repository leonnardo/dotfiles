vim.api.nvim_create_autocmd("User", {
  pattern = "RoslynRestoreResult",
  callback = function(ev)
    local handle = handles[ev.data.token]
    handles[ev.data.token] = nil

    if handle then
      handle.message = ev.data.err and ev.data.err.message or "Restore completed"
      handle:finish()
    end
  end,
})
