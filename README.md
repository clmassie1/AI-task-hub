# AI Task Hub

A markdown-based coordination hub where multiple AI agents (and humans) communicate work, track tasks, hand off context, and leave an audit trail in git.

No database, no API — just **folders + markdown + commits**.

## Quick start

1. Clone this repo and open it as your agent workspace.
2. Check [`tasks/inbox/`](tasks/inbox/) for unclaimed work.
3. Claim a task by moving it to [`tasks/active/`](tasks/active/) and updating frontmatter (`owner`, `status`, `updated`).
4. Read related docs in [`context/`](context/) before starting.
5. When handing off, write a note in [`handoffs/`](handoffs/) (see [`handoffs/README.md`](handoffs/README.md)).
6. When done, move the task to [`tasks/done/`](tasks/done/) with a completion summary.

## Documentation

| File | Purpose |
|------|---------|
| [EXAMPLES.md](EXAMPLES.md) | Fictional examples of tasks, handoffs, context, and commits |
| [INTEGRATION.md](INTEGRATION.md) | How to wire Cursor, CLI agents, ChatGPT, and scripts into this hub |
| [tasks/README.md](tasks/README.md) | Task file format and status folders |
| [handoffs/README.md](handoffs/README.md) | Handoff note format |
| [context/README.md](context/README.md) | Long-lived reference docs |
| [agents/registry.md](agents/registry.md) | Agent IDs and responsibilities |

## Status folders

| Folder | Meaning |
|--------|---------|
| `tasks/inbox/` | New, unclaimed work |
| `tasks/active/` | Claimed and in progress |
| `tasks/blocked/` | Waiting on human input or external dependency |
| `tasks/done/` | Completed (archive here; delete later if desired) |

Move the **entire task file** between folders when status changes. Update the `status` field in frontmatter to match.

## Naming convention

Task and handoff files:

```
YYYY-MM-DD-short-slug.md
```

Example: `2026-05-20-oauth-redirect-fix.md`

## Task frontmatter (required)

Every task file must start with YAML frontmatter:

```yaml
---
id: task-2026-05-20-auth-fix
title: Fix OAuth redirect loop
status: inbox
priority: medium
owner: ""
created: 2026-05-20
updated: 2026-05-20
tags: []
blocked_reason: ""
handoff_to: ""
related: []
---
```

See [tasks/README.md](tasks/README.md) for field definitions and body sections.

## Commit etiquette

- Prefer **one task state change per commit** (e.g. `task: claim oauth-redirect-fix` or `task: complete oauth-redirect-fix`).
- Include the task `id` in the commit message when possible.
- Handoffs: commit the handoff note and task update together.

## Agent registry

Before claiming work, register your agent in [agents/registry.md](agents/registry.md) or use an existing `owner` ID listed there.
