# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/cb/run_delayed
# ─────────────────────────────────────────────────────────────────
# Schedules a command string to execute via command block after a delay.
#
# INPUT  (storage vortex:input cb):
#   cmd     (string)  — the command to run    [REQUIRED]
#   delay   (int)     — delay in ticks        [REQUIRED, min 1]
#   x       (int)     — CB block X            [default: 0]
#   y       (int)     — CB block Y            [default: -64]
#   z       (int)     — CB block Z            [default: 0]
#
# OUTPUT (storage vortex:output):
#   cb_id   (int)  — id of the queued entry, usable with api/cb/cancel_id
#
#
# EXAMPLE:
#   data modify storage vortex:input cb set value {cmd:"say delayed!",delay:40}
#   function vortex:api/cb/run_delayed
# ─────────────────────────────────────────────────────────────────

# Verify required inputs
execute if data storage vortex:engine modules{cb:0b} run return 0
execute unless data storage vortex:input cb.cmd run function vortex:systems/dbg/err {src:"cb",msg:"cb.cmd not set"}
execute unless data storage vortex:input cb.cmd run return 0
execute unless data storage vortex:input cb.delay run function vortex:systems/dbg/err {src:"cb",msg:"cb.delay not set"}
execute unless data storage vortex:input cb.delay run return 0

# Fill coordinate defaults
function vortex:core/internal/api/cb/apply_defaults

# Push to delay queue and schedule flush
function vortex:core/internal/systems/cb/queue_push
data remove storage vortex:input cb
