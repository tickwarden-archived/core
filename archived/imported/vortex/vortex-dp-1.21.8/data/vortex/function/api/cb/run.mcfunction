# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
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
#
# EXAMPLE:
#   data modify storage vortex:input cb set value {cmd:"say hello"}
#   function vortex:api/cb/run
# ─────────────────────────────────────────────────────────────────

# Verify required input
execute if data storage vortex:engine modules{cb:0b} run return 0
execute unless data storage vortex:input cb.cmd run function vortex:systems/dbg/err {src:"cb",msg:"cb.cmd not set"}
execute unless data storage vortex:input cb.cmd run return 0

# Fill coordinate defaults
function vortex:core/internal/api/cb/apply_defaults

# Execute
function vortex:core/internal/api/cb/exec with storage vortex:input cb
data remove storage vortex:input cb
