local vo = vim.opt_local
vo.tabstop = 4
vo.shiftwidth = 4
vo.softtabstop = 4

require('dap-go').setup()

local wk = require("which-key")
local default_options = { silent = true }

wk.register({
	c = {
		name = "Coding",
		a = { "<cmd>GoAddTag<cr>", "Add tags to struct" },
		c = { "<cmd>GoCoverage<cr>", "Test coverage" },
		l = { "<cmd>GoLint<cr>", "Run linter" },
		r = { "<cmd>GoRun<cr>", "Run" },
		s = { "<cmd>GoFillStruct<cr>", "Autofill struct" },
		t = { "<cmd>GoTestFunc -F<cr>", "Run test for current function" },
	},
  d = {
    t = { "<cmd>lua require('dap-go').debug_test()<CR>", "Start debug the test"}
  }
}, { prefix = "<leader>", mode = "n", default_options })


