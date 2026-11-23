# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/close
# Idempotent: emit on_close only for an active library session.
dialog clear @s
execute unless entity @s[tag=vortex.dialog_active] run return run function vortex:core/internal/dialog/invalidate
function vortex:core/internal/dialog/invalidate
function vortex:core/internal/dialog/lifecycle
data modify storage vortex:dialog_event type set value "close"
function #vortex:hook/dialog_on_close
