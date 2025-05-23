local prompts = {
  -- Code related prompts
  Explain = "Please explain how the following code works.",
  Review = "Please review the following code and provide suggestions for improvement.",
  Tests = "Please explain how the selected code works, then generate unit tests for it.",
  Refactor = "Please refactor the following code to improve its clarity and readability.",
  FixCode = "Please fix the following code to make it work as intended.",
  FixError = "Please explain the error in the following text and provide a solution.",
  BetterNamings = "Please provide better names for the following variables and functions.",
  Documentation = "Please provide documentation for the following code.",

  -- Text related prompts
  Summarize = "Please summarize the following text.",
  Spelling = "Please correct any grammar and spelling errors in the following text.",
  Wording = "Please improve the grammar and wording of the following text.",
  Concise = "Please rewrite the following text to make it more concise.",
}

return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
        },
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "j-hui/fidget.nvim",
    },
    init = function()
      require("plugins.codecompanion.fidget-spinner"):init()
    end,
    config = true,
    opts = {
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-3.7-sonnet",
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "copilot",
        },
      },
      display = {
        chat = {
          show_settings = true,
          window = {
            opts = {
              breakindent = true,
              cursorcolumn = false,
              cursorline = false,
              foldcolumn = "0",
              linebreak = true,
              list = false,
              numberwidth = 1,
              signcolumn = "no",
            },
            layout = "float",
            width = 0.7,
          },
        },
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cond = false,
    branch = "main",
    lazy = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      show_help = true, -- Show help actions
      window = {
        layout = "float",
      },
      question_header = "  Me ",
      answer_header = "  Copilot ",
      auto_follow_cursor = false, -- Don't follow the cursor after getting response
      auto_insert_mode = false,
      selection = function(source)
        local select = require("CopilotChat.select")
        return select.visual(source) or select.buffer(source)
      end,
      mappings = {
        close = {
          normal = "<Esc>",
        },
        submit_prompt = {
          normal = "<CR>",
          insert = "<S-CR>",
        },
      },
    },
    keys = {
      {
        "<leader>aa",
        function()
          local chat = require("CopilotChat")
          chat.toggle({
            window = {
              layout = "vertical",
              width = 0.3,
            },
          })
        end,
        desc = "Toggle vertical split",
      },
      {
        "<leader>ai",
        mode = { "n", "v" },
        function()
          local chat = require("CopilotChat")
          chat.open({
            window = {
              layout = "float",
              relative = "cursor",
              width = 0.5,
              height = 0.2,
              row = 1,
              col = 0,
            },
          })
        end,
        desc = "Inline chat",
      },
      {
        "<leader>ac",
        "<cmd>CopilotChatCommit<CR>",
        desc = "Create commit message",
      },
    },
  },
}
