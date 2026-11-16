# Credits

## AI involvement

Parts of this pack were written with AI. Files that were AI-assisted carry the line
`# AI-assisted: written with Claude (Anthropic); see CREDITS.md.` in their header, and the
commits carry an `AI-assisted:` trailer.

| Change | Files | AI |
|---|---|---|
| Shared callback runner | `api/callback/*`, `tags/function/callback/dispatch.json` | Claude (Anthropic) |
| Shared callback runner | `core/internal/callback/*`, `api/callback/*`, `tags/function/callback/*` | Claude (Anthropic) |
| Example datapack | `examples/vortex-example/*` | Claude (Anthropic) |
| Storage debug output | `systems/dbg/*`, converted `tellraw` lines | Claude (Anthropic) |
| Input rules | `input/validate/rule*`, `input/validate/_rule_*` | Claude (Anthropic) |

Static checks only (JSON validity, function and tag references). Not run in a game.
