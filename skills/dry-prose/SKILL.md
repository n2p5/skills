---
name: dry-prose
description: >-
  Flat, neutral, declarative prose for reference documentation: READMEs, API
  docs, guides, runbooks, comments. Writes new docs, or sweeps an existing
  draft.
disable-model-invocation: true
---

# Dry Prose

Someone is reading this while trying to do something else. They arrived from a
search box or an error message, they are scanning for one specific thing, and
they will leave as soon as they find it. Every choice that draws attention to
the writing costs them time they did not come here to spend.

The target is prose that reads as though no particular person wrote it: the
reader finishes each sentence holding the fact and no impression of the
sentence. This is a different target from good writing, which earns its effect
through rhythm, contrast, and a well-placed dash. Those tools ask for attention
the reader does not have. Set them down.

## Rules

**Address the reader.** Second person and the imperative. "Edit `config.yaml`
and set `endpoint`", not "the configuration file may then be edited to set the
endpoint". Passive voice and nominalization are the documentation equivalent of
flourish: they put a narrator between the reader and the action, and they hide
who does what.

**No em dashes in prose. Punctuate by relationship instead:** colon for a label
and its elaboration, period for two independent statements, semicolon when those
two belong together, comma for genuine subordination, parentheses for a real
aside worth keeping. Deciding mechanically is the point, because it removes the
moment where a writer reaches for a dash. Two exceptions, because they are not
prose: a standalone em dash (U+2014) in a table cell as an n/a marker, and en
dashes (U+2013) in ranges (5–23 December, 2025–26).

**Cut what isn't the fact.** Four tells:

- *Trailing reframe*: a clause restating what was just said. "Set `timeout` to
  0 to disable it, which means no timeout is applied." Delete it, or promote it
  to its own sentence if it carries new information.
- *Narrator frame*: "In this section we will", "It is worth noting that",
  "Importantly,". Delete the frame and keep the fact. The fact was always the
  sentence.
- *Intensifier*: a modifier the claim survives without. In documentation the
  recurring ones are "simply", "just", "easy", and "obviously", and they cost
  more than tokens: when the step does not work, they tell the reader the
  failure is theirs.
- *Smoothing transition*: "Moreover,", "That said,", "Ultimately,". If a
  paragraph falls apart without them, the ordering is wrong and they were
  hiding it.

**Describe what the system does, not what it is meant to do.** "Returns a
non-zero exit code and writes the reason to stderr", not "handles errors
gracefully". Intent is what the author holds; behavior is what the reader
needs. Where you have not checked, say so rather than describing the design.

**Keep "X, not Y" only when Y is a reading someone would actually make.** This
one takes judgment. "Returns null, not undefined, when the key is absent" rules
out the reading a reader would otherwise default to, so it carries information.
"Runs in the background, not the foreground" says one thing twice for emphasis,
so it carries only voice. Ask whether a reasonable reader would have made the
mistake Y describes. If not, cut Y.

**Headings say what is under them.** A reader scanning for one thing meets the
headings first and reads nothing else until one matches. "Advanced usage" tells
them nothing about whether their answer is there; "Streaming responses and
backpressure" does. Name the subject, not the section's rank.

A new document is done when every rule has been applied and you have read it
end to end.

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

Leave verbatim material alone. Quoted text, code samples, command output, and
passages the user wrote and handed over are outside the sweep unless they ask
otherwise.

The sweep is done when every rule has been applied to the whole document,
every em dash has been replaced or deliberately kept, and the output has been
read end to end.

## Over-correction

The failure mode is stripping information along with the flourish. Dry is not
terse: a dry document can be long, it does not perform, and cutting a sentence
into ambiguity costs the reader more than the flourish did. Do not flatten a
heading until it stops distinguishing its section from the next. Do not strip
structure, because tables, headings, code blocks, parameter lists, and numbered
steps are not voice and are how a scanning reader finds anything. Do not replace
an em dash with a comma splice.
