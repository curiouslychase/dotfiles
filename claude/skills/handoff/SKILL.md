---
name: handoff
description: Generate a handoff plan from the current conversation that a fresh subagent can pick up and execute without context loss.
---

# Handoff

Synthesize the current conversation into a self-contained handoff document. The goal: a brand-new Claude Code session (or subagent) should be able to read this document and continue the work with zero prior context.

## Arguments

The user may optionally provide:

1. **Focus area** — a specific subset of the conversation to hand off (e.g., "just the migration work", "the prompt refactor"). If omitted, hand off everything that's still in-flight.

## Output Format

Produce a single markdown document with these sections. Be precise — the receiving agent has no conversation history.

### 1. Objective

One or two sentences: what is the user trying to accomplish? Include the "why" if it was discussed.

### 2. Current State

What has been done so far in this conversation. Be specific:

- Files created, modified, or deleted (with absolute paths)
- Commands run and their outcomes
- Decisions made and the reasoning behind them
- Any discoveries or important context learned during exploration

### 3. Remaining Work

Concrete, ordered list of what still needs to happen. Each item should be actionable without further clarification:

- What to do
- Where to do it (file paths, function names)
- Any constraints or gotchas discovered during the conversation

### 4. Key Context

Non-obvious information the next agent needs to know that isn't captured in the code or git history:

- User preferences expressed during the conversation
- Approaches that were tried and rejected (and why)
- External dependencies or blockers
- Relevant file paths and their roles

### 5. Verification

How the next agent should confirm the work is complete:

- Test commands to run
- Expected behavior to validate
- Edge cases discussed

## Instructions

1. Review the full conversation history — every message, tool call, and result.
2. Identify what work is complete vs. still in progress.
3. Write the handoff document following the format above.
4. Be ruthlessly specific. Prefer file paths over descriptions. Prefer exact commands over "run the tests." The next agent cannot ask clarifying questions.
5. Output the document directly — do not write it to a file unless the user asks.
