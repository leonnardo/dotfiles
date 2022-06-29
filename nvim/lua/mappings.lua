local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Map leader to space
vim.g.mapleader = " "

map("n", "<esc>", ":noh<cr><esc>", { silent = true })

map("n", ";", ":")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>w", ":wa<CR>")
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })
map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

--  Comment.api
map("n", "<C-_>", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>")
map("n", "<C-\\>", "<cmd>lua require('Comment.api').toggle_current_blockwise()<cr>")
map("x", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>")
map("x", "<C-\\>", "<esc><cmd>lua require('Comment.api').toggle_blockwise_op(vim.fn.visualmode())<cr>")

-- toggle langmap
map("n", "<leader>tl", "<cmd>lua require('autocommands').toggle_colemak()<cr>")

