# Vortex (0.2.0)

Library pack: it provides functions for other datapacks and does nothing useful on its own.
Targets Minecraft 1.21.7-1.21.8 (pack_format 81). Renamed and reorganized from
macroEngine-Datapack-v26.3; old-to-new names for this layout are listed in `RENAMES.md`.

## Layout (`data/vortex/function/`)

| Folder | Purpose | Stable API? |
|---|---|---|
| `api/` | Public entry points, grouped by feature (`cmd`, `perm`, `store`, `toggle`, `title`, `cb`, `block`, `container`, ...) | Yes |
| `player/` | Player helpers: `get/*`, `is/*`, `var/*`, `run/*`, plus `inv/` and `team/` | Yes |
| `world/` | World helpers: `block/*`, `region/*` (clone, fill), `time/*`, `entity/*`, `weather` | Yes |
| `input/` | Text-input capture: `anvil`, `sign`, `lectern`, ... with `give/*`, `summon/*` and `validate/*` | Yes |
| `events/`, `tui/` | Event bus and text-UI helpers | Yes |
| `systems/` | Reusable building blocks (`math`, `string`, `hook`, `flag`, `rng`, `uuid`, `log`, ...) | Yes |
| `core/` | Engine runtime: `config`, `state`, `tick`, `queue`, `cooldown`, `dispatch`, `runtime` | No |
| `core/lib/` | Scheduling toolkit, one folder per feature: `schedule/`, `wait/`, `repeat/`, `once/`, `debounce/`, `queue/`, `for_each/`, `batch/`, `fiber/`, `string/` | No |
| `core/internal/` | Implementation behind the folders above (mirrors their layout) | No |

Other data folders: `advancement/`, `predicate/`, `loot_table/`, `item_modifier/`, `recipe/`, `tags/`.

## Conventions

- Every `.mcfunction` carries its own function ID in its header comment, plus `[MACRO]` when it uses `$` lines.
- Function folders group by feature, then by action: `player/var/set`, `core/lib/wait/cmd_as`.
- Scoreboard objectives, entity tags and macro keys are `snake_case` and prefixed `vortex.` (objectives and tags).
- Storage IDs are `vortex:<module>` with no leading underscore.
- Files use LF line endings, end with a newline, and JSON uses 2-space indentation.
