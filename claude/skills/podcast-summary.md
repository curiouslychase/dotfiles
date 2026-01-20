---
name: podcast-summary
description: Summarize podcast transcripts with key takeaways and timestamped citations. Extracts insights, notable quotes, and creates scannable summaries. Use when processing podcast transcripts or YouTube video transcripts.
---

# Podcast Summary Skill

Summarize podcast/video transcripts with timestamped citations.

## Input

User provides:
1. **Transcript** - Either pasted text or a file path to a transcript with timestamps like `[MM:SS]`
2. **Focus topics** (optional) - Specific themes, questions, or areas to prioritize in the summary

## Output Format

Write output to `/Users/chaseadams/vault/20 - Notes/{descriptive-title}.md`

```markdown
---
title: "{Podcast/Video Title} - Summary"
date: {YYYY-MM-DD}
source: {URL if provided}
fileClass: podcast-summary
---

## TL;DR
{1-2 sentences - the single most compelling insight or takeaway}

## Key Takeaways
- First major insight[^1]
- Second important point[^2]
- Third takeaway[^3]
{Continue as needed, typically 3-7 items}

## Notable Quotes
> "Direct quote that captures the essence"[^4]

> "Another impactful quote"[^5]

## Deep Dive
{2-3 paragraphs expanding on the most important themes. If user specified focus topics, prioritize those here.}

---

## Transcript

{Full transcript with timestamps preserved}

---

[^1]: [05:23] Relevant quote or context from transcript
[^2]: [12:45] Supporting text
[^3]: [18:30] More context
```

## Guidelines

### Citations
- Every key takeaway and quote MUST have a footnote citation
- Footnotes reference the timestamp in format `[^N]: [MM:SS] quote or context`
- Timestamps help user jump to relevant section

### Focus Topics
When user provides focus topics:
- Prioritize those topics in Key Takeaways
- Dedicate more Deep Dive space to focus areas
- Still capture other major insights, but weight toward focus

### TL;DR
- Make it punchy and specific
- Should make someone want to read more
- Avoid generic summaries

### Key Takeaways
- Use action-oriented language
- Be specific, not vague
- Each should stand alone as valuable

### Transcript Section
- Preserve original timestamps
- Keep full transcript for reference
- Separate from summary with horizontal rule
