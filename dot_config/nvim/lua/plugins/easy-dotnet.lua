return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- Only load when explicitly calling :Dotnet commands
  cmd = { "Dotnet" },
  opts = {
    -- Disable easy-dotnet's built-in LSP since we use roslyn.nvim
    lsp = {
      enabled = false,
    },
    -- Disable background scanning to prevent slow startup on large solutions
    background_scanning = false,
    -- Disable auto namespace bootstrapping on new files
    auto_bootstrap_namespace = {
      enabled = false,
    },
    -- Disable csproj/fsproj keymappings if not needed
    csproj_mappings = false,
    fsproj_mappings = false,
    -- Disable test buffer execution (gutter signs in test files)
    test_runner = {
      enable_buffer_test_execution = false,
    },
  },
}
