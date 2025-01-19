return {
  "saghen/blink.cmp",
  lazy = false,
  event = "InsertEnter",
  version = "*",
  opts_extend = { "sources.default" },
  dependencies = {
    { "L3MON4D3/LuaSnip", version = "v2.*" },
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
    { "saghen/blink.compat", version = "*", opts = { impersonate_nvim_cmp = true } },
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = {
        function(cmp)
          return cmp.select_next()
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = {
        function(cmp)
          return cmp.select_prev()
        end,
        "snippet_backward",
        "fallback",
      },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-Up>"] = { "scroll_documentation_up", "fallback" },
      ["<C-Down>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      keyword = {
        range = "full",
      },
      menu = {
        auto_show = function(ctx)
          return ctx.mode ~= "cmdline"
        end,
        border = "rounded",
        scrollbar = false,
      },
      trigger = {
        show_in_snippet = false,
      },
      list = {
        selection = {
          preselect = function(ctx)
            return ctx.mode ~= "cmdline" and not require("blink.cmp").snippet_active({ direction = 1 })
          end,
          auto_insert = function(ctx)
            return ctx.mode == "cmdline"
          end,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        update_delay_ms = 50,
        treesitter_highlighting = true,
        window = {
          border = "rounded",
        },
      },
    },
    snippets = {
      preset = "luasnip",
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
    sources = {
      default = { "lazydev", "lsp", "snippets", "path", "codecompanion", "buffer" },
      cmdline = function()
        local type = vim.fn.getcmdtype()
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        if type == ":" then
          return { "cmdline" }
        end
        return {}
      end,
      providers = {
        lsp = {
          min_keyword_length = 2,
          score_offset = 0,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
        path = {
          min_keyword_length = 1,
        },
        snippets = {
          min_keyword_length = 2,
        },
        buffer = {
          min_keyword_length = 4,
          max_items = 5,
        },
      },
    },
  },
}
