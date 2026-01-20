# Article Coauthor Skill

Use this skill when creating or editing articles or newsletters to ensure proper frontmatter, headlines, and formatting.

## Article Frontmatter

Always include frontmatter with:
- `date`: Current date in YYYY-MM-DD format
- `title`: Article title
- `status`: Set to "draft"
- `fileClass`: Set to "article"
- `excerpt`: Brief summary for social sharing (optional but recommended)
- `description`: How AI/topic transforms something specific (optional)
- `tags`: Array of relevant tags (optional)
- `author`: Chase Adams
- `category`: Appropriate category (optional)

Example:
```markdown
---
title: Article Title Here
date: 2025-10-12
excerpt: Brief compelling summary for social sharing
description: How this topic transforms the way we work
tags: [ai, productivity, tools]
author: Chase Adams
category: Productivity
status: draft
fileClass: article
---
```

## Newsletter Frontmatter

When creating newsletter markdown files, always include frontmatter with:
- `date`: Current date in YYYY-MM-DD format
- `title`: Newsletter title
- `fileClass`: Set to "newsletter" (NOT "article")
- **NO `status` field** - newsletters don't use status
- `excerpt`: Brief summary for social sharing (optional but recommended)
- `description`: Newsletter description (optional)
- `tags`: Array of relevant tags (optional)
- `author`: Chase Adams
- `category`: Appropriate category (optional)

Example:
```markdown
---
title: Newsletter Title Here
date: 2025-10-12
excerpt: Brief compelling summary for social sharing
description: What this newsletter covers
tags: [ai, productivity, tools]
author: Chase Adams
category: Newsletter
fileClass: newsletter
---
```

## Frontmatter Formatting Rules

When writing frontmatter values:
- **Values with colons:** Any value containing a `:` must be wrapped in double quotes
- **Escaping quotes:** If the value contains double quotes, escape them with `\"`
- **No HTML entities in markdown:** Use regular apostrophes (`'`) and quotes (`"`) in markdown content, NOT HTML entities like `&apos;` or `&quot;`. HTML entities are only for TSX/JSX files.

Examples:
```markdown
---
title: "Module 0: Using AI as Your Learning Partner"  # Contains : so wrapped in quotes
description: "Learn how to use AI as a \"collaborator\" not a generator"  # Contains : and escaped quotes
author: Chase Adams  # No special characters, no quotes needed
---
```

## Article Headlines

Include a compelling opening sentence in a `<Headline>` tag immediately after the frontmatter. Headlines should:
- Be contrarian or attention-grabbing
- Set up the core tension or insight of the article
- Create curiosity about the topic
- Be concise (1-2 sentences max)

Example:
```markdown
---
title: The New Maker Schedule Isn't About Making
date: 2025-10-02
excerpt: AI agents are turning makers into directors
description: How AI agents are turning makers into directors
tags: [ai, productivity, agents]
author: Chase Adams
category: Future of Work
status: draft
fileClass: article
---

<Headline>
Paul Graham's taxonomy of the maker and manager schedule is dead.
</Headline>

# First Main Section
Content...
```

## Markdown Heading Guidelines

When creating or editing markdown files for articles:
- **Never use a single H1 as document title** - Use multiple H1s throughout articles
- Use H1 headings (`#`) for main sections (treat H1s as repeatable section headers, not as a single document title)
- Use H2 headings (`##`) for subsections
- Use H3 headings (`###`) for sub-subsections
- Articles are converted for blog publishing where H1s become H2s, so multiple H1s are expected
- **Always include at least 2 sentences before any new heading** - Never place headings directly next to each other without transition text

Example structure:
```markdown
# First Main Section
Content here...

# Second Main Section
Content here...

## Subsection of Second Section
More content...

# Third Main Section
Content here...
```

## Changelog Guidelines

When user requests changelog entry:
- Add to `# Changelog` section at end of file (create section if doesn't exist)
- Use format: `- [YYYY-MM-DD] Change description`
- Keep entries concise, focused on what changed

Example:
```markdown
# Changelog
- [2025-10-13] Clarified opening statement about philosophies
- [2025-10-13] Rewrote "Write it down" section
```
