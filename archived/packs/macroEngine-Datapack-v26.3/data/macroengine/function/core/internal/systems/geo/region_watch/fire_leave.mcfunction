# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/geo/region_watch/internal/fire_leave [MACRO]
# INPUT: $(on_leave) — from _rw_cur; called ONLY when on_leave field exists.
# @s = player leaving the region

$data modify storage macroengine:engine _dispatch.func set value "$(on_leave)"
function #macroengine:internal/dispatch
