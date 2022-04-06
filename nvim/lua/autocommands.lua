local M = {}
local langmap_group = vim.api.nvim_create_augroup("ChangeLangmap", { clear = true  })

_G.colemak = true
_G.colemak_toggle = false

M.toggle_colemak = function ()
  if _G.colemak_toggle then
    _G.colemak_toggle = false
  else
    _G.colemak_toggle = true
  end
end

local function toggle_langmap()
  if _G.colemak_toggle then
    if _G.colemak then
      vim.cmd[[set langmap=]]
      _G.colemak = false
    else
      vim.cmd[[set langmap=il,li,IL,LI,je,JE,ek,EK,kn,KN,nj,NJ]]
      _G.colemak = true
    end
  end
end


-- vim.api.nvim_create_autocmd("InsertEnter", { command = "set langmap=", group = langmap_group })
vim.api.nvim_create_autocmd("InsertEnter", { callback = toggle_langmap, group = langmap_group })
-- vim.api.nvim_create_autocmd("InsertLeave", { command = "set langmap=il,li,IL,LI,je,JE,ek,EK,kn,KN,nj,NJ", group = langmap_group })
vim.api.nvim_create_autocmd("InsertLeave", { callback = toggle_langmap, group = langmap_group })

return M
