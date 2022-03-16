local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.api.nvim_set_var('colemak', true)
vim.opt.langmap = "il,li,IL,LI,je,JE,ek,EK,kn,KN,nj,NJ"

-- Map leader to space
vim.g.mapleader = " "

map("n", "<esc>", ":noh<cr><esc>", { silent = true })

map("n", ";", ":")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>w", ":wa<CR>")
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })
map("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
map("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })

--  Comment.api
map("n", "<C-_>", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>")
map("n", "<C-\\>", "<cmd>lua require('Comment.api').toggle_current_blockwise()<cr>")
map("x", "<C-_>", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>")
map("x", "<C-\\>", "<esc><cmd>lua require('Comment.api').toggle_blockwise_op(vim.fn.visualmode())<cr>")

-- Easy split navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-n>", "<C-w>j")
map("n", "<C-e>", "<C-w>k")
map("n", "<C-i>", "<C-w>l")
map("n", "<C-l>", "<C-w>w")

-- toggle langmap
map("n", "<leader>z", ':set langmap=il,li,IL,LI,je,JE,ek,EK,kn,KN,nj,NJ<cr>')
map("n", "<leader>c", ':set langmap=<cr>')

