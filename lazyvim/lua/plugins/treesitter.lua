return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        -- Disable treesitter for large files and generated files
        disable = function(_, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local filepath = vim.api.nvim_buf_get_name(buf)

          -- Disable for files in obj/ or bin/ directories (generated code)
          if filepath:match("/obj/") or filepath:match("/bin/") then
            return true
          end

          -- Disable for very large files
          local ok, stats = pcall(vim.uv.fs_stat, filepath)
          if ok and stats and stats.size > max_filesize then
            return true
          end

          return false
        end,
      },
    },
  },
}
