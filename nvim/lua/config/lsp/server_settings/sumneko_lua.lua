return {
  Lua = {
    diagnostics = {
      globals = {'vim'}
    },
    workspace = {
      library = {
        [vim.fn.expand("$VINRUNTIME/lua")] = true,
        [vim.fn.stdpath("config") .. "/lua"] = true,
      }
    }
  },
}
