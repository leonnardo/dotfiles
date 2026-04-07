local M = {}

local function clipboard_provider()
  if vim.env.TMUX then
    return {
      name = "tmux",
      copy = {
        ["+"] = { "tmux", "load-buffer", "-w", "-" },
        ["*"] = { "tmux", "load-buffer", "-w", "-" },
      },
      paste = {
        ["+"] = { "bash", "-lc", "tmux save-buffer -" },
        ["*"] = { "bash", "-lc", "tmux save-buffer -" },
      },
      cache_enabled = 0,
    }
  end

  if vim.env.WSL_DISTRO_NAME then
    return {
      name = "win32yank-wsl",
      copy = {
        ["+"] = { "win32yank.exe", "-i", "--crlf" },
        ["*"] = { "win32yank.exe", "-i", "--crlf" },
      },
      paste = {
        ["+"] = { "win32yank.exe", "-o", "--lf" },
        ["*"] = { "win32yank.exe", "-o", "--lf" },
      },
      cache_enabled = 0,
    }
  end

  if vim.fn.executable("wl-copy") == 1 and vim.fn.executable("wl-paste") == 1 then
    return {
      name = "wayland",
      copy = {
        ["+"] = { "wl-copy", "--foreground", "--type", "text/plain" },
        ["*"] = { "wl-copy", "--foreground", "--primary", "--type", "text/plain" },
      },
      paste = {
        ["+"] = { "wl-paste", "--no-newline" },
        ["*"] = { "wl-paste", "--no-newline", "--primary" },
      },
      cache_enabled = 0,
    }
  end
end

function M.setup()
  vim.g.clipboard = clipboard_provider()
  vim.opt.clipboard = "unnamedplus"
end

return M
