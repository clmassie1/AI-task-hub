# Tasks

Tasks are markdown files with YAML frontmatter. Status is determined by **which folder** the file lives in.

## Folders

| Folder | `status` value | When to use |
|--------|----------------|-------------|
| `inbox/` | `inbox` | New work; no owner yet |
| `active/` | `active` | Someone is working on it |
| `blocked/` | `blocked` | Cannot proceed; set `blocked_reason` |
| `done/` | `done` | Finished; fill completion summary |

## Frontmatter fields

| Field | Required | Description |
|-------|----------|-------------|
| `id` | Yes | Unique ID, e.g. `task-2026-05-20-auth-fix` |
| `title` | Yes | Short human-readable title |
| `status` | Yes | Must match folder: `inbox`, `active`, `blocked`, `done` |
| `priority` | Yes | `low`, `medium`, or `high` |
| `owner` | Yes | Agent ID from [agents/registry.md](../agents/registry.md); empty in inbox |
| `created` | Yes | ISO date `YYYY-MM-DD` |
| `updated` | Yes | ISO date; bump on every edit |
| `tags` | Yes | List of strings, e.g. `[auth, bug]` |
| `blocked_reason` | If blocked | Why work stopped |
| `handoff_to` | Optional | Target agent ID when handing off |
| `related` | Optional | Paths to context docs, e.g. `[context/auth-setup.md]` |

## Body sections

Use these headings in order (omit empty sections):

```markdown
## Objective

What needs to be accomplished.

## Context

Background, links, constraints. Prefer linking to `context/` for long docs.

## Acceptance criteria

- [ ] Criterion 1
- [ ] Criterion 2

## Progress log

Reverse chronological notes. Agents append dated bullets.

## Artifacts

PRs, branches, file paths, commit SHAs.
```

## Blank template

Copy this into `inbox/` for new work:

```markdown
---
id: task-YYYY-MM-DD-slug
title: 
status: inbox
priority: medium
owner: ""
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags: []
blocked_reason: ""
handoff_to: ""
related: []
---

## Objective



## Context



## Acceptance criteria

- [ ] 

## Progress log

- YYYY-MM-DD: Task created.

## Artifacts


```

## Claiming a task

1. Move file from `inbox/` → `active/`.
2. Set `status: active`, `owner: <your-agent-id>`, `updated: <today>`.
3. Add a progress log entry: claimed by whom.
4. Commit: `task: claim <slug>`

## Completing a task

1. Check all acceptance criteria.
2. Add final progress log and artifacts (PR links, etc.).
3. Move file to `done/`, set `status: done`.
4. Update the kanban board in [README.md](../README.md).
5. Commit: `task: complete <slug>`
