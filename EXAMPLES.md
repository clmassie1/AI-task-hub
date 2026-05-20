# Examples

Fictional but realistic examples for the AI Task Hub. Live seed files are in `tasks/inbox/` and `tasks/done/` — this doc shows the same patterns in other states.

---

## 1. Inbox task (unclaimed)

**File:** `tasks/inbox/2026-05-20-oauth-redirect-fix.md` (seed file — practice claiming this)

```markdown
---
id: task-2026-05-20-oauth-redirect-fix
title: Fix OAuth redirect loop on login
status: inbox
priority: high
owner: ""
created: 2026-05-20
updated: 2026-05-20
tags: [auth, bug]
blocked_reason: ""
handoff_to: ""
related: [context/auth-setup.md]
---

## Objective

Stop the infinite redirect between `/login` and `/auth/callback` after successful OAuth.

## Context

Users on production report being stuck in a loop after Google sign-in. See [auth setup](context/auth-setup.md).

## Acceptance criteria

- [ ] User lands on dashboard after OAuth with valid session
- [ ] No more than one redirect between login and callback
- [ ] Add regression test for callback with `?code=` present

## Progress log

- 2026-05-20: Task created by cursor-planner.

## Artifacts


```

---

## 2. Active task (claimed, in progress)

**File:** `tasks/active/2026-05-20-oauth-redirect-fix.md` (example state after claim)

```markdown
---
id: task-2026-05-20-oauth-redirect-fix
title: Fix OAuth redirect loop on login
status: active
priority: high
owner: cursor-implementer
created: 2026-05-20
updated: 2026-05-20
tags: [auth, bug]
blocked_reason: ""
handoff_to: ""
related: [context/auth-setup.md]
---

## Objective

Stop the infinite redirect between `/login` and `/auth/callback` after successful OAuth.

## Context

Root cause likely in callback handler — see [auth setup](context/auth-setup.md).

## Acceptance criteria

- [ ] User lands on dashboard after OAuth with valid session
- [ ] No more than one redirect between login and callback
- [ ] Add regression test for callback with `?code=` present

## Progress log

- 2026-05-20: Task created by cursor-planner.
- 2026-05-20: Claimed by cursor-implementer. Branch `fix/oauth-redirect` created.
- 2026-05-20: Identified missing `code` check before redirect to login.

## Artifacts

- Branch: `fix/oauth-redirect` (in target app repo, not this hub)
- Hub commit: `task: claim oauth-redirect-fix`
```

---

## 3. Blocked task

**File:** `tasks/blocked/2026-05-18-api-rate-limit.md` (example only — not seeded)

```markdown
---
id: task-2026-05-18-api-rate-limit
title: Implement API rate limiting
status: blocked
priority: medium
owner: claude-implementer
created: 2026-05-18
updated: 2026-05-19
tags: [api, infra]
blocked_reason: "Need REDIS_URL for production rate limit store; human to provision."
handoff_to: ""
related: []
---

## Objective

Add per-IP rate limiting on public API routes.

## Context

Design agreed: token bucket in Redis. Dev can use local Redis; prod instance not provisioned yet.

## Acceptance criteria

- [ ] 100 req/min per IP on `/api/v1/*`
- [ ] 429 response with `Retry-After` header
- [ ] Metrics exported to existing dashboard

## Progress log

- 2026-05-18: Task created.
- 2026-05-18: Claimed by claude-implementer; middleware scaffolded.
- 2026-05-19: Blocked — waiting on REDIS_URL for staging/prod.

## Artifacts

- PR draft: https://github.com/example/api/pull/42 (fictional)
```

**Unblocking:** Human adds env var → agent moves file to `active/`, clears `blocked_reason`, logs unblock in progress log.

---

## 4. Done task

**File:** `tasks/done/2026-05-15-add-task-hub-docs.md` (seed file)

See the live file in the repo for the completed example with PR links and checked acceptance criteria.

**Summary snippet:**

```markdown
---
id: task-2026-05-15-add-task-hub-docs
title: Add EXAMPLES and INTEGRATION documentation
status: done
priority: medium
owner: cursor-implementer
created: 2026-05-15
updated: 2026-05-15
tags: [docs]
blocked_reason: ""
handoff_to: ""
related: []
---

## Progress log

- 2026-05-15: Completed. Merged initial hub documentation.

## Artifacts

- PR: https://github.com/example/AI-task-hub/pull/1 (fictional)
- Commit: `task: complete add-task-hub-docs`
```

---

## 5. Handoff note

**File:** `handoffs/2026-05-20-task-oauth-redirect-fix.md`

```markdown
---
task_id: task-2026-05-20-oauth-redirect-fix
from: cursor-implementer
to: claude-implementer
date: 2026-05-20
---

## Summary

Reproduced redirect loop locally and fixed callback guard. Tests still need writing — handing off for CLI test run and PR polish.

## Current state

- Branch: `fix/oauth-redirect`
- Last commit: `a1b2c3d` (fictional)
- Task file: `tasks/active/2026-05-20-oauth-redirect-fix.md`

## Done

- Added `if (searchParams.has('code'))` before redirect to login
- Manual QA passed on localhost

## Next steps

1. Add regression test in `tests/auth/callback.test.ts`
2. Open PR and link in task artifacts
3. Move task to `done/` when CI green

## Pitfalls

- Mock OAuth provider returns duplicate `code` on refresh — test uses single-use fixture
- Do not commit `.env` with real `OAUTH_CLIENT_SECRET`

## Files touched

| Path | Notes |
|------|-------|
| `src/auth/callback.ts` | Main fix |
| `src/auth/session.ts` | No changes needed |

## Open questions

- None
```

---

## 6. Context doc snippet

**File:** [context/auth-setup.md](context/auth-setup.md)

```markdown
# Auth setup (example context)

## Environment variables (names only)

| Variable | Purpose |
|----------|---------|
| `OAUTH_CLIENT_ID` | Public client ID |
| `OAUTH_CLIENT_SECRET` | Server-side secret (never commit) |
```

Agents should `@` or link this file from tasks instead of duplicating env tables.

---

## 7. Agent registry entries

From [agents/registry.md](agents/registry.md):

| id | role | Use when |
|----|------|----------|
| `cursor-planner` | planner | Creating inbox tasks |
| `cursor-implementer` | implementer | IDE-based implementation |
| `claude-implementer` | implementer | CLI / headless workflows |
| `human-reviewer` | reviewer | Unblocking, approvals |

**Workflow example:**

1. `cursor-planner` adds task to `inbox/`
2. `cursor-implementer` claims → `active/`
3. Handoff note to `claude-implementer` for tests + PR
4. `human-reviewer` merges PR; agent moves task to `done/`

---

## 8. Example git commit messages

| Action | Message |
|--------|---------|
| New task | `task: add oauth-redirect-fix to inbox` |
| Claim | `task: claim oauth-redirect-fix (cursor-implementer)` |
| Progress | `task: update oauth-redirect-fix progress` |
| Handoff | `handoff: oauth-redirect-fix cursor-implementer → claude-implementer` |
| Block | `task: block api-rate-limit — need REDIS_URL` |
| Unblock | `task: unblock api-rate-limit` |
| Complete | `task: complete oauth-redirect-fix` |
| Context | `context: update auth-setup env table` |

---

## Try it yourself

1. Open `tasks/inbox/2026-05-20-oauth-redirect-fix.md`
2. Follow [INTEGRATION.md](INTEGRATION.md) to claim it as your agent
3. Compare your edits to the **Active** and **Handoff** examples above
