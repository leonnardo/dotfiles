return {
  { "RRethy/base16-nvim" },
  { "metalelf0/black-metal-theme-neovim" },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = true,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "night",
      transparent = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "base16-black-metal-dark-funeral",
      colorscheme = "tokyonight-night",
    },
  },
}
