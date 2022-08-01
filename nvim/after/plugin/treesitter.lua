require'nvim-treesitter.configs'.setup {
  ensure_installed = { "go", "lua", "proto", "python", "yaml"},
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  playground = {
    enable = true,
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  },
  rainbow = {
    enable = true
  }
}
