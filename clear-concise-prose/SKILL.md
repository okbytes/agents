---
name: clear-concise-prose
description: Default skill for drafting or revising prose, including informal writing. Use for all prose unless a more specialized skill clearly applies to the user's primary task.
---

# Clear, Concise Prose

## Overview

Use this as the default clarity-and-concision skill for human-readable prose. It improves the expression of ideas without developing or materially restructuring the underlying argument.

William Strunk Jr.'s _The Elements of Style_ (1918) provides the core writing principles.

**WARNING:** `elements-of-style.md` consumes ~12,000 tokens. Read it only when writing or editing prose.

## When to Use This Skill

Use this skill when the task is to draft or revise human-readable prose and no more specialized skill clearly applies. Common cases include:

- Informal emails, messages, and notes
- Documentation, README files, technical explanations
- Commit messages, pull request descriptions
- Error messages, UI copy, help text, comments
- Reports, summaries, or any explanation
- Editing to improve clarity

Treat this skill as the default fallback, not as a reason to stack it automatically with every specialized writing skill. If the user's primary task clearly calls for another skill, use that skill unless the user explicitly asks for both.

## Limited Context Strategy

When context is tight:

1. Write your draft using judgment
2. Dispatch a subagent with your draft and `elements-of-style.md`
3. Have the subagent perform a clarity-and-concision pass and return the revision

## All Rules

### Elementary Rules of Usage (Grammar/Punctuation)

1. Form possessive singular by adding 's
2. Use comma after each term in series except last
3. Enclose parenthetic expressions between commas
4. Comma before conjunction introducing co-ordinate clause
5. Don't join independent clauses by comma
6. Don't break sentences in two
7. Participial phrase at beginning refers to grammatical subject

### Elementary Principles of Composition

8. One paragraph per topic
9. Begin paragraph with topic sentence
10. **Use active voice**
11. **Put statements in positive form**
12. **Use definite, specific, concrete language**
13. **Omit needless words**
14. Avoid succession of loose sentences
15. Express co-ordinate ideas in similar form
16. **Keep related words together**
17. Keep to one tense in summaries
18. **Place emphatic words at end of sentence**

### Section V: Words and Expressions Commonly Misused

Alphabetical reference for usage questions

Prioritize the reference's durable composition principles. Treat dated lexical or usage prescriptions in the 1918 text as historical guidance rather than binding modern usage when they conflict with the user's requested register or contemporary clarity.

## Bottom Line

When this skill applies, read `elements-of-style.md` and apply the relevant rules. If context is limited, use the limited-context strategy above.
