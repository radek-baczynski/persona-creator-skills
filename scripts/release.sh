#!/usr/bin/env bash
# Bump version, update CHANGELOG + SKILL metadata, commit, tag, and push.
# Usage: ./scripts/release.sh 1.1.0

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

NEW_VERSION="${1:-}"
if [[ -z "$NEW_VERSION" ]]; then
  echo "Usage: $0 <semver>   e.g. $0 1.1.0"
  exit 1
fi

if ! [[ "$NEW_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Version must be semver (MAJOR.MINOR.PATCH): $NEW_VERSION"
  exit 1
fi

CURRENT="$(tr -d '[:space:]' < VERSION)"
TAG="v$NEW_VERSION"
TODAY="$(date +%Y-%m-%d)"

if [[ "$NEW_VERSION" == "$CURRENT" ]]; then
  echo "VERSION is already $NEW_VERSION"
  exit 1
fi

echo "$NEW_VERSION" > VERSION

# Update persona-creator skill metadata version
SKILL_FILE="skills/persona-creator/SKILL.md"
if grep -q '^metadata:' "$SKILL_FILE" 2>/dev/null; then
  sed -i '' "s/^  version:.*/  version: \"$NEW_VERSION\"/" "$SKILL_FILE"
else
  # Insert metadata block after description line in frontmatter
  awk -v ver="$NEW_VERSION" '
    /^description:/ { print; print "metadata:"; print "  version: \"" ver "\""; next }
    { print }
  ' "$SKILL_FILE" > "${SKILL_FILE}.tmp" && mv "${SKILL_FILE}.tmp" "$SKILL_FILE"
fi

echo ""
echo "Updated VERSION and $SKILL_FILE to $NEW_VERSION"
echo ""
echo "Next steps:"
echo "  1. Edit CHANGELOG.md — move [Unreleased] items under ## [$NEW_VERSION] - $TODAY"
echo "  2. git add VERSION CHANGELOG.md $SKILL_FILE"
echo "  3. git commit -m \"Release $TAG\""
echo "  4. git tag -a $TAG -m \"Release $TAG\""
echo "  5. git push && git push origin $TAG"
echo ""
echo "GitHub Actions will create the release from CHANGELOG.md when the tag is pushed."
