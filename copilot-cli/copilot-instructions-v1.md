# Copilot Instructions - MCP Server Usage

## Available MCP Servers

You have access to three MCP servers that enhance your capabilities:

### 1. Sequential Thinking (`sequential-thinking`)
Use this server for complex problem-solving that requires step-by-step reasoning. Best for:
- Breaking down complex problems into manageable steps
- Planning and design with room for revision
- Multi-step analysis where understanding might deepen
- Problems where the full scope isn't initially clear
- Situations requiring hypothesis generation and verification
- Tasks needing context maintained over multiple steps

**When to use**: For any non-trivial problem that benefits from structured, iterative thinking rather than immediate answers.

### 2. Context7 (`context7`)
Provides up-to-date documentation for libraries and frameworks. Best for:
- Getting current API documentation
- Learning about library features and best practices
- Finding code examples and usage patterns
- Understanding framework concepts

**How to use**:
1. First call `context7-resolve-library-id` with the library name to get the Context7-compatible ID
2. Then call `context7-get-library-docs` with the resolved ID and optional topic parameter

**Example workflow**: For React documentation, resolve "react" to get `/facebook/react`, then fetch docs with optional topic like "hooks" or "routing".

### 3. Serena (`serena`)
Advanced code intelligence and editing capabilities for IDE-like operations. Best for:
- Exploring codebases systematically
- Finding symbols (classes, functions, methods) across files
- Understanding code structure and relationships
- Making surgical code edits with context awareness
- Finding references to symbols
- Pattern-based code search

**Key tools**:
- `serena-list_dir`: List directory contents
- `serena-find_file`: Find files by pattern
- `serena-get_symbols_overview`: Get high-level view of code symbols in a file
- `serena-find_symbol`: Find code symbols by name path
- `serena-find_referencing_symbols`: Find where symbols are used
- `serena-search_for_pattern`: Search for patterns in code
- `serena-replace_symbol_body`: Replace symbol definitions
- `serena-insert_after_symbol`/`serena-insert_before_symbol`: Insert code relative to symbols

**Best practices**:
- Always call `serena-check_onboarding_performed` when starting work on a project
- Use `serena-get_symbols_overview` before diving into file details
- Call `serena-think_about_collected_information` after gathering information
- Call `serena-think_about_task_adherence` before making code changes
- Call `serena-think_about_whether_you_are_done` when you believe the task is complete

## General Guidelines

- **Combine tools**: Use sequential-thinking for planning, context7 for documentation, and serena for implementation
- **Be efficient**: Make parallel tool calls when operations are independent
- **Think before acting**: Use sequential-thinking for complex tasks, serena's thinking tools before major changes
- **Stay current**: Use context7 for latest library documentation instead of relying solely on training data
- **Be precise**: Use serena's symbol-based editing for surgical code changes

## Example Workflows

**Complex refactoring task**:
1. Use sequential-thinking to plan the refactoring approach
2. Use serena to explore the codebase and understand current structure
3. Use context7 if working with external libraries
4. Use serena's editing tools to make precise changes

**Learning a new library**:
1. Use context7-resolve-library-id to find the library
2. Use context7-get-library-docs with relevant topics
3. Apply knowledge to your project using serena for code changes

**Debugging**:
1. Use serena to find symbol definitions and references
2. Use sequential-thinking to reason through the problem
3. Use serena to make targeted fixes
