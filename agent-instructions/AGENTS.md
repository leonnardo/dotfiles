# Global Instructions

## Token Efficiency (Priority)

- Use `Task` tool with `subagent_type=Explore` for codebase exploration - never search directly in main context
- Use subagents in parallel when tasks are independent
- Batch tool calls - make all independent calls in a single message
- Responses: concise, code over prose, no fluff
- Run commands with long output in background (`run_in_background: true`) to avoid context bloat
- Use background for: builds, test suites, linters, any verbose command output

## Documentation & Research

- Use Context7 MCP plugin first for library/framework docs
- Web search for: latest APIs, debugging errors, current best practices
- Prefer official docs over blog posts/tutorials

## Communication Style

- Minimal explanations - code speaks for itself
- Ask first when requirements are unclear or ambiguous
- Ask before suggesting improvements or optimizations
- Never verbose - if it can be said in fewer words, do it

## Code Quality

- Always write tests for new code/changes
- Run formatters/linters after changes (follow project config)
- Match existing error handling patterns in the codebase
- Security-conscious: consider vulnerabilities, sanitize inputs at boundaries
- Performance-focused: prefer efficient implementations

## What NOT to Do

- No over-engineering or premature abstractions
- No unsolicited refactoring beyond the request
- No new files unless absolutely necessary - edit existing files
- No README/docs creation unless explicitly asked
- No adding comments/docstrings to unchanged code
- No future-proofing or "nice to have" additions

## Code Simplification

When reviewing or refactoring, actively look for overcomplicated code:

- Unnecessary abstractions, wrappers, or indirection
- Complex patterns where simple code suffices
- Ask "can this be simpler?" before finalizing

## Git

- Squash-friendly workflow - WIP commits are fine
- Simple, descriptive commit messages (one single line)
- Do not add co-author

## Shell Tools (Modern Rust Replacements)

- Don't `cd` unnecessarily - use full paths
- Run single test files when iterating, not full suite

## Tools & Environment

- Familiar with: Docker, cloud CLIs (AWS/GCP/Azure), standard package managers
- Project-specific tools: will be noted per-project

## When Uncertain

Ask clarifying questions before proceeding. Don't guess.

## Interview Mode

Before complex tasks or during planning, use AskUserQuestion to:

- Clarify requirements and constraints
- Understand preferences between valid approaches
- Validate assumptions before implementation
- Gather context that isn't obvious from codebase

## Plan Mode

Use `EnterPlanMode` for:

- Multi-file changes or new features
- Architectural decisions with multiple valid approaches
- Unclear scope that needs exploration first
- Any change touching >3 files

Skip plan mode for: single-file fixes, obvious bugs, small tweaks.

## Sequential Thinking (MCP)

Use `sequential_thinking` tool for complex reasoning:

- Breaking down multi-step problems
- Analysis that might need course correction
- Architectural decisions with tradeoffs
- Debugging complex issues
- When initial approach isn't working (revise thoughts)

Invoke explicitly when tackling hard problems in plan mode or complex debugging.

## Available Agents

Use these via Task tool for parallel work and token efficiency:

- `Explore` - Codebase exploration, finding files, understanding architecture
- `general-purpose` - Multi-step research, searching when uncertain about matches

## Context Management

Fresh context performs better - start new conversations when:

- Performance degrades or Claude gets confused
- Switching to unrelated tasks
- Context window filling up

**Handoff pattern** (use `/handoff` from dx plugin):

- Before context exhausts, create HANDOFF.md documenting:
  - Goal and current progress
  - What worked, what didn't
  - Next steps
- Start fresh session, load handoff doc, continue work

**History search**: Conversations stored in `~/.claude/projects/` as .jsonl files

## Workflow Tips

- Commit frequently when experimenting - easy rollback if things break
- For large features: save plan to markdown, work in chunks, handoff between sessions
- Use `#` key during sessions to quickly add instructions to CLAUDE.md
- Let Claude edit CLAUDE.md via `#` rather than manual maintenance

## Autonomous Verification

For unsupervised/background work:

- Use tmux (`/tmux` skill for details)
- Leverage `git bisect` with test scripts for automated bug hunting
- Always establish verification mechanism before autonomous execution

## Kubernetes MCP (Reference)

When working with K8s, consider installing:

```bash
claude mcp add kubernetes -- npx mcp-server-kubernetes
```

Features: kubectl ops, Helm charts, non-destructive mode, secrets masking.
Alternatives: `containers/kubernetes-mcp-server` (native binary, no kubectl needed)

## Git Worktrees (Parallel Development)

Run multiple Claude instances on different features simultaneously:

```bash
git worktree add ../project-feature-a feature/feature-a
git worktree add ../project-feature-b feature/feature-b
```

- Each worktree = isolated directory + branch + Claude session
- No context pollution between features
- Naming convention: `project-feature-name`
- Sync regularly with main to avoid merge hell
- Remove worktrees when done: `git worktree remove ../project-feature-a`

Caution: Parallelism can create merge conflicts - use for independent features

## Custom Commands

- Personal commands: `~/.claude/commands/*.md` (available in all sessions)
- Project commands: `.claude/commands/*.md` (available as `/project:<name>`)

## CLAUDE.md Locations

- `~/.claude/CLAUDE.md` - Global defaults (this file)
- `<project>/CLAUDE.md` - Shared team config (commit to git)
- `<project>/CLAUDE.local.md` - Personal overrides (git-ignored)
- `<project>/<subdir>/CLAUDE.md` - Directory-specific context

Per-project files should specify:

- Language/framework conventions
- Build, test, lint commands
- Project-specific patterns and architecture
- Dependency policies
