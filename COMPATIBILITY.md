<!-- AI-assisted: written with Claude (Anthropic); see CREDITS.md. -->
# Compatibility, requirements and assumptions

This file states what Vortex needs from the world it runs in, what it
deliberately does **not** assume, and which Minecraft versions it targets.
If a requirement is not written here, Vortex does not have it.

## Version target

| Item | Value |
|---|---|
| Minecraft Java Edition | **26.4-snapshot-10** |
| Data pack format | **128.0** (`min_format`/`max_format` in `vortex-dp/pack.mcmeta`; the single `pack_format` field was removed in 1.21.9) |
| Pack version | 0.5.0 (`vortex-dp/data/vortex/function/core/version/define.mcfunction` is the single source) |
| Persistent-state schema | 1 (`vortex:engine global.state_version`, see "State and migrations") |

The target is a snapshot, so the grammar below is exactly the one of
26.4-snapshot-10; nothing older is accepted (`min_format` = `max_format` =
128). Notable version-sensitive features:

- function macros (`$` lines) — since 1.20.2;
- SNBT-style text components and the `dialog` command family — 1.21.6+;
- data-component NBT paths on items/blocks (e.g. `components."..."`);
- game rules are registry entries with snake_case IDs since 1.21.11
  (`advance_time`, not `doDaylightCycle`) — `api/cmd/gamerule` passes rule
  names through, so callers must use the new names;
- the 26.x world-clock `time` grammar: `time query day` (ticks into the
  day) and `time query day repetition` (day count) replace the removed
  `time query daytime` / old `time query day` meanings, and
  `time rate <rate>` sets the clock speed (`api/cmd/set_clock_rate`);
- entity predicates use component keys since 26.2: `minecraft:entity_type`
  and `minecraft:type_specific/<type>` replace `type` / `type_specific`;
  unrecognised entity-predicate keys are now rejected, not ignored;
- loot conditions and loot functions dispatch on `"type"` (the old
  `"condition"` / `"function"` dispatch keys are gone), `value_check` was
  split into `int_value_check` / `float_value_check`, and advancement
  criteria take single condition objects instead of condition lists;
- `/item` and `execute if/unless items` take slot sources since 26.3 —
  plain slot names (`weapon.mainhand`, `container.0`, `contents`, …) remain
  valid slot sources and are what Vortex uses.

Outside 26.4-snapshot-10 the pack is **not supported**: earlier versions
cannot read format 128 (and lack the grammars above), later versions are
untested. When the target moves, the move must update `pack.mcmeta`, this
table, the Spyglass versions pinned in `.github/workflows/validate.yml`,
and be re-validated end to end — a format bump alone is not a port.

## Requirements

- A Java Edition world/server that loads datapacks (singleplayer, LAN or
  dedicated server all work).
- Datapack function permission: the server's default
  (`function-permission-level`, 2) is enough. Nothing in Vortex needs op
  level 3/4, and Vortex ships no `op`, `stop` or `ban` commands.
- No other datapack is required. Vortex is a library: by itself it only
  loads, initialises its state and waits to be called (see API.md).
- Placed in `datapacks/` so that `pack.mcmeta` and `data/` sit at the pack
  root — the release zip is already laid out that way; from a repo checkout
  that folder is `vortex-dp/`, not the repository root.

## Explicit non-assumptions

Vortex does not assume:

- **a specific world or seed** — no hardcoded coordinates (the one legacy
  `forceload add -30000000 1600` marker chunk in `load/all` only keeps the
  classic marker-chunk convention working and is not read as world data);
- **any player being online** — load runs without an executor entity;
  notices that used to address `@s` at load were fixed to address `@a` and
  tick code tolerates zero players;
- **a player count** — per-player state is keyed by UUID and created on
  join/enumeration, never pre-sized;
- **other datapacks existing or not existing** — the only shared names are
  the vanilla `#minecraft:load` / `#minecraft:tick` function tags Vortex
  registers its own entry points in, and its own `vortex:`/`vortex.` names
  (see the naming table in API.md). World state left by other packs is
  never read as Vortex state, except the documented `vortacraftmc.`-era
  migration keys in `core/config/init`, which are matched exactly because
  an older world may still carry them.
- **execution order vs. other packs** — beyond `/reload` running
  `#minecraft:load`. Inter-pack hooks are opt-in function tags (API.md,
  "Hook tags"); Vortex never calls a function in another pack's namespace,
  except through user-registered tags and the documented callback runner,
  which dispatches on IDs the caller supplies.

## State and migrations

- Persistent state lives in command storage (chiefly `vortex:engine`),
  created on load with `unless data` guards: existing state is kept,
  missing pieces are initialised. `global.loaded` distinguishes "already
  loaded, keep live state" from a first init; `core/internal/load/force`
  is the explicit escape hatch that discards live state.
- `vortex:engine global.state_version` records the persistent-state
  schema (currently **1**). On every load/reload,
  `core/internal/load/migrate` runs the pending `migrations/to_<n>` steps
  before the already-loaded early return, so upgrading the pack in an
  existing world migrates in place. Steps are idempotent and tolerate
  partially-migrated state; see the rules at the top of `migrate.mcfunction`.
- The **config** has its own cheaper mechanism: `config_rev` in
  `core/config/init`, re-checked every tick by `core/config/ensure`, so
  worlds that never reload still pick up new config keys.
- Breaking scoreboard renames cannot be migrated in code (scores under an
  old objective name cannot be enumerated generically). The current one —
  `player_action.*` → `vortex.player_action.*`, `load.status` →
  `vortex.load_status` — is called out in RENAMES.md with the manual
  cleanup command; orphaned objectives are inert but can be removed with
  `scoreboard objectives remove`.

## Updating in an existing world

1. Replace the pack files (or drop the new release zip into `datapacks/`).
2. `/reload`. Migrations and config `ensure` run as described above.
3. Optional cleanup for the renamed objectives (RENAMES.md).

## Validation policy

Validation is static by default (see `AGENTS.md`): Spyglass
(`scripts/spyglass-check.mjs`), the namespace check
(`scripts/check-namespace.mjs`) and JSON parsing must all pass, and the
diff must be reviewed against the target version's documented changes.

A local server/bot test run is allowed only as an exception, under the
mandatory lockdown in `AGENTS.md`: `server-ip=127.0.0.1`,
`white-list=true` + `enforce-whitelist=true` with only the designated
test bot whitelisted, and port forwarding kept private/off (no tunnels,
listings or invites). A publicly reachable test server is prohibited —
fake players on a reachable server can mislead real players and create
phishing/blocklist risk. The 0.5.0 port to 26.4-snapshot-10 was
validated on a local 26.4-snapshot-10 server under this policy.
