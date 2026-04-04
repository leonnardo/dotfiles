return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false, -- Disable inlay hints by default
    },
    diagnostics = {
      underline = {
        severity = {
          min = vim.diagnostic.severity.WARN,
        },
      },
      virtual_text = false,
      virtual_lines = false,
      -- virtual_lines = {
      --   current_line = true,
      -- },
    },
    log_level = vim.log.levels.OFF,
    servers = {
      omnisharp = {
        enabled = false,
      },
    },
  },
}
