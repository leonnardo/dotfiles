return {
  { "folke/tokyonight.nvim", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "rebelot/kanagawa.nvim", priority = 1000 },
  { "andreasvc/vim-256noir", priority = 1000 },
  { "ntk148v/komau.vim", priority = 1000 },
  { "p00f/alabaster.nvim", priority = 1000, cond = false },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      -- vim.g.tokyobones_transparent_background = true
      -- vim.cmd.colorscheme("tokyobones")
    end,
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    -- init = function()
    --   vim.cmd.colorscheme("lackluster")
    -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
    -- vim.cmd.colorscheme("lackluster-mint")
    -- end,
  },
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("base16-black-metal-dark-funeral")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      no_italic = true,
      term_colors = true,
      transparent_background = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
}
