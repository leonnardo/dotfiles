" translate to telescope.lua https://github.com/alpha2phi/dotfiles/blob/main/config/nvim/lua/config/telescope.lua
lua << EOF
no_preview = function()
  return require('telescope.themes').get_dropdown({
    borderchars = {
      { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
      results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    },
    width = 0.8,
    previewer = false,
    prompt_title = false
  })
end

vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>lua require\"telescope.builtin\".find_files(no_preview())<cr>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua require\"telescope.builtin\".find_files(no_preview())<cr>', {noremap = true})
EOF

" Telescope mappings
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <C-b> <cmd>Telescope buffers<cr>

