# Global Instructions

## Efficiency

- Use `Task` tool with `subagent_type=Explore` for codebase exploration
- Use subagents in parallel when tasks are independent
- Batch tool calls - make all independent calls in a single message
- Run verbose commands in background (`run_in_background: true`)
- Context7 MCP first for library/framework docs

## Style

- Minimal explanations - code speaks
- No unsolicited refactoring or future-proofing
- No new files unless necessary - edit existing

## Decision Making

- When multiple valid approaches exist, ask before choosing
- State assumptions explicitly when making non-obvious choices
- Don't guess requirements - ask

## Honesty

- Disagree when user is technically wrong
- No flattery or excessive praise
- Maintain position when correct, even if challenged

## Code

- Run formatters/linters after changes
- Simplify: ask "can this be simpler?" before finalizing
- No console.log for debugging - use structured logging

## Tests

- Write tests for new code/changes
- Prefer unit tests; integration only when necessary
- Follow existing test patterns in the project
- Run tests before committing

## Shell (zsh)

- Use `jq` for JSON, `yq` for YAML - never parse with Python scripts
- Always use single quotes for filters: `jq '.key'`, `yq '.key'`
- Handle nulls: `.key // ""` or `.key?`
- Escape `$` in filters or use single quotes
- For complex filters, prefer heredoc over nested quotes
- When JSON contains file content as escaped string, extract with `jq -r` to /tmp before analyzing

## Git

- Squash-friendly, terse commit messages (<50 chars)
- PR descriptions: detailed summary
- Never add Co-Authored-By to commit messages

## Debugging

- Always reproduce the error first before proposing fixes
- Show exact error messages in responses, not summaries
- Use systematic-debugging skill for non-trivial bugs
- Don't guess root cause - trace the actual execution path

## Plan Mode

Use `EnterPlanMode` for:

- Multi-file changes or new features
- Architectural decisions with multiple approaches
- Any change touching >3 files

Skip for: single-file fixes, obvious bugs, small tweaks.

## Complex Reasoning

- Use `Task` tool with `subagent_type=Plan` for architectural tradeoffs and multi-step reasoning
- When stuck on a problem, spawn a Plan agent to break it down before acting

## Azure DevOps

- NEVER call Azure DevOps MCP tools directly - use `azure-devops-fetcher` agent
- Prompt must specify fields to return (use templates from /azure-devops skill)
- `pipelines_run_pipeline` requires `resources.pipelines: {}` even if empty
- Preview runs read from remote branch - push changes before validating with `previewRun: true`
- Pipeline paths vary - search by `definitionIds` if you know the ID

## Self-Improvement

- If a workflow friction could be avoided with a CLAUDE.md rule, suggest it
