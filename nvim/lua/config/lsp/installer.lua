local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.setup()
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  local opts = {
    on_attach = require("config.lsp.handlers").on_attach,
    capabilities = require("config.lsp.handlers").capabilities
  }

  local ok, custom_server_opts = pcall(require,"config.lsp.settings." .. server.name)
  if ok then
    opts = vim.tbl_deep_extend("force", custom_server_opts, opts)
  end

  lspconfig[server.name].setup(opts)
end
