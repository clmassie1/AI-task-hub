# Integration guide

How to connect AI agents and tools to this task hub. The hub is **file-based** — integrations read and write markdown in git.

## Prerequisites

1. Clone the repo (or add it as a workspace root).
2. Read [README.md](README.md) (command board) and [REAL_README.md](REAL_README.md) (full guide). See [tasks/README.md](tasks/README.md) for task format.
3. Pick or register an `owner` ID in [agents/registry.md](agents/registry.md).

---

## Cursor / IDE agents

### Setup

1. **File → Open Folder** → select the AI Task Hub repo root.
2. Optional: add a Cursor rule (`.cursor/rules/task-hub.mdc` or project rule):

```markdown
Before starting work, list tasks/inbox/. If claiming a task:
- Move the file to tasks/active/
- Set owner to your agent id, status active, updated today
- Append a progress log line
- Commit with message: task: claim <slug>
See INTEGRATION.md in the hub repo.
```

3. Reference context with `@context/auth-setup.md` or `@tasks/inbox/...`.

### Workflow

| Step | Action |
|------|--------|
| Find work | `Glob tasks/inbox/*.md` or ask agent to list inbox |
| Claim | Move file + update frontmatter + commit |
| Work | Code in *other* repos; link branches/PRs in task **Artifacts** |
| Handoff | Create `handoffs/YYYY-MM-DD-<id>.md`, update task |
| Done | Move to `tasks/done/`, check criteria, commit |

### Copy-paste system prompt (Cursor)

```text
You are working in an AI Task Hub (markdown + git). Rules:
1. Check tasks/inbox/ for unclaimed tasks before new work.
2. To claim: move task to tasks/active/, set owner, status active, log progress, commit "task: claim <slug>".
3. Link context via related: and @context/ files.
4. On handoff: write handoffs/YYYY-MM-DD-<task-id>.md per handoffs/README.md.
5. On complete: move to tasks/done/, status done, fill artifacts, commit "task: complete <slug>".
6. Never commit secrets. One task state change per commit when possible.
```

---

## Claude Code / CLI agents

### Setup

Add a `CLAUDE.md` at the hub repo root (optional but recommended):

```markdown
# AI Task Hub

This repo coordinates tasks between agents. Read INTEGRATION.md.

- Inbox: tasks/inbox/
- Claim: move to tasks/active/, update frontmatter
- Handoffs: handoffs/
- Context: context/

Always run `ls tasks/inbox/` before starting new work.
```

### Workflow

```bash
# List available work
ls tasks/inbox/

# After editing (claim, update, complete)
git add -A && git commit -m "task: claim oauth-redirect-fix"
git push
```

### Copy-paste system prompt (CLI)

```text
You operate in an AI Task Hub repository. Before implementation:
1. List tasks/inbox/ and pick one task OR follow the user's specified task file.
2. Claim by moving the file to tasks/active/ and updating YAML frontmatter (owner, status, updated).
3. Read related context/ files listed in frontmatter.
4. Log progress in the task's ## Progress log section.
5. For handoffs, create a file in handoffs/ using the template in handoffs/README.md.
6. Commit with conventional messages from EXAMPLES.md section 8.
```

---

## ChatGPT / manual (human-in-the-loop)

No direct repo access required.

### Workflow

1. Human copies task markdown from `tasks/inbox/<file>.md` into the chat.
2. Prompt: *"Update this task as claimed by chatgpt-assistant and add a progress note for …"*
3. Assistant returns updated markdown (and optional handoff note).
4. Human pastes into the repo, moves folders, commits, pushes.

### Copy-paste prompt (ChatGPT)

```text
I'm using an AI Task Hub. I'll paste a task markdown file. Update it according to my instruction.
Preserve YAML frontmatter. Use statuses: inbox, active, blocked, done.
Include sections: Objective, Context, Acceptance criteria, Progress log, Artifacts.
Return the full updated file only, no extra commentary unless I ask.
```

---

## Multiple agents, conflict avoidance

| Rule | Why |
|------|-----|
| Claim in **one commit** (move inbox → active) | Others see git history and avoid duplicate claims |
| Do not edit the same task file in parallel | Last write wins; no merge conflict tooling for prose |
| Use `handoff_to` + handoff file | Clear ownership transfer |
| Pull before listing inbox | Get latest claims |

If two agents claim the same task: revert the later claim, coordinate via handoff note or human.

---

## Handoff protocol (all platforms)

1. **Update task** — progress log, optional `handoff_to: <agent-id>`.
2. **Write** `handoffs/YYYY-MM-DD-<task-id>.md` (template in [handoffs/README.md](handoffs/README.md)).
3. **Leave task in `active/`** until the next agent updates `owner` and acknowledges in progress log.
4. **Commit** together: `handoff: <slug> from <a> to <b>`.
5. **Receiving agent** pulls, reads handoff + task + `related` context, continues work.

---

## Linking to code repositories

This hub does **not** contain application code. In task **Artifacts**, record:

- Target repo URL
- Branch name
- PR URL
- Commit SHAs

Agents implement in other workspaces; this repo is the **source of truth for work status**.

---

## Optional automation (future)

Documented for later — not required for v1:

| Idea | Approach |
|------|----------|
| Stale task warning | GitHub Action: fail if `tasks/active/` file `updated` > 7 days ago |
| Frontmatter lint | Action runs `yq` or small script to validate required fields |
| Inbox notifier | Webhook on push to `tasks/inbox/` |

See [EXAMPLES.md](EXAMPLES.md) for commit message conventions automation can enforce.

---

## Quick reference

| I want to… | Do this |
|------------|---------|
| Add new work | Copy template from `tasks/README.md` → `tasks/inbox/` |
| Start work | Move to `active/`, set `owner`, commit claim |
| Pass to another agent | `handoffs/` file + update task |
| Wait on human | Move to `blocked/`, set `blocked_reason` |
| Finish | Move to `done/`, link PRs, commit complete |
| Share long context | Add `context/<topic>.md`, link in `related` |

For worked examples, see [EXAMPLES.md](EXAMPLES.md).
