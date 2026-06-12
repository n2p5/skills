# Dual-channel distribution via marketplace.json only

This repo is modeled on mattpocock/skills but must also support the Claude
Code plugin marketplace, which that repo lacks (it ships only a `plugin.json`,
which cannot be added via `/plugin marketplace add`). We distribute one set of
bare `skills/<name>/SKILL.md` directories through two channels: the skills CLI
(`npx skills add n2p5/skills`), which discovers SKILL.md files by scanning,
and a single `.claude-plugin/marketplace.json` (marketplace `n2p5-skills`)
exposing one bundle plugin (`n2p5`) with `source: "./"`, `strict: false`, and
an explicit `skills` array. There is deliberately no `plugin.json` and no
`version` field anywhere.

## Considered options

- **plugin.json only (Matt's literal shape)** — rejected: no marketplace
  channel at all.
- **plugin.json + thin marketplace.json** — rejected: two manifests to keep in
  sync, and a `version` field in plugin.json silently wins over the
  marketplace entry, freezing users on stale copies until manually bumped.
- **Per-skill or per-category plugins** — rejected: marketplace subselection
  is already covered by the npx channel's interactive picker; more entries to
  maintain, and a bundle+per-skill hybrid double-installs skills under two
  namespaces.

## Consequences

- A `plugin.json` must never be added: alongside a `strict: false` marketplace
  entry it is a documented "conflicting manifests" load failure.
- Omitting `version` everywhere means every commit to main counts as a new
  plugin version — marketplace users get updates per commit (manual two-step
  or per-marketplace auto-update).
- Channel division of labor: npx = cherry-picking, unprefixed top-level
  skills, skills only, ~70 supported agents; marketplace = whole-collection
  subscription, `/n2p5:` invocation prefix, and the only channel that can also
  ship Claude-Code-specific components (subagents, hooks, commands) later.
