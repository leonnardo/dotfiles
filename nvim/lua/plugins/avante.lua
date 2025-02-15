return {
  "yetone/avante.nvim",
  cmd = { "AvanteAsk", "AvanteToggle", "AvanteChat" },
  keys = {
    { "<leader>aa", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante" },
  },
  version = false, -- set this if you want to always pull the latest change
  enabled = true,
  opts = {
    provider = "copilot",
    copilot = {
      model = "claude-3.5-sonnet", -- your desired model (or use gpt-4o, etc.)
    },
    vendors = {
      ["copilot-o3-mini"] = {
        __inherited_from = "copilot",
        model = "o3-mini",
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
