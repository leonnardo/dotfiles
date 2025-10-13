local icons = LazyVim.config.icons

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    sections = {
      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
      },
      lualine_x = { "encoding" },
      lualine_y = { "fileformat" },
      lualine_z = { "location" },
    },
    winbar = {
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        {
          "filename",
          path = 1,
          shorting_target = 40,
          symbols = { modified = "[+]", readonly = "", unnamed = "[No name]" },
        },
      },
    },
    inactive_winbar = {
      lualine_c = {
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        {
          "filename",
          path = 1,
          shorting_target = 40,
          symbols = { modified = "[+]", readonly = "", unnamed = "[No name]" },
        },
      },
    },
  },
}
