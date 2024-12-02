vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local opts = { silent = true }
map("n", "qq", "<cmd>q<cr>", { desc = "Quit" })
map("v", ">", ">gv", { silent = true })
map("v", "<", "<gv", { silent = true })
-- map("v", "<Tab>", ">gv", { silent = true })
-- map("v", "<S-Tab>", "<gv", { silent = true })
map({ "n", "v" }, "<Up>", "g<Up>", opts)
map({ "n", "v" }, "<Down>", "g<Down>", opts)

-- pane management (move, open, close)
map("n", "<C-Left>", "<C-w>h", { desc = "Move to the left pane", silent = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Move to the right pane", silent = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Move to the up pane", silent = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Move to the down pane", silent = true })
map("n", "<leader>ws", "<cmd>split<cr>", { desc = "Split pane horizontally", silent = true })
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Split pane vertically", silent = true })

-- buffer management (close, delete, last)
map("n", "<leader>xx", "<cmd>clo<cr>", { desc = "Close window", silent = true })
map("n", "<leader>bl", "<cmd>e #<cr>", { desc = "Open last buffer", silent = true })
map("n", "<BS>", "<cmd>e #<cr>", { desc = "Open last buffer", silent = true })

map("n", "<leader>tl", " <cmd>Lazy<cr>", { desc = "Toggle Lazy", silent = true })
map("n", "<leader>tm", " <cmd>Mason<cr>", { desc = "Toggle Mason", silent = true })
map("n", "<leader>ts", " <cmd>ASToggle<cr>", { desc = "Toggle Auto Save", silent = true })
