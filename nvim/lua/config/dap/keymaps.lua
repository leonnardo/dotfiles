local wk = require('which-key')
local opts = { prefix = "<leader>", mode = "n", { silent = true } }

wk.register({
  d = {
    name = "Debug",
    n = {"<cmd>DapStepOver<CR>", "Step over"},
    i = {"<cmd>DapStepInto<CR>", "Step into"},
    o = {"<cmd>DapStepOut<CR>", "Step out"},
    c = {"<cmd>DapContinue<CR>", "Continue"},
    b = {"<cmd>DapToggleBreakpoint<CR>", "Toggle breakpoint"},
    B = {":lua require'dap'.set_breakpoint(vim.fn.input('Condition: '))<CR>", "Toggle conditional breakpoint"}
  }
}, opts)

