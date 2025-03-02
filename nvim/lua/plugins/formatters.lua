return {
  "stevearc/conform.nvim",
  event = { "BufReadPre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = function()
    vim.api.nvim_create_user_command("ToggleAutoformat", function(args)
      local opts = vim.g
      local toggle_for_buffer = false
      if args.bang then
        opts = vim.b
        toggle_for_buffer = true
      end
      opts.disable_autoformat = not opts.disable_autoformat
      if toggle_for_buffer then
        Snacks.notify.info("Autoformat for buffer " .. (opts.disable_autoformat and "disabled" or "enabled"))
      else
        Snacks.notify.info("Autoformat " .. (opts.disable_autoformat and "disabled" or "enabled"))
      end
    end, {
      desc = "Toggle Autoformat on save",
      bang = true,
    })

    return {
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
      formatters = {
        prettier = function(bufnr)
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          local config = vim.fs.find(".prettierrc", { path = vim.fn.stdpath("config") })[1]
          local default = require("conform.formatters.prettier")
          if config then
            return vim.tbl_deep_extend("force", default, {
              args = { "--stdin-filepath", "$FILENAME", "--config", config },
            })
          end
        end,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        html = { "prettier" },
        yaml = { "prettier" },
      },
    }
  end,
}
