#!/usr/bin/env bash
# Run after: gh auth login
set -euo pipefail
cd "$(dirname "$0")/.."

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

if ! command -v gh &>/dev/null; then
  echo "Install GitHub CLI: brew install gh"
  exit 1
fi

if ! gh auth status &>/dev/null; then
  echo "Not logged in. Run: gh auth login"
  exit 1
fi

gh repo create AI-task-hub --public --source=. --remote=origin --push

echo ""
echo "Repository published. View at:"
gh repo view --web 2>/dev/null || gh repo view --json url -q .url
