# vortex:core/internal/systems/geo/region_watch/fire_leave_cmd [MACRO]
# INPUT: $(on_leave_cmd) — from _rw_cur; called ONLY when on_leave_cmd field exists.
# @s = player leaving the region

execute if data storage vortex:engine modules{macro_cmd:0b} run return run function vortex:core/internal/callback/blocked/cmd {site:"core/internal/systems/geo/region_watch/fire_leave_cmd"}
$$(on_leave_cmd)
