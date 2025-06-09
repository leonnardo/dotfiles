return {
  root_markers = { ".csproj", ".sln", ".slnf", "Directory.Build.props" },
  filetypes = { "cs", "csharp", "c_sharp" },
  cmd = {
    "dotnet",
    "~/.local/lib/roslyn/Microsoft.CodeAnalysis.LanguageServer.dll",
    "--logLevel=Information",
    "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
    "--stdio",
  },
  settings = {
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = true,
    },
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "openFiles",
      dotnet_compiler_diagnostics_scope = "openFiles",
    },
    ["csharp|completion"] = {
      dotnet_show_completion_items_from_unimported_namespaces = true,
      dotnet_show_name_completion_suggestions = true,
    },
    ["csharp|symbol_search"] = {
      dotnet_search_reference_assemblies = true,
    },
    ["csharp|formatting"] = {
      dotnet_organize_imports_on_format = true,
    },
  },
}
