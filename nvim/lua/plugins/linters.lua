return {
  "mfussenegger/nvim-lint",
  event = { "LspAttach" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      python = { "ruff" },
      lua = { "selene" },
      sh = { "shellcheck" },
      yaml = { "yamllint" },
      -- cs = { "csharpier" },
    }

    local yamllint = lint.linters.yamllint
    yamllint.args = { "-c", "$HOME/src/dotfiles/yamllint/config.yaml" }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
