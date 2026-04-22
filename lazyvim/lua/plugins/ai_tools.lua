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
}
