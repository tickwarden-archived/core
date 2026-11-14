# Changelog

## 0.3.0

Adds the dialog module, ported from [Modalith](https://github.com/tickwarden/modalith) 2.2.0 (MIT, see `NOTICE-modalith.md`).

### Added
- `vortex:api/dialog/*` (public API), `vortex:api/dialog/native_action/*` (client-side button actions) and `vortex:core/internal/dialog/*` (runtime, not API). 176 functions.
- Hook tags `#vortex:hook/dialog_{after_action,before_action,on_close,on_event,on_reject,on_show,on_timeout}`.
- `vortex:core/internal/dialog/load` is called from `vortex:setup`; `vortex:core/internal/dialog/tick` is registered directly in `#minecraft:tick`, so ticket TTLs and cooldowns are not slowed by the engine's `tick.rate`.
- `.github/rulesets/main.json`: the `main` branch ruleset (no deletion, no force-push, pull request required, no bypass actors).

### Renames (Modalith -> vortex)
- Functions: `mdl:api/*` -> `vortex:api/dialog/*`, `mdl:action/*` -> `vortex:api/dialog/native_action/*`, `mdl:internal/*` -> `vortex:core/internal/dialog/*`.
- Storage: `mdl:<x>` -> `vortex:dialog_<x>`. Objectives and tags: `mdl.<x>` -> `vortex.dialog_<x>`.

### Not verified
- Modalith targets Minecraft 26.3 (data pack version 121.0); vortex targets 1.21.7-1.21.8 (pack_format 81). Only static checks were run (JSON validity, every `function` reference and tag resolves, macro lines carry `$(...)`). The dialog definition fields were not run against a 1.21.8 game.
- Modalith's test suite and `mdl_demo` were not ported.

## 0.2.0

Fixes every data file that failed to load on Minecraft 1.21.7-1.21.8 (pack_format 81).

### Fixed
- `item_modifier/discard`: `minecraft:discard` does not exist in 1.21.8; now `set_count` with `count: 0`, which empties the stack.
- `predicate/core/internal/player/equals_uuid`: `minecraft:int_value_check` does not exist in 1.21.8; now `minecraft:value_check` with a score-provider `range` (min = max).
- 34 advancements (`core/internal/player/*`, `input/anvil_open`, `systems/hook/*`): trigger conditions are now a list of loot conditions that use the `condition` key (was a single object with `type`).
- `advancement/core/internal/player/interact_click_entity`: entity predicate key `minecraft:entity_type` is now `type`.
- `events/fire_queued`: pointed at the missing `events/internal/fire_deferred`; now calls `core/internal/events/fire_deferred`, so queued events run.

### Changed
- Version bumped to 0.2.0 (`pack.mcmeta`, `README.md`, `core/version/define`).
