local M = {}
require('toggleterm').setup()
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ 
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  float_opts = {
    border = "double"
  }
})

M.lazygit_toggle = function()
  lazygit:toggle()
end

return M
