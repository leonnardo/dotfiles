return {
  "folke/trouble.nvim",
  opts = {
    mode = "document_diagnostics",
    auto_close = true,
    focus = true,
    preview = {
      type = "float",
      relative = "editor",
      border = "rounded",
      title = "Preview",
      title_pos = "center",
      position = { 0.7, 1 },
      size = { width = 0.3, height = 0.3 },
      zindex = 200,
    },
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>cd",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Toggle diagnostics",
    },
  },
}
