# vortex:api/cb/run
# ─────────────────────────────────────────────────────────────────
# Executes a raw command string via a temporary command block.
# Zero-delay variant: fires next tick, cleaned up 2t later.
#
# INPUT  (storage vortex:input cb):
#   cmd   (string)  — the command to run  [REQUIRED]
#   x     (int)     — CB block X          [default: 0]
#   y     (int)     — CB block Y          [default: -64]
#   z     (int)     — CB block Z          [default: 0]
#
# No permission gate — caller is trusted as-is.
#
# EXAMPLE:
#   data modify storage vortex:input cb set value {cmd:"say hello"}
#   function vortex:api/cb/run
# ─────────────────────────────────────────────────────────────────

# Verify required input
execute if data storage vortex:engine modules{cb:0b} run return 0
execute unless data storage vortex:input cb.cmd run tellraw @s [{"text":"[VORTEX/cb] ","color":"#00AAAA","bold":true},{"text":"cb.cmd not set","color":"red"}]
execute unless data storage vortex:input cb.cmd run return 0

# Fill coordinate defaults
function vortex:core/internal/api/cb/apply_defaults

# Execute
function vortex:core/internal/api/cb/exec with storage vortex:input cb
data remove storage vortex:input cb
