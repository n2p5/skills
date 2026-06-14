# Makefile for the n2p5/skills collection.
# Run `make` (or `make help`) to list targets.

.DEFAULT_GOAL := help

.PHONY: help link unlink list validate draw

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "  \033[36m%-9s\033[0m %s\n", $$1, $$2}'

link: ## Sideload draft skills into ~/.claude/skills for live iteration
	@sh scripts/link-drafts.sh

unlink: ## Remove the draft skill symlinks created by `make link`
	@sh scripts/link-drafts.sh --unlink

list: ## List published (skills/) and draft (drafts/) skills
	@echo "Published (skills/):"
	@find skills -maxdepth 2 -name SKILL.md 2>/dev/null | sed 's|/SKILL.md||; s|^|  |' | sort
	@echo "Drafts (drafts/):"
	@find drafts -maxdepth 2 -name SKILL.md 2>/dev/null | sed 's|/SKILL.md||; s|^|  |' | sort

validate: ## Check the collection invariants (manifest, frontmatter, ADRs)
	@sh scripts/validate.sh

draw: ## Draw one oblique-strategies card
	@sh skills/oblique-strategies/scripts/draw
