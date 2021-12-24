local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.opt.langmap = "il,li,IL,li,je,JE,ek,EK,kn,KN,nj,NJ"

-- Map leader to space
vim.g.mapleader = " "

map("n", "<esc>", ":noh<cr><esc>", { silent = true })

map("n", "<leader><Tab>", ":NvimTreeToggle<CR>", { silent = true })
map("n", ";", ":")
map("n", "<C-f>", "<cmd>lua require('config.telescope').find_in_local_file()<cr>")
map("n", "<leader>q", ":q<CR>")
map("n", "<leader>w", ":wa<CR>")
map("v", "<", "<gv", { silent = true })
map("v", ">", ">gv", { silent = true })

--  Comment.api
map("n", "<C-_>", "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>")
map("n", "<C-\\>", "<cmd>lua require('Comment.api').toggle_current_blockwise()<cr>")
map("x", "<C-_>", "<cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>")
map("x", "<C-\\>", "<cmd>lua require('Comment.api').toggle_blockwise_op(vim.fn.visualmode())<cr>")
