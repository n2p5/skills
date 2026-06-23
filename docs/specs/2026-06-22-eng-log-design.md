# Design: `eng-log` skill

- Status: draft (design approved, prompt-mode)
- Date: 2026-06-22
- Pillar: thinking-well (a supporting "yes, and", not a creativity catalyst)

## Summary

A reflective engineering-journal skill, in the same lineage as `rubber-duck`:
pure prompt-mode, no bundled machinery. The skill is an **interviewer**. It draws
the reflection out of the user and touches their systems only to keep that
reflection honest — it never authors the log and never invents work. Modeled on
the "work log" / "brag document" practice the Pragmatic Engineer and others
advocate.

It covers a daily entry and four rollups (weekly, monthly, quarterly, annual).
Each rollup reflects on the tier directly below it.

## Identity and fit

This answers the collection's open "membership test": `eng-log` is a *supporting*
skill, not a *core* creativity catalyst. The spine is "infinite games and
autotelic pursuits — creativity, play, and thinking well"; a reflective practice
that compounds your sense of progress extends "thinking well" and the
infinite-game framing (you log to keep playing, not to win and stop).

## Design stance

The skill **prescribes nothing**. An earlier draft shipped a config file, a
`gather` shell script, and a fixed vault directory tree; that was machinery the
rest of the collection doesn't have, and it prescribed solutions instead of
asking. It was removed. The skill now:

- **Asks** which tier, what to verify against, and where the log lives — rather
  than assuming a structure.
- **Grounds, doesn't generate.** It pulls only the sources the user grants
  (git history being the canonical one; also a tracker, calendar, notes, or the
  tier below) and uses them to verify the user's recollection.
- **Stays source-agnostic.** Git is the common case, not a hard dependency. The
  skill runs `git log` in-conversation when the user names repos; it does not
  carry its own git plumbing.

## Flows

### Daily

1. Pull the commits (or other evidence) the user points to as quiet context —
   e.g. `git log` scoped to the day and their author, for the repos they name.
2. Interview, one question at a time, letting the evidence keep it honest:
   what the day was about; whether a recognizable commit cluster was the main
   thread or a detour; what left no trace (reading, meetings, dead-ends); what's
   unresolved.
3. Record the user's words, grounded by what the evidence showed, wherever they
   keep their log.

### Rollups (weekly, monthly, quarterly, annual)

Each rollup reflects on the tier directly below it — weekly on the dailies,
monthly on the weeklies, and so on. Read that tier, interview at its altitude
(themes/learnings weekly; goal-progress monthly; arcs and bets quarterly;
growth and trajectory annually), and record the synthesis. Gaps in the tier
below are named, not imagined away.

## Non-goals (v1)

- **No bundled scripts or config.** The skill is instructions only. If a
  deterministic helper ever earns its keep, add it then (YAGNI).
- **No prescribed storage.** The user says where the log lives and how entries
  are named; the skill follows that. Markdown in an Obsidian vault is the
  expected common case, but nothing is hard-coded, and other destinations
  (e.g. Notion via MCP) are just "wherever they keep it."
- **No auto-invocation.** `disable-model-invocation` is set; the user invokes it
  explicitly with a tier.
- **No backfill magic.** It writes the tier you ask for; it does not reconstruct
  missing history in one shot.
