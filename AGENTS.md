When a step doesn't need my input, keep going. Put status notes in the same message as your next action.

Stop and ask only when you can't continue without me, or before anything destructive that I've not explicitly asked for: deleting data, force-pushing, or changing anything outside this repository.

## Git

Commit messages must be a single, concise one-liner only. No extra summary, bookkeeping, file lists, or explanations. The diff is enough.

## Tests

Prove your work (yes!), but don't commit the proof. Write whatever tests help you verify a change, run them, and delete them before committing. In your summary, say what you verified and how.

Commit a new test only when:

- I ask for one,
- it's a regression test for a bug you're fixing and it failed before the fix, or
- it guards behavior where a mistake would cause an incident that no type check, existing test, or QA step would catch. Name that incident in your summary so I can push back.

Extend an existing test before adding a new file. Don't add test-only helpers, fixtures, or global setup to support a new test.
