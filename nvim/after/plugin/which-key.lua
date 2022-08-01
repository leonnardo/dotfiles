local ok, whichkey = pcall(require, "which-key")

if not ok then
  return
end


local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}


local mappings = {
  ["b"] = {
    "<cmd>lua require('config.telescope').buffers()<cr>",
    "Buffers",
  },

  ["f"] = {
    "<cmd>lua require('config.telescope').find_files()<cr>",
    "Find files",
  },

  e = {
    name = "Editor Actions",
    q = { ":wqa<cr>", "Saves all buffers and quit" },
    c = { ":clo<cr>", "Close current window/pane" },
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
    d = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Document Diagnostics", },
    D = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics", },
    w = { "<cmd>TroubleToggle<cr>", "Workspace Diagnostics", },
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic", },
    e = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
  },

  s = {
    name = "Search",
    a = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    f = { "<cmd>lua require('config.telescope').find_in_local_file()<cr>" , "Find in Local File" },
  },

  t = {
    name = "Toggle",
    t = { "<cmd>NvimTreeToggle<cr>", "Toggle Tree" },
    e = { "<cmd>ToggleTerm<cr>", "Toggle Term" },
    g = { "<cmd>lua require('config.toggleterm_cfg').lazygit_toggle()<cr>", "Toggle Git" },
    r = { "<cmd>TroubleToggle<cr>", "Trouble" },
  },

  w = {
    name = "Window",
    q = { "<cmd>:q<cr>", "Close" },
    s = { "<cmd>:split<cr>", "Horizontal split"},
    v = { "<cmd>:vsplit<cr>", "Vertical split"},
    ["="] = { "<c-w>=", "Equally size"},
    p = { "<c-w>x", "Swap" },

  }
}

whichkey.setup()
whichkey.register(mappings, opts)

