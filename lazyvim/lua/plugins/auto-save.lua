local patterns = { "*.md" }

return {
  "okuuva/auto-save.nvim",
  version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
  opts = {
    noautocmd = true,
    trigger_events = {
      immediate_save = {
        { "BufLeave", pattern = patterns },
        { "FocusLost", pattern = patterns },
      },
      defer_save = {
        { "InsertLeave", pattern = patterns },
        { "TextChanged", pattern = patterns },
      },
      cancel_deferred_save = {
        { "InsertEnter", pattern = patterns },
      },
    },
  },
}
