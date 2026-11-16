# vortex:core/internal/systems/geo/region_watch/fire_enter_cmd [MACRO]
# INPUT: $(on_enter_cmd) — from _rw_cur; called ONLY when on_enter_cmd field exists.
# @s = player entering the region

$data modify storage vortex:cmd_gate in.cmd set value "$(on_enter_cmd)"
execute unless function vortex:systems/cmd_gate/check run return 0
execute if data storage vortex:engine modules{macro_cmd:0b} run return run function vortex:core/internal/callback/blocked/cmd {site:"core/internal/systems/geo/region_watch/fire_enter_cmd"}
$$(on_enter_cmd)
