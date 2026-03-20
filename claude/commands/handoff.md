---
description: Hand off current thread context to a new fresh Claude Code session
---

You are creating a handoff — continuing work from this thread in a new, fresh thread. Handoffs keep threads small and focused for better results.

The user's direction for the new thread: {{arg1}}

## Instructions

1. Analyze the FULL conversation. Identify:
   - The task being worked on
   - All files read, created, or modified (exact paths)
   - Key decisions and reasoning
   - Current state: what's done, what's remaining
   - Gotchas, constraints, or important context

2. Write a handoff prompt using this structure:

---

## Handoff

**Task:** [one-line summary]
**Direction:** [user's direction for new thread]

**Files:**
- [path] — [role / what changed]

**Done so far:**
[Completed work]

**Remaining:**
[What's left]

**Key context:**
[Decisions, constraints, gotchas — be specific, the new thread has zero prior context]

## Next steps

[Actionable instructions based on direction. Reference files and line numbers.]

---

3. Write the full handoff prompt to `/tmp/claude-handoff.md` using the Write tool.

4. Tell the user: "Handoff ready. Press Ctrl+C and run `claude-handoff` to continue in a fresh session."
