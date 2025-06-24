return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      underline = {
        severity = {
          min = vim.diagnostic.severity.WARN,
        },
      },
      virtual_text = false,
      virtual_lines = false,
      -- virtual_lines = {
      --   current_line = true,
      -- },
    },
    log_level = vim.log.levels.OFF,
    servers = {
      omnisharp = {
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
          },
          MsBuild = {
            -- If true, MSBuild project system will only load projects for files that
            -- were opened in the editor. This setting is useful for big C# codebases
            -- and allows for faster initialization of code navigation features only
            -- for projects that are relevant to code that is being edited. With this
            -- setting enabled OmniSharp may load fewer projects and may thus display
            -- incomplete reference lists for symbols.
            LoadProjectsOnDemand = false,
          },
          RoslynExtensionsOptions = {
            -- Enables support for roslyn analyzers, code fixes and rulesets.
            EnableAnalyzersSupport = true,
            -- Enables support for showing unimported types and unimported extension
            -- methods in completion lists. When committed, the appropriate using
            -- directive will be added at the top of the current file. This option can
            -- have a negative impact on initial completion responsiveness,
            -- particularly for the first few completion sessions after opening a
            -- solution.
            EnableImportCompletion = true,
            -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
            -- true
            AnalyzeOpenDocumentsOnly = true,
          },
        },
      },
    },
  },
}
