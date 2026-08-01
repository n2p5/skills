---
name: dry-prose
description: >-
  Dry prose: flat, neutral, declarative, with no authorial voice. For
  engineering documents that get forwarded and read with no author present,
  such as design docs, ADRs, post-mortems, incident reports, and status memos.
  Use when writing one, or when making an existing draft plainer, less salesy,
  or less flowery.
---

# Dry Prose

The document will be forwarded. It will be read months later by people who were
not in the room, with no author present to explain it. Every choice that draws
attention to the writing invites the reader to evaluate the author instead of
the fact.

The target is prose that reads as though no particular person wrote it: the
reader finishes each sentence holding the fact and no impression of the
sentence. This is a different target from good writing, which earns its effect
through rhythm, contrast, and a well-placed dash. Those tools work against a
forwarded document. Set them down.

## Rules

**No em dashes in prose. Punctuate by relationship instead:** colon for a label
and its elaboration, period for two independent statements, semicolon when those
two belong together, comma for genuine subordination, parentheses for a real
aside worth keeping. Deciding mechanically is the point, because it removes the
moment where a writer reaches for a dash. Two exceptions, because they are not
prose: a standalone dash in a table cell as an n/a marker, and en dashes in
ranges (5–23 December, 2025–26).

**Cut what isn't the fact.** Four tells:

- *Trailing reframe*: a clause restating what was just said. "The retention
  decision stands, the exposure does not need to." Delete it, or promote it to
  its own sentence if it carries new information.
- *Narrator frame*: "Context for the reader:", "It is worth noting that",
  "Importantly,". Delete the frame and keep the fact. The fact was always the
  sentence.
- *Intensifier*: "single highest-leverage" where "highest-impact" asserts the
  same thing. If striking the modifier leaves the claim intact, strike it.
- *Smoothing transition*: "Moreover,", "That said,", "Ultimately,". If a
  paragraph falls apart without them, the ordering is wrong and they were
  hiding it.

**Keep "X, not Y" only when Y is a reading someone would actually make.** This
one takes judgment. "Active exploitation for at least 18 days, not a one-time
event" rules out the reading a reader would otherwise default to, so it carries
information. "Relaunch behind the perimeter, not in front of it" says one thing
twice for emphasis, so it carries only voice. Ask whether a reasonable reader
would have made the mistake Y describes. If not, cut Y.

**Claim only what the evidence shows.** Cite the number and let the reader
characterize it; "a dramatic spike" is the author speaking. Where the evidence
supports only the weaker claim, make the weaker claim. "No evidence of bulk
export" is defensible and "no data was accessed" is not, and that gap is the
whole document if better evidence surfaces later.

**Headings name their subject, not their verdict.** "Detection and logging:
nothing watched for 18 days" puts a finding where the reader meets it with no
evidence in view. "Detection and logging: centralized telemetry and alerting"
names the topic and lets the body carry the finding next to what supports it.

**Make the argument instead of performing one.** Balanced clauses are the tell,
and the honest rewrite is often longer:

> Neither is a substitute for the other, and neither is sufficient alone: each
> closes what the other leaves open, which is the argument for layering rather
> than relying on any single control.

> Neither replaces the other. A perimeter product will itself have a
> vulnerability one day, which is why the layers need to be independent.

## Revising an existing draft

Inventory before editing. Read every em dash in context before changing any of
them: some are load-bearing, a blind find-and-replace damages ranges and table
markers, and reading them all first surfaces the flourishes that contain no dash
at all, which are usually the more important edits.

Read each target string verbatim before replacing it, never from memory. When
the edit is programmatic, assert an expected match count for every pair and
refuse to write the file if any pair fails. A silently missed replacement is
invisible in the output; a loud failure list is not.

Re-read the output, not the diff. Tone problems live in flow and are invisible
line by line.

Leave verbatim material alone. Quoted text, and passages the user wrote and
handed over, are outside the sweep unless they ask otherwise.

## Over-correction

The failure mode is stripping information along with the flourish. Dry is not
terse: a dry document can be long, it simply does not perform, and cutting a
sentence into ambiguity costs the reader more than the flourish did. Do not
flatten a heading until it stops distinguishing its section from the next. Do
not strip structure, because tables, headings, numbered findings, status columns
and dates are not voice and are how a forwarded document stays navigable without
its author present. Do not replace an em dash with a comma splice; if the halves
are independent, use a period or a semicolon.
