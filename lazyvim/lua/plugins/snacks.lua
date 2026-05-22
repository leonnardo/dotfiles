return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      enabled = false,
      char = "┆",
      only_scope = true, -- only show indent guides for current scope
      only_current = true, -- only show indent guides for current line
    },
    scroll = {
      enabled = false, -- Disable smooth scrolling
    },
    gitbrowse = {
      url_patterns = {
        ["dev%.azure%.com"] = {
          -- https://dev.azure.com/{organization}/{project}/_git/{repository}?path=/file&version=GBbranch&line=1&lineEnd=15&lineStartColumn=1&lineEndColumn=1&lineStyle=plain&_a=contents
          file = function(fields)
            local function encode(value)
              return tostring(value):gsub("([^%w%-%._~])", function(char)
                return string.format("%%%02X", string.byte(char))
              end)
            end

            local file = fields.file or ""
            if file ~= "" and not file:match("^/") then
              file = "/" .. file
            end

            local version
            if fields.branch and fields.branch ~= "main" and fields.branch ~= "master" then
              local choice = vim.fn.confirm(
                "Azure DevOps branch for gitbrowse?",
                "&1 Branch principal\n&2 Branch checkoutada (" .. fields.branch .. ")",
                1
              )
              if choice == 2 then
                version = "GB" .. fields.branch
              end
            end

            local params = {
              path = file,
              version = version,
              lineStyle = "plain",
              _a = "contents",
            }

            -- Snacks always fills line_start/line_end, even in normal mode.
            -- Only send Azure line/column params when there is an actual visual selection.
            -- Column marks are 0-based in Neovim, while Azure DevOps expects 1-based columns.
            local visual_start = vim.api.nvim_buf_get_mark(0, "<")
            local visual_end = vim.api.nvim_buf_get_mark(0, ">")
            local has_selection = fields.line_start
              and fields.line_end
              and visual_start[1] == fields.line_start
              and visual_end[1] == fields.line_end
              and (fields.line_start ~= fields.line_end or visual_start[2] ~= visual_end[2])
            if has_selection then
              params.line = fields.line_start
              params.lineEnd = fields.line_end
              params.lineStartColumn = visual_start[2] + 1
              params.lineEndColumn = visual_end[2] + 1
            end

            local order =
              { "path", "version", "line", "lineEnd", "lineStartColumn", "lineEndColumn", "lineStyle", "_a" }
            local query = {}
            for _, key in ipairs(order) do
              if params[key] ~= nil then
                table.insert(query, key .. "=" .. encode(params[key]))
              end
            end
            return "?" .. table.concat(query, "&")
          end,
        },
      },
    },
    picker = {
      hidden = true,
      layout = {
        preset = "ivy",
      },
      formatters = {
        file = {
          filename_first = true,
          truncate = 80,
        },
      },
      sources = {
        buffers = {
          current = false,
        },
        explorer = {
          matcher = {
            fuzzy = true,
            smartcase = true,
            ignorecase = true,
          },
        },
      },
    },
  },
}
