local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local M = {}

M.buffers = function ()
  local opts = {
    previewer = false,
    layout_config = {
      mirror =  true,
      prompt_position = 'top',
    },
    layout_strategy = 'vertical',
    sorting_strategy = 'ascending',
    initial_mode = 'normal',
    sort_mru = true,
    ignore_current_buffer = true,
  }
    builtin.buffers(themes.get_dropdown(opts))
end

M.find_files = function ()
  local opts = {
    previewer = false,
    hidden = false,
  }
  builtin.find_files(themes.get_dropdown(opts))
end

M.find_in_local_file = function ( )
  local opts = {
    prompt_title = "Find in file",
    previewer = false,
    sorting_strategy = 'ascending',
    layout_config =  {
      prompt_position = 'top',
    },
  }

  builtin.current_buffer_fuzzy_find(themes.get_dropdown(opts))
end

return M
