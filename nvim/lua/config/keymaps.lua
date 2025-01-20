vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local opts = { silent = true }

map({ "n", "v" }, ";", ":", { desc = "Command" })
map("n", "<leader>qa", "<cmd>wqa!<cr>", { desc = "Quit" })
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
map("v", ">", ">gv", { silent = true })
map("v", "<", "<gv", { silent = true })
map({ "n", "v" }, "<Up>", "g<Up>", opts)
map({ "n", "v" }, "<Down>", "g<Down>", opts)

map({ "n", "i" }, "<C-e>", "<C-d>zz", { desc = "Scroll downwards" })
map({ "n", "i" }, "<C-u>", "<C-u>zz", { desc = "Scroll upwards" })

-- improve delettion moves
map("n", "<BS>", "x", { desc = "Delete backwards" })
map({ "n", "v" }, "x", "d")
map("n", "xx", "dd")
map("n", "X", "D")
map({ "n", "v" }, "<leader>p", '"0p')
map({ "n", "v" }, "<leader>P", '"0P')
map({ "n", "v" }, "d", '"_d')
map({ "n", "v" }, "c", '"_c')

-- pane management (move, open, close)
map("n", "<leader>ws", "<cmd>split<cr>", { desc = "Split pane horizontally", silent = true })
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Split pane vertically", silent = true })
map("n", "<leader>ww", "<cmd>up<cr>", { desc = "Save current buffer", silent = true })
map("n", "<leader>wa", "<cmd>wa<cr>", { desc = "Save all opened buffers", silent = true })

-- buffer management (close, delete, last)
map("n", "<leader>xx", "<cmd>clo<cr>", { desc = "Close window", silent = true })

map("n", "<leader>tl", " <cmd>Lazy<cr>", { desc = "Toggle Lazy", silent = true })
map("n", "<leader>tm", " <cmd>Mason<cr>", { desc = "Toggle Mason", silent = true })
map("n", "<leader>ts", " <cmd>ASToggle<cr>", { desc = "Toggle Auto Save", silent = true })

map("n", "<leader>tt", function()
  vim.cmd.new()
  vim.cmd.term()
  vim.api.nvim_win_set_height(0, 15)
  vim.cmd("startinsert")
end)

map("n", "<leader>th", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Code Companion", silent = true })

map("n", "<leader>rr", "<cmd>source %<CR>", { desc = "Sourceconfig", silent = true })
map("n", "<leader>rl", "<cmd>.lua<CR>", { desc = "Execute current line", silent = true })
map("v", "<leader>rl", "<cmd>'<,'>lua<CR>", { desc = "Execute selected lines", silent = true })
