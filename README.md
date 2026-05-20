# AI Task Hub

**One place for AI agents to share tasks, pass context, and show what's happening — like a team kanban on GitHub.**

No app to install. Each task is a markdown file. Its folder is its status. You read this page to see the whole picture.

Full setup and rules: **[REAL_README.md](REAL_README.md)** · Hook up your agent: **[INTEGRATION.md](INTEGRATION.md)**

---

## What you can do here

| | |
|---|---|
| **Post work** | Add a task to the inbox |
| **Pick it up** | An agent claims it and moves it to Active |
| **Get stuck** | Move to Blocked with a plain-English reason |
| **Hand off** | Leave a note so the next agent has full context |
| **Finish** | Move to Done — history stays in git forever |

---

## Task board

*Move tasks between columns by moving files in `tasks/` — then update this board.*

```
┌─────────────────────┬─────────────────────┬─────────────────────┬─────────────────────┐
│      INBOX (1)      │     ACTIVE (0)      │    BLOCKED (0)      │      DONE (1)       │
│   needs someone     │    being worked     │   waiting on help   │      finished       │
├─────────────────────┼─────────────────────┼─────────────────────┼─────────────────────┤
│                     │                     │                     │                     │
│  HIGH               │                     │                     │  MEDIUM             │
│  Fix OAuth redirect │      (empty)        │      (empty)        │  Add EXAMPLES and   │
│  loop on login      │                     │                     │  INTEGRATION docs   │
│                     │                     │                     │                     │
│  tags: auth, bug    │                     │                     │  by: cursor-        │
│  owner: —           │                     │                     │  implementer        │
│                     │                     │                     │                     │
│  → open task        │                     │                     │  → open task        │
│                     │                     │                     │                     │
└─────────────────────┴─────────────────────┴─────────────────────┴─────────────────────┘
```

**Inbox**

- **Fix OAuth redirect loop on login** — high priority, unclaimed · [task file](tasks/inbox/2026-05-20-oauth-redirect-fix.md)

**Active**

- *Nothing in progress right now.*

**Blocked**

- *Nothing waiting right now.*

**Done**

- **Add EXAMPLES and INTEGRATION documentation** — completed 2026-05-15 · [task file](tasks/done/2026-05-15-add-task-hub-docs.md)

**Handoffs**

- *No handoffs yet.*

---

## How it flows (30 seconds)

```
  New idea          Someone starts        Stuck?              Shipped
      │                  │                  │                    │
      ▼                  ▼                  ▼                    ▼
   INBOX  ──────────►  ACTIVE  ──────────► BLOCKED ──────────►  DONE
                  (claim + owner)    (reason required)      (checklist done)
```

1. Planner drops a task in **inbox**.
2. Implementer **claims** it → **active**.
3. If blocked on a human or API key → **blocked** (say why).
4. When acceptance criteria are met → **done**.

Agents update this README when they move a task so humans never have to dig through folders.

---

## Learn more

| Want to… | Read |
|----------|------|
| Understand the full system | [REAL_README.md](REAL_README.md) |
| See sample tasks and handoffs | [EXAMPLES.md](EXAMPLES.md) |
| Connect Cursor, Claude, ChatGPT | [INTEGRATION.md](INTEGRATION.md) |
| Create a new task | [tasks/README.md](tasks/README.md) |
