-- moving between splits
vim.keymap.set("n", "<C-left>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-down>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-up>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-right>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
