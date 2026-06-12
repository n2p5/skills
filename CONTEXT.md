# n2p5/skills — Agent Skills Collection

A public collection of agent skills, maintained in one set of skill directories
and installable through multiple channels.

## Language

**Skill**:
A self-contained directory of agent instructions — a `SKILL.md` plus optional
supporting files. The unit a user installs and invokes.
_Avoid_: command, prompt, plugin

**Collection**:
The full set of skills in this repo, across all lifecycle states.
_Avoid_: library, registry

**Channel**:
A path by which a user installs skills from the collection. The channels are
the skills CLI (`npx skills`), the Claude Code plugin marketplace, and manual
copy.
_Avoid_: distribution method, install path

**Marketplace**:
The Claude Code catalog this repo exposes. A user adds the marketplace once,
then installs plugins from it.
_Avoid_: store

**Plugin**:
A named bundle of skills from the collection, installed and updated as one
unit through the marketplace channel. Plugins exist only in the marketplace
channel; the skills CLI installs skills individually.
_Avoid_: package, extension

**Published skill**:
A skill that is visible and installable through every channel. A skill is
either published on all channels or on none — there is no per-channel
publishing.
_Avoid_: live, released, active

**Draft**:
A skill that exists in the collection but is not yet installable through any
channel. Promotion to published is a single, deliberate act.
_Avoid_: in-progress, WIP, experimental

**Retired skill**:
A formerly published skill that is no longer installable. Users who already
installed it keep their copy; it just stops being offered.
_Avoid_: deprecated, archived

## Example dialogue

> **Dev:** A user says `/tdd` isn't doing anything after they installed the
> plugin.
>
> **Maintainer:** Which channel? If they installed the plugin through the
> marketplace, the skill is namespaced — it's `/n2p5:tdd`, not `/tdd`. Bare
> `/tdd` only exists if they installed the skill itself via the skills CLI.
>
> **Dev:** So the same skill has two names?
>
> **Maintainer:** Same skill, one name — `tdd`. The plugin prefix comes from
> the channel, not the skill.
