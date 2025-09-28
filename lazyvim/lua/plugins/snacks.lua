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
      enabled = false,  -- Disable smooth scrolling
    },
    gitbrowse = {
      url_patterns = {
        ["dev%.azure%.com"] = {
          -- https://dev.azure.com/{organization}/{project}/_git/{project}/?path={file}&version=GB{branch}&line=1&lineEnd=15&lineStartColumn=1&lineEndColumn=1&lineStyle=plain&_a=contents
          file = function(fields)
            local params = {}
            params["path"] = fields.file or ""
            if fields.branch and fields.branch ~= "main" and fields.branch ~= "master" then
              params["version"] = fields.branch
            end
            if fields.line_start and fields.line_end and fields.line_start ~= fields.line_end then
              params["line"] = tostring(fields.line_start)
              params["lineEnd"] = tostring(fields.line_end)
            end
            -- Check if in visual mode and get selection columns
            local mode = vim.api.nvim_get_mode().mode
            if mode == "v" or mode == "V" or mode == "\22" then
              local pos_start = vim.api.nvim_buf_get_mark(0, "<")[1]
              local pos_end = vim.api.nvim_buf_get_mark(0, ">")[1]
              params["lineStartColumn"] = tostring(pos_start)
              params["lineEndColumn"] = tostring(pos_end)
            end
            local url = "?"
              .. table.concat(
                vim.tbl_map(function(k)
                  return k .. "=" .. vim.fn.escape(params[k], "#?&=")
                end, vim.tbl_keys(params)),
                "&"
              )
            return url
          end,
        },
      },
    },
    picker = {
      hidden = true,
      formatters = {
        file = {
          filename_first = true,
          truncate = 80,
        },
      },
      sources = {
        grep = {
          layout = {
            preset = "vertical",
          },
        },
        buffers = {
          current = false,
        },
      },
    },
  },
}
