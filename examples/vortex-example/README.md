<!-- AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root. -->
# vortex example pack

A small datapack that uses vortex. It is a demo, not part of the vortex release zip (the release packs the contents of `vortex-dp/` in the repo (its `pack.mcmeta` and `data/`) into the zip root).

Needs **vortex 0.4.0** (the callback runner, module callbacks, the `#vortex:events/on_load` hook and the macro toggles all ship in it; see `API.md` and `COMPATIBILITY.md` in the repo root). Minecraft 1.21.7-1.21.8 (pack_format 81).

## Install
Put the `vortex-example` folder (or a zip of it with `pack.mcmeta` and `data/` at its root) into the world's `datapacks/` folder next to vortex (the `vortex-dp` folder or its release zip), then `/reload`.

## Run
```mcfunction
/tag @s add vortex.admin
/function vortex_example:demo/run_all
```
`run_all` needs `vortex.admin`, because the toggle functions and `dbg/show` check it. Each part can also be run alone: `demo/callback`, `demo/validate`, `demo/blocked`, `demo/module`, `demo/dbg`. A sixth piece runs by itself: the `#vortex:events/on_load` hook fires on every load/reload and leaves a line in `vortex:dbg` (visible via `demo/dbg`).

## What it shows
| Demo | Feature | Files to read |
|---|---|---|
| `demo/callback` | Shared callback runner. The handler is listed in `#vortex:callback/dispatch` and compares the ID itself. IDs are lower-cased; an empty ID is rejected. | `callback/dispatch_handler`, `callback/on_hello`, `data/vortex/tags/function/callback/dispatch.json` |
| `demo/validate` | Input rules: `yesno` (allow, ignore case), `bit` (allow 0 or 1), `no_admin` (deny list). The pack decides what a failure means. | `setup`, `demo/validate`, `demo/show_result` |
| `demo/blocked` | With `macro_function` or `macro_cmd` off (0), a guarded site does not run the macro; it reports the site through `vortex:core/internal/callback/run` instead. Handlers sit in `#vortex:callback/macro_function` and `#vortex:callback/macro_cmd`; `top.site` is the blocked function. Both toggles are switched back on (1) at the end. | `demo/blocked`, `callback/on_macro_*_blocked`, `provider/one`, `consumer/print` |
| `demo/module` | Module-specific callbacks: `module:"macro_cmd"` makes the runner fire `#vortex:callback/macro_cmd` before the shared dispatch; only `macro_cmd`/`macro_function` module tags exist. For your own modules there is no per-module tag — mark `args` (here `args.mod`) and let a dispatch handler filter on it. | `demo/module`, `callback/on_module_hello`, `callback/on_custom_module` |
| (automatic) | `#vortex:events/on_load` user hook: Vortex fires the tag once at the end of every load/reload. The example registers a handler that leaves a `dbg` line; no executor entity exists at that point. | `events/on_vortex_load`, `data/vortex/tags/function/events/on_load.json` |
| `demo/dbg` | `dbg.out` / `dbg.err` write to storage `vortex:dbg` instead of chat; `dbg/show` prints them. | `demo/dbg`, `callback/log_site` |

## Expected output (abridged)
```
[example] 1/4 callback
[example] hello, team red
[example] hello (no payload)
[example] hello (no payload)          <- "Vortex_Example:Hello" was lower-cased
[example] 2/4 input rules
yesno <- YES (expect valid)           -> valid
yesno <- maybe (expect not allowed)   -> invalid: value not allowed
bit <- 1 (expect valid)               -> valid
bit <- 2 (expect not allowed)         -> invalid: value not allowed
no_admin <- Admin (expect denied)     -> invalid: value is denied
[example] 3/5 blocked macro sites
[example] $function $(id) blocked at api/macro/with_function
[example] $$(cmd) blocked at core/internal/core/lib/once/cmd
[example] the pipe works
[example] 4/5 module callbacks
[example] module callback (macro_cmd tag) from demo/module
[example] custom-module event vortex_example:custom_event n=7
[example] 5/5 dbg
```
followed by the `dbg.err` / `dbg.out` lists (including `callback id is empty` and the two `blocked:` lines).

This output was derived from reading the code; the pack has not been run in a game yet.

## Notes
- `demo/blocked` deliberately calls one internal guarded site (`core/internal/core/lib/once/cmd`) just to make the blocked report fire; internal paths are not stable API — don't copy that call into a real pack.
- `$tellraw` in `consumer/print` and `$function` in `callback/log_site` use a fixed target and static text, so the macro toggles do not affect them.
- Never paste player text into a macro argument. The example passes constants only.
