return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettier = {
          command = vim.fn.expand("~/.local/share/nvim/mason/packages/prettier/node_modules/.bin/prettier"),
        },
      },
    },
  },
}
