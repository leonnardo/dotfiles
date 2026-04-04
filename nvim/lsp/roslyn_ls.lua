-- lsp/roslyn_ls.lua — Roslyn C# LSP settings override
-- Server binary: dotnet tool install --global roslyn-language-server --prerelease
-- All other LSPs (gopls, pyright, yamlls, jsonls, dockerls) need zero config.
return {
  settings = {
    ['csharp|completion'] = {
      dotnet_provide_regex_completions = true,
      dotnet_show_completion_items_from_unimported_namespaces = true,
      dotnet_show_name_completion_suggestions = true,
    },
    ['csharp|background_analysis'] = {
      dotnet_analyzer_diagnostics_scope = 'openFiles',
      dotnet_compiler_diagnostics_scope = 'openFiles',
    },
  },
}
