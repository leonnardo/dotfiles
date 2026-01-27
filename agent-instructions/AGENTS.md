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

- Use `jq`/`yq` with single quotes: `jq '.key // ""'`
- Complex filters: heredoc over nested quotes
- Escaped JSON content: extract with `jq -r` to /tmp first

## CLI Errors

- NEVER guess solutions when commands fail - always verify first
- On ANY CLI error (not just "unrecognized arguments"):
  1. Run `<command> --help` or `man <command>`
  2. Search Context7 for library/framework docs
  3. Use WebSearch for tool-specific issues
- Only retry after confirming the correct syntax/approach

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

## Log Analysis

- NEVER read logs directly - delegate to `Task` subagent (general-purpose)
- Subagent extracts errors/warnings/root cause, returns summary (<20 lines)
- Build/test: `run_in_background: true`, then analyze via subagent

## Self-Improvement (Meta-Rules)

When writing new rules (via `/reflect` or manually):
- Start with NEVER or ALWAYS
- Lead with why (1-3 bullets max)
- Include concrete example if helpful
