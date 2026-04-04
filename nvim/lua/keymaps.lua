-- keymaps.lua — Custom keybindings
-- LSP defaults (0.12): gra, grn, grr, gri, grt, grx, gO, K, <C-S>

-- Smart-splits: navigate between splits (tmux-aware)
local splits = require('smart-splits')
vim.keymap.set('n', '<C-Left>', splits.move_cursor_left)
vim.keymap.set('n', '<C-Down>', splits.move_cursor_down)
vim.keymap.set('n', '<C-Up>', splits.move_cursor_up)
vim.keymap.set('n', '<C-Right>', splits.move_cursor_right)

-- Snacks picker
vim.keymap.set('n', '<leader><space>', function() Snacks.picker.files() end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>/', function() Snacks.picker.grep() end, { desc = 'Grep' })
vim.keymap.set('n', '<leader>e', function() Snacks.picker.explorer() end, { desc = 'Explorer' })
