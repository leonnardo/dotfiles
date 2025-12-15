-- Track Roslyn startup time
local roslyn_start_time = nil

return {
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      filewatching = "roslyn",
      -- Prefer .Dev.sln files when available for faster load times
      choose_target = function(targets)
        -- Prioritize .Dev.sln > .slnf > .sln for fastest loading
        local dev_sln = vim.iter(targets):find(function(t)
          return t:match("%.Dev%.sln$")
        end)
        if dev_sln then
          return dev_sln
        end
        local slnf = vim.iter(targets):find(function(t)
          return t:match("%.slnf$")
        end)
        if slnf then
          return slnf
        end
        -- Fall back to first target (usually .sln)
        return targets[1]
      end,
      -- Disable broad search for faster startup on large solutions
      broad_search = false,
    },
    config = function(_, opts)
      require("roslyn").setup(opts)

      -- Track when Roslyn starts initializing
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "roslyn" then
            if not roslyn_start_time then
              roslyn_start_time = vim.uv.hrtime()
              vim.notify("Roslyn LSP attached, waiting for initialization...", vim.log.levels.INFO)
            end
          end
        end,
      })

      -- Track when Roslyn finishes loading the solution
      vim.api.nvim_create_autocmd("User", {
        pattern = "RoslynInitialized",
        callback = function()
          if roslyn_start_time then
            local elapsed = (vim.uv.hrtime() - roslyn_start_time) / 1e9
            vim.notify(string.format("Roslyn fully initialized in %.2f seconds", elapsed), vim.log.levels.INFO)
            roslyn_start_time = nil
          end
        end,
      })
    end,
  },
}
