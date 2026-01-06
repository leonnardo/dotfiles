return {
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      "copilotlsp-nvim/copilot-lsp",
    },
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = false,
      },
      nes = {
        enabled = false,
        auto_trigger = true,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "claude-sonnet-4",
      window = {
        width = 0.35, -- fractional width of parent, or absolute width in columns when > 1
      },
      auto_insert_mode = true,
      headers = {
        user = "👤 Me",
        assistant = " Copilot",
        tool = "🔧 Tool",
      },
      separator = "━━",
      auto_fold = true, -- Automatically folds non-assistant messages
    },
  },
}
