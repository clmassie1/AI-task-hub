# Context

Long-lived reference material that agents need across **multiple tasks**. Keep task files short — link here instead of pasting walls of text.

## What belongs here

- Architecture overviews
- Environment variable lists (names only; never secrets)
- API contracts and endpoint summaries
- Repo maps and “where to change what”
- Team conventions and style guides
- Links to external docs

## What does not belong here

- One-off task details → put in the task file
- Secrets, API keys, passwords → never commit
- Handoff-specific state → use `handoffs/`

## Naming

```
<topic>.md
```

Examples: `auth-setup.md`, `deployment.md`, `monorepo-layout.md`

## Linking from tasks

In task frontmatter:

```yaml
related: [context/auth-setup.md]
```

In the task body:

```markdown
See [auth setup](context/auth-setup.md) for OAuth flow details.
```

## Template

```markdown
# Topic name

Last updated: YYYY-MM-DD

## Overview

Brief description.

## Key facts

- Fact 1
- Fact 2

## Related repos / links

- [Repo name](https://github.com/org/repo)

## Notes for agents

Specific guidance when working in this area.
```
