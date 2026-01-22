# Agent Instructions

Global instructions for AI coding agents (Claude Code, OpenCode, Codex, etc.).

## Setup

### Claude Code

```bash
ln -sf ~/Projects/dotfiles/agent-instructions/AGENTS.md ~/.claude/CLAUDE.md
```

### OpenCode

OpenCode reads from `~/.config/opencode/AGENTS.md` or project-level files.

```bash
mkdir -p ~/.config/opencode
ln -sf ~/Projects/dotfiles/agent-instructions/AGENTS.md ~/.config/opencode/AGENTS.md
```

## Files

| File | Purpose |
|------|---------|
| `AGENTS.md` | Global instructions loaded in every session |

## How It Works

AI coding agents look for instruction files in standard locations:

- **Claude Code**: `~/.claude/CLAUDE.md` (global), `./CLAUDE.md` (project)
- **OpenCode**: `~/.config/opencode/AGENTS.md`, `./AGENTS.md`

These files tell the agent your preferences: communication style, code quality standards, tools to use, patterns to follow.

## Customization

Edit `AGENTS.md` to match your workflow. Common sections:

- **Communication style**: Concise vs detailed responses
- **Code quality**: Testing requirements, linting, error handling
- **Tools**: Which MCPs/plugins to prefer
- **Git**: Commit message format, workflow preferences

## Related

- [agent-skills](https://github.com/leonnardo/agent-skills) - Reusable skills for specific tasks (tmux, etc.)
