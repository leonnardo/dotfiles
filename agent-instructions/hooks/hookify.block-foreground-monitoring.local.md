---
name: block-foreground-monitoring
enabled: true
event: bash
pattern: while\s+(true|:|\[\s*1\s*\]).*sleep|watch\s+-n|for\s+\(\(.*\)\).*sleep|until\s+false.*sleep
action: block
---

🚫 **Foreground monitoring loop blocked!**

You're attempting to run a foreground polling/monitoring loop. This blocks the conversation and wastes context.

**Detected pattern:** Sleep-based polling loop (`while true; sleep`, `watch -n`, etc.)

**ALWAYS use background tasks instead:**

```bash
# ✅ CORRECT: Run in background
Bash { command: "tail -f /var/log/app.log", run_in_background: true }

# Then check periodically with:
BashOutput { task_id: "<id>" }
# or
TaskOutput { task_id: "<id>" }
```

**For monitoring workflows:**
1. Start command with `run_in_background: true`
2. Use `BashOutput`/`TaskOutput` to check output
3. For complex log analysis, delegate to a Task subagent

**See:** CLAUDE.md → "Background Tasks (CRITICAL)" section
