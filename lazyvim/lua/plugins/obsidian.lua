return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = false,
  opts = {
    ui = {
      enable = false,
    },
    legacy_commands = false,
    workspaces = {
      {
        name = "second-brain",
        path = "~/Documents/SecondBrain",
      },
    },
    daily_notes = {
      folder = "05-log/daily",
      date_format = "YYYY-MM-DD",
      template = "daily-log.md",
      default_tags = {},
    },
    frontmatter = {
      enabled = false,
    },
    templates = {
      folder = "07-metadata/templates",
      date_format = "YYYY-MM-DD",
      time_format = "HH:mm",
    },
    picker = {
      name = "snacks.picker",
    },
  },
}
