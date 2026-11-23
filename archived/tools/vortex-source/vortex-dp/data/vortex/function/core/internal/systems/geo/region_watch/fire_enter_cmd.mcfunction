# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/geo/region_watch/fire_enter_cmd [MACRO]
# INPUT: $(on_enter_cmd) — from _rw_cur; called ONLY when on_enter_cmd field exists.
# @s = player entering the region

execute if data storage vortex:engine modules{macro_cmd:0b} run return run function vortex:core/internal/callback/blocked/cmd {site:"core/internal/systems/geo/region_watch/fire_enter_cmd"}
$$(on_enter_cmd)
