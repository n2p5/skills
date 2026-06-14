#!/usr/bin/env sh
#
# link-drafts.sh — sideload draft skills for live local iteration.
#
# Symlinks each drafts/<name>/ that contains a SKILL.md into your Claude
# Code skills directory. The skill then appears exactly as a real install
# would — unprefixed and model-invocable — and edits to the draft are
# reflected immediately, with no reinstall.
#
#   scripts/link-drafts.sh            link every draft skill
#   scripts/link-drafts.sh --unlink   remove the symlinks this created
#
# Set CLAUDE_SKILLS_DIR to override the destination (used for testing).

set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
drafts_dir="$repo_root/drafts"
dest_dir="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

mode="link"
[ "${1:-}" = "--unlink" ] && mode="unlink"

[ -d "$drafts_dir" ] || { echo "No drafts/ at $drafts_dir"; exit 0; }
mkdir -p "$dest_dir"

# Refuse to operate on a destination that resolves back into this repo,
# which would risk self-referential link loops.
dest_resolved=$(CDPATH= cd -- "$dest_dir" && pwd -P)
case "$dest_resolved" in
  "$repo_root" | "$repo_root"/*)
    echo "Refusing: $dest_dir resolves inside the repo." >&2
    exit 1 ;;
esac

count=0
for skill in "$drafts_dir"/*/; do
  [ -f "${skill}SKILL.md" ] || continue
  name=$(basename "$skill")
  src="${skill%/}"
  target="$dest_dir/$name"

  if [ "$mode" = "unlink" ]; then
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$src" ]; then
      rm "$target"
      echo "unlink  $name"
      count=$((count + 1))
    fi
    continue
  fi

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "skip    $name — $target exists and is not a symlink" >&2
    continue
  fi
  ln -sfn "$src" "$target"
  echo "link    $name -> $src"
  count=$((count + 1))
done

if [ "$mode" = "unlink" ]; then
  echo "Removed $count symlink(s) from $dest_dir"
else
  echo "Linked $count draft skill(s) into $dest_dir"
  echo "Reload Claude Code (/reload or restart) to pick them up."
fi
