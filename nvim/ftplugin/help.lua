vim.cmd("wincmd K")
local total_lines = vim.api.nvim_buf_line_count(0)
local height = math.min(total_lines, 20)
vim.cmd("resize " .. height)

-- vim.opt_local.textwidth = 80
vim.opt_local.wrap = true
vim.opt_local.wrapmargin = 2
vim.opt_local.linebreak = true
vim.opt_local.fillchars = { eob = " " }
vim.keymap.set("n", "<Esc>", ":close<CR>", { buffer = true, silent = true })

-- Text formatting and centering
local opt = vim.opt_local
opt.textwidth = 80
opt.wrap = true
opt.wrapmargin = 2
opt.fillchars = { eob = " " }
opt.conceallevel = 2
