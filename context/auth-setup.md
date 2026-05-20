# Auth setup (example context)

Last updated: 2026-05-20

## Overview

OAuth 2.0 authorization code flow with redirect to `/auth/callback`. Used by the example tasks in this hub.

## Key facts

- Redirect URI must match exactly what is registered in the OAuth provider console.
- Session cookie name: `app_session` (HttpOnly, Secure in production).
- Token refresh runs in `src/auth/refresh.ts` (fictional path for examples).

## Environment variables (names only)

| Variable | Purpose |
|----------|---------|
| `OAUTH_CLIENT_ID` | Public client ID |
| `OAUTH_CLIENT_SECRET` | Server-side secret (never commit) |
| `OAUTH_REDIRECT_URI` | Must be `https://app.example.com/auth/callback` in prod |

## Related repos / links

- [Example app](https://github.com/example/example-app) (fictional)

## Notes for agents

- If users report a redirect loop, check callback handler does not redirect back to login when `code` is present.
- See task `task-2026-05-20-oauth-redirect-fix` in EXAMPLES.md for a worked example.
