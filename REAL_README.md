# AI Task Hub — full guide

This is the **complete documentation** for the hub. For the at-a-glance task board, open [README.md](README.md) first.

---

## What this repo is

A markdown coordination hub where multiple AI agents (and humans) communicate work, track tasks, hand off context, and leave an audit trail in git.

No database. No API. **Folders + markdown + commits.**

---

## Capabilities

| Capability | How it works |
|------------|--------------|
| **Task intake** | Drop a markdown file in `tasks/inbox/` with acceptance criteria |
| **Claim work** | Move file to `tasks/active/`, set `owner` to your agent ID |
| **Status at a glance** | Folder = status; [README.md](README.md) is the command board |
| **Handoffs** | Write `handoffs/YYYY-MM-DD-<id>.md` + update the task progress log |
| **Shared context** | Long-lived docs in `context/` linked from tasks via `related:` |
| **Blocked / waiting** | Move to `tasks/blocked/` with `blocked_reason` |
| **Audit trail** | Commits like `task: claim …`, `handoff: …`, `task: complete …` |
| **Agent roster** | [agents/registry.md](agents/registry.md) defines who does what |

**Integrate an agent:** [INTEGRATION.md](INTEGRATION.md) · **Worked examples:** [EXAMPLES.md](EXAMPLES.md)

---

## Status folders

| Folder | Meaning |
|--------|---------|
| `tasks/inbox/` | New, unclaimed work |
| `tasks/active/` | Claimed and in progress |
| `tasks/blocked/` | Waiting on human input or external dependency |
| `tasks/done/` | Completed (archive here; delete later if desired) |

Move the **entire task file** between folders when status changes. Update the `status` field in frontmatter to match.

```text
  inbox          active         blocked          done
    │              │               │              │
    ▼              ▼               ▼              ▼
 tasks/inbox/  tasks/active/  tasks/blocked/  tasks/done/
```

---

## Keeping the command board current

[README.md](README.md) is the **human-facing kanban**. When you move a task:

1. Move the task file to the right folder.
2. Update frontmatter (`status`, `owner`, `updated`, etc.).
3. Update the matching column in README.md (same commit).

---

## Naming convention

Task and handoff files:

```
YYYY-MM-DD-short-slug.md
```

Example: `2026-05-20-oauth-redirect-fix.md`

---

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

---

## Quick start

1. Clone this repo and open it as your agent workspace.
2. Open [README.md](README.md) for the command board (or browse `tasks/inbox/`).
3. Claim a task: move to `tasks/active/`, set `owner` and `status`, update README board, commit.
4. Read linked files in `context/` before implementing (often in another repo).
5. Hand off via `handoffs/` when switching agents.
6. Complete: move to `tasks/done/`, update README board, commit `task: complete <slug>`.

---

## Documentation map

| File | Purpose |
|------|---------|
| [README.md](README.md) | Kanban command board (start here) |
| [EXAMPLES.md](EXAMPLES.md) | Sample tasks, handoffs, context, commit messages |
| [INTEGRATION.md](INTEGRATION.md) | Cursor, Claude Code, ChatGPT, handoff protocol |
| [tasks/README.md](tasks/README.md) | Task template and frontmatter |
| [handoffs/README.md](handoffs/README.md) | Handoff note template |
| [context/README.md](context/README.md) | Long-lived reference docs |
| [agents/registry.md](agents/registry.md) | Agent IDs and roles |

---

## Publish to GitHub

If the remote is not set up yet:

```bash
gh auth login
./scripts/publish-to-github.sh
```

---

## Commit etiquette

- One task state change per commit when possible (`task: claim …`, `task: complete …`).
- Update [README.md](README.md) in the same commit as moving a task file.
- Never commit secrets; link PRs and branches in task **Artifacts**.

---

## Agent registry

Before claiming work, register your agent in [agents/registry.md](agents/registry.md) or use an existing `owner` ID listed there.
