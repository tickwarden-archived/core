# Changelog

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
