require('lualine').setup{
  options = {
    theme = 'nightfox',
  },
  sections = {
    lualine_b = { 'filename', 'diff' },
    lualine_c = { 'diagnostics' },
    lualine_x = {'filetype', 'encoding'},
    lualine_y = { 'location' },
    lualine_z = { 'branch' }
  }
}

