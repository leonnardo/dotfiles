local ok, tmux = pcall(require, "tmux")
if not ok then
  return
end

tmux.setup({
    copy_sync = {
        -- enables copy sync and overwrites all register actions to
        -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
        enable = true,
    },
})

local opts = { silent = true, nowait = true }
vim.keymap.set('n', '<C-Left>', "<cmd>lua require('tmux').move_left()<CR>", opts)
vim.keymap.set('n', '<C-Right>', "<cmd>lua require('tmux').move_right()<CR>", opts)
vim.keymap.set('n', '<C-Up>', "<cmd>lua require('tmux').move_top()<CR>", opts)
vim.keymap.set('n', '<C-Down>', "<cmd>lua require('tmux').move_bottom()<CR>", opts)

