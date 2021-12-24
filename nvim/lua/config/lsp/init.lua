local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

require("config.lsp.installer")
require("config.lsp.handlers").setup()
