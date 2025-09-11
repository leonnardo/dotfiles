-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function()
--     local opts = {
--       focusable = false,
--       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--       border = "rounded",
--       source = "always",
--       prefix = " ",
--       scope = "line",
--     }
--     if vim.diagnostic.is_enabled() then
--       vim.diagnostic.open_float(nil, opts)
--     end
--   end,
-- })

-- roslyn codelens refresh
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    for _, client in pairs(clients) do
      if client.name == "roslyn" then
        vim.lsp.codelens.refresh({ bufnr = bufnr })
      end
    end
  end,
})

-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--   pattern = "*",
--   callback = function()
--     local clients = vim.lsp.get_clients({ name = "roslyn" })
--     if not clients or #clients == 0 then
--       return
--     end
--
--     local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
--     local buffers = vim.lsp.get_buffers_by_client_id(ctx.client_id)
--     for _, buf in ipairs(buffers) do
--       local params = { textDocument = vim.lsp.util.make_text_document_params(buf) }
--       client:request("textDocument/diagnostic", params, nil, buf)
--     end
--   end,
-- })

local handles = {}

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "RoslynRestoreProgress",
--   callback = function(ev)
--     local token = ev.data.params[1]
--     local handle = handles[token]
--     if handle then
--       handle:report({
--         title = ev.data.params[2].state,
--         message = ev.data.params[2].message,
--       })
--     else
--       handles[token] = require("fidget.progress").handle.create({
--         title = ev.data.params[2].state,
--         message = ev.data.params[2].message,
--         lsp_client = {
--           name = "roslyn",
--         },
--       })
--     end
--   end,
-- })

vim.api.nvim_create_autocmd("User", {
  pattern = "RoslynRestoreResult",
  callback = function(ev)
    local handle = handles[ev.data.token]
    handles[ev.data.token] = nil

    if handle then
      handle.message = ev.data.err and ev.data.err.message or "Restore completed"
      handle:finish()
    end
  end,
})
