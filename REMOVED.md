# Removed dead code

Found by walking the call graph from every root: all functions outside `core/internal/`, function tags, advancements and JSON files.
Nothing live referenced any of the items below.

## Functions

| Function | Why it was dead |
|---|---|
| `core/internal/api/cmd/other/multi_cmd/exec` | Old raw executor, replaced by `exec_macro` |
| `core/internal/api/cmd/other/multi_cmd/exec_func` | Only called by `step_func` |
| `core/internal/api/cmd/other/multi_cmd/step_func` | Only called itself; replaced by `step` and `exec_func_macro` |
| `core/internal/core/queue/tick` | Never called; `tick_loop` was its only callee |
| `core/internal/core/queue/tick_loop` | Only called by `tick` and itself |
| `core/internal/systems/rate_limit/player_ensure` | Replaced by `player_check`, which `systems/rate_limit/check` calls |

## Scoreboard objectives

| Objective | Why |
|---|---|
| `vortex.pre_version` | Created and removed at load, never read or written |

## Kept on purpose (unused, but not dead code)

- `core/internal/load/cleanup` and `core/internal/text/unload`: manual teardown tools.
- `core/internal/text/count` and `core/internal/text/has`: helper API of the text module.
- `core/internal/events/fire_deferred`: `events/fire_queued` points at the wrong path, `events/internal/fire_deferred`, so the queued event never runs. Fix the path there rather than deleting this function.
- Predicates, loot tables, item modifiers and recipes: public assets for dependent packs, not referenced internally by design.


## Re-check during the 0.4.0 restructure

The list above was re-verified against the full call graph, including `minecraft:` tags and runtime string references. Nothing is removed by this pass, and two earlier notes are out of date:

- `core/internal/events/fire_deferred` is alive. `events/fire_queued` already points at `core/internal/events/fire_deferred`, so the path bug described under "Kept on purpose" is fixed.
- `core/internal/dialog/tick` and `core/internal/notice/tick` are alive: both are in `minecraft:tick`.
- `systems/log/print_entry` is alive: `systems/log/show` names it as a string.
- `core/internal/core/lib/fiber/resume_dispatch` is reached through the queue and dispatch tag chain described in its header.
- `core/internal/systems/hook/on_open_gui` is reached through the `core/internal/player/open_gui` tag chain.
- `systems/cmd_gate/*` has 12 callers and gates stored-string command execution. It is not dead.
