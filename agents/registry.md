# Agent registry

Register agents that work in this hub. Use the `id` as `owner` in task frontmatter.

| id | role | platform | responsibilities |
|----|------|----------|------------------|
| `cursor-planner` | planner | Cursor | Break down work, create tasks in inbox, refine acceptance criteria |
| `cursor-implementer` | implementer | Cursor | Claim tasks, write code, move tasks to done |
| `claude-implementer` | implementer | Claude Code | Same as implementer; good for CLI/automation workflows |
| `chatgpt-assistant` | general | ChatGPT | Draft tasks, review copy, manual handoffs via user commits |
| `human-reviewer` | reviewer | Human | Unblock tasks, approve PRs, resolve ambiguous requirements |

## Adding an agent

Append a row:

```markdown
| `my-agent-id` | implementer | Cursor | Short description of what this agent does |
```

## Roles

| Role | Typical actions |
|------|-----------------|
| `planner` | Creates inbox tasks, splits epics, writes context docs |
| `implementer` | Claims active tasks, commits code elsewhere, updates progress |
| `reviewer` | Reviews diffs, marks criteria met, moves blocked → active |
| `general` | Ad-hoc help; does not own long-running implementation |

## Example entries (fictional)

These match examples in [EXAMPLES.md](../EXAMPLES.md):

- **cursor-planner** created `task-2026-05-20-oauth-redirect-fix` in inbox.
- **cursor-implementer** claimed it, then handed off to **claude-implementer**.
- **human-reviewer** unblocked `task-2026-05-18-api-rate-limit` when API keys were provided.
