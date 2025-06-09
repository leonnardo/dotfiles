-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- map("n", "<C-Up>", "<C-w>k", { desc = "Increase Window Height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
--

map("n", "<C-left>", require("smart-splits").move_cursor_left)
map("n", "<C-down>", require("smart-splits").move_cursor_down)
map("n", "<C-up>", require("smart-splits").move_cursor_up)
map("n", "<C-right>", require("smart-splits").move_cursor_right)

map("n", "<C-n>", require("smart-splits").move_cursor_left)
map("n", "<C-e>", require("smart-splits").move_cursor_down)
map("n", "<C-u>", require("smart-splits").move_cursor_up)
map("n", "<C-i>", require("smart-splits").move_cursor_right)

-- Alt+Shift+N for previous jump
vim.keymap.set("n", "<M-S-n>", "<C-o>", { desc = "Jump to previous location" })

-- Alt+Shift+I for next jump using direct jump list manipulation
vim.keymap.set("n", "<M-S-i>", "<Tab>", { desc = "Jump to next location" })

map("n", "<leader>rr", "<cmd>source %<CR>", { desc = "Source current file", silent = true })
map("n", "<leader>rl", "<cmd>.lua<CR>", { desc = "Execute current line", silent = true })
map("v", "<leader>rl", "<cmd>'<,'>lua<CR>", { desc = "Execute selected lines", silent = true })

-- find files in cwd using snacks.nvim
map("n", "<leader><space>", LazyVim.pick("files", { root = false }), { desc = "Find Files (cwd)" })
map("n", "<leader>/", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })
map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "Explorer (cwd)" })
