---
name: oblique-strategies
description: >-
  Draws one random card from an original deck of lateral-thinking prompts
  (inspired by Brian Eno & Peter Schmidt's Oblique Strategies) and applies
  it obliquely to the current problem. Use when the user is stuck, going in
  circles, out of ideas, says "I'm stuck" or "nothing is working", or asks
  for a card or an oblique strategy.
---

# Oblique Strategies

1. **Draw honestly** — run this from the skill's directory. Never choose
   the card yourself: you would pick the comfortable one. The shell picks;
   you interpret.

   ```bash
   grep '^- ' deck.md | sed -n "$(( $(od -An -N2 -tu2 /dev/urandom | tr -dc 0-9) % $(grep -c '^- ' deck.md) + 1 ))p" | cut -c3-
   ```

2. **Present the card verbatim:**

   > 🎴 _"Make the bug worse on purpose."_

3. **Read it obliquely.** A card is a move, not advice. Offer 2–3 readings
   bound to the actual stuck problem — never translate the card into the
   advice you already wanted to give.

4. **The card is the card.** Irrelevance is the mechanism. Redraw only if
   the user explicitly asks, and only once.

A draw is cheap — offer it; don't insist on it.
