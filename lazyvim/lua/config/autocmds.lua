-- vim.api.nvim_create_autocmd("User", {
--   pattern = "RoslynRestoreResult",
--   callback = function(ev)
--     local handle = handles[ev.data.token]
--     handles[ev.data.token] = nil
--
--     if handle then
--       handle.message = ev.data.err and ev.data.err.message or "Restore completed"
--       handle:finish()
--     end
--   end,
-- })

local ignore_filetypes = { "neo-tree" }
local ignore_buftypes = { "nofile", "prompt", "popup" }

local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

vim.api.nvim_create_autocmd("WinEnter", {
  group = augroup,
  callback = function(_)
    if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
      vim.w.focus_disable = true
    else
      vim.w.focus_disable = false
    end
  end,
  desc = "Disable focus autoresize for BufType",
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  callback = function(_)
    if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
      vim.b.focus_disable = true
    else
      vim.b.focus_disable = false
    end
  end,
  desc = "Disable focus autoresize for FileType",
})

-- Relative line numbers only in normal mode for currently focused window
local numbergroup = vim.api.nvim_create_augroup("NumberToggle", {})
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" }, {
  group = numbergroup,
  callback = function()
    if vim.wo.number and vim.api.nvim_get_mode().mode ~= "i" then
      vim.wo.relativenumber = true
    end
    -- if not vim.wo.number and not vim.wo.relativenumber then
    --   vim.wo.number = true
    --   vim.wo.relativenumber = true
    -- end
  end,
  desc = "Enable line numbers",
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" }, {
  group = numbergroup,
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
      vim.cmd("redraw")
    end
    -- if vim.wo.number and vim.wo.relativenumber and not vim.w.focus_disable and not vim.b.focus_disable then
    --   vim.wo.number = false
    --   vim.wo.relativenumber = false
    -- end
  end,
  desc = "Disable line numbers",
})
