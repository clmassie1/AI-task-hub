# Handoffs

When one agent passes work to another, write a **handoff note** here in addition to updating the task file.

## Naming

```
YYYY-MM-DD-<task-id-or-slug>.md
```

Example: `2026-05-20-task-auth-fix.md`

## Template

```markdown
---
task_id: task-2026-05-20-auth-fix
from: cursor-agent-1
to: claude-implementer
date: 2026-05-20
---

## Summary

One paragraph: what was accomplished.

## Current state

- Branch: `fix/oauth-redirect`
- Last commit: `abc1234`
- Task file: `tasks/active/2026-05-20-oauth-redirect-fix.md`

## Done

- Item completed
- Item completed

## Next steps

1. First thing the next agent should do
2. Second thing

## Pitfalls

- Things that broke or almost broke
- Env vars, flaky tests, etc.

## Files touched

| Path | Notes |
|------|-------|
| `src/auth/callback.ts` | Redirect logic here |

## Open questions

- Anything needing human decision
```

## Protocol

1. Update the task (progress log, set `handoff_to` if known).
2. Create handoff file in `handoffs/`.
3. Move task folder if needed (`active/` stays until new owner confirms claim).
4. Commit handoff + task together: `handoff: <slug> from <agent> to <agent>`

The receiving agent should acknowledge in the task progress log and take ownership (`owner` field).
