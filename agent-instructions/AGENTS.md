## Environment

- Running in Arch Linux, WSL
- Main shell: zsh
- Terminal multiplexer: tmux
- Programming language runtime manager: mise

## Tools available

**Preferable** to use these tools, instead of default tools:
- ripgrep (rg) vs grep
- fd-find (fd) vs find

## Code Intelligence

Prefer LSP over Grep/Read for code navigation — it's faster, precise, and avoids reading entire files:
- `workspaceSymbol` to find where something is defined
- `findReferences` to see all usages across the codebase
- `goToDefinition` / `goToImplementation` to jump to source
- `hover` for type info without reading the file

Use Grep only when LSP isn't available or for text/pattern searches (comments, strings, config).

After writing or editing code, check LSP diagnostics and fix errors before proceeding.

## Notes

- Notes are indexed by `qmd`. Use `qmd` plugin to search in notes.
- Notes are stored in `$HOME/Documents/SecondBrain`

## Decision Making

- When multiple valid approaches exist, ask before choosing
- State assumptions explicitly when making non-obvious choices
- Don't guess requirements - ask

## Honesty

- Disagree when user is technically wrong
- Maintain position when correct, even if challenged
- No flattery or excessive praise

## Git

- Use squash-friendly, terse commit messages (<50 chars)
- Always rebase onto master/main, never merge — keep linear history
- To sync with upstream: `git fetch origin && git rebase origin/master`
