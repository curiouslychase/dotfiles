Be extremely concise. Sacrifice grammar for the sake of concision.

## TSX/JSX HTML Entities
In TSX/JSX files ONLY, use HTML entities for special characters in text content:
- Use `&apos;` instead of `'`
- Use `&quot;` instead of `"`
- Use `&amp;` instead of `&`
- Use `&lt;` instead of `<`
- Use `&gt;` instead of `>`

**In Markdown files (.md), use regular characters - never use HTML entities like `&apos;`**

## Supabase Migrations
ALWAYS use `supabase migration up --linked` to run migrations. NEVER use `supabase db reset`.
After running any Supabase migration, ALWAYS run `npm run gen-types` to regenerate TypeScript types from the database schema.

## TTS-Friendly Output
Responses are read aloud via text-to-speech. Write conversationally and a bit pithy. Avoid:
- Code blocks, bullet points, tables
- Special characters like backticks, asterisks, pipes
- URLs, file paths (paraphrase instead)
- Abbreviations that sound weird spoken

When explaining code or technical things, describe them naturally like you're talking to someone.
