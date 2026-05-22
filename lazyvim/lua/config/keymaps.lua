-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<C-left>", require("smart-splits").move_cursor_left)
map("n", "<C-down>", require("smart-splits").move_cursor_down)
map("n", "<C-up>", require("smart-splits").move_cursor_up)
map("n", "<C-right>", require("smart-splits").move_cursor_right)

map("n", "<C-h>", require("smart-splits").move_cursor_left)
map("n", "<C-j>", require("smart-splits").move_cursor_down)
map("n", "<C-k>", require("smart-splits").move_cursor_up)
map("n", "<C-l>", require("smart-splits").move_cursor_right)

map("x", "p", [["_dP]], { desc = "Paste over selection without without yanked text" })

-- Alt+Shift+N for previous jump
map("n", "<M-S-n>", "<C-o>", { desc = "Jump to previous location" })

-- Alt+Shift+I for next jump using direct jump list manipulation
vim.keymap.set("n", "<M-S-i>", "<Tab>", { desc = "Jump to next location" })

map("n", "<leader>rr", "<cmd>source %<cr>", { desc = "Source current file", silent = true })
map("n", "<leader>rl", "<cmd>.lua<cr>", { desc = "Execute current line", silent = true })
map("v", "<leader>rl", "<cmd>'<,'>lua<cr>", { desc = "Execute selected lines", silent = true })

-- find files in cwd using snacks.nvim
map("n", "<leader><space>", LazyVim.pick("files", { root = false }), { desc = "Find Files (cwd)" })
map("n", "<leader>/", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" })
map("n", "<leader>e", function()
  Snacks.explorer()
end, { desc = "Explorer (cwd)" })

map("n", "<leader>gr", "<cmd>CodeDiff<cr>", { desc = "CodeDiff" })

map("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

map("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart neovim" })
