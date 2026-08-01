#!/usr/bin/env sh
# Validate the collection's invariants (see docs/adr/0001, 0002).
# Pure POSIX shell — no jq dependency, so it runs anywhere.

set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$root"
manifest=".claude-plugin/marketplace.json"
fail=0
err() { echo "FAIL: $*" >&2; fail=1; }

[ -f "$manifest" ] || { echo "FAIL: missing $manifest" >&2; exit 1; }

# ADR 0001: no plugin.json (conflicts with strict:false marketplace entries).
if find . -name plugin.json -not -path './.git/*' | grep -q .; then
  err "a plugin.json is present — ADR 0001 forbids it"
fi

# ADR 0001: no version pinning in the manifest.
if grep -Eq '"version"[[:space:]]*:' "$manifest"; then
  err "marketplace.json has a version field — ADR 0001 forbids it"
fi

# Skills declared in the manifest vs. present on disk.
manifest_skills=$(grep -oE '"\./skills/[^"]+"' "$manifest" | tr -d '"' | sed 's|^\./||' | sort -u)
disk_skills=$(find skills -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort -u || true)
draft_skills=$(find drafts -mindepth 1 -maxdepth 1 -type d 2>/dev/null | sort -u || true)

# ADR 0002: lifecycle is location, so the manifest may only reach into skills/.
# This is what keeps a draft (or a retired skill) from being published by an
# edit to the manifest alone.
for p in $(grep -oE '"\./[^"]*"' "$manifest" | tr -d '"' | sort -u); do
  case "$p" in
    ./|./skills/*) ;;
    *) err "manifest references '$p' outside skills/ — ADR 0002 forbids it" ;;
  esac
done

for s in $manifest_skills; do
  [ -d "$s" ] || err "manifest lists '$s' but it is not in skills/"
  [ -f "$s/SKILL.md" ] || err "$s has no SKILL.md"
done

for d in $disk_skills; do
  printf '%s\n' "$manifest_skills" | grep -qx "$d" || err "$d is in skills/ but not in the manifest"
done

# Frontmatter: name present and matching the directory; description present.
# Checked in drafts/ too. A draft is what gets promoted, so a broken name is
# cheaper to catch now than on the commit that publishes it.
for d in $disk_skills $draft_skills; do
  f="$d/SKILL.md"
  [ -f "$f" ] || { err "$d has no SKILL.md"; continue; }
  name=$(sed -n 's/^name:[[:space:]]*//p' "$f" | head -1 | tr -d '"')
  has_desc=$(grep -cE '^description:' "$f" || true)
  base=$(basename "$d")
  [ "$name" = "$base" ] || err "$f: frontmatter name '$name' does not match directory '$base'"
  [ "${has_desc:-0}" -ge 1 ] || err "$f: missing 'description' in frontmatter"
done

if [ "$fail" -eq 0 ]; then
  n=$(printf '%s\n' "$disk_skills" | grep -c . || true)
  m=$(printf '%s\n' "$draft_skills" | grep -c . || true)
  echo "OK: $n published, $m draft(s) validated against $manifest"
else
  exit 1
fi
