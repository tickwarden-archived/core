# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/geo/region_watch/internal/fire_enter [MACRO]
# INPUT: $(on_enter) — from _rw_cur; called ONLY when on_enter field exists.
# @s = player entering the region

$data modify storage macroengine:engine _dispatch.func set value "$(on_enter)"
function #macroengine:internal/dispatch
