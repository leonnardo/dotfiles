return {
  root_markers = { ".csproj", ".sln", ".slnf", "Directory.Build.props" },
  filetypes = { "cs" },
  settings = {
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = false,
      dontnet_enable_tests_code_lens = false,
    },
    ["csharp|background_analysis"] = {
      dotnet_analyzer_diagnostics_scope = "fullSolution",
      dotnet_compiler_diagnostics_scope = "fullSolution",
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
