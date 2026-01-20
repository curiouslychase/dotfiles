---
name: code-review
description: Review code for quality, security, and best practices. Analyze pull requests, identify bugs, suggest improvements, verify error handling, check for security vulnerabilities (XSS, SQL injection, command injection), evaluate design patterns, and assess performance. Use when reviewing pull requests, examining code diffs, evaluating code changes, or analyzing implementation quality.
---

# Code Review Skill

Perform comprehensive code reviews focusing on:

## Security
- XSS, SQL injection, command injection vulnerabilities
- Input validation and sanitization
- Authentication and authorization issues
- Sensitive data exposure
- OWASP Top 10 vulnerabilities

## Code Quality
- Logic errors and edge cases
- Error handling and recovery
- Null/undefined checks
- Race conditions and async issues
- Resource leaks

## Best Practices
- Code clarity and maintainability
- DRY principle violations
- Function/component complexity
- Naming conventions
- Documentation quality

## Performance
- Unnecessary re-renders (React)
- Inefficient algorithms
- Memory leaks
- Database query optimization

## Testing
- Test coverage gaps
- Missing edge case tests
- Test quality and reliability

## Output Format

Write this to a file in /Users/chaseadams/src/github.com/curiouslychase/reviews/{YYYY-MM-DD}.md

Provide:
1. **Summary**: High-level assessment
2. **Critical Issues**: Security/bugs requiring immediate attention
3. **Improvements**: Suggestions for better code quality
4. **Praise**: What's done well (be specific, not generic)
5. **File References**: Use `file_path:line_number` format

Be concise. Focus on actionable feedback.

