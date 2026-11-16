<!-- AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root. -->
# vortex example pack

A small datapack that uses vortex. It is a demo, not part of the vortex release zip (the release only packs `pack.mcmeta` and `data/` from the repo root).

Needs vortex 0.3+ with the callback, input-rule and dbg changes (PRs #5 and #7). Minecraft 1.21.7-1.21.8 (pack_format 81).

## Install
Put the `vortex-example` folder (or a zip of it with `pack.mcmeta` and `data/` at its root) into the world's `datapacks/` folder next to vortex, then `/reload`.

## Run
```mcfunction
/tag @s add vortex.admin
/function vortex_example:demo/run_all
```
`run_all` needs `vortex.admin`, because the toggle functions and `dbg/show` check it. Each part can also be run alone: `demo/callback`, `demo/validate`, `demo/dbg`.

## What it shows
| Demo | Feature | Files to read |
|---|---|---|
| `demo/callback` | Shared callback runner. The handler is listed in `#vortex:callback/dispatch` and compares the ID itself. IDs are lower-cased; an empty ID is rejected. | `callback/dispatch_handler`, `callback/on_hello`, `data/vortex/tags/function/callback/dispatch.json` |
| `demo/validate` | Input rules: `yesno` (allow, ignore case), `bit` (allow 0 or 1), `no_admin` (deny list). The pack decides what a failure means. | `setup`, `demo/validate`, `demo/show_result` |
| `demo/dbg` | `dbg.out` / `dbg.err` write to storage `vortex:dbg` instead of chat; `dbg/show` prints them. | `demo/dbg` |

## Expected output (abridged)
```
[example] 1/3 callback
[example] hello, team red
[example] hello (no payload)
[example] hello (no payload)          <- "Vortex_Example:Hello" was lower-cased
[example] 2/3 input rules
yesno <- YES (expect valid)           -> valid
yesno <- maybe (expect not allowed)   -> invalid: value not allowed
bit <- 1 (expect valid)               -> valid
bit <- 2 (expect not allowed)         -> invalid: value not allowed
no_admin <- Admin (expect denied)     -> invalid: value is denied
[example] 3/3 dbg
```
followed by the `dbg.err` / `dbg.out` lists (including `callback id is empty`).

This output was derived from reading the code; the pack has not been run in a game yet.

## Notes
- `$tellraw` in `consumer/print` uses a fixed target and static text.
- Never paste player text into a macro argument. The example passes constants only.
