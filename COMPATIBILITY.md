<!-- AI-assisted: written with Claude (Anthropic); see CREDITS.md. -->
# Compatibility, requirements and assumptions

This file states what Vortex needs from the world it runs in, what it
deliberately does **not** assume, and which Minecraft versions it targets.
If a requirement is not written here, Vortex does not have it.

## Version target

| Item | Value |
|---|---|
| Minecraft Java Edition | **1.21.7 – 1.21.8** |
| `pack_format` | **81** (`vortex-dp/pack.mcmeta`) |
| Pack version | 0.4.0 (`vortex-dp/data/vortex/function/core/version/define.mcfunction` is the single source) |
| Persistent-state schema | 1 (`vortex:engine global.state_version`, see "State and migrations") |

Both target versions share pack_format 81 and the same command grammar for
everything Vortex uses, so one build serves both. Syntax that only exists in
one of them is not used. Notable version-sensitive features, all available
in both targets:

- function macros (`$` lines) — since 1.20.2;
- SNBT-style text components and the `dialog` command family — 1.21.6+,
  unchanged between 1.21.7 and 1.21.8 for the shapes used here;
- data-component NBT paths on items/blocks (e.g. `components."..."`).

Outside 1.21.7–1.21.8 the pack is **not supported**: earlier versions lack
the dialog grammar, later versions are untested. When the target moves, the
move must update `pack.mcmeta`, this table, the Spyglass versions pinned in
`.github/workflows/validate.yml`, and be re-validated end to end — a
`pack_format` bump alone is not a port.

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
