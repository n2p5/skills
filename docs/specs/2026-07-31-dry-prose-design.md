# Design: `dry-prose` skill

- Status: draft (design approved)
- Date: 2026-07-31, refocused 2026-08-01
- Origin: a security-audit writing style developed in Cowork, trimmed and then
  repointed at reference documentation

This document is written in the style it specifies, which is also a standing
test of whether the style holds up over a document of this kind.

## Summary

A tone for reference documentation: READMEs, API docs, guides, runbooks, and
comments. Flat, neutral, declarative prose with no authorial voice and no em
dashes. User-invoked, one file, six rules.

## Spine

Every rule follows from one condition: the reader is here to accomplish
something, not to read. They arrived from a search box or an error message,
they are scanning for one specific thing, and they leave as soon as they find
it. Any choice that draws attention to the writing spends time they did not
come to spend.

The design passed through two earlier spines before this one. The source
version was adversarial, naming disputes, opposing counsel, and readers hunting
for a sentence to quote back. That is correct for an audit and wrong
everywhere else. It was replaced by the absent author, which generalized well
but covered two different readers at once: one mid-task looking something up,
one deciding whether to accept a proposal. One condition anchors rules better
than two, so the scope narrowed to reference documentation and the spine
narrowed with it.

The narrowing is not a restriction on use. The skill is user-invoked, so
pointing it at an ADR or a post-mortem is a decision the author can make. What
narrowing bought is a spine that generates the rules rather than tolerating
them.

## Leading words

`dry` anchors execution. `scanning` anchors the rationale, replacing
`forwarded`, which no longer describes the reader this skill writes for.

## Rules

Six, and the set changed materially when the spine did.

Carried forward unchanged:

- **No em dashes**, with **punctuate by relationship** as its mechanism rather
  than a separate rule.
- **Cut what isn't the fact**, with four named tells: trailing reframe,
  narrator frame, intensifier, smoothing transition.
- **Keep "X, not Y" only when Y is a reading someone would actually make.**

Added, because reference documentation needs them and no earlier version had
anything to say about either:

- **Address the reader.** Second person and the imperative. Passive voice and
  nominalization are the documentation equivalent of flourish: they put a
  narrator between the reader and the action, and they hide who does what.
- **Minimizers** (`simply`, `just`, `easy`, `obviously`) named inside the
  intensifier tell rather than given their own rule. Mechanically they are
  intensifiers, so a separate rule would duplicate the meaning. They are named
  because their harm differs: when the step does not work, they tell the reader
  the failure is theirs.

Recast:

- **Claim only what the evidence shows** became **describe what the system
  does, not what it is meant to do**. The same rule with a different object:
  evidence becomes observed behavior. Sharper in documentation than in audits.
- **Headings name their subject, not their verdict** became **headings say what
  is under them**. The audit failure was a heading that delivered a finding
  before its evidence. The documentation failure is a heading that defeats
  scanning, which is a different problem with the same fix.

Dropped:

- **Make the argument instead of performing one.** Reference documentation does
  not argue. The rule earned its place only under the wider scope.
- **American spellings.** A house convention rather than a property of dryness.
  It belongs in `CLAUDE.md`, where it governs everything.

Every example in the file was replaced. The security incident material was the
sharpest available under the old spine and unusable under this one.

## Invocation

User-invoked: `disable-model-invocation: true`. The agent never sees this skill
and cannot fire it, and neither can another skill. Reaching it means typing its
name.

The trade is deliberate. A writing style is something the author decides to
apply, not something an agent should infer from the shape of a request, and the
inference is the part that goes wrong: a skill that fires on "write this up"
imposes a register the author did not ask for. Paying zero context load for a
skill invoked by hand is the same decision `eng-log` makes.

The cost lands on the human, who is now the index. Two user-invoked skills is
under the threshold where that matters. If they multiply, the cure is a router
skill that names them and when to reach for each.

The description is human-facing and runs to 21 words. Its trigger list is gone:
no agent reads it, so phrasing it for retrieval would be writing for a reader
that does not exist. What survives states what the skill is for a person
scanning a list of skill names, and names both branches, since the human
choosing the skill is the one who needs to know it sweeps existing drafts as
well as governing new ones.

## Deliberate properties

The skill contains no em dashes, and uses none of the minimizers it bans. A
style guide that violates its own rules teaches the violation.

`Revising an existing draft` stays inline rather than becoming a disclosed
branch. The programmatic-sweep advice, which asserts an expected match count per
replacement and refuses to write on any failure, fires only on long documents,
but the section is too short to earn a pointer.

The name stays `dry-prose` rather than moving to something naming documentation
directly. `dry` is the leading word and carries the tone; a name built on
`docs` would carry the audience and lose the tone, and the audience is already
in the description.

## Open

Untested. The skill has been run once, on `eng-log`, under the previous spine.
No documentation has been written or swept with it yet, and the rules added for
documentation have never run at all.

## Lifecycle

Lands in `drafts/`, which is invisible to both install channels by construction
(ADR 0002). Publishing means moving it to `skills/` and adding it to
`.claude-plugin/marketplace.json`. `make link` sideloads it for live iteration
in the meantime.
