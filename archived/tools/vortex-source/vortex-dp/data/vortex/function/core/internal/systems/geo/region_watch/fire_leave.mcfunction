# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/geo/region_watch/fire_leave [MACRO]
# INPUT: $(on_leave) — from _rw_cur; called ONLY when on_leave field exists.
# @s = player leaving the region

$data modify storage vortex:engine _dispatch.func set value "$(on_leave)"
function #vortex:internal/dispatch
