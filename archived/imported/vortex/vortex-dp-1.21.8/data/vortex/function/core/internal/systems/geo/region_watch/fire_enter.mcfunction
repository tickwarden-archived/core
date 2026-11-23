# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/geo/region_watch/fire_enter [MACRO]
# INPUT: $(on_enter) — from _rw_cur; called ONLY when on_enter field exists.
# @s = player entering the region

$data modify storage vortex:engine _dispatch.func set value "$(on_enter)"
function #vortex:internal/dispatch
