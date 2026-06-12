# Curation by construction: published means inside skills/

Both install channels discover whatever valid `SKILL.md` directories they can
see: the skills CLI walks `skills/` two levels deep and offers everything with
valid frontmatter (it has no lifecycle awareness), and the marketplace
plugin's default directory scan always adds `skills/` contents to the bundle.
We therefore express lifecycle as location — `skills/` holds only published
skills, while `drafts/` and `retired/` sit outside the discovery paths at the
repo root, invisible to both channels by construction. Categories are README
sections, not directories, so re-categorizing never changes a published path.

We deliberately rejected the model repo's (mattpocock/skills) lifecycle
buckets (`skills/in-progress/`, `skills/deprecated/`): its draft and
deprecated skills leak into its public npx picker, and its convention-based
curation (CLAUDE.md sync rules) had already drifted from its own manifest.

## Consequences

- Publishing is `git mv drafts/<x> skills/<x>` plus a marketplace.json
  `skills` entry; retiring is the reverse. The `skills/` tree and the manifest
  must stay in step — enforced by validation, not convention.
- Retired skills stop being offered but are never yanked from users who
  installed them; the directory remains in `retired/` for the record.
- Drafts are only reachable deliberately (direct path or full-depth scan),
  which is acceptable: anyone doing that has opted in.
