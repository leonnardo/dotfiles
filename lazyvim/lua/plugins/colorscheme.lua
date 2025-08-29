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
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "base16-black-metal-dark-funeral",
      colorscheme = "rose-pine",
    },
  },
}
