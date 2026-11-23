# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/geo/region_watch/internal/fire_leave_cmd [MACRO]
# INPUT: $(on_leave_cmd) — from _rw_cur; called ONLY when on_leave_cmd field exists.
# @s = player leaving the region

$data modify storage macroengine:cmd_gate in.cmd set value "$(on_leave_cmd)"
execute unless function macroengine:systems/cmd_gate/check run return 0
function macroengine:core/dispatch/cmd with storage macroengine:cmd_gate in
