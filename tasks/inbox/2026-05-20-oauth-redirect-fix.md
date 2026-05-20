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

Users on production report being stuck in a loop after Google sign-in. See [auth setup](../../context/auth-setup.md).

## Acceptance criteria

- [ ] User lands on dashboard after OAuth with valid session
- [ ] No more than one redirect between login and callback
- [ ] Add regression test for callback with `?code=` present

## Progress log

- 2026-05-20: Task created by cursor-planner (seed example for practice).

## Artifacts

