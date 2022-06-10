local M = {}
local opts = {}

local get_default_options = function ()
  return {
    enable = false,
    toggled = false
  }
end

local toggle = function ()
  if opts.enable then
    if opts.toggled then
      vim.opt.langmap=""
      print("test!")
    else
      vim.opt.langmap="il,li,IL,LI,je,JE,ek,EK,kn,KN,nj,NJ"
      print("test!!!!")
    end
  end
end

M.setup = function(options)
  local user_opts = options or {}
  opts = vim.tbl_extend('force', get_default_options(), user_opts)
  if opts.enable then
    vim.opt.langmap="il,li,IL,LI,je,JE,ek,EK,kn,KN,nj,NJ"
  end
end

-- vim.api.nvim_create_autocmd("InsertEnter", { command = "set langmap=", group = langmap_group }) vim.api.nvim_create_autocmd("InsertEnter", { callback = toggle_langmap, group = langmap_group })
-- vim.api.nvim_create_autocmd("InsertLeave", { command = "set langmap=il,li,IL,LI,je,JE,ek,EK,kn,KN,nj,NJ", group = langmap_group })
local langmapGroup = vim.api.nvim_create_augroup("ChangeLangmap", { clear = true  })
vim.api.nvim_create_autocmd({"InsertEnter", "InsertLeave"}, { callback = toggle, group = langmapGroup })

return M
