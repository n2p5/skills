# Design: `dry-prose` skill

- Status: draft (design approved)
- Date: 2026-07-31
- Origin: trimmed and generalized from a security-audit writing style developed
  in Cowork

This document is written in the style it specifies, which is also the first test
of whether the style holds up over a document of this kind.

## Summary

A writing style for engineering documents that get forwarded: flat, neutral,
declarative prose with no authorial voice and no em dashes. User-invoked, one
file, six rules.

## Spine

The rules are justified by a single condition: the document is read later, by
people who were not in the room, with no author present to explain it. Every
stylistic choice that draws attention to the writing invites the reader to
evaluate the author instead of the fact.

The source version justified this adversarially, naming disputes, opposing
counsel, and readers hunting for a sentence to quote back. That framing is
correct for audits and wrong for the general case. Replacing it with the
absent author generalizes to design docs, ADRs, and post-mortems without
weakening any rule, because the evidence-boundary rule is load-bearing in a
post-mortem for the same reason it is load-bearing in an audit.

## Leading words

`dry` anchors execution and `forwarded` anchors the rationale. Both are
pretrained, both already earn their repetitions, and neither needed coining.

## Structure

One file. Nothing left after the trim is large enough to earn a context pointer.

Six rules, down from ten:

- **No em dashes** and **punctuate by relationship** merged. The second is the
  mechanism for the first, not a separate commandment.
- **State the fact and stop**, **no narrator frames**, **prefer the plain
  word**, and **short sentences** merged into "cut what isn't the fact" with
  four named tells. One meaning, four faces, co-located.
- **Keep "X, not Y" only when Y is a real reading** kept. It carries judgment
  the rule text cannot state without its examples.
- **Claim only what the evidence shows** kept.
- **Headings name their subject** kept. The smallest rule, and the first
  candidate if further cutting is wanted.
- **American spellings** cut. A house convention rather than a property of
  dryness. It belongs in `CLAUDE.md`, where it governs everything.

The balanced-clauses example was promoted out of the example gallery into its
own rule, "make the argument instead of performing one." Its fix is replacement
rather than deletion, so it is not a tell of "cut what isn't the fact."

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

The description is therefore human-facing, cut from roughly 120 words to 16. Its
trigger list is gone: no agent reads it, so phrasing it for retrieval would be
writing for a reader that does not exist. What survives states what the skill is
for a person scanning a list of skill names.

## Examples

Cut from eight to three. The mechanical substitutions were dropped because the
rule states the substitution completely and the example adds nothing. The three
survivors sit on the rules that need judgment: the kept-and-cut "X, not Y" pair,
and the balanced-clauses rewrite.

The surviving examples are drawn from security incident writing. They were kept
over generic replacements because they discriminate sharply, and because the
rules they illustrate are domain-independent even where the sentences are not.

## Deliberate properties

The skill contains no em dashes. A style guide that violates its own signature
rule teaches the violation.

`Revising an existing draft` stays inline at fourteen lines rather than becoming
a disclosed branch. The programmatic-sweep advice, which asserts an expected
match count per replacement and refuses to write on any failure, fires only on
long documents, but the section is too short to earn a pointer.

## Lifecycle

Lands in `drafts/`, which is invisible to both install channels by construction
(ADR 0002). Publishing means moving it to `skills/` and adding it to
`.claude-plugin/marketplace.json`. `make link` sideloads it for live iteration
in the meantime.
