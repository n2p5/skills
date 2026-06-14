# Drafts

Work-in-progress skills live here. They are invisible to both install
channels by construction — see
[ADR 0002](../docs/adr/0002-curation-by-construction-flat-skills-tree.md).
Nothing in `drafts/` is published.

Iterate on a draft live with `make link` (symlinks every draft into
`~/.claude/skills`), and `make unlink` when you're done. Publish a draft by
moving it into `skills/` and adding it to `.claude-plugin/marketplace.json`.
