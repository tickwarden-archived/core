# Changelog

## Unreleased

### Fixed
- `vortex-dp-1.21.8`: `api/cmd/time_of` could never instantiate — the single macro held `time set`/`time add`/`time query $(value)` lines, and the substituted value is parsed against every line's grammar, so all actions (even `pause`/`resume`) failed with "Failed to instantiate function". set/add/query now live in their own `core/internal/api/cmd/time_of/` macro helpers (same split as the 26.4 pack), with the argument quoted in SNBT. Verified end to end on a local 1.21.8 server (pause/resume flip `doDaylightCycle`, set/add/query return the right daytime).
- `vortex-dp-1.21.8`: removed dead 26.x keys Spyglass flagged and a real 1.21.8 server silently ignores — `clock` in the `is_daytime`/`is_night` time_check predicates (predicates re-verified at day/night boundaries) and `Invisible` on the anvil scratch `chest_minecart` summon (1.21.8 does not store it on minecarts).

### Changed
- `scripts/spyglass-check.mjs`: the 1.21.8 suppression profile is no longer empty. It now caps only diagnostics that were observed in CI, reproduced locally, and proven false positives on a real 1.21.8 server: the quoted `components."minecraft:sign_text_front"` NBT path (executes without error; silent fallback), the 26.x text-component `plain` key (accepted; renders as plain text), `entity_type` in the `killed_by_arrow` entity predicate (accepted and discriminates correctly), and the lectern `pages[0].text` fallback (1.21.8 reads `pages[0].raw` first). Result for the 1.21.8 root: 0 errors / 0 warnings in 1753 files, 45 known false positives suppressed.

### Added
- Project rule (`AGENTS.md`, restated in `COMPATIBILITY.md`): validation is static by default (Spyglass, namespace check, JSON parse, diff review against documented version changes). A local server/bot test run is allowed only as a locked-down exception — `server-ip=127.0.0.1`, `white-list=true` + `enforce-whitelist=true` with only the designated test bot whitelisted, port forwarding private/off. Publicly reachable test servers are prohibited (phishing/blocklist risk from fake players).
- Player warning (`AGENTS.md`, `COMPATIBILITY.md`): never join an unknown "test" server — connecting exposes your IP address/port, username and UUID to the operator, who can log, process and misuse them (an IP:port pair can be abused like a VPN/proxy exit; IP + username enables targeting/tracking).

## 0.5.0

Minecraft target moved from 1.21.7–1.21.8 to **26.4-snapshot-10** (the new
year-based version scheme; data pack format 128.0). The port was validated
end to end on a real 26.4-snapshot-10 dedicated server: the pack loads with
no function, predicate or advancement errors. Worlds on older versions can
no longer load the pack.

### Changed
- `vortex-dp/pack.mcmeta`: the removed `pack_format` field (gone since 1.21.9) is replaced by `min_format`/`max_format` = 128. The example pack's `pack.mcmeta` moved the same way.
- Game rules (renamed to snake_case registry IDs in 1.21.11): `api/cmd/time_of` pause/resume now uses `gamerule advance_time` instead of the removed `doDaylightCycle`. Callers of `api/cmd/gamerule` must pass the new rule names (e.g. `keep_inventory`, not `keepInventory`); see RENAMES.md.
- `world/time/get` and `world/time/phase`: `time query daytime` no longer exists in the 26.x world-clock grammar — daytime is now `time query day` and the day count is `time query day repetition`.
- Entity predicates (26.2 component-key format): `"type"` became `"minecraft:entity_type"` and `"type_specific"` became `"minecraft:type_specific/<type>"` in `is_creative`, `is_survival`, `is_full_health`, `is_freezing`, the `riding_*` predicates and the `interact_click_entity` advancement. Predicate IDs and caller-visible behaviour are unchanged; unrecognised entity-predicate keys are now rejected by the game, so the old keys had to go.
- Loot conditions, loot functions and item modifiers: the dispatch key `"condition"` became `"type"` in every predicate/loot/advancement JSON, and the loot-function dispatch key `"function"` became `"type"` (advancement reward `"function"` entries are function IDs, not dispatch keys, and did not change). The removed `minecraft:value_check` condition was split by Mojang into `int_value_check`/`float_value_check`; `equals_uuid` now uses `minecraft:int_value_check` with `test` instead of `range`.
- Advancement criteria: `entity`/`location` condition lists became single condition objects (26.x trigger codecs no longer accept a list).
- `api/cmd/time_of`: the `rate` action still refuses, but now points at `api/cmd/set_clock_rate` (`time rate <rate>`, which exists in 26.x) instead of claiming rate control is impossible.
- `scripts/spyglass-check.mjs`: the pinned Spyglass now resolves the pack as 26.4-snapshot-4, whose schemas know the previously suppressed `plain`/`clock`/NBT keys and the quoted-component NBT paths - those suppression rules were removed. Two new capped rules cover snapshot-4 grammar lag (numeric `return <int>` form, loot-entry `functions` key); both shapes are verified valid on a real 26.4-snapshot-10 server, which is the authoritative check for this port.

### Added
- `examples/vortex-example`: `demo/hook_callback` - processing bound through `vortex:systems/hook` still running when `macro_function` is off, via the `vortex:macro_function_blocked` callback and a whitelist dispatch on `vortex:engine _dispatch.func` (one-shot bind registration in `hook/register`).

### Changed
- `examples/vortex-example` updated for 0.4.0: now also demonstrates module-specific callbacks (`module:"macro_cmd"` plus the `args.mod` filter pattern for user modules) and the `#vortex:events/on_load` hook; demo numbering and the `needs vortex 0.4+` requirement updated accordingly.

## 0.4.0

### Changed
- Repository layout: the datapack moved from the repository root into `vortex-dp/` (`vortex-dp/pack.mcmeta`, `vortex-dp/data/`). The release zip is unchanged — pack.mcmeta and data/ still sit at the zip root; CI now builds it from `vortex-dp/`. Function IDs, storage paths and tags did not change.
- Breaking for worlds (not for callers): scoreboard objectives and entity tags `player_action.*` are now `vortex.player_action.*`, and the objective `load.status` is now `vortex.load_status`, so every name Vortex creates carries its own prefix. Old scores stay in orphaned objectives; see RENAMES.md for the manual cleanup.

### Added
- `API.md`: the public contract — stability policy, the naming/prefix table, public storage contracts, hook tags, and the generated index of public functions (`api/`, `events/`, `world/`, `systems/`). Everything else (notably `core/internal/` and `*/private/`) is internal.
- `COMPATIBILITY.md`: version target (Minecraft 1.21.7–1.21.8, pack_format 81), requirements, explicit non-assumptions (world, player count, other packs, execution order) and the state/migration model.
- Persistent-state schema versioning: `vortex:engine global.state_version` (currently 1) with a migration chain in `core/internal/load/migrate` + `migrations/to_<n>`, run on every load/reload before the already-loaded early return.
- `scripts/check-namespace.mjs` + CI job: fails when a scoreboard objective, entity tag, team, bossbar or storage the pack creates is not `vortex.`- / `vortex:`-prefixed.
- `#vortex:events/on_load` now actually fires: once per load/reload at the end of `vortex:setup`. It is no longer chained from `#vortex:init` (which only runs on the full-init path, which /reload skips).

### Removed
- Stored-string command checks and the command blocklist: stored-string commands now run directly, with no runtime check in between.
- `pack.png` (CI packages it only when present).

### Fixed
- Callback runner and example handler failed to load on 1.21.8 (`Invalid NBT path element ... stack[-1]<--[HERE]`): `stack[-1]{...}` is not valid NBT path syntax. The runner now mirrors the active entry to `vortex:callback top`; filter handlers with `top{id:"..."}`. `top` is restored after nested callbacks and cleared when the stack is empty.

### Added
- Macro execution toggles: `module_macro_cmd` (every caller-supplied `$$(cmd)` line) and `module_macro_function` (every caller-supplied `$function $(id)` line whose target comes from the caller). Both default to `1b`. On (1) the macro runs as written; off (0) the site does not run and is instead reported through the existing `vortex:core/internal/callback/run` (`vortex:macro_cmd_blocked` / `vortex:macro_function_blocked`, `top.site` = the blocked function path, macro value not forwarded). Switch with `vortex:api/toggle/macro_cmd/{true,false}` and `vortex:api/toggle/macro_function/{true,false}` (vortex.admin only), the toggle menu, or `core/config/set`. Fixed-target `$function` lines are not toggled.
- Shared callback runner `vortex:core/internal/callback/run`, with `vortex:api/callback/run` and `run_id` as thin public wrappers. No module toggle and no config flag. The ID comes from storage `vortex:callback in`, is string-checked (coerced to a string, rejected when empty or when it has a quote or backslash, lower-cased), pushed on a stack, and passed to the handlers in the function tags. Handlers compare the ID themselves (`stack[-1].id`). Re-entrant up to 8 levels; deeper calls are dropped and logged to `dbg.err`.
- `vortex:systems/dbg/{out,err,show,clear}`: storage-based debug output (`vortex:dbg out` / `err`, 50 entries each). `show` is the only place that prints to chat.
- Input rules: `vortex:api/input/validate/rule_define` (`allow`, `deny`, `ignore_case`) and `vortex:api/input/validate/rule`. Example: `allow:["yes","no"]` or `allow:[0,1]`. The result goes to `vortex:input_validate result` like the other validators.
- `examples/vortex-example`: a demo datapack for the callback runner, the blocked-macro hooks, input rules and dbg. It is not part of the release zip.

### Changed
- Breaking for callers (function IDs moved): top-level `player/`, `input/` and `tui/` moved to `api/player/`, `api/input/` and `api/tui/`. `core/cooldown`, `core/state`, `core/queue` and `core/lib` split: entry points used from outside now live in `api/cooldown`, `api/state`, `api/queue` and `systems/lib/`; helpers and handlers moved to `core/internal/core/`. Old-to-new table: `RENAMES.md`.
- Every `.mcfunction` header ID now matches its file path (125 headers were stale).
- The diagnostic `tellraw` lines in `api/cb/*` (10), `core/internal/api/gamerule/debug_print` and the diagnostic notice to admins now write to `vortex:dbg` instead of chat. Menu and permission messages are unchanged.

### Added
- `vortex:api/notice/show`: a dialog (built with `vortex:api/dialog/*`) that tells players the pack was written with AI, that the dialog module was ported from Modalith instead of rewritten, what player data it keeps, that datapacks are not sandboxed, and where to report problems. It is shown once to every player who has not seen it (flag: `vortex.notice_seen`), including players online during a `/reload`; call it again with `execute as <player> run function vortex:api/notice/show`.
- `vortex:core/internal/notice/load` (called from `vortex:setup`) and `vortex:core/internal/notice/tick` (registered in `#minecraft:tick`).

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
