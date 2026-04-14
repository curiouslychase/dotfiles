---
name: skill-creator
description: Create Claude Code skill files with proper YAML frontmatter and structure. Takes skill specifications and generates compliant skill.md files.
---

# Skill Creator

## Purpose
Create properly formatted Claude Code skill files based on provided specifications. Generates SKILL.md files with correct YAML frontmatter, directory structure, and documentation sections following Claude Code best practices.

## When to Use
- After artifact-advisor recommends creating a skill
- When you have clear specifications for a simple, single-purpose tool
- To replace deprecated skill-writer for skill-specific creation
- When converting existing tools to Claude Code skills
- For creating constraint-compliant skills with proper structure

## What This Skill Does

### File Generation
- Creates skill directory with proper naming (kebab-case)
- Generates SKILL.md with correct YAML frontmatter
- Adds all required documentation sections
- Ensures proper markdown formatting and structure

### Required Input
- **Skill name** (kebab-case format)
- **Description** (concise, single-line purpose statement)
- **Purpose** (detailed explanation of what the skill does)
- **When to Use** (specific scenarios and use cases)
- **Implementation details** (what the skill actually does)

### Generated Structure
```
skill-name/
└── SKILL.md     # Main skill file with YAML frontmatter
```

### YAML Frontmatter Format
```yaml
---
name: skill-name
description: Brief description of what the skill does
---
```

## Expected Output

### Progress Visibility During Creation
Users will see clear progress messages during skill creation:

```
Starting skill creation - Generating "example-skill" with constraint compliance
Creating directory - ~/.claude/skills/example-skill/ created
Writing SKILL.md - YAML frontmatter and documentation sections generated
Applying standards - Ensuring kebab-case naming and required fields
Creation complete - Skill ready for discovery in 2.8s
```

### Creation Confirmation
**Primary Output:**
- Properly formatted SKILL.md file in correct directory location
- Structured creation summary with timing and status

**Creation Summary Format:**
```
Skill Creation Complete

Created Files:
   ~/.claude/skills/example-skill/SKILL.md

Skill Details:
   Name: example-skill
   Description: Brief description of skill functionality
   Size: 156 lines, 8,234 bytes
   Constraint Status: Compliant

Creation Summary:
   Directory Created: ~/.claude/skills/example-skill/
   YAML Validation: Pass
   Structure Compliance: Pass
   Processing Time: 2.8 seconds

Ready for Use:
   Skill is discoverable via Claude Code
   Ready for team git tracking with sync-claude-skills
```

**File Structure:**
```markdown
---
name: skill-name
description: Brief single-line description
---

# Skill Name

## Purpose
[Detailed purpose explanation]

## When to Use
[Specific use case scenarios]

## What This Skill Does
[Implementation details and functionality]

## Expected Output
[What the skill produces]

## Usage
[How to invoke and use the skill]

## Skill Location
[Directory location information]
```

## Usage

**Basic Creation:**
```
Create a skill named "log-parser" that parses application logs for error patterns
```

**With Specifications:**
```
Create skill:
- Name: markdown-formatter
- Description: Format markdown files according to project standards
- Purpose: Standardize markdown formatting across documentation
- Use cases: Before committing docs, cleaning up formatting
```

## Validation

### Constraint Compliance
- Ensures single responsibility principle
- No orchestration or chaining patterns
- Manual invocation only
- Boring, predictable behavior

### Structure Validation
- Proper YAML frontmatter syntax
- Required sections present
- Kebab-case naming convention
- Appropriate file permissions

## Integration Points
- Works with artifact-advisor recommendations
- Follows Claude Code documentation standards
- Uses established skill directory patterns
- Compatible with existing skill discovery

## File Location
Skills created in: `~/.claude/skills/[skill-name]/`

## Skill Location
User skill - stored in `~/.claude/skills/skill-creator/`
